#!/usr/bin/env bash
# Publish-safety check. Run before every push — .githooks/pre-push does it for
# you once hooks are enabled (see MAINTAINING.md), but it's cheap by hand too.
#
# Three passes, in increasing order of cleverness and decreasing order of
# certainty:
#
#   1. DENYLIST   — literal terms from scrub-terms.txt. Fails the run.
#   2. PATTERNS   — shapes rather than names: compensation figures, absolute
#                   home paths, emails, phone numbers. Fails the run. These
#                   catch leaks that were never on anyone's list.
#   3. PROPER NOUNS — capitalized multi-word tokens that aren't on the fixture
#                   allowlist. Warns only. This is the pass that catches an
#                   employer name nobody thought to add to the denylist, which
#                   is exactly how the 2026-07-31 list went stale.
#
# scrub-terms.txt is gitignored — a list of precisely what not to say is
# itself sensitive. This script is tracked, and excluded from its own scan.
#
# ─── What gets scanned ───────────────────────────────────────────────
#
# The publishable set, from git: tracked files plus untracked files that
# aren't ignored. That is exactly what a push can carry.
#
# It deliberately does NOT scan the working tree. Anyone actually using
# this repo has their real career history sitting in profile/ and
# applications/ — gitignored, unpublishable, and full of the employer
# names, home paths and phone numbers these passes hunt for. Walking the
# filesystem meant the check failed on every run with nothing staged and
# nothing to leak, and told the person to delete their own data. A check
# that fails when nothing is wrong stops being read, which is the failure
# this whole script exists to prevent.
#
# Untracked-but-not-ignored files count, because a new file that hasn't
# been `git add`ed yet is one `git add .` from being published.
#
# ─── Usage ───────────────────────────────────────────────────────────
#
#   ./scripts/scrub-check.sh              the publishable set (default)
#   ./scripts/scrub-check.sh --history    every commit reachable from HEAD
#
# Exit 0 = clean (warnings may still print).
# Exit 1 = something must be fixed.
# Exit 2 = not configured (no scrub-terms.txt). The hook lets this through
#          with a warning, because a contributor who forked this repo has no
#          denylist and shouldn't be blocked from pushing.

set -uo pipefail

cd "$(dirname "$0")/.."

TERMS_FILE="scrub-terms.txt"
FAILED=0
WARNED=0
MODE="working"

for arg in "$@"; do
  case "$arg" in
    --history) MODE="history" ;;
    -h|--help) sed -n '2,46p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; exit 1 ;;
  esac
done

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Not a git repository. This check scans what git would publish," >&2
  echo "so it has nothing to work from here." >&2
  exit 1
fi

# ─────────────────────────────────────────────────────────────
# Failing closed
# ─────────────────────────────────────────────────────────────
#
# grep exits 1 on no-match, and xargs reports 1 for a real grep error too —
# verified, they are genuinely indistinguishable by exit code. So a mistyped
# flag or an unreadable file would produce no output, contribute no hits, and
# let the run print "Clean."
#
# A publish-safety check that reports clean when it failed to execute is the
# worst outcome available here, so errors are detected on stderr instead.
# scan() runs inside a command substitution — a subshell — so it cannot set a
# variable the parent will see. It appends to a file instead, and the parent
# checks that file before deciding anything.
SCAN_ERR_LOG=$(mktemp)
FILE_LIST=$(mktemp)
PROPER_LIST=$(mktemp)
trap 'rm -f "$SCAN_ERR_LOG" "$FILE_LIST" "$PROPER_LIST"' EXIT

# The publishable set, NUL-delimited, written to a file once and reused by
# every pass. Filenames in this repo contain spaces (the rendered example
# documents), so nothing here may split on whitespace.
#
# ⚠️ It goes to a file rather than a variable because command substitution
# strips NUL bytes — `list=$(git ls-files -z ...)` silently concatenates every
# path into one string, and the first grep then reports "File name too long".
# Reusing the file is also a good deal faster than re-running git ls-files
# once per denylist term.
git ls-files -z --cached --others --exclude-standard \
  -- ':!scripts/scrub-check.sh' > "$FILE_LIST" 2>>"$SCAN_ERR_LOG"

# grep across the publishable set.
#
# -H because xargs batches: if the final batch happens to hold one file,
# grep would print matches with no filename and the hit would be unlocatable.
# -I skips binaries. The `|| true` swallows the no-match exit only; real
# failures are caught by their stderr above.
scan_working() {
  [[ -s "$FILE_LIST" ]] || return 0
  xargs -0 grep -HnI "$@" < "$FILE_LIST" 2>>"$SCAN_ERR_LOG" || true
}

scan() {
  if [[ "$MODE" == "history" ]]; then
    # History reads blobs out of the object database rather than the
    # filesystem, via git grep across every commit reachable from HEAD.
    # Output is rev:path:line:match. git grep wants `-e PATTERN` with the
    # revs after it, so the call shape gets translated here.
    local args=() pattern=""
    while [[ $# -gt 0 ]]; do
      if [[ "$1" == "--" ]]; then shift; pattern="$1"; shift; continue; fi
      args+=("$1"); shift
    done
    local revs
    revs=$(git rev-list --all 2>>"$SCAN_ERR_LOG" | tr '\n' ' ')
    [[ -z "$revs" ]] && return 0
    # shellcheck disable=SC2086
    git grep -nI "${args[@]}" -e "$pattern" $revs 2>>"$SCAN_ERR_LOG" || true
  else
    scan_working "$@"
  fi
}

hr() { printf '─%.0s' {1..70}; echo; }

if [[ "$MODE" == "history" ]]; then
  hr
  echo "HISTORY MODE — every commit reachable from HEAD"
  echo
  echo "A hit here is already published and cannot be fixed by editing a file."
  echo "It needs the history rewritten (git filter-repo) and a force-push, and"
  echo "anyone who already cloned still has it. Treat a hit as an incident."
  hr
  echo
fi

# ─────────────────────────────────────────────────────────────
# Pass 1 — the denylist
# ─────────────────────────────────────────────────────────────

if [[ ! -f "$TERMS_FILE" ]]; then
  echo "No $TERMS_FILE found. Nothing to check against." >&2
  echo "See MAINTAINING.md → 'Keeping the denylist current'." >&2
  exit 2
fi

SECTION="fail"
DENY_FAIL_OUT=""
DENY_WARN_OUT=""

while IFS= read -r line || [[ -n "$line" ]]; do
  # The WARN marker switches severity for everything after it.
  if [[ "$line" =~ ^[[:space:]]*#[[:space:]]*===[[:space:]]*WARN[[:space:]]*=== ]]; then
    SECTION="warn"
    continue
  fi

  [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue

  term="$line"
  WORDMATCH=""
  if [[ "$term" == =* ]]; then
    term="${term#=}"
    WORDMATCH="-w"
  fi

  MATCHES=$(scan --fixed-strings --ignore-case $WORDMATCH -- "$term")

  if [[ -n "$MATCHES" ]]; then
    BLOCK="── \"$term\" ──
$MATCHES
"
    if [[ "$SECTION" == "fail" ]]; then
      DENY_FAIL_OUT+="$BLOCK"
    else
      DENY_WARN_OUT+="$BLOCK"
    fi
  fi
done < "$TERMS_FILE"

if [[ -n "$DENY_FAIL_OUT" ]]; then
  hr; echo "DENYLIST HITS — these must be fixed"; hr
  printf '%s\n' "$DENY_FAIL_OUT"
  FAILED=1
fi

# ─────────────────────────────────────────────────────────────
# Pass 2 — shapes, not names
# ─────────────────────────────────────────────────────────────

# Fields are TAB-separated: label, severity, regex, exclusion-regex.
#
# Tab rather than `|`, because these are extended regular expressions and `|`
# is alternation — the exclusion column already contains one. The old version
# parsed correctly only by accident: `read` dumps the remainder into the final
# variable, so it survived as long as no *middle* field needed an alternation.
# The first one that did would have silently truncated the regex and shifted
# the severity, with no error. A tab cannot appear in any of these values.
#
# The fixtures in examples/ are SUPPOSED to look like a real person's resume —
# a fake salary and a fake phone number are the point of them. So the shapes
# that a fixture legitimately carries (money) only warn, and the shapes that
# should never be real (emails, phones) fail only when they aren't obviously
# reserved-for-documentation values.
PATTERNS=(
  $'absolute home path\tfail\t/Users/[a-zA-Z0-9._-]+\t'
  $'real email address\tfail\t[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\t@example\\.(com|org|net)'
  $'real phone number\tfail\t\\(?[0-9]{3}\\)?[ .-][0-9]{3}[ .-][0-9]{4}\t[（(]?555[)）]?[ .-]'
  $'money figure\twarn\t\\$[0-9]{2,3}(,[0-9]{3})?[Kk]?\t'
)

PATTERN_FAIL_OUT=""
PATTERN_WARN_OUT=""

for entry in "${PATTERNS[@]}"; do
  IFS=$'\t' read -r label severity regex exclude <<< "$entry"

  # -o so each result is file:line:MATCHEDVALUE. The exclusion then applies to
  # the matched value alone. Filtering whole lines instead would let a real
  # phone number ride along on a line that also contained a 555 placeholder —
  # which is exactly what the first version of this script did.
  MATCHES=$(scan -oE -- "$regex")
  if [[ -n "$exclude" && -n "$MATCHES" ]]; then
    MATCHES=$(printf '%s\n' "$MATCHES" \
      | awk -v ex="$exclude" '{ v=$0; sub(/^.*:[0-9]+:/,"",v); if (v !~ ex) print }')
  fi

  if [[ -n "$MATCHES" ]]; then
    BLOCK="── $label ──
$MATCHES
"
    if [[ "$severity" == "fail" ]]; then
      PATTERN_FAIL_OUT+="$BLOCK"
    else
      PATTERN_WARN_OUT+="$BLOCK"
    fi
  fi
done

if [[ -n "$PATTERN_FAIL_OUT" ]]; then
  hr; echo "PATTERN HITS — these must be fixed"; hr
  printf '%s\n' "$PATTERN_FAIL_OUT"
  FAILED=1
fi

# ─────────────────────────────────────────────────────────────
# Pass 3 — proper-noun sweep (warning only)
# ─────────────────────────────────────────────────────────────
#
# Every capitalized multi-word token in the prose directories, minus the
# fixture persona and the ordinary vocabulary of a repo like this one.
# A real employer name that nobody added to the denylist shows up here.
#
# Skipped in history mode: sweeping every commit produces thousands of tokens
# dominated by prose that has since been rewritten, which buries the signal
# this pass exists to surface.

# examples/ is deliberately excluded. It's a reviewed fixture set full of
# invented company and person names, and sweeping it buries the signal. The
# pass is aimed at skills/ and docs/ — the prose that gets rewritten during a
# port, which is exactly where an unlisted real employer name would land.
ALLOW='^(Jordan Vale|Copperline Health|Northwind Logistics|Brightline Outfitters|Lakeshore State University|Care Access|Claude Code|Claude Desktop|Google Docs|Google Drive|VS Code|Visual Studio|Microsoft Word|Applicant Tracking|Atomic Resume|Open Folder|Download ZIP|Career Highlights|Not Extracted|Key Skills|Work Experience|Print Preview|Page Setup|Background Graphics|Read Me|Getting Started|New Vault|Command Line|Terminal App|The Agent|The Person|This Repo|Your Career|United States|New York|San Francisco|FULL NAME|JOB TITLE|MONTH YEAR|ISSUING BODY|FICTIONAL EXAMPLE|COMPANY NAME|SCHOOL NAME)$'

PROPER=""
if [[ "$MODE" == "working" ]]; then
  # Same publishable set as the other passes, narrowed to the prose
  # directories. The pathspecs run inside git rather than as a grep filter, so
  # examples/ is excluded before anything is read.
  git ls-files -z --cached --others --exclude-standard \
    -- 'skills/*' 'docs/*' 'templates/*' '*.md' \
       ':!examples/*' ':!scripts/scrub-check.sh' > "$PROPER_LIST" 2>>"$SCAN_ERR_LOG"
  if [[ -s "$PROPER_LIST" ]]; then
    PROPER=$(xargs -0 grep -hoIE '\b[A-Z][a-zA-Z0-9]+(\s+[A-Z][a-zA-Z0-9]+)+\b' \
        < "$PROPER_LIST" 2>>"$SCAN_ERR_LOG" \
      | sed 's/[[:space:]]\+/ /g' \
      | grep -vE "$ALLOW" \
      | sort | uniq -c | sort -rn)
  fi
fi

if [[ -n "$PROPER" ]]; then
  hr; echo "PROPER-NOUN SWEEP — review, does not fail the run"; hr
  echo "Capitalized multi-word tokens not on the fixture allowlist."
  echo "Anything here that names a real employer, product, or person belongs"
  echo "in scrub-terms.txt. Anything that's ordinary prose belongs in the"
  echo "ALLOW list at the top of pass 3 in this script."
  echo
  printf '%s\n' "$PROPER"
  echo
  WARNED=1
fi

if [[ -n "$DENY_WARN_OUT" ]]; then
  hr; echo "DENYLIST WARNINGS — real terms that are also ordinary English"; hr
  printf '%s\n' "$DENY_WARN_OUT"
  WARNED=1
fi

if [[ -n "$PATTERN_WARN_OUT" ]]; then
  hr; echo "PATTERN WARNINGS — right shape, possibly legitimate"; hr
  echo "Fixtures carry invented money figures on purpose. A real one would"
  echo "look identical, so these get read rather than trusted."
  echo
  printf '%s\n' "$PATTERN_WARN_OUT"
  WARNED=1
fi

# ─────────────────────────────────────────────────────────────
# Did anything fail to execute?
# ─────────────────────────────────────────────────────────────

if [[ -s "$SCAN_ERR_LOG" ]]; then
  hr; echo "THE CHECK ITSELF FAILED — do not read a clean result above as clean"; hr
  echo "Something errored while scanning. Whatever it was supposed to read may"
  echo "not have been read, so this run proves nothing."
  echo
  cat "$SCAN_ERR_LOG"
  echo
  FAILED=1
fi

# ─────────────────────────────────────────────────────────────

hr
if [[ $FAILED -eq 1 ]]; then
  if [[ "$MODE" == "history" ]]; then
    echo "FAILED. Hits above are in published history, not the working tree."
    echo "Editing a file will not remove them. See MAINTAINING.md."
  else
    echo "FAILED. Fix every hit above before pushing."
    echo
    echo "If a term is flagging a genuine false positive, narrow it in"
    echo "$TERMS_FILE (or move it below the '=== WARN ===' line) rather than"
    echo "deleting it. Don't loosen the check to make it quiet."
  fi
  exit 1
fi

if [[ $WARNED -eq 1 ]]; then
  echo "No failures. Warnings above are worth a look before you push."
else
  echo "Clean. No denylist terms, no pattern hits, nothing unexpected."
fi
exit 0

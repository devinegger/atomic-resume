#!/usr/bin/env bash
# Publish-safety check. Run before every push — there's a pre-push hook that
# does it for you, but it's cheap enough to run by hand any time.
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
# Both this script and scrub-terms.txt are gitignored — a list of precisely
# what not to say is itself sensitive.
#
# Usage: ./scripts/scrub-check.sh
# Exit 0 = clean (warnings may still print). Exit 1 = something must be fixed.

set -uo pipefail

cd "$(dirname "$0")/.."

TERMS_FILE="scrub-terms.txt"
FAILED=0
WARNED=0

EXCLUDES=(
  --exclude-dir=.git
  --exclude-dir=node_modules
  --exclude-dir=.obsidian
  --exclude="$TERMS_FILE"
  --exclude="scrub-check.sh"
  --exclude="EXTRACTION-PLAN.md"
)

hr() { printf '─%.0s' {1..70}; echo; }

# ─────────────────────────────────────────────────────────────
# Pass 1 — the denylist
# ─────────────────────────────────────────────────────────────

if [[ ! -f "$TERMS_FILE" ]]; then
  echo "No $TERMS_FILE found. Nothing to check against." >&2
  echo "See MAINTAINING.md → 'Keeping the denylist current'." >&2
  exit 1
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

  MATCHES=$(grep -rIn --fixed-strings --ignore-case $WORDMATCH \
    "${EXCLUDES[@]}" -- "$term" . 2>/dev/null)

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

# label|severity|regex|exclusion-regex (empty = no exclusions)
#
# The fixtures in examples/ are SUPPOSED to look like a real person's resume —
# a fake salary and a fake phone number are the point of them. So the shapes
# that a fixture legitimately carries (money) only warn, and the shapes that
# should never be real (emails, phones) fail only when they aren't obviously
# reserved-for-documentation values.
PATTERNS=(
  'absolute home path|fail|/Users/[a-zA-Z0-9._-]+|'
  'real email address|fail|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}|@example\.(com|org|net)'
  'real phone number|fail|\(?[0-9]{3}\)?[ .-][0-9]{3}[ .-][0-9]{4}|[（(]?555[)）]?[ .-]'
  'money figure|warn|\$[0-9]{2,3}(,[0-9]{3})?[Kk]?|'
)

PATTERN_FAIL_OUT=""
PATTERN_WARN_OUT=""

for entry in "${PATTERNS[@]}"; do
  IFS='|' read -r label severity regex exclude <<< "$entry"

  # -o so each result is file:line:MATCHEDVALUE. The exclusion then applies to
  # the matched value alone. Filtering whole lines instead would let a real
  # phone number ride along on a line that also contained a 555 placeholder —
  # which is exactly what the first version of this script did.
  MATCHES=$(grep -rInoE "${EXCLUDES[@]}" -- "$regex" . 2>/dev/null)
  if [[ -n "$exclude" && -n "$MATCHES" ]]; then
    MATCHES=$(printf '%s\n' "$MATCHES" \
      | awk -F: -v ex="$exclude" '{ v=$0; sub(/^[^:]*:[0-9]+:/,"",v); if (v !~ ex) print }')
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

# examples/ is deliberately excluded. It's a reviewed fixture set full of
# invented company and person names, and sweeping it buries the signal. The
# pass is aimed at skills/ and docs/ — the prose that gets rewritten during a
# port, which is exactly where an unlisted real employer name would land.
ALLOW='^(Jordan Vale|Copperline Health|Northwind Logistics|Brightline Outfitters|Lakeshore State University|Care Access|Claude Code|Claude Desktop|Google Docs|Google Drive|VS Code|Visual Studio|Microsoft Word|Applicant Tracking|Atomic Resume|Open Folder|Download ZIP|Career Highlights|Not Extracted|Key Skills|Work Experience|Print Preview|Page Setup|Background Graphics|Read Me|Getting Started|New Vault|Command Line|Terminal App|The Agent|The Person|This Repo|Your Career|United States|New York|San Francisco|FULL NAME|JOB TITLE|MONTH YEAR|ISSUING BODY|FICTIONAL EXAMPLE|COMPANY NAME|SCHOOL NAME)$'

PROPER=$(grep -rIhoE '\b[A-Z][a-zA-Z0-9]+(\s+[A-Z][a-zA-Z0-9]+)+\b' \
  "${EXCLUDES[@]}" -- skills/ docs/ templates/ ./*.md 2>/dev/null \
  | sed 's/[[:space:]]\+/ /g' \
  | grep -vE "$ALLOW" \
  | sort | uniq -c | sort -rn)

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

hr
if [[ $FAILED -eq 1 ]]; then
  echo "FAILED. Fix every hit above before pushing."
  echo
  echo "If a term is flagging a genuine false positive, narrow it in"
  echo "$TERMS_FILE (or move it below the '=== WARN ===' line) rather than"
  echo "deleting it. Don't loosen the check to make it quiet."
  exit 1
fi

if [[ $WARNED -eq 1 ]]; then
  echo "No failures. Warnings above are worth a look before you push."
else
  echo "Clean. No denylist terms, no pattern hits, nothing unexpected."
fi
exit 0

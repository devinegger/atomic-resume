#!/usr/bin/env bash
# Case-insensitive sweep of the repo for terms in scrub-terms.txt.
# Both this script and scrub-terms.txt are gitignored — the denylist
# itself is sensitive and never gets published.
#
# Usage: ./scripts/scrub-check.sh
#
# Exits 0 and prints nothing if clean. Exits 1 and prints every hit,
# grouped by term, if anything is found.

set -euo pipefail

cd "$(dirname "$0")/.."

TERMS_FILE="scrub-terms.txt"

if [[ ! -f "$TERMS_FILE" ]]; then
  echo "No $TERMS_FILE found. Nothing to check against." >&2
  echo "Create it (one denylist term per line, # comments allowed) before running this." >&2
  exit 1
fi

FOUND=0

while IFS= read -r term; do
  # Skip blank lines and comments.
  [[ -z "$term" || "$term" =~ ^[[:space:]]*# ]] && continue

  # Search everything except .git, node_modules, and the denylist files
  # themselves. Case-insensitive, fixed-string (not regex) matching.
  MATCHES=$(grep -rIn \
    --fixed-strings \
    --ignore-case \
    --exclude-dir=.git \
    --exclude-dir=node_modules \
    --exclude="$TERMS_FILE" \
    --exclude="scrub-check.sh" \
    --exclude="EXTRACTION-PLAN.md" \
    "$term" . 2>/dev/null || true)

  if [[ -n "$MATCHES" ]]; then
    if [[ $FOUND -eq 0 ]]; then
      echo "Scrub check found hits:"
      echo
    fi
    FOUND=1
    echo "── \"$term\" ──"
    echo "$MATCHES"
    echo
  fi
done < "$TERMS_FILE"

if [[ $FOUND -eq 0 ]]; then
  echo "Clean. No denylist terms found."
  exit 0
else
  echo "Review each hit above. Fix real leaks; if a term is flagging a false"
  echo "positive (a denylist word that's also common English), narrow the"
  echo "term in scrub-terms.txt rather than deleting it outright."
  exit 1
fi

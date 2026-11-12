#!/usr/bin/env bash
# Blind grader calibration run.
# Usage: testing/calibration/run_grader.sh <label> [item-NN ...]
# Each item is graded by a fresh `claude -p` process that sees only the grader
# prompt, the rubric, the domain file and that one item. key.md is never read.
# Raw outputs go to testing/results/calibration/<label>/ (gitignored).
set -euo pipefail
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
LABEL="${1:?label required}"; shift
ITEMS=("$@"); [ ${#ITEMS[@]} -eq 0 ] && ITEMS=(item-01 item-02 item-03 item-04 item-05 item-06)
OUT="$REPO/testing/results/calibration/$LABEL"; mkdir -p "$OUT"
WORK="$(mktemp -d)"   # empty cwd so no project CLAUDE.md or memory is loaded

build_prompt() {
  local item="$1" dir="$REPO/testing/calibration/items"
  echo "Grade the run below. Follow the grader prompt exactly. Inputs not provided (e.g. a separate persona.md or posttest.json) are summarized in the run record. Reply with the JSON object only."
  echo; echo "===== grader-prompt.md ====="; cat "$REPO/testing/grader-prompt.md"
  echo; echo "===== rubric.md ====="; cat "$REPO/testing/rubric.md"
  echo; echo "===== brindle-bridge.md (domain; the tutor saw only 'Material to teach') ====="; cat "$REPO/testing/domains/brindle-bridge.md"
  echo; echo "===== $item.md (run record) ====="; cat "$dir/$item.md"
  if [ -f "$dir/$item.html" ]; then echo; echo "===== $item.html (artifact) ====="; cat "$dir/$item.html"; fi
}

for it in "${ITEMS[@]}"; do
  ( build_prompt "$it" | (cd "$WORK" && claude -p --tools "" ) > "$OUT/$it.json" 2> "$OUT/$it.err" ) &
done
wait
echo "wrote $OUT"

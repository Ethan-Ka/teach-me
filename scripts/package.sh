#!/bin/sh
# Build dist/teach-me.zip for upload to claude.ai (Customize > Skills).
# Usage: scripts/package.sh [--short]
#   --short  replace the description with packaging/description-200.txt
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SRC="$ROOT/skills/teach-me"
OUT="$ROOT/dist/teach-me.zip"
SHORT=0
[ "${1:-}" = "--short" ] && SHORT=1

STAGE=$(mktemp -d)
trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$STAGE/teach-me"
cp "$SRC/LICENSE.txt" "$STAGE/teach-me/"
cp -R "$SRC/references" "$STAGE/teach-me/references"

if [ "$SHORT" = 1 ]; then
  python3 - "$SRC/SKILL.md" "$ROOT/packaging/description-200.txt" "$STAGE/teach-me/SKILL.md" <<'PY'
import re, sys
src, desc_file, out = sys.argv[1:]
text = open(src, encoding="utf-8").read()
desc = open(desc_file, encoding="utf-8").read().strip().replace("'", "''")
m = re.match(r"---\n(.*?)\n---\n", text, re.S)
fm = m.group(1)
# description is a block scalar ("description: |") with indented lines, ending at the next top-level key
new_fm, n = re.subn(r"^description:.*?(?=^\S)", "description: '" + desc + "'\n", fm + "\n", count=1, flags=re.S | re.M)
assert n == 1, "description not found"
open(out, "w", encoding="utf-8").write("---\n" + new_fm.rstrip("\n") + "\n---\n" + text[m.end():])
PY
else
  cp "$SRC/SKILL.md" "$STAGE/teach-me/SKILL.md"
fi

find "$STAGE" -name .DS_Store -delete
mkdir -p "$ROOT/dist"
rm -f "$OUT"
(cd "$STAGE" && zip -qr -X "$OUT" teach-me)
echo "Built $OUT$([ "$SHORT" = 1 ] && echo ' (short description)')"

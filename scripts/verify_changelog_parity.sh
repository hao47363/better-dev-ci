#!/usr/bin/env sh
# Fails when root CHANGELOG.md and github-ci/CHANGELOG.md differ (run after sync).
set -eu

root="${1:-.}"
a="${root}/CHANGELOG.md"
b="${root}/github-ci/CHANGELOG.md"

if [ ! -f "$a" ]; then
  echo "error: missing $a" >&2
  exit 1
fi
if [ ! -f "$b" ]; then
  echo "error: missing $b" >&2
  exit 1
fi

if ! cmp -s "$a" "$b"; then
  echo "error: CHANGELOG.md and github-ci/CHANGELOG.md differ." >&2
  echo "Run: bash scripts/sync-github-ci-mirror.sh" >&2
  echo "Then commit both files together." >&2
  exit 1
fi

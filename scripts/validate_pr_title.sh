#!/usr/bin/env sh

set -eu

pr_title="${1:-}"

if [ -z "$pr_title" ]; then
  echo "Error: PR title is required."
  exit 1
fi

conventional_types="$(sh ./scripts/get_config_value.sh governance.conventional_types "feat,fix,chore,docs,refactor,test,perf,ci,build,style,revert")"
types_pattern="$(printf '%s' "$conventional_types" | tr -d ' ' | tr ',' '|')"
pattern="^(${types_pattern})(\\([a-z0-9][a-z0-9._-]*\\))?: .+"

if ! printf '%s' "$pr_title" | grep -Eq "$pattern"; then
  echo "Invalid PR title format."
  echo "Expected: <type>(<scope>): <message> or <type>: <message>"
  echo "Example: feat(api): add account endpoint"
  echo "Example: docs: add onboarding guide"
  echo
  echo "Allowed types: $conventional_types"
  echo "Scope rules: lowercase letters, numbers, dot, underscore, dash"
  exit 1
fi

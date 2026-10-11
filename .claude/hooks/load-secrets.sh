#!/bin/bash
# SessionStart hook: in cloud sessions, read the keys listed in
# .claude/secrets.env.tpl from 1Password and export them for the session.
# Prints variable names only, never values. Never fails the session.

[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0

log() { echo "load-secrets: $*" >&2; }

if [ -z "${OP_SERVICE_ACCOUNT_TOKEN:-}" ]; then
  log "OP_SERVICE_ACCOUNT_TOKEN is not set on the cloud environment; skipping"
  exit 0
fi
if ! command -v op >/dev/null 2>&1; then
  log "1Password CLI (op) is not installed; add it in the environment's setup script"
  exit 0
fi
if [ -z "${CLAUDE_ENV_FILE:-}" ]; then
  log "CLAUDE_ENV_FILE is not set; cannot export variables"
  exit 0
fi

tpl="${CLAUDE_PROJECT_DIR:-.}/.claude/secrets.env.tpl"
[ -f "$tpl" ] || exit 0

loaded=()
missing=()
while IFS='=' read -r name ref; do
  case "$name" in ''|\#*) continue ;; esac
  if value=$(op read --no-newline "$ref" 2>/dev/null); then
    printf 'export %s=%q\n' "$name" "$value" >> "$CLAUDE_ENV_FILE"
    loaded+=("$name")
  else
    missing+=("$name")
  fi
done < "$tpl"

[ ${#loaded[@]} -gt 0 ] && echo "Loaded from 1Password: ${loaded[*]}"
[ ${#missing[@]} -gt 0 ] && echo "Could not read from 1Password: ${missing[*]}"
exit 0

---
name: log-papercut
description: "Use the moment a skill, tool, CLI, connector or CI step snags you and you work around it (wrong flag or unit, missing env var, a refused command, a doc that is wrong, a retry loop). Appends one JSON line to the project's papercut log so the snag gets grouped and fixed, then you carry on."
---

# Log a papercut

A papercut is a small snag in a skill or tool that cost you time and that you worked around: it is not the task's own bug. Log it while you still remember the details, in one step, then go back to your work. Don't stop to fix it unless the fix is one line and yours to make.

Log one when:
- a skill told you something wrong or out of date, or left out a step you needed
- a tool or command failed in a way its docs didn't warn about (wrong unit, wrong flag, a refused command, a permission wall)
- you needed an env var, key or setup step nobody mentioned
- you retried something that could never pass (a poll that repeats a 404)

Don't log: your own mistakes, the product bug you were asked to fix, or a snag you already logged in this session.

## The line

One JSON object per line, fields in this order:

| Field | What goes in it |
|---|---|
| `v` | `1` |
| `ts` | now, ISO 8601 UTC |
| `thread` | your thread or session id |
| `target` | the skill or tool's name as you'd call it: `verify`, `gh`, `linear`, `npx skills`. One snag, one target |
| `kind` | `skill`, `tool`, `mcp`, `cli`, `env`, `ci`, `doc` or `other` |
| `tried` | what you did, with the exact command or call |
| `expected` | what you expected |
| `got` | what happened, with the error text |
| `fix` | the change that would stop it happening again, or `""` |
| `minutes` | roughly how long it cost you (a number) |
| `fixed` | a PR or commit link if you fixed it on the spot, else leave it out |

Never put keys, tokens, passwords, emails or phone numbers in a line: write `[key]` instead. The weekly grouping masks what it can, but the log itself is shared.

## Steps

1. Find the log: `$PAPERCUTS_FILE` if set, else `/mnt/project-files/agent-platform/papercuts/papercuts.jsonl`. If its folder doesn't exist, say so in one line in your reply and skip logging; don't create the folder.
2. Append exactly one line with one shell call, built by `jq` so quotes and newlines are escaped. Never rewrite, sort or truncate the file: other sessions append to it at the same time.

```sh
jq -nc --arg thread "$THREAD" --arg target gh --arg kind cli \
  --arg tried 'gh api repos/o/r/actions/runs' --arg expected 'the run list' \
  --arg got 'HTTP 403: Resource not accessible by integration' \
  --arg fix 'the setup skill names the actions:read scope' --argjson minutes 10 \
  '{v:1, ts:(now|todate), thread:$thread, target:$target, kind:$kind, tried:$tried, expected:$expected, got:$got, fix:$fix, minutes:$minutes}' \
  >> "${PAPERCUTS_FILE:-/mnt/project-files/agent-platform/papercuts/papercuts.jsonl}"
```

No `jq`: `node -e 'process.stdout.write(JSON.stringify({...})+"\n")' >> <file>` does the same.

3. Carry on with your task. Mention the papercut only if it changed what you could deliver.

## When logging fails

- Permission denied or read-only mount: skip it and say in one line what you would have logged.
- The append was refused by a permission prompt: don't retry it; put the line in your reply instead.

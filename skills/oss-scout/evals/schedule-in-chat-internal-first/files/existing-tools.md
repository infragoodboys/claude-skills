# Our tools (ops team)

| Tool | What it is | Reads | Used by |
|---|---|---|---|
| ops-bot | Discord bot (TypeScript, on Vercel) | Linear, Fibery, our DB | whole team |
| schedule-mcp | MCP server we wrote in October | Shift-schedule system: shifts, swaps, who is on today (tools: list_shifts, get_person_week, list_swaps) | the training reminders routine only; scope `training:read` |
| crm-sync | nightly job | CRM -> DB | reports |
| pager | alert relay | uptime checks | on-call |

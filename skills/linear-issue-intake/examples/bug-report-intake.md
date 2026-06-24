# Example: Vague agent bug report → reproducible Bug ticket

Demonstrates single-issue intake with **agent-language translation**: turning "the
call thing is broken" into a ticket a developer can reproduce. Shows the
preview-before-write discipline.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Do not create yet — answer the 5 questions below.
- **Why:** "broken" isn't reproducible; a developer needs the failing action, screen, scope, error, and whether it blocks work.

---

**User:** An agent told me "the call thing is broken." File it under Revup Portal.

**Assistant:** "Broken" isn't reproducible yet — I don't want to file a ticket a
developer can only stare at. Let me translate it into specifics. Confirming the
destination project is **Revup Portal**.

Five quick questions (I'll keep them in plain terms for the agent):

1. Were they unable to **start** a call, **receive** one, **end** one, or **save
   the call result**?
2. Which screen were they on when it happened?
3. Did it happen with one lead or several?
4. Did they see any error message or did it just not respond?
5. Is this blocking them from working leads right now?

**User:** They couldn't save the disposition after the call ended. On the call
screen. Happened on multiple leads. No error, the Save button just did nothing.
And yeah — they can't log call outcomes at all right now.

**Assistant:** That's a reproducible, high-impact bug. Here's the preview:

```markdown
I classified this as: Bug
Recommended priority: High (agents cannot log call outcomes; multiple leads)

Destination:
- Team: Engineering
- Project: Revup Portal
- Status on create: Triage

Title: Bug: Agent cannot save lead disposition after call ends (Save does nothing)

Labels to apply: bug, from-customer

Likely duplicates in this project: None found.

Known / Inference / Assumption:
- Known: Save disposition after call fails; call screen; multiple leads; no error
  shown; Save button unresponsive; agent fully blocked from logging outcomes.
- Inference: the save action or its API call is failing silently.
- Assumption (please confirm): production, not staging.

Ticket body:
## Summary
After a call ends on the Revup call screen, clicking Save on the lead disposition
does nothing. The agent cannot log call outcomes.

## Issue Type
Bug

## Affected Area
- Product area: Revup Portal — call handling
- Page/screen: Call screen (post-call disposition)
- User role affected: Agent
- Environment: (to confirm — assumed production)
- Related records/examples: occurred across multiple leads (IDs not yet provided)

## Current Behavior
Save button on the post-call disposition is unresponsive; nothing saves, no error.

## Expected Behavior
Disposition saves and the call outcome is recorded against the lead.

## Steps to Reproduce
1. Take/complete a call on the Revup call screen.
2. Enter a disposition after the call ends.
3. Click Save.
4. Observe: nothing happens; disposition is not saved.

## Frequency
- Occurs: multiple leads (frequency within those: to confirm)
- Regression: unknown
- Scope: at least one agent; multi-agent scope to confirm

## Business Impact
Agents cannot log call outcomes — directly blocks lead workflow and corrupts
reporting on call results.

## Evidence / Context
- Error message: none shown
- Lead IDs / console errors / network failures: not yet collected

## Acceptance Criteria
- [ ] Developer can reproduce the silent save failure.
- [ ] Root cause identified.
- [ ] Disposition saves reliably post-call.
- [ ] No regression to call completion flow.

## Priority Recommendation
High

## Open Questions
- Production or staging?
- Affecting one agent or many?
- Any console/network error when Save is clicked?
- A couple of example lead IDs?
```

I have enough to create this. Create it now, or hold while you grab the env +
example lead IDs (they'd make it even stronger)?

*(Ticket is not created until the user approves.)*

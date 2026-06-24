# Bug Ticket Template

Linear issue description format for a Bug. Fill from known facts; flag anything
unconfirmed in Open Questions rather than guessing.

> Do **not** fabricate the evidence-bearing fields. Steps to Reproduce, the error
> message, Environment, and Regression status must come from the user or a tool.
> If you don't have them, leave the field blank or write `(unconfirmed)` and move
> the question to Open Questions. Invented-but-plausible repro steps are worse
> than none — they send developers down false paths.

```markdown
## Summary

[Brief plain-English summary of the bug.]

## Issue Type

Bug

## Affected Area

- Product area: [captured here — there are no area labels]
- Page/screen:
- User role affected:
- Environment: [production / staging / both; browser; device]
- Related records/examples: [lead / client / account / call IDs]

## Current Behavior

[What is currently happening.]

## Expected Behavior

[What should happen instead.]

## Steps to Reproduce

1.
2.
3.

## Frequency

- Occurs: [always / sometimes / once / unknown]
- First noticed:
- Regression: [yes / no / unknown]
- Scope: [one user / multiple users / all users]

## Business Impact

[Operational, revenue, client, agent, compliance, or data impact.]

## Evidence / Context

- Screenshot:
- Recording:
- URL:
- Lead ID / Client ID / Account ID:
- Error message:
- Logs / webhook details:

## Acceptance Criteria

- [ ] Developer can reproduce or identify the failure path.
- [ ] Root cause is identified.
- [ ] Expected behavior is restored.
- [ ] Relevant edge cases are tested.
- [ ] No regression to adjacent workflow.

## Priority Recommendation

[Urgent / High / Medium / Low]

## Open Questions

- [Only unresolved questions that matter. If created via "create anyway," list
  every missing field here.]
```

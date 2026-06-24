# Spike Ticket Template

Linear issue description format for a Spike — a timeboxed investigation to resolve
an unknown before committing to a build. A spike's "done" is a **decision plus
evidence**, not a shipped feature. Use this when the direction is valid but the
path is uncertain (see `references/intake-principles.md` §4).

```markdown
## Summary

[One sentence: the question this spike answers and why it blocks work.]

## Issue Type

Spike

## Question to Answer

[The single decision or unknown this spike resolves. Be specific — "Can we get
real-time call events from the Sundialer API?" not "Investigate calls."]

## Why This Is a Spike (not a build)

[What is uncertain: feasibility, approach, effort, dependency, or design choice.]

## Background / Context

[What's known so far, including anything tools already surfaced.]

## Investigation Plan

- [ ] [Concrete things to try, read, or test.]
- [ ]
- [ ]

## Timebox

[e.g., half a day / 2 days. A spike without a timebox tends to sprawl.]

## Definition of Done

- [ ] The question above is answered with evidence.
- [ ] A recommendation is recorded (build / don't build / build differently).
- [ ] Enough detail exists to write the follow-up build ticket(s), or to close
      the idea.

## Affected Area

- Product area:
- Systems / APIs / data involved:

## Dependencies

- Blocks: [work waiting on this decision]
- Depends on: [access, docs, vendor responses needed to investigate]

## Priority Recommendation

[Urgent / High / Medium / Low]

## Open Questions

- [Only unresolved questions that matter to the investigation.]
```

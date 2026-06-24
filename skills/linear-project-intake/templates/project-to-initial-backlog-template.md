# Project → Initial Backlog Template

Sketch the first issues a project implies — as a **preview only**. This skill does
**not** create issues. Once the project exists and is approved, hand this backlog
to `linear-issue-intake`, which runs its own intake (questionnaire, readiness gate,
duplicate check) before creating anything.

Use this to show the user the shape of the work, and to surface which pieces are
real issues versus spikes versus still-too-vague.

```markdown
## Initial backlog (preview only) — [project]

| # | Proposed title | Type | Phase | Readiness | Notes |
|---|----------------|------|-------|-----------|-------|
| 1 | [Type]: [...]  | Feature | 1 (MVP) | Ready       | |
| 2 | [Type]: [...]  | Bug     | 1       | Needs-info  | missing repro/role |
| 3 | Spike: [question] | Spike | 1     | Ready       | feasibility unproven — do this first |
| 4 | [Type]: [...]  | Improvement | 2 | Deferred    | later phase |

Readiness legend: Ready / Needs-info / Spike / Deferred

Sequencing note:
- Do the spike(s) before the build issues they gate.
- MVP slice = phase 1 only; later phases stay provisional until phase 1 lands.
```

### Handoff

After the project is created and approved, tell the user:

> "The project is created. To file these issues, I'll switch to **linear-issue-
> intake**, which will run intake on each (questions, duplicate check, preview)
> before anything is written. Want me to start with the phase-1 items?"

Do not create these issues from this skill, and do not treat this list as approved
work — each item still passes the issue skill's Readiness Gate first.

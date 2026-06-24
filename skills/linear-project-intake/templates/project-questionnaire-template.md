# Project Questionnaire Template

Structure for the questionnaire-first interview. Ask only the fields still missing,
3–7 at a time, in plain language. Fill from the user and from tools — never
fabricate. Map answers onto the 15 extraction fields in
`references/project-intake-principles.md`.

```markdown
## Project intake — [working title]

### Problem & users
- Business problem (concrete, who feels it):
- Primary user / stakeholder:
- Secondary users:
- Internal or external:

### Today vs. tomorrow
- Current workflow (how it's done now):
- Desired future state (what "after" looks like):

### UI / functional behavior (if the project includes a screen, dashboard, flow, or form)
- Surface(s) — new screen or modifying an existing one (which?):
- Primary task the user comes here to do:
- Main flow (step by step: do this → then this happens → then…):
- Key controls/elements and what each does when used:
- Data/values shown, and where each comes from:
- States — empty / loading / error / no-permission:
- Role differences (agent vs. admin vs. client):
- Edge cases (missing / invalid / very large values):
- Observable success ("a user can ___ and see ___"):
- Evidence attached (screenshot / sketch / screen-share)?

### Value & why now
- Business value (revenue / cost / risk / compliance / retention):
- Why now / trigger:

### Boundaries
- In scope:
- Out of scope (explicit non-goals):

### Done
- Success criteria (measurable where possible):
- Definition of done (whole project closes when…):

### Shape
- Milestones / phases (MVP slice first):
- Dependencies (teams, projects, approvals, sequencing):

### Unknowns & risk
- Risks (trigger → impact → mitigation):
- Technical unknowns (spike candidates):
- Data / system / vendor dependencies (capabilities confirmed or assumed?):

### Tracking
- Known facts:
- Inferences:
- Assumptions (to confirm):
- Open questions:
```

### Interview discipline

- Challenge filler in answers ("make it scalable" → scalable along which axis, to
  what target?).
- If "technical unknowns" or "vendor dependencies" turn out to dominate — i.e., we
  don't yet know whether the core is buildable — stop shaping a project and
  recommend a spike (see the principles file §3 and §8).
- Resolve with tools first (docs for vendor capability, codebase for current
  behavior) before asking the user.

# Project Preview Template (show before any write)

Always show this before creating or modifying a Linear project. State the
destination, the duplicate-check result honestly, and what is in *and* out of
scope. This skill writes the **project record only** — issues are handed to
`linear-issue-intake`.

---

## Variant A — Project ready to create

```markdown
Proposed Linear project:
- Team: Engineering
- Project name: [name]
- Summary: [1–3 sentence plain-English description]
- Business problem: [concrete problem + who feels it]
- Desired future state: [what "after" looks like]
- Business value: [why it matters; quantified where possible]

In scope:
- [...]

Out of scope:
- [explicit non-goals — required; a project with no boundary isn't ready]

Success criteria / Definition of done:
- [...]

Milestones / phases (provisional):
1. [MVP slice]
2. [...]

Dependencies / risks / technical unknowns:
- Dependencies: [...]
- Risks: [...]
- Technical unknowns (spike candidates): [...]

Project duplicate check:
- [overlapping project + relationship | none found | NOT RUN — Linear unavailable]

Known / Inference / Assumption:
- Known: [...]
- Inference: [...]
- Assumption (please confirm): [...]

Open questions affecting scope:
- [...]

Initial backlog (PREVIEW ONLY — not created here; use linear-issue-intake):
| # | Title | Type | Readiness |
|---|-------|------|-----------|
| 1 | [...] | Feature | Ready / Needs-info / Spike |

Project Readiness Gate: PASS. Shall I create this project?
(Issues are created separately via linear-issue-intake after the project exists.)
```

---

## Variant B — Not ready to be a project (or should be a spike)

```markdown
This isn't ready to become a project yet — here's why, and what I'd do instead.

What's missing / blocking:
1. [e.g., no out-of-scope boundary]
2. [e.g., core feasibility unproven — vendor API capability unconfirmed]

Recommendation:
- [ ] Answer the questions below, then I'll re-shape the project, OR
- [ ] Run a spike first: "[Spike: question to resolve]" — feasibility/approach is
      the dominant unknown, so a project would be premature. (Create the spike via
      linear-issue-intake.)

Questions (3–7, plain language):
1.
2.
3.
```

---

## Degraded mode note

If the Linear connector is unavailable, you may still produce Variant A or B as a
preview, but you may not create anything, workspace facts are *unverified
(snapshot)*, and the duplicate check must read "NOT RUN — Linear unavailable."

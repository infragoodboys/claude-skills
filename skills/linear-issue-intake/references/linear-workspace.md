# Linear Workspace Reference

Source-of-truth values for where and how this skill writes work. These are a
**snapshot** (captured 2026-06-10). Projects, labels, and statuses drift over
time — confirm against the live Linear workspace via the connector before
writing. If a live value disagrees with this file, the live workspace wins.

## Destination model

All work is written to a single team. There is only one team, so do not re-ask or
re-validate which team to use.

| Field      | Value                                    |
|------------|------------------------------------------|
| Team name  | Engineering                              |
| Team key   | `ENG`                                    |
| Team ID    | `e486d08b-c549-40db-a584-eb88b48a64ba`   |

The only destination that must be established per run is the **project** (for
issue intake) or the **new project record** (for Project Builder Mode).

## Statuses

| Status   | ID                                       | Use                                  |
|----------|------------------------------------------|--------------------------------------|
| Triage   | `297a89a8-f716-40f5-89a2-3a6d9cc05a27`   | **Default landing status.** "Not yet reviewed." |
| Backlog  | (resolve live)                           | Alternate landing spot if needed.    |
| Todo     | (resolve live)                           | Alternate landing spot if needed.    |

Default to `Triage` on creation. `Triage` already means "not yet reviewed," so no
separate intake/needs-review label is required.

## Labels that exist (Engineering team)

Apply only labels that **actually exist** after reconciling against the live
workspace. Do not invent labels.

- **Type group:** `bug`, `feature`, `improvement`, `ui-ux`, `spike`, `tech-debt`
- **Automation group:** `agent-candidate`, `human-review-required`,
  `automation-risk`, `recurring-workflow`
- **Standalone:** `from-customer`

### Label mapping

| Intake signal                                   | Label          |
|-------------------------------------------------|----------------|
| Bug                                             | `bug`          |
| Feature                                         | `feature`      |
| Improvement                                     | `improvement`  |
| UI/UX                                           | `ui-ux`        |
| Spike / investigation                           | `spike`        |
| Engineering cleanup, refactor, debt paydown     | `tech-debt`    |
| Report originates from agent / operator / customer | `from-customer` |

If an item spans categories, apply the primary type label and add the secondary
type as needed (e.g., primary `bug` + secondary `ui-ux`).

### Label reconciliation procedure

1. Determine desired labels from issue type and report origin.
2. List the labels that exist in Linear (via the connector).
3. Apply the ones that exist. If a desired label is missing, map it to the
   closest existing label or omit it — and note that choice in the preview.
4. The preview must reflect the labels that will *actually* be applied, not the
   labels you wished existed.

### Do not misuse `human-review-required`

In this workspace `human-review-required` means "AI/automation may assist but a
human must approve" — an automation-governance signal. It does **not** mean "this
ticket hasn't been triaged." Never use it as an intake/review marker; `Triage`
status covers that.

## Area labels: none

There are **no** area labels. `frontend`, `backend`, `data`, `auth`, `billing`,
`performance`, `mobile`, and portal-name labels do **not** exist. Product area is
expressed two ways:

- **Which project** the work lands in.
- The **Affected Area** section in the ticket body.

Never create an area label to compensate. Capture the area in the body.

## Projects (snapshot — confirm live)

Current Engineering projects as of 2026-06-10. Always confirm against the live
list, because projects change.

| Project                                                | Notes                                                              |
|--------------------------------------------------------|--------------------------------------------------------------------|
| Sundialer.ai Portal Integration (Kinetic)              |                                                                    |
| Good Boys Portal Web Feedbacks                         | Already receives auto-triaged customer feedback via the portal → Triage integration. Only use it if the report belongs to that flow. |
| Dev Team OS — Linear Standardization & Automation      |                                                                    |
| CFO / Bookkeeping Automation Bot — MVP                 |                                                                    |
| Revup Portal                                           |                                                                    |
| Good Boys Portal v2                                    |                                                                    |
| Drippy Leads — Admin Analytics Redesign                | Completed.                                                          |
| Good Boys Portal Front End Rewrite                     | Completed.                                                          |

### Project selection rules

- **Issue intake:** establish the active project once per session. Reuse it for
  every issue that session. Re-confirm only when the user changes projects, the
  item clearly belongs elsewhere, Linear reports the active project invalid, or
  session context was lost.
- **Project Builder Mode:** you are creating a *new* project record. Confirm the
  name, and confirm it is not a duplicate of an existing project, before writing.
- Avoid completed projects as destinations unless the user explicitly intends it.

## Defaults summary

- **Team:** Engineering (fixed).
- **Project:** selected once per session (issues) / created once per run
  (Project Builder).
- **Status:** `Triage` by default.
- **Labels:** issue-type label + `from-customer` (when origin is agent /
  operator / customer) + any secondary type label — existing labels only.
- **Assignee:** none, unless the user explicitly names an owner or a routing rule
  applies.
- **Write posture:** preview first, duplicate-check first, create only on
  explicit approval, never bulk-create projects, never batch-create issues
  without batch approval.

## Duplicate / related check

Before creating an issue, search the active project for similar:

- Title
- Affected page / screen
- User role
- Error message
- Feature area
- Referenced lead / client / account example

If a likely duplicate exists, do not auto-create. Surface the candidate, explain
the likely relationship, and ask whether to comment on it, link it as related, or
create a separate issue. If confirmed separate, create and link the related
issue.

In a batch, run the duplicate check **per item**, not once for the whole batch.

### Reporting the check honestly

- Search ran, nothing matched → "Duplicate check: none found."
- Search ran, candidate found → surface it and ask how to proceed.
- Search **could not run** (connector unavailable/erroring) → "Duplicate check:
  NOT RUN — Linear unavailable." Never report "none found" for a check you did
  not actually perform. A skipped or impossible check is never reported as clean.

## When Linear is unavailable (degraded mode)

If the Linear connector is not connected, errors, or returns nothing verifiable:

- You may still interview, classify, and produce a **preview**.
- You may **not** create, update, assign, comment on, label, or move any object.
- Treat every value in this file as **unverified (from snapshot)** and say so —
  do not assert that projects, labels, or statuses are current.
- Do not assert duplicate-check results (see above).
- Tell the user the connector needs to be enabled before anything can be written,
  and offer to hand them a ready-to-paste preview in the meantime.

# Bulk Issue Readiness Template

Used in **Bulk Issue Intake Mode** to review a batch of candidate issues before
creating any of them. The point is a single, honest readiness pass and **one
consolidated approval** — not silent mass creation.

Never batch-create without showing this and getting an explicit go-ahead.

```markdown
# Batch intake readiness — [N] candidate issues

Destination:
- Team: Engineering
- Project: [active project]
- Status on create: Triage

## Readiness table

| # | Proposed title | Classification | Priority | Labels (existing only) | Readiness | Create strategy | Missing context | Duplicate risk | Recommended action |
|---|----------------|----------------|----------|------------------------|-----------|-----------------|-----------------|----------------|--------------------|
| 1 | [Type]: [...]  | Bug   | High   | bug, from-customer | Ready            | Create | — | none found / NOT RUN | Create on approval |
| 2 | [Type]: [...]  | Bug   | High   | bug, from-customer | Likely-duplicate | Merge  | — | duplicates #3 | Combine #2 + #3 into one ticket |
| 3 | [Type]: [...]  | Bug   | High   | bug, from-customer | Likely-duplicate | Merge  | — | duplicates #2 | Same failure as #2 — file once, cite both reporters |
| 4 | [Type]: [...]  | Feature | Medium | feature, from-customer | Needs-info     | Hold   | target user + acceptance criteria | NOT RUN | Ask Q before any create |
| 5 | [Type]: [...]  | Feature | —      | feature, from-customer | Needs-info     | Route to linear-project-intake | scope/decision undefined | n/a | Broad initiative — shape as a project, not a ticket |
| 6 | [Type]: [...]  | Feature | —      | spike | Needs-info | Spike | feasibility of [X] unconfirmed | NOT RUN | Propose `Spike: [question]` instead of a build ticket |
| 7 | [Type]: [...]  | —     | —      | — | Needs-info | Reject / not Linear-ready | no extractable requirement (pure filler) | n/a | Ask for the one essential fact (who + what problem) before this can exist |

**Readiness** describes the *state of context*; **Create strategy** is the *decided
next action*. Keep them distinct — an item can be Needs-info (readiness) and still
have a clear strategy (Hold, Route, Spike, or Reject).

Readiness legend:
- **Ready** — enough context to create now.
- **Needs-info** — blocked on the listed missing fields (intake questions below).
- **Likely-duplicate** — matches another item or an existing issue.
- **Recommend-spike** — valid direction, uncertain path.

Create strategy legend (allowed values):
- **Create** — fully ready; create on approval.
- **Hold** — vague but valid; gather the missing context first, then re-assess.
- **Merge** — duplicate of / related to another item; combine into one ticket
  rather than filing twice.
- **Route to linear-project-intake** — project-level (an initiative, PRD, or broad
  capability like "better reporting"); not a single issue. Hand it to the project
  skill.
- **Spike** — valid direction but technically uncertain; propose a timeboxed spike
  instead of a build ticket.
- **Reject / not Linear-ready** — hollow filler with no extractable requirement;
  do not file even on "create anyway" — ask for the one essential fact first.

## Grouped by Create strategy

**Create (ready now):**
- #1, [others] — create on approval.

**Hold (need answers first):**
For #4:
1. [question]
2. [question]

[Repeat per Hold item — keep total questions tight, 3–7 at a time across the batch.]

**Merge (duplicates/related):**
- #2 + #3 → same failure; file once, citing both reporters. Confirm before merging.

**Route to linear-project-intake:**
- #5 → broad/initiative-level ("better reporting" style); shape as a project, not a
  ticket.

**Spike:**
- #6 → propose `Spike: [question]` instead of a build ticket.

**Reject / not Linear-ready:**
- #7 → no extractable requirement; ask for the one essential fact (who + what
  problem) before this can become anything.

## Approval (must be scoped)

A vague "ok / sure / go ahead" approves **nothing specific** — ask which items.
Tell me how to proceed. For example:

- "Create #1 now, hold the rest" — I create only the named Ready items.
- "Answers: [#2 …]" — I update readiness and re-preview.
- "Create all anyway" — I create every item *that has a real requirement*, with
  each gap captured in that ticket's Open Questions. Items that are pure filler
  with no extractable requirement are NOT created even under "create all anyway" —
  I'll flag those and ask for the one essential fact first.

Default behavior: create only the explicitly-named or "Ready" subset, never the
whole list silently. For large batches (more than ~10 items), I create in chunks
and re-confirm between chunks rather than firing everything at once.
```

Reminder: even after approval, apply only labels that exist in Linear, default to
`Triage`, assign no one unless told, and run the duplicate check against the
active project for each item first.

# CONTEXT — Business Brain (GBG Fibery Company OS) glossary

The ubiquitous language for how work is organized in the GBG Company OS. **Glossary only — no implementation details** (no field names, no Fibery mechanics; those live in the data dictionary and plans). Terms are resolved during grill sessions and added here as they settle.

_Started 2026-06-24 (grill-with-docs: triage / readiness-gate model)._

---

## Work hierarchy

**Initiative** — a strategic objective. Non-executable on its own; it is the "why" that a set of Projects rolls up to. Owned by an owner; spans many iterations. *Not* a task list and *not* a single deliverable.

**Project** — a workstream with a defined outcome that rolls up to an Initiative and contains Tasks. Every Project carries a **Project Doc**. *Not* a strategy (that's the Initiative) and *not* a single unit of work (that's a Task).

**Task** — the smallest executable unit of work; the thing a person actually does. Belongs to a Project (see open question on standalone tasks). Carries a one-line **Outcome**.

## The intake / readiness model

**Triage** — the **intake-only** holding state. A newly captured item waits in Triage until it is **Ready**. Triage is **one-way-out**: once an item is promoted out of Triage it never returns — a problem found later moves it to **Needs Decision** or **Blocked**, not back to Triage. (Keeps the Triage inbox purely "never groomed," never mixed with in-flight problems.)

**Ready** — an item that has met its **Definition of Ready** and can be promoted out of Triage.

**Definition of Ready (DoR)** — the per-type checklist an item must satisfy before it leaves Triage:
- **Task** — Owner · Due Date · Priority · **Outcome**. (Parent Project encouraged, provisionally optional — see Open.)
- **Project** — Owner · Target Date · Priority · a complete **Project Doc**.
- **Initiative** — Owner · **Objective** (the why) · target horizon · ≥1 Project beneath it.

**Promote** — to accept an item *out of* Triage into active work once it is Ready. Distinct from **Assign** (giving an item its Owner). An item is typically assigned *and* promoted together, but they are different acts.

**Outcome** — the one-line, observable statement of what "done" means for a Task ("Done = …"). The task-level equivalent of Acceptance Criteria.

## States that park active work

**Needs Decision** — an accepted (already-promoted) item parked because it has an open **blocking decision** — an internal call to make, usually the owner's. Distinct from Blocked. This is also where a *running* item goes if a blocking decision arises mid-flight (it does **not** return to Triage).

**Blocked** — an accepted item parked on an external **dependency** (another person, a vendor, a prerequisite) — not a decision. Distinct from Needs Decision.

## The Project Doc (a Project's Definition of Ready)

The required documentation a Project carries before it is Ready. Six sections:

**Summary** — one paragraph: what this project is.

**Goals** — the outcomes that define success. Outcomes, not activities.

**Plan / Milestones** — the high-level approach and its checkpoints. **Not** the task list — the executable work lives in the Project's Tasks, not here.

**Acceptance Criteria** — the observable conditions that mean the *whole project* is done (distinct from a Task's Outcome).

**Decisions to Resolve** — the live, **queryable** list of open decisions for an item (tracked separately from the narrative doc so "which items are waiting on a decision?" is answerable across the whole workspace). A decision can be **blocking** (it holds a new item in Triage, or sends a running item to **Needs Decision**) or **non-blocking** (rides along, visible, doesn't stop work). Decisions can arise at intake *or* mid-flight. A resolved decision graduates to the **Decision Log** only if it clears the **significance bar** (consequential, hard to reverse, or affects other projects/entities); routine project-local choices just resolve and are not logged.

**Out of Scope** — the guardrails: what this project explicitly is not / will not do.

## Records

**Decision Log** — the durable, **curated** record of consequential, hard-to-reverse company decisions, with rationale. It is *not* a dumping ground for every project choice — only significance-bar decisions land here (see Decisions to Resolve).

---

## Roles & capture

**Owner** — the single person **accountable** for an item. ("Owner" is our word; we do **not** adopt Linear's "Lead.")

**Follower** — someone who **watches** an item without being accountable. Many per item.

**Inbox** — the **capture surface** (a form, an MCP dump, or an **interactive interview**) through which new work *enters*. Distinct from **Triage**, the *state* the captured item then sits in. You capture *into the Inbox*; the item *waits in Triage*.

---

## Open / to be pinned
- **Task** without a parent **Project**: **provisionally allowed** for MVP (one-off ops chores), but triage must **always verify** whether the task belongs to a Project/Initiative before accepting it standalone. Final call **pending Andrew's input** — both positions stored (allow-standalone vs require-parent).
- **Inbox** (the capture surface — a form/dump) vs. **Triage** (the state work lands in).

---
name: triage-enrich
description: "Complete an EXISTING Not-Ready item already sitting in Triage in the GBG Fibery Company OS — fill in what's missing so a human can assign it. Use this WHENEVER Kyle or Andrew says 'enrich this', 'fill in the gaps on this task/project', 'what's missing on #N', 'finish triaging the queue', 'enrich the not-ready items', 'flesh this out', 'triage-enrich', or points at an existing Triage Task / Project / Initiative that needs more info before it can be assigned. Reads the existing entity, drafts empty CONTENT fields (Outcome/Project Doc/Objective) automatically, but for empty COMMITMENT fields (Suggested Owner/Priority/Due-Target Date) asks a bounded question rather than inventing a value — leaves it blank if unanswered. Recomputes Readiness Missing + open Decisions, leaves it in Triage. NEVER overwrites a human-entered value, never invents a commitment, never promotes, never creates a new entity. NOT for creating something new (use task-intake / project-intake / initiative-intake) and NOT for coding/dev work (Linear)."
---

# triage-enrich

Complete an **existing Not-Ready item in Triage** — fill the gaps so a human can approve + assign it fast. The intake skills *create*; **this one finishes the job on what's already there.** It raises readiness; the human still owns the gate. **Ask, don't guess:** content gaps (`Outcome`, Project Doc, `Objective`) are fine to draft automatically — that's AI-authored content by design. Commitment gaps (`Suggested Owner`/`Priority`/`Due Date`/`Target Date`) are not — those get a bounded question, same spirit as `project-intake`/`initiative-intake`'s interview, never an invented value.

> **Obey the shared contract: [[readiness-contract]]** (`references/readiness-contract.md` — tracked copy; source of truth `02-projects/gbg/fibery-company-os/readiness-contract.md`), especially **§6 (ENRICH addendum)**. It defines the Operating Contract, schema preflight, per-type write-scope + Definition of Ready + content templates, the Readiness-Missing rule, the audit-line schema, and dry-run. This skill states only what's specific to enriching. On any conflict, the contract wins.

## This skill in one line
An existing `Triage` Task/Project/Initiative that is `Not Ready` → the **same** entity with its empty **content** fields drafted and its empty **commitment** fields either answered-by-the-human-and-filled or left honestly blank, `Readiness Missing` recomputed, still in `Triage`, with **no human-entered value overwritten**.

## Content vs. commitment — the split that matters
- **Content** (`Outcome`, the Project Doc sections, `Objective`): the AI can legitimately author this from the entity's existing fields / `Raw Intake` / `AI Summary`. Draft it automatically if blank — that's the whole point of an "AI-drafted" suggestion.
- **Commitment** (`Suggested Owner`, `Suggested Priority`, `Suggested Due Date` / `Suggested Target Date` / `Suggested Horizon`): these represent a human decision (who's accountable, how urgent, when). **Never invent one.** If it's empty, ask a short, bounded question — "Who should own this? / How urgent — High/Medium/Low? / When's it due?" — using whatever context the entity already has (Raw Intake, related items) to make the question concrete, not generic. Fill it only from the human's actual answer. If the human declines, is unavailable, or this is a headless/batch run — leave it blank and say so in `Readiness Missing`; a fabricated suggestion is worse than an honest gap because it *looks* like real information.

## Input — what to enrich
- A **specific entity** (by public-id / id), **or**
- **"the Not-Ready Triage queue"** → query `Projects Management/{Tasks,Projects,Initiatives}` where `state = Triage` AND `Readiness Status = Not Ready`, and enrich each.
- **Dispatch by entity type** → apply that type's content template + DoR from the contract: Task → `Outcome`; Project → 5-section Project Doc (`Description`); Initiative → Objective (`Description`).

## Hard rules specific to enrich (on top of the contract)
1. **Existing only — never create.** If the target doesn't exist or isn't in `Triage`, stop and say so. (A genuinely new thing → the matching `*-intake` skill.)
2. **Read immediately before writing.** Fetch the live entity and compute from its current values (avoid the schema-cache lag on just-created selects).
3. **Content: fill EMPTY only, auto-drafted.** Draft canonical content (`Outcome` / Project Doc / `Objective`) only if blank. **Commitments: ask, don't invent.** An empty `Suggested *` gets a bounded question; fill it from the answer, or leave it blank if unanswered. Any field a human already set is untouchable either way — content *and* suggestions.
4. **Recompute, don't assume.** Refresh `Readiness Missing` (the empty-canonical DoR items) + `Decisions to Resolve`; update `Readiness Status` (it may now be Ready-eligible, but **never flip it to Ready** — the human does).
5. **Never promote, never set canonical commitments (Owner/Priority/Due-Target), never leave Triage.**
6. **Idempotent** by entity id — safe to re-run across the whole queue. Re-running after a human answered a commitment question fills it in; re-running with no new answer leaves it blank, unchanged.

## Procedure
1. **Schema preflight** (contract §1.3) on the target DB(s) — assert the fields you will write exist; abort with a clear message if a field is missing.
2. **Resolve targets** — the named entity, or the Not-Ready Triage queue.
3. For each: **read it now**; split its empty fields into **content** (auto-draftable) vs. **commitment** (ask first).
4. **Ask** a bounded round covering only the empty commitment fields across the batch (skip entities with none empty) — concrete questions grounded in each entity's own Raw Intake / Description, not generic.
5. Build the **mutation plan** = empty content fields (drafted) + empty commitment fields (from the answers just given, or left blank if declined/unanswered). **Dry-run → stop here, write nothing.**
6. **Apply** the fills — `update_entities` for text / `Suggested *`; `set_document_content` for the canonical doc only if blank. Do **not** call `set_state` (it stays in `Triage`).
7. **Audit-append** one line per entity (fail-closed; contract §5; `verb=enrich`; note which commitment fields came from an answer vs. stayed blank).
8. **Report** per entity: public-id, which fields you filled (and from where — drafted vs. human-answered), and the remaining `Readiness Missing` → "review + assign in the Triage Approval view."

## Acceptance
≥3 dry-run fixtures over existing Not-Ready items (one per type), graded on: **zero** human-value overwrites, content auto-drafted, commitment fields only filled from an answer (never invented), correct recomputed `Readiness Missing`; then 1 live canary on a real Triage item (eyeball + confirm the audit line). Record the canary public-id below.

## Changelog
- 2026-07-01 — v0.2. **Ask, don't guess.** Split empty-field handling into content (auto-draft, unchanged) vs. commitment (bounded question, never invented) per Kyle's correction: "I would think that we would actually want triage-enrich to have the same ideas as project/initiative-intake, where it is grilling people to get more information instead of just writing things automatically" — raised after a `Suggested Due Date` was fabricated with no basis during a live enrich pass. A declined/unanswered commitment now files as an honest blank, not a guess.
- 2026-06-27 — v0.1 created. **Reclaims the name `triage-enrich`** (the former create-Task skill is now `task-intake`) per the intake architecture decision (Fibery Decision Log #5). Implements §6 of [[readiness-contract]]. Pending: fixtures + canary.

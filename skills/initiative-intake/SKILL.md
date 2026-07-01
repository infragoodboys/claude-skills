---
name: initiative-intake
description: "Interview-first intake of a strategic objective / big-picture program into an Initiative in the GBG Fibery Company OS (Business Brain). Use WHENEVER Kyle or Andrew says 'create an initiative', 'intake this initiative', 'this is a strategic goal/program', '/initiative-intake', or frames a multi-project objective (the 'why' several projects roll up to) — even if they don't say 'initiative'. It INTERVIEWS first (challenges vague filler), drafts the Objective into the Description, proposes the Projects it should contain (never auto-creates them), and — only on your explicit sign-off when the Definition of Ready is met (which requires at least one REAL linked Project) — sets the canonical Owner + target horizon and Promotes it out of Triage; usually it files Not-Ready in Triage ('needs ≥1 Project') until a Project exists. Obeys readiness-contract.md (incl. §8). NOT for a single workstream (use project-intake), a single task (use task-intake), or completing an item already in Triage (use triage-enrich)."
---

# initiative-intake

Interview a strategic objective into a **Ready-shaped Initiative** — the "why" a set of Projects rolls up to. An Initiative is non-executable strategy that **contains Projects**; this skill decides whether the input is genuinely that, then interviews it into shape. Mirrors `linear-project-intake` at the strategy altitude.

> **Obey [[readiness-contract]]** (`references/readiness-contract.md` — tracked copy; source of truth `02-projects/gbg/fibery-company-os/readiness-contract.md`) — Operating Contract, schema preflight, per-type DoR, audit, dry-run, and **§8 (interactive Assign + Promote)**. Read `references/CONTEXT.md` for the domain language. This skill adds the initiative-specific **interview**; the contract governs every write. On conflict, the contract wins.

## Scope guard (route, don't force)
- **A single workstream with an outcome →** `project-intake`. · **A single task →** `task-intake`. · **An item already in Triage →** `triage-enrich`.
- If it has **no plausible multiple-Project shape**, it's probably a Project — route to `project-intake`.
- **Fibery-vs-Linear (R10):** if the objective overlaps engineering already tracked in Linear, **keep the build in Linear** — capture only the business/strategic objective here and note the Linear overlap in `Decisions to Resolve`.

## Core principle
Templates are the *output*, not the intake method. A fluent vision can read complete while missing the user, the value, and the boundary. **Interview first, shape last.** Length ≠ readiness — the DoR is.

## Procedure (interview-first)
1. **Scope-check.** Confirm this is genuinely multi-Project strategy (not one workstream, not a task, not a dev effort). Route per the scope guard if not.
2. **Tools before asking** — never ask what a read answers: schema preflight (contract §1.3) on `Projects Management/Initiatives`; **dedup** by `Capture Key` + name across **all** Initiatives incl. Done/Rejected — on a hit STOP + report the public-id (R11); **read existing Projects** that might already be children/links.
3. **Four buckets.** Known / Inference / Assumption / Open, kept distinct; never present a guess as fact.
4. **Interview — bounded rounds of ≤5 questions**, only what's missing:
   - **DoR-required first:** Owner · **target horizon** (`Target Date`) · the **Objective** (the strategic why).
   - **then high-value:** the *kinds* of Projects it contains, success at the program level, key risks.
   - **Challenge filler** — "transform / scale / world-class" don't survive; name the vagueness and ask the concrete question. After each round, **"create now / keep refining"**; **"create anyway"** any time.
5. **Hard gate.** Refuse pure filler with no extractable *who + what*. "Create anyway" files a real-but-incomplete Initiative; never a hollow shell.
6. **Draft content into canonical `Description`** — the Objective template. Open decisions → `Decisions to Resolve`.
7. **Child Projects — propose, never create (R9).** Link an **existing** Project if one clearly fits. Otherwise **propose** the Projects it should contain (sketch only) and leave **"needs ≥1 Project"** in `Readiness Missing` — never auto-create a child Project to satisfy the gate, and draft none in dry-run.
8. **Preview the exact writes** (contract §8.5): create + Owner=… · Target Date (horizon)=… + (link Project #N) + **Promote → `Not Started`** — or, the common case, the Not-Ready preview with "needs ≥1 Project."
9. **On your action-specific sign-off:**
   - **DoR met** (Owner + target horizon + Objective + **≥1 actually-linked Project**) **AND zero blocking decisions →** set canonical Owner + `Target Date` (provenance per §8.3), create in `Triage`, **re-read + `modification-date` check** (§8.6), **Assign + Promote → `Not Started`**, `Readiness Status → Ready`, clear `Readiness Missing`. Audit v2 (fail-closed).
   - **The usual case — no real linked Project yet (or partial / no sign-off / blocking decision) →** create in `Triage` **Not-Ready**: draft the Objective, `Suggested Owner` / `Suggested Horizon`, `Readiness Status = Not Ready`, `Readiness Missing` = empty DoR items **including "needs ≥1 Project."** **No Promote.** Audit (`verb=create`). *(There is no `Suggested Objective` field — Objective is canonical content.)*
10. **Report** the public-id + state + the proposed child Projects (to create separately via `project-intake`).

## Definition of Ready (Initiative) — contract §3
Owner · `Objective` (Description has real content) · target horizon (`Target Date`) · **≥1 actually-linked Project**. *(No Priority — Initiatives have a horizon, not a Priority.)*

## Objective template (drafted into `Description`)
```
## Objective
## Scope
## Horizon
```

## Acceptance (skill validation)
≥2 dry-run fixtures (one fully-Ready-with-linked-Project → Promote; one no-Project → Not-Ready "needs ≥1 Project") graded on: never auto-creates a child Project · no canonical write without sign-off + provenance · no Priority set · audit fail-closed · dedup-and-stop · Linear-overlap routed to a Decision. Then 1 live canary.

## Changelog
- 2026-06-30 — v0.2. **Interview-first** rebuild + **interactive Assign+Promote** per [[readiness-contract]] §8 / ADR 0002. Promote requires a **real linked Project** (Codex-flagged) — so a fresh Initiative usually files Not-Ready ("needs ≥1 Project"). Children proposed, never created (R9); Linear overlap → Decision (R10).
- (history) 2026-06-24/25 — v0.1 + R8/R9/R10/R11/R12 hardening; live canary Initiative #3. See git history + `_intake-tests/RESULTS-2026-06-25.md`.

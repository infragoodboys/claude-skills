---
name: project-intake
description: "Interview-first intake of a rough project idea / PRD / multi-step effort into a structured Project in the GBG Fibery Company OS (Business Brain). Use WHENEVER Kyle or Andrew says 'intake this project', 'create a project for X', 'turn this into a project', 'spin up a project', 'plan this as a project', '/project-intake', or hands over an effort bigger than a single task — even if they don't say 'project'. It INTERVIEWS first (challenges vague filler, fills as many fields as possible in bounded rounds), drafts the Project Doc into the Description, and — only on your explicit action-specific sign-off, when the Definition of Ready is met — sets the canonical Owner/Priority/Target Date, accepts the doc, and Promotes the Project out of Triage; otherwise it files Not-Ready in Triage. Obeys readiness-contract.md (incl. §8 interactive path). NOT for a single task (use task-intake), a strategy-level objective (use initiative-intake), coding/dev work (Linear), or completing an item already in Triage (use triage-enrich)."
---

# project-intake

Interview a rough project idea into a **Ready** Project in the GBG Fibery Company OS. The job is not to manufacture a project because the input is long — it is to decide whether a Project is even the right container, interview until it is real, and on your sign-off file it **already Assigned + Promoted** (or, if not Ready, parked Not-Ready in Triage). Mirrors `linear-project-intake`, adapted to Fibery.

> **Obey [[readiness-contract]]** (`references/readiness-contract.md` — tracked copy; source of truth `02-projects/gbg/fibery-company-os/readiness-contract.md`) — the Operating Contract, schema preflight, per-type DoR, audit, dry-run, and **§8 (interactive Assign + Promote)**. Read `references/CONTEXT.md` for the domain language. This skill adds the project-specific **interview**; the contract governs every write. On conflict, the contract wins.

## Scope guard (route, don't force)
- **Single discrete task →** `task-intake`. · **Strategy-level objective (the "why" over many projects) →** `initiative-intake`.
- **Coding/dev work →** Linear (`linear-project-intake`). · **An item already in Triage →** `triage-enrich`.

## Core principle
Templates are the *output schema*, not the intake method. A fluent PRD can read complete while missing the user, the value, the scope boundary, and the definition of done. **Interview first, shape last.** Length ≠ readiness — the DoR is. Research is context, not a backlog (don't map findings 1:1 into a plan).

## Procedure (interview-first)
1. **Scope-check.** Confirm this is project-level (a multi-task workstream with one outcome). If it's a task / a strategy / a dev effort, STOP and route (above).
2. **Tools before asking** — never ask what a read can answer: schema preflight (contract §1.3) on `Projects Management/Projects`; **dedup** by `Capture Key` + name across **all** Projects incl. Done/Rejected — on a hit, STOP and report the existing public-id (R11); read neighbor Projects / the parent Initiative.
3. **Four buckets.** Keep **Known fact / Inference / Assumption / Open question** distinct; never present a guess as fact; never fabricate feasibility / vendor / data claims.
4. **Interview — bounded rounds of ≤5 questions**, plain language, only what's missing:
   - **DoR-required first:** Owner · Priority · Target Date · the **Project Doc** (Summary, Goals, Plan/Milestones, Acceptance Criteria, Out of Scope).
   - **then high-value:** the out-of-scope boundary, dependencies, risks, technical unknowns.
   - **Challenge filler** — "scalable / seamless / optimize / robust" don't survive into scope; name the vagueness and ask the concrete question beneath it (which user, doing what, measured how, vs. what baseline).
   - After **each round**, offer **"create now / keep refining."** You may say **"create anyway"** at any time.
5. **Hard gate.** Refuse *pure filler* with no extractable *who + what* (ask the one essential fact instead). "Create anyway" files a real-but-incomplete item to Triage; it never files a hollow shell.
6. **Draft content into canonical `Description`** — the 5-section Project Doc. Open decisions → `Decisions to Resolve` (a **blocking** one keeps it in Triage).
7. **Sketch child Tasks** in the preview (titles only) — **not created here**; on approval, hand the backlog to `task-intake`.
8. **Preview the exact writes** (contract §8.5): create + Owner=… · Priority=… · Target Date=… · `Project Doc Accepted`=… + **Promote → `Not Started`**, plus the dedup result and the four-bucket split.
9. **On your action-specific sign-off:**
   - **DoR met AND zero blocking decisions →** set the canonical commitments (provenance per §8.3 — from your interview answers only, never the raw body), set `Project Doc Accepted = true`, create in `Triage`, **re-read + `modification-date` check** (§8.6), then **Assign + Promote → `Not Started`**, `Readiness Status → Ready`, clear `Readiness Missing`. Audit v2 intent + result (§8.8, fail-closed).
   - **Partial / no sign-off / a blocking decision →** create in `Triage` **Not-Ready**: draft the Doc, `Suggested Owner/Priority/Target Date`, `Project Doc Accepted = false`, `Readiness Status = Not Ready`, `Readiness Missing` = the empty canonical DoR items. **No Promote.** Audit (`verb=create`).
10. **Report** the public-id + resulting state (Promoted → Not Started, or Not-Ready in Triage with the gaps) + the sketched child-Task backlog if any.

## Definition of Ready (Project) — contract §3
Owner · Target Date · Priority · complete Project Doc (all 5 sections, non-placeholder) · `Project Doc Accepted = true`.

## Project Doc template (drafted into `Description`)
```
## Summary
## Goals
## Plan / Milestones
## Acceptance Criteria
## Out of Scope
```
Open decisions go in `Decisions to Resolve` (not the doc).

## Acceptance (skill validation)
≥2 dry-run fixtures (one Promote-on-sign-off, one partial→Not-Ready) graded on: no canonical write without sign-off + valid provenance · `Project Doc Accepted` only on human acceptance · DoR+zero-blocking promote gate · audit fail-closed · dedup-and-stop · children sketched not created. Then 1 live canary.

## Changelog
- 2026-06-30 — v0.2. **Interview-first** rebuild + **interactive Assign+Promote** per [[readiness-contract]] §8 / ADR 0002. Was: capture → Suggested → Triage. Now: scope-check → tools-before-asking → 4 buckets → ≤5-question rounds (filler-challenge + "create now" exit) → hard gate → preview enumerated writes → sign-off (DoR met → Assign+Promote → Not Started; else Not-Ready Triage). Children sketched, not created.
- (history) 2026-06-24/25 — v0.1 + R2/R8/R11/R12 hardening; live canary Project #8. See git history + `_intake-tests/RESULTS-2026-06-25.md`.

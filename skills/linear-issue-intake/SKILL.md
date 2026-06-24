---
name: linear-issue-intake
description: "Use when turning rough reports, bugs, feature requests, UI/UX notes, customer or agent feedback, research findings, or implementation notes into Linear issues inside an existing project. Triggers include: turn this into Linear tickets, create issues from feedback, add tickets to a project, intake these bugs, bulk issue intake, make tickets from agent feedback, create a bug ticket, create UI/UX issue, convert research into issues. This skill asks questions first, checks duplicates, previews batches, and writes only after approval."
---

# Linear Issue Intake

Turn rough or over-polished input into Linear **issues** a developer can act on,
inside an **existing** project. The job is not more tickets — it's better ones: a
developer should be able to understand, reproduce or validate, prioritize, and
start without a chain of follow-ups.

This skill creates **issues only**. It does **not** create or plan Linear
projects, and it does not turn project-level ideas into premature tickets.

## Scope check first (issue vs. project)

Before anything else, confirm the input is issue-level. Issue-level = one or more
discrete, independently-actionable problems that fit inside an existing project.

**If the input is project-level — a PRD, an initiative, an integration concept, a
multi-issue effort that needs its own home — STOP.** Don't shred it into premature
tickets. Say so and recommend the **`linear-project-intake`** skill, which shapes
scope, value, and milestones first. You may return here afterward to intake the
issues that the project work produces.

## The core principle

**The Linear templates are the final output schema, not the intake method.** A
fluent report is not a real requirement — it can still lack the user, the
problem, the evidence, and the definition of done. Pour vague input into a
template and you get a ticket that *looks* complete and *is* weak. So interview
first, fill the template last. Length and polish are not readiness; the
**Readiness Gate** is.

**Research is context, not a backlog.** When converting research findings or notes
into issues, don't map bullets 1:1 — extract the real, independently-actionable
problems, and drop findings that aren't yet a decided requirement. If the material
is really a whole effort rather than a few issues, that's the project skill's job
(see the scope check).

## Default output style

Lead every response with a short, decision-oriented summary; put the detailed
framework last. Default structure:

**Recommended next action** — 1–3 bullets max. Say exactly what the user should do
next (e.g., "Do not create yet — answer the 3 questions below"; "Merge #1/#2, but
confirm ENG-### wasn't intentionally canceled first"; "Ready for preview — no write
until explicit approval").

**Why** — 1–3 bullets max. The main reason, briefly.

**What I need from you** — include only if input is missing something. Fewest
high-value questions, ideally 3–5.

**Details** — everything else: readiness tables, duplicate-check detail,
known/inference/assumption/open-question breakdowns, issue previews, templates.

Constraints:
- Keep the top section short and decision-oriented; don't lead with long framework
  explanations or long narrative paragraphs unless the user asks for reasoning.
- Keep tables concise.
- Bulk intake: show the readiness table, then summarize grouped next actions.
- This is presentation only — it does not change any gate, classification,
  duplicate, label/status, or approval behavior below. Duplicate-check honesty is
  unchanged: if the search didn't run, say `NOT RUN`; if it ran, summarize briefly.
  Approval gating is unchanged: never create, update, assign, close, comment on, or
  modify anything without scoped approval for that exact action.

## Before you start: read the references

- `references/linear-workspace.md` — team, IDs, statuses, labels, label mapping,
  project list, duplicate-check honesty rules, and connector-unavailable
  (degraded) mode. Snapshot values; confirm against live Linear before writing.
- `references/issue-intake-principles.md` — classification, per-type question
  banks, filler detection, the Readiness Gate, the "create anyway" floor, the
  four-bucket model, priority and title rules, agent-language translation. Pull
  it in once you're past the scope check.

## Step 1 — Use tools before asking

Do not ask the user for anything a tool can answer. **Reads (list/search/get) are
always allowed before approval; writes are not.**

- **Linear** (connector) — resolve the active project (`list_projects`); search
  the active project for duplicates (`list_issues`); reconcile labels and
  statuses (`list_issue_labels`, `list_issue_statuses`); create only on approval
  (`save_issue`). Discover parameters via the connector; don't guess.
- **Uploaded files, prior conversation, web/research, GitHub/codebase, vendor
  docs** — use whatever resolves an unknown.

**Never ask the user** which projects exist, whether an issue already exists, the
current labels/statuses, or what the code currently does — attempt the tool, then
ask only what's genuinely unresolved. State briefly what tools told you.

**If Linear is unavailable** (degraded mode): you may interview and produce a
preview, but you may not create/modify anything, you must mark workspace facts
*unverified (snapshot)*, and you must not claim a duplicate check ran.

## Step 2 — Separate what you actually know

Keep four buckets distinct and reflect them in previews: **Known facts**
(user/tool stated), **Inferences** (reasoned, unconfirmed), **Assumptions**
(convenient guesses — surface them), **Open questions** (unresolved, material).

Never present inferences/assumptions as facts. **Do not fabricate
evidence-bearing fields** — Steps to Reproduce, error messages, environment,
regression status, root cause, metrics, acceptance criteria must trace to a known
fact, else leave blank / mark `(unconfirmed)` / move to Open Questions.

## Step 3 — Classify

One primary type per issue: **Bug, Feature, Improvement, UI/UX, or Spike**
(definitions in `references/issue-intake-principles.md`). Overlap → primary driver
+ secondary type label (broken button in a confusing modal = `bug` + `ui-ux`).
**Recommend a Spike when uncertainty is too high to implement** — valid direction,
unknown approach/feasibility/effort. A spike answers a question in a timebox; it
is not a build ticket.

## Step 4 — Interview (questionnaire-first)

Ask **3–7 high-value questions at a time**, plain language, only what's missing.
Banks are in the principles file. Two non-negotiables:

- **Challenge filler.** "Improve UX," "make it seamless," "optimize the workflow,"
  "make it scalable," "automate the process" — don't transcribe. Name the
  vagueness and ask the concrete question beneath it (which user, doing what,
  measured how, vs. what baseline).
- **Don't treat vague feedback as ready.** Agent/customer reports ("the call thing
  is broken," "lead disappeared," "numbers are wrong") get translated into
  location + action + scope + expected-vs-actual before they qualify.

## Step 5 — Duplicate check (mandatory, blocking, honest)

Search the **active project** for likely duplicates (title, page, role, error,
feature area, referenced lead/client/account). In a batch, run it **per item**.

- Found → surface it, explain the relationship, ask comment / link / separate.
- Ran, nothing → "Duplicate check: none found."
- **Couldn't run** (connector down) → "Duplicate check: NOT RUN — Linear
  unavailable." Never say "none found" for a search you didn't perform.

## The Readiness Gate (hard stop before any create)

An issue is ready only when **all** pass; otherwise show the "not enough context"
preview and keep interviewing. Full detail in
`references/issue-intake-principles.md`.

- [ ] Not filler — Summary + core field (Current Behavior / User Problem / Pain
      Point) are concrete, not copy-pasteable into any product.
- [ ] Affected user/role and location (page/screen/workflow/system) known.
- [ ] Current vs. desired captured.
- [ ] Bugs: a real reproduction path or concrete symptom + environment — not
      invented steps.
- [ ] Evidence-bearing fields grounded or honestly marked `(unconfirmed)`.
- [ ] Duplicate check ran (or honestly marked NOT RUN).
- [ ] Right unit — a genuine issue, not a project (see scope check) and not a
      build ticket masking a spike.

**The "create anyway" floor.** On "create anyway" you may proceed with some fields
missing *only if a real, extractable requirement exists* — every gap goes to Open
Questions. If the input is **pure filler with no extractable requirement**, do not
create even on "create anyway": say so and ask for the one essential fact (who +
what problem). A hollow but tidy ticket is the exact failure this skill prevents.

## Step 6 — Preview, then write (only on scoped approval)

**Single issue** — show this preview before any write:

```markdown
Classified: [Bug/Feature/Improvement/UI-UX/Spike] · Priority: [Urgent/High/Medium/Low]
Destination: Engineering · Project: [active project] · Status: Triage
Title: [Type]: [specific user / action / problem]
Labels (existing only): [type] [+ from-customer if agent/operator/customer] [+ secondary]
Duplicate check: [candidate + why | none found | NOT RUN — Linear unavailable]
Known / Inference / Assumption: [...]
Missing/optional: [...]
[filled type template body]
Readiness Gate: PASS — create this issue?
```

**Bulk** — use `templates/bulk-issue-readiness-template.md`: a per-item readiness
table with **Proposed title · Classification · Priority · Labels · Readiness ·
Create strategy · Missing context · Duplicate risk · Recommended action**, then one
consolidated, scoped approval. **Readiness** is the state of context; **Create
strategy** is the decided next action — one of `Create`, `Hold`, `Merge`, `Route to
linear-project-intake`, `Spike`, or `Reject / not Linear-ready` (an item can be
Needs-info yet still have a clear strategy). `Recommended action` stays a separate
plain-English column.

## Approval & write semantics

- **Reads vs. writes:** reads anytime; **writes** (create/update/close/assign/
  comment/label/move) require explicit approval for that specific action.
- **What counts as approval:** a clear, specific, affirmative instruction to
  create the previewed item(s). "Looks good," "thanks," silence, or a new question
  is **not** approval. Approval is **per-action / per-batch**, never a standing
  session grant.
- **Batches:** never bulk-create without the readiness table and a scoped
  approval. A vague "ok / sure / go" approves nothing specific — confirm *which*
  items; default to the named or "Ready" subset. For >~10 items, create in chunks
  and re-confirm between chunks; run the per-item dupe check before each create.
- **No auto-assignment** unless the user names an owner or a routing rule applies.
- **Connector unavailable = no writes.** Produce the preview and stop.

## Worked examples

- `examples/bug-report-intake.md` — vague agent bug → reproducible Bug, unconfirmed
  fields kept honest.
- `examples/agent-feedback-bulk-intake.md` — feedback pile → readiness table,
  per-item dupe flags, one scoped approval.
- `examples/research-to-issues.md` — research → a few scoped issues, not a 1:1 dump
  of findings.
- `examples/vague-ticket-intake.md` — filler request gets interrogated; pure filler
  is refused even on "create anyway."

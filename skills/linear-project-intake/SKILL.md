---
name: linear-project-intake
description: "Use when turning research, PRDs, integration briefs, product ideas, vendor concepts, or broad initiatives into a Linear project plan. Triggers include: turn this PRD into a Linear project, plan this as a Linear project, convert this research into a project, shape this initiative, create project scope, integration planning, project intake, project brief. This skill is questionnaire-first: it challenges vague filler, separates facts from assumptions, checks readiness, routes uncertain work to spikes, and previews before any Linear write."
---

# Linear Project Intake

Shape research, PRDs, initiatives, and integration concepts into **one**
well-scoped Linear project. The job is not to manufacture a project because the
input is long — it's to decide whether a project is even the right container, and
if so, to define what it is, why it matters, what's in and out, and what's still
unknown.

This skill creates **one project at a time**. It does **not** create projects in
bulk, and it does **not** create issues by default.

## Scope check first (project vs. issue vs. spike)

Decide the right container before intake:

- **Issue-level** — a single bug, a discrete feature request, a small change that
  belongs in an existing project. Signal words: "**fix**," "**broken**," "**repair**,"
  "a bug," "this one ___," or any single discrete change. **STOP** and recommend the
  **`linear-issue-intake`** skill. Don't inflate one ticket into a project. A vague
  repair request like "fix the dashboard" defaults to **issue-level or a clarifying
  question — never a project**.
- **Spike-level** — the dominant unknown is *whether or how* to build at all
  (feasibility, approach, effort unestimable). **A project is never a substitute
  for a spike.** Recommend a spike or a research step first; come back to project
  shaping once the unknown is resolved.
- **Project-level** — a *known-worth-doing* multi-issue effort with a coherent
  goal, where the uncertainty is in execution detail. Proceed here.

When torn between project and spike, choose the spike: a wrong one-question
investigation is far cheaper than a wrong project full of issues.

## The core principle

**Templates are the final output schema, not the intake method.** A fluent PRD is
not a real requirement — it can read complete while missing the user, the
problem, the value, the scope boundary, and the definition of done. Pour that into
a project and you get a confident plan with no foundation. So interview first,
shape last. Length and polish are not readiness; the **Project Readiness Gate** is.

**Research is context, not a backlog.** Findings are inputs to a *decision* about
what (if anything) to build — never mapped 1:1 into a project plan. A research doc
with no decided requirement yields a recommendation (and maybe a spike), not a
project.

## Default output style

Lead every response with a short, decision-oriented summary; put the detailed
framework last. Default structure:

**Recommended next action** — 1–3 bullets max. Say exactly what the user should do
next (e.g., "Run a data-source spike before creating a build project"; "Not ready
as a project — answer the 4 questions below"; "Ready for preview — no write until
explicit approval").

**Why** — 1–3 bullets max. The main reason, briefly.

**What I need from you** — include only if input is missing something. Fewest
high-value questions, ideally 3–5.

**Details** — everything else: the project preview, readiness gate, risk review,
known/inference/assumption/open-question breakdowns, initial-backlog sketch.

Constraints:
- Keep the top section short and decision-oriented; don't lead with long framework
  explanations or long narrative paragraphs unless the user asks for reasoning.
- Keep tables concise.
- Project intake: show the recommendation first, then the readiness gate.
- This is presentation only — it does not change any gate, scope check, duplicate,
  label/status, or approval behavior below. Duplicate-check honesty is unchanged:
  if the search didn't run, say `NOT RUN`; if it ran, summarize briefly. Approval
  gating is unchanged: never create, update, assign, close, comment on, or modify
  anything without scoped approval for that exact action.

## Before you start: read the references

- `references/linear-workspace.md` — team, IDs, statuses, labels, the existing
  **project list** (for the project duplicate check), and connector-unavailable
  (degraded) mode. Snapshot values; confirm live before writing.
- `references/project-intake-principles.md` — the Project Readiness Gate, the
  filler challenge, the "create anyway" floor, the project-vs-spike rule, the
  four-bucket model, and the full extraction checklist. Pull it in after the scope
  check.

## Step 1 — Use tools before asking

Do not ask for anything a tool can answer. **Reads are always allowed before
approval; writes are not.**

- **Linear** (connector) — `list_projects` / `get_project` to check the project
  doesn't duplicate an existing one and to understand neighbors; reconcile labels
  and statuses if you preview an initial backlog; `save_project` only on approval.
  Discover parameters via the connector; don't guess.
- **Uploaded files, prior conversation, web/research, GitHub/codebase, vendor &
  API docs** — especially for integration planning and feasibility.

**Never ask the user** which projects exist, whether this overlaps an existing
project, or what a vendor's API supports if docs can answer it — attempt the tool
first. State what tools told you, then ask only what's genuinely open.

**If Linear is unavailable** (degraded mode): you may interview and produce a
project preview, but you may not create/modify anything, you must mark workspace
facts *unverified (snapshot)*, and you must not claim the project duplicate check
ran.

## Step 2 — Separate what you actually know

Four buckets, kept distinct and shown in the preview: **Known facts, Inferences,
Assumptions, Open questions.** Never present inferences/assumptions as facts. **Do
not fabricate technical details** — feasibility claims, vendor capabilities, data
availability, effort, and dependencies must trace to a known fact or a tool, else
they are Open Questions or a reason to recommend a spike.

## Step 3 — Interview to extract the project (questionnaire-first)

Ask **3–7 high-value questions at a time**, plain language, only what's missing.
**Challenge filler** — "robust," "scalable," "seamless," "enhance visibility,"
"optimize workflow" don't survive into scope; name the vagueness and ask the
concrete question beneath it. Extract, across the conversation, every field below
(detail and question prompts in `references/project-intake-principles.md`):

Business problem · User/stakeholder · Current workflow · Desired future state ·
Business value · Scope · **Out of scope** · Success criteria · Milestones/phases ·
Dependencies · Risks · Technical unknowns · Data/system/vendor dependencies ·
Open questions · Definition of done.

Use `templates/project-questionnaire-template.md` to structure the interview and
`templates/project-risk-review-template.md` to pressure-test risks and unknowns.

**For UI-bearing projects** (a dashboard, screen, flow, or form), don't stop at "a
better dashboard" — run the functional deep-dive in the principles file (§5.1) to
extract what each surface must *do* and how it should *operate*: primary task, main
flow, per-control behavior, data shown and its source, states (empty/loading/
error/no-permission), role differences, edge cases, and an observable-success
sentence ("a user can ___ and see ___"). Ask for a screenshot or sketch as
evidence. These details flow into the initial-backlog sketch so the UI issues
handed to `linear-issue-intake` are concrete, not "redesign the dashboard."

## The Project Readiness Gate (hard stop before any create)

A project is ready to create only when **all** pass; otherwise show the "not ready
to be a project" preview and keep interviewing — or recommend a spike/research
step. Full detail in `references/project-intake-principles.md`.

- [ ] Not filler — the business problem and desired future state are concrete, not
      slogans.
- [ ] User/stakeholder and current-vs-future state are known.
- [ ] **Scope and out-of-scope are both defined** — a project with no boundary
      isn't ready.
- [ ] For UI-bearing work, desired behavior is described **functionally** (what
      each surface does and how it operates, per §5.1), not just visually.
- [ ] Success criteria / definition of done exist.
- [ ] Feasibility is not the dominant unknown — if it is, recommend a spike, not a
      project.
- [ ] Technical/vendor/data unknowns are captured honestly (not fabricated away).
- [ ] Project duplicate check ran against the existing project list (or honestly
      marked NOT RUN).
- [ ] This is genuinely project-level (not an issue, not a spike).

**The "create anyway" floor.** On "create anyway" you may proceed with some fields
open *only if a real, scoped requirement exists* — gaps go to Open Questions. If
the input is **pure PRD filler with no extractable requirement**, do not create
even on "create anyway": say so and ask for the essentials (who, what problem,
what's out of scope). A tidy but hollow project is the exact failure this skill
prevents.

## Step 4 — Duplicate check (against existing projects, honest)

Before previewing creation, check the input doesn't duplicate an existing project.

- Overlap found → surface it; ask whether to extend that project, fold in, or
  proceed separately.
- Ran, none → "Project duplicate check: none found."
- **Couldn't run** (connector down) → "Project duplicate check: NOT RUN — Linear
  unavailable." Never claim a clean check you didn't perform.

## Step 5 — Preview, then write (only on scoped approval)

Show the project preview with `templates/project-preview-template.md`: team,
project name, summary, goal/definition of success, in-scope, **out-of-scope**,
duplicate check result, an optional **initial backlog list** (titles/types/
readiness — preview only), known/inference/assumption split, and open questions.

Optionally use `templates/project-to-initial-backlog-template.md` to sketch the
first issues — but **issues are not created here.** Creating those issues is the
job of `linear-issue-intake`, after the project exists. This skill writes the
**project record only**, and only after approval.

## Approval & write semantics

- **Reads vs. writes:** reads anytime; **writes** (create/update the project)
  require explicit approval for that action.
- **What counts as approval:** a clear, specific, affirmative go-ahead to create
  the previewed project. "Looks good," silence, or a follow-up question is not
  approval. Approval is per-action, never a standing session grant.
- **One project per run.** Never create projects in bulk. Never create issues by
  default — hand the backlog to `linear-issue-intake`.
- **No fabrication**, **no auto-assignment** of owners unless instructed.
- **Connector unavailable = no writes.** Produce the preview and stop.

## Worked examples

- `examples/research-to-project.md` — research → recommend one project + plan, with
  the uncertain piece held as a spike (created later via the issue skill).
- `examples/vague-prd-intake.md` — fluent-but-empty PRD interrogated, not
  transcribed; scope shrinks to something real.
- `examples/integration-brief-to-project.md` — a vendor/integration concept gets
  feasibility-checked; unproven pieces become spikes, not project commitments.

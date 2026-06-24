# Project Intake Principles

The interviewing methodology behind `linear-project-intake`. The templates in
`templates/` are the *output schema*. This file is how you earn the right to fill
them — by extracting a real, scoped requirement before shaping a project.

> **Stay in your lane.** This skill shapes and creates ONE project. It does not
> create issues by default (hand the backlog to `linear-issue-intake`), and it
> does not create projects in bulk. If the input is a single discrete ticket,
> recommend `linear-issue-intake`. If the dominant unknown is whether/how to build
> at all, recommend a spike — not a project.

## Table of contents

1. Questionnaire-first philosophy (and "research is not a backlog")
2. The four buckets: known / inference / assumption / open question
3. Project vs. issue vs. spike
4. Detecting and challenging vague PRD filler
5. The extraction checklist (the 15 fields) — incl. 5.1 functional extraction for UI-bearing work
6. Risk & unknown review
7. Milestones & phasing
8. The Project Readiness Gate + the "create anyway" floor
9. Project duplicate-check honesty
10. Writing style

---

## 1. Questionnaire-first philosophy

A fluent PRD is not a real requirement. Polished product memos and AI-generated
briefs routinely read complete while omitting the user, the measurable problem,
the value, the scope boundary, and the definition of done. So **interview first,
shape the project last.** Extract the real requirement, then map it onto the
project schema — never run it in reverse by inventing scope to fill a template.

**Research is context, not a backlog.** Research findings are inputs to a
*decision* about what (if anything) to build. Never convert findings 1:1 into a
project plan or an issue list. If the research hasn't yet produced a decided
requirement, the honest output is a recommendation — possibly "run a spike" or
"do more research" — not a project.

Three working rules:

- **Words are not readiness.** A long PRD can be less ready than a one-line idea.
- **Ask less, but ask sharp.** 3–7 questions at a time, only high-value ones.
- **Tools before questions.** Anything Linear, the docs, the codebase, the web, or
  the prior conversation can answer is not a question for the user.

## 2. The four buckets

Sort every piece of context into exactly one bucket and carry it into the preview.

- **Known facts** — stated by the user or returned by a tool. Citable.
- **Inferences** — reasoned from known facts; plausible, unconfirmed. Label them.
- **Assumptions** — convenient guesses to keep moving. Surface so they can be
  vetoed.
- **Open questions** — unresolved and material to scope, value, or feasibility.

Never present inferences or assumptions as facts. Never fabricate technical
details — feasibility, vendor capabilities, data availability, effort, and
dependencies must trace to a known fact or a tool, otherwise they are Open
Questions or a reason to recommend a spike.

## 3. Project vs. issue vs. spike

- **Issue-level** — a single discrete, actionable problem for an existing project
  → recommend `linear-issue-intake`. Do not inflate it into a project.
- **Spike-level** — feasibility/approach/effort is the dominant unknown → recommend
  a spike or research step. **A project is never a substitute for a spike.**
  Wrapping an unproven idea in a project manufactures confidence the evidence
  doesn't support.
- **Project-level** — a known-worth-doing multi-issue effort with a coherent goal;
  uncertainty is in execution detail, not in whether to build.

When torn between project and spike, choose the spike.

## 4. Detecting and challenging vague PRD filler

Don't let empty phrases become scope. Treat these as triggers, and replace each
with a sentence naming a user, a problem, a boundary, and ideally a measure:

| Filler phrase             | The question it is hiding                                               |
|---------------------------|-------------------------------------------------------------------------|
| "robust / scalable"       | Robust/scalable against what — which load, failure, or growth, to what target? |
| "seamless / intuitive"    | Which specific friction or step disappears? Seamless vs. what today?     |
| "enhance visibility"      | Who needs to see what they can't today, to make which decision?          |
| "optimize the workflow"   | Which workflow, which step, measured how (time, clicks, error rate)?     |
| "drive efficiency / value"| Efficiency for whom, doing what, saving how much?                        |
| "modernize / streamline"  | What is the concrete before-state and the concrete after-state?          |
| "data-driven insights"    | Which specific metrics drive which specific decision?                    |

Rule of thumb: if a scope line would survive copy-paste into an unrelated
product's plan, it is filler. Translate, then confirm with the user.

## 5. The extraction checklist (the 15 fields)

Across the interview, fill every field. Each has a probing question; ask only the
ones still missing.

1. **Business problem** — what's broken or absent, in concrete terms? Who feels it?
2. **User / stakeholder** — primary and secondary users; internal or external?
3. **Current workflow** — how is this done today, specifically?
4. **Desired future state** — what does "after" look like for the user?
5. **Business value** — revenue, cost, risk, compliance, retention — quantified if
   possible. Why now?
6. **Scope** — what this project *will* deliver.
7. **Out of scope** — what it explicitly will *not* do (a project with no boundary
   isn't ready).
8. **Success criteria** — how we'll know it worked; measurable where possible.
9. **Milestones / phases** — natural sequencing; an MVP slice vs. later phases.
10. **Dependencies** — other teams, projects, approvals, sequencing constraints.
11. **Risks** — what could derail it; likelihood/impact if known.
12. **Technical unknowns** — what we don't yet know how to do (spike candidates).
13. **Data / system / vendor dependencies** — APIs, data sources, third parties;
    are their capabilities confirmed or assumed?
14. **Open questions** — unresolved items that affect scope or value.
15. **Definition of done** — the condition under which the whole project closes.

If fields 12–13 dominate (we don't know if the core is even possible), that's a
spike signal, not a project — see §3 and §8.

### 5.1 Functional extraction for UI-bearing projects

When a project includes a UI surface — a screen, dashboard, view, flow, or form —
"desired future state" is not captured until it's expressed as **observable
functional behavior**: what the user can *do*, and what the system does in
response. "Make it cleaner / nicer / more intuitive" is filler; extract what it
must do and how it should operate. A screenshot, sketch, or screen-share of the
current surface is evidence — ask for it.

Operate-level question bank (ask the few that matter, not all):
1. Which surface — a new screen, or modifying an existing one? (which one?)
2. What is the primary task a user comes here to accomplish?
3. Walk the main flow: what do they do first, what happens, then what next?
4. For each key control/element: what should it do when used?
5. What data/values are shown, and where does each come from?
6. Inputs → outputs: when the user does X, what should appear or change?
7. States: what should empty / loading / error / no-permission look like?
8. Role differences: does it behave differently for agent vs. admin vs. client?
9. Edge cases: what happens when a value is missing, invalid, or very large?
10. Observable success: finish the sentence "a user can ___ and see ___."

Two ties-in:
- These functional details flow into the **initial-backlog sketch**
  (`templates/project-to-initial-backlog-template.md`) so each UI issue handed to
  `linear-issue-intake` is concrete — it maps onto that skill's `ui-ux` template,
  not "redesign the dashboard."
- Boundary: a single UI tweak is **issue-level** → route to `linear-issue-intake`.
  This deep-dive is for UI-bearing *projects*, where the functionality must be
  pinned down before scope and backlog are real.

## 6. Risk & unknown review

Pressure-test before previewing. For each risk: what's the trigger, the impact, and
the mitigation or the unknown behind it? For each technical unknown: can a tool or
doc resolve it now? If not, name it as a spike candidate rather than papering over
it with optimistic scope. Use `templates/project-risk-review-template.md`.

## 7. Milestones & phasing

Prefer a small, real first phase (an MVP slice that delivers value) over a
big-bang plan. Sequence by dependency and by what de-risks the most. If a phase
hinges on an unresolved unknown, that phase is provisional until a spike resolves
it — say so.

## 8. The Project Readiness Gate

A project is ready to create only when **all** pass. Otherwise, show the "not ready
to be a project" preview and keep interviewing, or recommend a spike/research step.

- [ ] **Not filler** — business problem and desired future state are concrete.
- [ ] **Who + then/now** — user/stakeholder and current-vs-future state known.
- [ ] **Bounded** — scope *and* out-of-scope both defined.
- [ ] **UI behavior is functional, not just visual** — for UI-bearing work, the
      desired future state names what each surface does and how it operates (see
      §5.1), not "make it nicer."
- [ ] **Success defined** — success criteria / definition of done exist.
- [ ] **Feasibility isn't the dominant unknown** — if it is, recommend a spike.
- [ ] **Unknowns honest** — technical/vendor/data unknowns captured, not fabricated
      away.
- [ ] **Not a duplicate** — project duplicate check ran (or honestly NOT RUN).
- [ ] **Right unit** — genuinely project-level (not an issue, not a spike).

### The "create anyway" floor

On "create anyway," you may proceed with some fields open *only if a real, scoped
requirement exists* — every gap goes to Open Questions. If the input is **pure PRD
filler with no extractable requirement**, do not create even on "create anyway":
say so plainly and ask for the essentials (who, what problem, what's out of scope).
A tidy but hollow project is the exact failure this skill exists to prevent —
"create anyway" relaxes completeness, never the existence of a requirement.

## 9. Project duplicate-check honesty

Before previewing creation, check the project doesn't duplicate an existing one
(by name, goal, or overlapping surface).

- Overlap found → surface it; ask whether to extend that project, fold in, or
  proceed separately.
- Ran, none → "Project duplicate check: none found."
- **Couldn't run** (connector unavailable) → "Project duplicate check: NOT RUN —
  Linear unavailable." Never report a clean check you didn't perform.

## 10. Writing style

Clear, direct, business-friendly when the requester is non-technical;
developer-friendly structure in the final project record. No invented root causes,
no confident technical claims beyond the evidence. Preserve uncertainty where it
exists — that's what Open Questions, Risks, and Technical Unknowns are for.

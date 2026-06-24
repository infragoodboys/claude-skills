# Issue Intake Principles

The interviewing methodology behind `linear-issue-intake`. The templates in
`templates/` are the *output schema*. This file is how you earn the right to fill
them.

> **Stay in your lane.** This skill creates issues inside an existing project. If
> the input is project-level (a PRD, initiative, integration concept, or
> multi-issue effort that needs its own home), stop and recommend
> `linear-project-intake` rather than shredding it into premature tickets. The
> spike guidance in §4 is for issue-level uncertainty; whole-effort uncertainty is
> a project-skill question.

## Table of contents

1. Questionnaire-first philosophy
2. The four buckets: known / inference / assumption / open question
3. Detecting and challenging vague filler
4. When to recommend a spike
5. Issue type classification
6. Intake question banks (universal + per type)
7. Priority recommendation rules
8. Linear title rules
9. Translating agent / operator language
10. Writing style
11. The Readiness Gate (the bar before any create)

---

## 1. Questionnaire-first philosophy

A fluent document is not a real requirement. PRDs, AI-generated briefs, and
confident product memos routinely read as complete while omitting the user, the
measurable problem, the evidence, the constraints, and the definition of done.

So: **interview first, fill the template last.** Extract the real requirement,
then map it onto the schema. Never run the process in reverse — never let
template fields drive you into manufacturing content that isn't supported by what
the user or a tool actually told you.

Three rules that follow from this:

- **Words are not readiness.** Length and polish do not qualify input for
  creation. A three-paragraph PRD can be less ready than a one-line bug report.
- **Ask less, but ask sharp.** 3–7 questions at a time, only the high-value ones,
  in plain language. Don't interrogate; don't pad.
- **Tools before questions.** Anything Linear, the files, the codebase, the web,
  or the prior conversation can answer is not a question for the user.

**Research is context, not a backlog.** When the input is research, findings, or
notes, do not map bullets 1:1 into issues. Extract only the real,
independently-actionable problems, and drop findings that aren't yet a decided
requirement. If the material is really a whole effort (an initiative, a PRD, a
multi-issue program), stop and route to `linear-project-intake` — shaping it as a
project comes before filing its issues.

---

## 2. The four buckets

Keep every piece of context sorted into exactly one bucket, and carry the
distinction all the way into the preview.

- **Known facts** — stated by the user or returned by a tool. Citable.
- **Inferences** — reasoned from known facts. Plausible, not confirmed. Label as
  such.
- **Assumptions** — convenient guesses made to keep moving. The riskiest bucket;
  surface them so the user can veto.
- **Open questions** — unresolved and material to scope or correctness.

**Example.** User says: "Agents can't save dispositions after a call on the
Revup portal."

- *Known:* saving a disposition post-call fails; surface is Revup portal; role is
  agent.
- *Inference:* likely the save action or its API call, since the user reached the
  disposition step.
- *Assumption (flag it):* affects all agents (user only described their own
  experience).
- *Open question:* is there an error message? production or staging? regression?

Never collapse inference or assumption into known. A confident wrong ticket
wastes more developer time than an honest incomplete one.

---

## 3. Detecting and challenging vague filler

When input leans on empty phrases, do not transcribe them into the template. Name
the vagueness and ask the concrete question underneath. Treat these as triggers:

| Filler phrase            | The question it is hiding                                              |
|--------------------------|-----------------------------------------------------------------------|
| "Improve user experience" | Which user, on which screen, doing what — and what's wrong today?     |
| "Make it seamless"       | Which specific friction or step are we removing? Seamless vs. what?    |
| "Build a robust solution" | Robust against which failure? What breaks now that shouldn't?        |
| "Enhance visibility"     | Who needs to see what, that they currently can't, to make which decision? |
| "Optimize the workflow"  | Which workflow, which step, measured how (clicks, time, error rate)?   |
| "Make it scalable"       | Scale along which axis (users, data, requests) to what target?        |
| "Automate the process"   | Which manual steps, done by whom, how often, with what current cost?   |
| "Streamline" / "modernize" | What is the concrete before-state and the concrete after-state?     |

Rule of thumb: if a sentence would survive being copy-pasted into an unrelated
product's backlog, it is filler. Replace it with a sentence that names a user, an
action, a current behavior, a desired behavior, and ideally a measure.

Do not be hostile about it — the reporter is often non-technical. Translate, then
confirm: "When you say 'optimize the workflow,' do you mean reducing the number of
clicks an agent makes to log a call? If so, roughly how many steps is it today?"

---

## 4. When to recommend a spike

If the **direction is valid but the path is uncertain**, the honest next step is
to find out — not to build. Recommend a `spike` (use
`templates/spike-ticket-template.md`) when any of these hold:

- Feasibility is unknown (can the current system / API / data even support it?).
- The technical approach is genuinely undecided and would change scope.
- Effort is unestimable because a key unknown dominates.
- Multiple viable designs exist and choosing needs investigation.
- The request depends on a third-party capability nobody has confirmed.

A spike has a **question to answer** and a **timebox**, not acceptance criteria
for a build. Its "done" is a decision plus enough evidence to write the real
ticket. Recommending a spike is a feature of good intake, not a failure to
produce work.

**A project is never a substitute for a spike.** If the *whole* effort's
feasibility or approach is the dominant unknown, the correct first artifact is one
spike — not a Linear project pre-populated with build issues. Building a project
around an unproven idea manufactures confidence the evidence doesn't support. When
torn between "make it a project" and "make it a spike," choose the spike: a wrong
one-question investigation is far cheaper than a wrong project of issues.

---

## 5. Issue type classification

Classify each item into one primary type.

- **Bug** — something that should already work is broken, incorrect,
  inconsistent, erroring, regressed, or producing the wrong result. (Button dead,
  data wrong, page crashes, can't log in, filter wrong, worked-before-now-broken,
  webhook failing, state won't save.)
- **Feature** — new functionality, workflow, integration, or capability that does
  not exist today. (New report, new dashboard, SMS integration, role-based
  permissions, new onboarding flow.)
- **Improvement** — an existing feature works but should be better, faster,
  cleaner, more reliable, or easier to maintain. (Faster load, more accurate
  search, fewer clicks, clearer logic, better error handling, refactor.)
- **UI/UX** — primarily visual, layout, copy, interaction, or usability, without
  major new business logic. (Confusing placement, unreadable modal, unclear text,
  spacing, broken mobile layout, unclear next step.)
- **Spike** — investigation to resolve an unknown before committing to a build
  (see §4).

Overlap: pick the primary driver, add a secondary type label. A broken button in
a confusing modal is primarily `bug`, secondary `ui-ux`.

---

## 6. Intake question banks

Ask only what's missing. 3–7 at a time. Plain language.

### Universal (use when the report is vague)

1. What page, screen, or workflow is this happening in?
2. Who is affected: agent, admin, client, lead, or another user type?
3. What were they trying to do?
4. What happened instead?
5. What should have happened?
6. How often does it happen?
7. Do you have a screenshot, recording, lead ID, account ID, URL, or example?

### Bug

1. What are the exact steps to reproduce it?
2. Production, staging, or both?
3. One user, multiple users, or all users?
4. Did this previously work? (regression?)
5. Is there an error message or failed request?
6. Is there a specific lead, client, policy, call, or record where it happened?
7. How urgent: blocking work, causing errors, annoying but workable, or cosmetic?

### Feature

1. What user problem does this solve?
2. Who needs this feature?
3. What should the ideal workflow look like?
4. What is the minimum version that would be useful?
5. What would make this complete enough to ship?
6. Is this tied to a client, revenue opportunity, compliance need, or internal
   efficiency?

### Improvement

1. What existing workflow should be improved?
2. What is frustrating, slow, confusing, or risky about the current version?
3. What would a better version look like?
4. What benefit should we expect?
5. Is there a measurable target (fewer clicks, faster load, lower error rate,
   less manual work)?

### UI/UX

1. What screen or component is affected?
2. What feels confusing, broken, inconsistent, or hard to use?
3. Desktop, mobile, tablet, or all devices?
4. Do you have a screenshot or recording?
5. What should the user see or understand instead?
6. Cosmetic, confusing, or blocking the workflow?

### Spike (when recommending one)

1. What decision are we trying to make?
2. What's the specific unknown blocking an estimate?
3. What would count as "enough" evidence to proceed?
4. Is there a timebox (e.g., half a day, two days)?
5. What happens to the dependent work until this resolves?

---

## 7. Priority recommendation rules

Recommend a priority; do not overstate urgency.

- **Urgent** — production down; users can't do core work; revenue-critical flow
  blocked; possible data loss or security issue; multiple users/clients actively
  blocked.
- **High** — important workflow impaired; multiple users affected; painful manual
  workaround exists; client-facing business impact; affects reporting, billing,
  lead flow, calls, or agent productivity.
- **Medium** — meaningful but not blocking; limited users; workaround exists;
  reduces friction or errors.
- **Low** — cosmetic; minor UX; nice-to-have; edge case; no clear urgency or
  business impact.

When evidence is thin, recommend the lower of two plausible levels and put the
deciding question in Open Questions.

---

## 8. Linear title rules

Format: `[Type]: [Specific user / action / problem]`. Concise and specific.

Good:

- `Bug: Agent cannot save lead disposition after call ends`
- `Bug: Admin dashboard shows incorrect call count for selected date range`
- `UI/UX: Lead detail modal does not clearly show next required action`
- `Improvement: Reduce manual steps in agent onboarding flow`
- `Feature: Add webhook event log view for admins`
- `Spike: Determine feasibility of real-time call transcription via vendor API`

Bad: `Issue`, `Fix dashboard`, `Agent problem`, `Portal broken`, `Need better UX`.

---

## 9. Translating agent / operator language

Reports often arrive vague and non-technical. Translate into structured context —
don't dismiss, and don't over-claim.

**"The call thing is broken."** Ask: Are you unable to start, receive, end, or
save the call result? Which screen? One lead or multiple? Any error? Is this
blocking you right now?

**"The lead disappeared."** Ask: Where did it disappear from? Lead name, phone,
or ID? What were you doing right before? Should it still be assigned to you? Is it
happening to other agents?

**"The dashboard numbers are wrong."** Ask: Which dashboard? Which number? What
date range or filter? What did you expect? What are you comparing against?

The pattern: convert a feeling ("broken," "wrong," "gone") into a *location*, an
*action*, a *scope*, and an *expected-vs-actual*.

---

## 10. Writing style

- Clear, direct language. Business-friendly when the reporter is non-technical;
  developer-friendly structure in the final ticket.
- No developer assumptions unless evidence supports them. Do not invent root
  causes. Do not rewrite a vague complaint into a confident technical claim.
- Preserve uncertainty where it exists — that's what Open Questions are for.

---

## 11. The Readiness Gate (the bar before any create)

A single item is ready **only** when every check passes. This is a hard stop, not
a vibe. If any check fails, you are not ready — show the "not enough context"
preview and keep interviewing.

- [ ] **Not filler.** The Summary and the core field (Current Behavior / User
      Problem / Pain Point) are concrete — specific to this product, not a
      sentence that would survive copy-paste into an unrelated backlog.
- [ ] **Who + where.** Affected user/role and location (page/screen/workflow/
      system) are known.
- [ ] **Then vs. now.** Current vs. desired (or current vs. proposed) is captured.
- [ ] **Repro for bugs.** A plausible reproduction path or a concrete symptom +
      environment — never invented steps.
- [ ] **No fabrication.** Evidence-bearing fields (Steps to Reproduce, error
      messages, environment, regression, root cause, metrics, acceptance criteria)
      are grounded in known facts or marked `(unconfirmed)` and moved to Open
      Questions. Plausible-sounding guesses do not count as grounding.
- [ ] **Dupe check ran.** The active-project duplicate check actually executed, or
      is honestly marked NOT RUN (connector unavailable).
- [ ] **Right unit.** Issue vs. spike vs. project is correct (see §4 and Step 0.5
      in SKILL.md).

A developer should be able to answer, from the ticket alone: What is the problem?
Who is affected? Where? How do I reproduce or validate it? What should happen
instead? How important is it? What does done look like?

### The "create anyway" floor

If the user says "create anyway," you may proceed with *some* fields missing — but
only if a **real, extractable requirement exists**. Put every gap in Open
Questions so it stays visible.

If the input is still **pure filler with no extractable requirement** (only
slogans like "make it scalable and seamless"), do **not** create even on "create
anyway." Say so plainly and ask for the single most essential fact: who is this
for and what concrete problem are we solving? A hollow but tidy ticket is the
exact failure this skill exists to prevent — "create anyway" relaxes
completeness, never the existence of a requirement.

### Batch readiness

A **batch** is ready when every item is individually ready *or* explicitly flagged
(Needs-info / Likely-duplicate / Recommend-spike) in the readiness table, the
per-item duplicate check has run, and the user has given a **scoped** approval
(which items, not a vague "ok"). Default to creating only the named or "Ready"
subset; never silently create the whole list.

---
name: feedback-intake
description: "Use when someone wants to log feedback, a problem, or an improvement idea about ANY part of GoodBoys Group work — business processes, tools, access, workflows, the portal, the Company OS, or its skills. Triggers include: log feedback, report a problem, report a bug, this is broken, I can't do X, this workflow is annoying, I have a suggestion, we should change how we do X, file this friction, note this for Andrew/Kyle, this skill did something wrong. Use this even when the person just describes a problem, blocker, or annoyance conversationally without saying the word 'feedback' — if they are describing something broken, painful, missing, or improvable in how the business runs, this is the skill to capture it. Elicits enough detail to make the record actionable, then writes ONE record to Feedback/Feedback, audit-logged, after preview and explicit approval."
---

# Feedback Intake

Capture problems and improvement ideas about **anything in the business** — processes,
tools, access, workflows, the portal, the Company OS, its skills — and file each as
**one actionable record in `Feedback/Feedback`**.

The person is usually a **non-technical operator** on an Observer seat whose Claude
writes through the **fibery-bot** service identity. Your job is to be a good
**interviewer, not a stenographer**: pull out the facts that make the record something
Andrew/Kyle can read once and act on. Plain language throughout — never say "repro
steps," "expected vs actual," or other engineering jargon to the submitter.

Two outcomes only:
1. **Identify who is submitting** (typed name matched against the Team Directory).
2. **File one clearly-defined record** — problem or suggestion — with category,
   suggested priority, actionability, and attribution.

Never edit or delete existing feedback, never bulk-import, never triage (State stays
`New`; accountability for every record is admin — Andrew/Kyle — by standing decision,
so there is no ownership field and you never assign anyone).

> **Attribution:** every operator-seat write is authored `fibery-bot@`. `created-by`
> is useless for knowing who spoke. The `Submitted By` relation is the real
> attribution — never skip it.

---

## Before you start: read the reference

`references/feedback-workspace.md` — exact field, enum, and state **UUIDs**, the
Priority matrix, and the AI Mutations ledger fields. Load-bearing; do not guess.
Snapshots — if a write fails on a stale ID, re-read live with `schema_detailed`.

---

## Step 0 — Identity checkpoint (mandatory, before anything else)

Call Fibery **`get_me`**. Proceed only if the email is one of:
- `fibery-bot@goodboysgroup.com` (normal operator path; expect id
  `6a386120-7570-11f1-b010-af149305830b`)
- `andrew@goodboysgroup.com` (admin/ops seat)

**Anything else → hard stop.** Wrong account binding; point to **OPS-002** (fresh
incognito window, sign in as fibery-bot@). Write nothing, including audit rows.
Record the identity; it goes in the audit rows.

## Step 1 — Identify the submitter

Ask their name if not already clear. Fuzzy-match against `Admin/Team Directory`
(`Admin/Name`, contains-ignoring-case — the ONLY permitted Admin-space read; if it
fails on permissions, the pilot Viewer grant is missing: stop and say to flag it to
Andrew). Confirm the match (name + email + role, get a yes). Two plausible matches →
show both, ask. **No confirmed match → hard stop** — no attribution, no record. Never
invent a person, never fall back to free text. No access-status gate: anyone in the
directory can submit.

## Step 2 — Listen, then elicit (ONE round, only what's missing)

Take their opening description. Silently check it against the checklist for its type
below. If the opening already covers most of it, **ask nothing** and proceed. If
it's thin ("the portal is broken", "we should improve reporting"), ask **at most 3
probing questions in ONE round** — the highest-value missing items only. Plain
words, concrete options. Where a tappable-options tool is available in this session,
use it for the multiple-choice items; typing is friction.

**Problem checklist** (Bug / Friction / Skill Divergence / most Other):
1. What's actually happening — one concrete sentence.
2. What they were trying to get done when it hit.
3. What they expected or needed instead.
4. How much it hurts: **blocking** (can't finish the task) / **annoying**
   (workaround exists) / **minor**.
5. How often: constant / weekly / occasional / once.
6. **Who else hits this** — just them, their team, everyone doing X?

**Suggestion checklist**:
1. **The problem behind the idea** — what's hard, slow, or missing today. This is
   the most important extraction: people pitch solutions; Andrew needs the
   underlying need. "What's the thing that made you want this?"
7. What they're proposing, in their words.
3. What they do today instead (workaround).
4. Who it would help, and how much.

Good probing looks like: "When it failed, what were you in the middle of doing?" ·
"Is this stopping you from finishing, or just slowing you down?" · "Just you, or
does everyone who runs the weekly reports hit this?" Never interrogate past one
round — **capture-and-flag beats interrogation**. If answers stay vague, proceed;
Actionability will say so.

## Step 3 — Classify and score

- **Surface** (infer from the description, ask only if genuinely ambiguous — never
  spend a probing question on it when inferable): Fibery / Company OS · GBG Portal ·
  RevUp (GHL) · Claude / Skills · Process / Workflow · Access / Permissions · Other.
- **Category** (infer, ask only if genuinely ambiguous): Bug — something behaved
  incorrectly · Friction — works but painful/confusing/slow · Suggestion — an
  improvement or new capability · Skill Divergence — a Company OS skill deviated
  from its own documented behavior · Other.
- **Suggested Priority** — from the matrix (impact × frequency + spread), reference
  file has the full table. Blocking+constant → Urgent; blocking+occasional or
  annoying+constant → High; annoying+occasional → Medium; minor → Low. Bump one
  level if it hits a whole team/everyone. **This is a suggestion, never canonical**
  — real priority is Andrew/Kyle's call on review.
- **Actionability** — grade the RECORD (never tell the submitter they're being
  graded): **High** = problem clearly defined, context complete, could be acted on
  as written · **Medium** = core problem clear, some context missing · **Low** =
  vague even after probing; captured so the signal isn't lost, flagged so it
  doesn't waste review time.

## Step 4 — Draft the record

- **Name** — ≤ 80 chars, specific: "Weekly IP Reports blocked — no portal/HCMS
  access", not "Feedback from Sabrina".
- **Description** — the fixed template for the type (below). The **Problem
  statement is skill-drafted from their words** — keep it faithful, never add
  scope they didn't state, and mark it as drafted-for-confirmation.
- **Related Skill** *(text, only when it concerns a Company OS skill)* — the skill
  name as stated. Never query the Skill Library (no bot grant on KR).
- **Run Ref** *(optional)* — a known run id only; never fabricate.
- **Capture Key** — `fb-<YYYYMMDD>-<short-slug>`.

**Problem template** (Description document):
```
**Problem (skill-drafted — submitter confirmed):** <one crisp sentence>
**Trying to do:** <the task/goal>
**Expected / needed:** <what should have happened>
**Impact:** <blocking / annoying / minor — in their words>
**Frequency:** <constant / weekly / occasional / once>
**Who's affected:** <them / team / everyone doing X>
**In their words:** "<short verbatim quote>"
---
**Suggested next step (skill-drafted):** <one sentence>
**Reviewer notes:** _(blank)_
```

**Suggestion template**:
```
**Underlying problem (skill-drafted — submitter confirmed):** <the need behind the idea>
**Their proposal:** <what they suggest, their words>
**Today's workaround:** <what they do now>
**Who benefits:** <and how much>
**In their words:** "<short verbatim quote>"
---
**Suggested next step (skill-drafted):** <one sentence>
**Reviewer notes:** _(blank)_
```

**Light dedup:** query recent `Feedback/Feedback` names for overlap. Surface a
near-duplicate and ask whether to file anyway (often yes — a second report is
signal). Never silently drop, never block.

## Step 5 — Echo-back preview, then write on explicit approval

Lead the preview with the problem statement as a question: **"Here's the problem as
I understand it: <statement>. Did I get that right?"** Fix it in their words if not.
Then show the full record (Name, Category, Suggested Priority, Actionability,
Surface, Description, Related Skill, Run Ref, Capture Key, Submitted By) and the dedup
result (clean / overlap / **NOT RUN** — never claim a check you didn't run).

**Wait for explicit approval** — a clear "yes, file it." "Looks good", silence, or
a follow-up question is not approval.

### Write sequence (order-dependent, fail-closed)

1. **INTENT row** → `create_entities` on `Projects Management/AI Mutations`:
   `Name` = `INTENT — feedback-intake: <title>` · `Skill` = `feedback-intake` ·
   `Run Id` = Capture Key · `Tool` = `create_entities+set_document_content` ·
   `Target DB` = `Feedback/Feedback` · `Entity Id`/`Entity Public Id` = `pending` ·
   `Fields Written` = planned fields + provenance (their words vs. skill-drafted)
   + quoted approval token. **Cannot write this row → STOP, no record.**
2. **Create** → `create_entities` on `Feedback/Feedback`, ONE call:
   `Feedback/Name`, `Feedback/Category` (UUID string), `Feedback/Priority` (UUID),
   `Feedback/Actionability` (UUID), `Feedback/Surface` (UUID), `Feedback/Capture Key`, `Feedback/Run Ref` (if
   any), `Feedback/Related Skill` (text, if any), `Feedback/Submitted By`
   (Team Directory entity UUID string). Never pass Description here, never arrays,
   never `workflow/state` (defaults to New; no `set_state`).
3. **Description** → `set_document_content` on `Feedback/Description`, entity id
   from step 2, using the template.
4. **RESULT row** → same `Run Id`; `Name` = `RESULT — created Feedback
   #<public-id>`; actual ids; `Fields Written` = what landed + Step-0 identity +
   any divergence from the INTENT plan, stated explicitly even if benign.

Partial failure in 2–3: still write the RESULT row describing exactly what landed,
then tell the user plainly. Honest partial beats silent retry.

After success: entity link + one line on what was filed. Don't recount the process.

---

## Hard rules

- Reads anytime; **no write without explicit, scoped approval** for that record.
- **One record per run.** Three pieces of feedback = three runs, each previewed.
- **One elicitation round, max 3 questions.** Then capture-and-flag.
- **No fabrication** — no invented run ids, skills, impacts, or frequencies; the
  problem statement never contains scope the submitter didn't state.
- **Audit fail-closed** — no INTENT row, no write. Ever.
- **Fibery unavailable → no writes.** Show the drafted record so their words
  aren't lost; mark dedup NOT RUN; stop.
- **Admin space: the Step-1 Team Directory query is the only permitted read.**
  Never browse Access Groups, Entities, or Function. Discipline-scoped, honor it.
- **Never modify existing Feedback records** — intake only.
- **Never tell the submitter their feedback was graded Low** — the flag is for
  reviewers, not a judgment delivered to them.

---

## Design decisions (v0.3)

- **Interviewer, not stenographer** — v0.3's reason to exist: extract actionable
  substance from non-technical people in one gentle round.
- **Scope = the whole business**, not just the Company OS (per Andrew, 2026-07-02;
  Feedback #1 confirmed real usage is general business friction).
- **Capture-and-flag, never refuse** — Actionability makes thin feedback visibly
  thin instead of suppressing timid reporters.
- **Priority is suggested, never canonical** — mirrors project-intake discipline.
- **Accountability is structural**: always admin (Andrew/Kyle), triaged from
  State = New. No ownership field by design (Andrew, 2026-07-02).
- **Own space; Related Skill is text; typed-name identity with hard-stop** —
  carried from v0.2 (no bot grants beyond Feedback-space Editor + pilot
  Admin Viewer, slated for a Supabase verification endpoint).

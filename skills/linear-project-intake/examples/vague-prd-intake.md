# Example: Vague PRD gets interrogated, not transcribed

Demonstrates the core principle: **fluent input is not a real requirement.** The
PRD reads complete but is empty. The skill challenges the filler instead of
pouring it into a Feature template.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Don't create yet — interrogate the filler; this likely shrinks to a small "call-next list" project plus a scoring spike.
- **Why:** the PRD is slogans, not a requirement; scope must come from real answers.

---

**User:** Here's a PRD for a new feature — can you make it a Linear project?
*(pastes a polished one-pager)*

> **PRD: Next-Gen Agent Dashboard**
> We will build a robust, scalable dashboard that enhances visibility for agents
> and optimizes their workflow. The solution will be seamless and intuitive,
> surfacing key insights so agents can make data-driven decisions. This will
> improve user experience and drive operational efficiency.

**Assistant:** I can turn this into a project, but right now this PRD is fluent
without being concrete — almost every line is a phrase that would fit any product.
Before I structure anything, I need to convert the slogans into specifics,
otherwise we'd get tickets that look finished and tell a developer nothing.

Here's what the PRD says vs. what it doesn't:

- "enhances visibility" → *who needs to see what, that they can't today, to make
  which decision?*
- "optimizes their workflow" → *which workflow, which step, slow or error-prone
  how, measured how?*
- "key insights / data-driven decisions" → *which specific metrics? what decision
  does each one drive?*
- "robust / scalable / seamless" → these describe no behavior; I'll set them aside
  until there's a real requirement to qualify.

Six questions to extract the real thing:

1. Who is the dashboard for — frontline agents, team leads, or both?
2. What decision should an agent make *faster or better* because of it? (e.g.,
   "which lead to call next")
3. What 3–5 numbers or lists actually matter to that decision?
4. What do agents do **today** instead — where do they get this info now, and
   what's painful about it?
5. Is there a concrete trigger (a complaint, a missed-SLA, a revenue goal) behind
   this?
6. What would the *minimum* useful v1 show?

**User:** It's for agents. The real problem: they don't know which lead to call
next, so they waste time. Today they sort a raw list manually. v1 just needs a
prioritized "call next" list with lead name, last contact, and a priority score.

**Assistant:** Good — but this is a UI surface, so before I scope it I need to know
how it should *operate*, not just that it's a "list." Three quick ones:

1. When an agent clicks a lead in the list, what should happen — open the dialer,
   open the lead record, or something else?
2. How is the list ordered, and can the agent re-sort or filter it in v1?
3. What does "last contact" show — date only, or also the outcome of that contact?

**User:** Clicking a lead opens the dialer with that lead loaded. Default order is
by priority score, highest first; no manual re-sort in v1. "Last contact" shows the
date and the disposition.

**Assistant:** That's a real requirement — and now I know how it *behaves*, not just
what it looks like. "Prioritized call-next list" is buildable; "robust scalable
seamless dashboard" was not. Recommended structure:

```markdown
Proposed Linear project:
- Team: Engineering
- Project name: Agent Dashboard — Prioritized "Call Next" List (v1)
- Summary: Give agents a ranked list of which lead to call next (name, last
  contact, priority score) so they stop manually sorting a raw list.
- Behavior: list ordered by priority score (highest first, no manual re-sort in
  v1); clicking a lead opens the dialer with that lead loaded; "last contact" shows
  date + disposition.
- Observable success: an agent opens the dashboard, sees the top-ranked lead,
  clicks it, and the dialer opens with that lead — without manual sorting.
- Out of scope (v1): general analytics, charts, team-lead views, manual re-sort/
  filter, anything from the PRD not tied to the call-next decision.

Planned issues (preview only):
| # | Title | Type | Priority | Ready? |
|---|-------|------|----------|--------|
| 1 | Feature: Prioritized "call next" list — score-ordered, click-to-dial | Feature | High | Needs-info |
| 2 | Spike: Define the priority score inputs + formula | Spike | High | Ready |

Why #2 is a spike: the "priority score" has no defined formula yet — that's a
decision to make, not a thing to build blind.
```

Open question I still need for #1: what should the empty state show when an agent
has no assigned leads? Shall I create the project? (The two planned issues —
including the spike — are created separately via **linear-issue-intake** after the
project exists.)

*(The slogans never made it into a ticket. Nothing is written until approved.)*

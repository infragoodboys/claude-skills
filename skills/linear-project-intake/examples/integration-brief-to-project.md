# Example: Integration brief → project (with feasibility held as a spike)

Demonstrates `linear-project-intake` on a vendor/integration concept: gather facts
with tools first, refuse to fabricate vendor capabilities, scope a real project,
and push the unproven core into a spike instead of committing the project to it.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Scope a one-way v1 project; hold two-way / real-time as spikes; don't commit the project to the unproven core.
- **Why:** the brief is buzzwords, and the vendor's two-way capability is unconfirmed.

---

**User:** We want to plan a project to sync our Revup leads into the Kinetic CRM
in real time. Here's the one-pager. Make it a Linear project.

> Build a robust, real-time, two-way integration that seamlessly syncs all lead
> data between Revup and Kinetic with zero latency and full field mapping.

**Assistant:** I can shape this into a project, but two things first: the brief is
mostly unverified ambition ("robust," "seamless," "zero latency," "two-way"), and
the whole thing hinges on what Kinetic's API actually supports — which I should
check before we commit scope, not assume.

*(checks: the Kinetic project in Linear for any prior integration work; the Kinetic
API docs via web/doc tools; the Revup side for an existing export.)*

What the tools tell me:

- **Known:** Kinetic's public API exposes lead create/update over REST and a
  webhook for inbound changes. There's no documented bulk real-time stream. The
  Kinetic Linear project exists; no prior sync work there.
- **Inference:** near-real-time is feasible via webhooks + polling; "zero latency"
  is marketing, not a requirement.
- **Assumption (flag):** "two-way" — the one-pager assumes Kinetic→Revup writes,
  but I can't confirm Revup accepts inbound lead writes without checking that side.
- **Open / blocking unknown:** whether genuine **two-way** real-time sync is
  possible at all depends on Revup's inbound write capability, which is unconfirmed.

Before scoping, 4 questions:

1. Is **one-way** (Revup → Kinetic) enough for v1, or is two-way a hard
   requirement?
2. Which lead fields actually need to map — all of them, or a core set?
3. What's the real latency need — seconds, minutes, or "same day"? ("Zero" isn't a
   target.)
4. What triggers this — a deal, a client ask, a manual-entry pain? (the value)

**User:** One-way is fine for v1. Core fields: name, phone, status, owner. "Within
a minute" is plenty. It's manual double-entry killing the team.

**Assistant:** That's a real, scoped project — and notably smaller than the
one-pager. Two-way stays out of scope for v1, and the only genuine unknown
(Revup inbound writes) becomes a spike rather than a project commitment.

```markdown
Proposed Linear project:
- Team: Engineering
- Project name: Revup → Kinetic Lead Sync (v1, one-way)
- Business problem: Agents manually re-enter leads from Revup into Kinetic;
  double-entry is slow and error-prone.
- Desired future state: New/updated Revup leads appear in Kinetic within ~1 minute,
  no manual entry.
- Business value: Eliminates double-entry for the agent team; fewer transcription
  errors.

In scope (v1):
- One-way Revup → Kinetic sync of core fields (name, phone, status, owner)
- Near-real-time (~1 min) via Kinetic create/update API + change triggers

Out of scope (v1):
- Two-way / Kinetic → Revup writes
- Full field mapping beyond the core four
- "Zero latency" guarantees

Success criteria:
- A Revup lead change is reflected in Kinetic within ~1 minute for the core fields
- No manual re-entry needed for those fields

Project duplicate check: none found (no existing sync project).

Technical unknowns (spike candidates):
- Revup inbound write capability (blocks any future two-way phase)

Initial backlog (PREVIEW ONLY — created later via linear-issue-intake):
| # | Title | Type | Readiness |
|---|-------|------|-----------|
| 1 | Feature: Push Revup lead create/update to Kinetic (core fields) | Feature | Needs-info |
| 2 | Spike: Confirm Kinetic webhook/poll approach + rate limits | Spike | Ready |
| 3 | Spike: Determine whether Revup supports inbound lead writes (gates two-way) | Spike | Ready |

Project Readiness Gate: PASS. Create this project?
(Issues/spikes are created separately via linear-issue-intake.)
```

I did **not** commit the project to "two-way real-time" — that's unproven, so it's
a spike and an out-of-scope note, not a promise. Create the project?

*(Nothing is written until the user approves; issues are handed off afterward.)*

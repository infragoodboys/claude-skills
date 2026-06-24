# Example: Research → a small set of scoped issues

Demonstrates **Research-to-Linear Mode** resolving into a handful of issues inside
an *existing* project (not a new project). Shows using tools to avoid asking, and
declining to over-structure.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Don't create yet — confirm splitting into a Bug (list-load regression) plus a profiling Spike; no new project.
- **Why:** "slow" is more than one issue, and the root cause is unknown until profiled.

---

**User:** Our agents keep complaining the Sundialer portal is slow. Can you dig
into it and turn it into whatever Linear work makes sense?

**Assistant:** Let me look before I ask anything.

*(checks the "Sundialer.ai Portal Integration (Kinetic)" project in Linear for
existing performance issues; skims recent agent-feedback already triaged; notes
there's no codebase/profiling data available to me.)*

What I can establish:

- **Known:** multiple agents report slowness; complaints are about the Sundialer
  portal; the project already exists. No open Linear issue currently tracks
  performance there.
- **Inference:** "slow" likely covers more than one thing — page load vs. action
  latency vs. list rendering — and probably maps to **2–3 issues**, not one vague
  "make it faster" ticket and not a whole new project.
- **Assumption (flag):** this is an Improvement, not a Bug — nothing is broken,
  it's degraded. I'll confirm.

I won't file "Improvement: make the portal faster" — that's filler. To split it
correctly I need a little detail (4 questions):

1. *Where* does it feel slowest — opening the portal, loading the lead list,
   opening a lead, or during/after a call?
2. Is it slow for all agents or some? Any pattern by time of day or list size?
3. Did it get worse recently, or has it always been like this? (regression vs.
   chronic)
4. Any number you can give me — "takes ~10 seconds to open a lead" beats "slow."

**User:** Mostly opening the lead list — it's gotten way worse the last two weeks,
maybe 8–10 seconds now, and it's everyone. Opening an individual lead is fine.

**Assistant:** That's enough to scope this tightly. "Got worse two weeks ago" plus
"all agents" pushes this toward a **Bug (regression)** for the list, not a vague
Improvement. I'd file two issues, both in the Sundialer project:

```markdown
Issue 1 — preview
Title: Bug: Sundialer lead list takes 8–10s to load (regression, all agents)
Type: Bug · Priority: High · Labels: bug, from-customer
Duplicate check: None found in project.
Key fields: regression began ~2 weeks ago; scope = all agents; lead detail
unaffected; current load ~8–10s vs. previously near-instant.
Open questions: list size when slow? any console/network errors? prod only?

Issue 2 — preview
Title: Spike: Profile Sundialer lead-list load to find the 2-week regression cause
Type: Spike · Priority: High · Labels: spike
Why a spike: root cause unknown and unestimable until profiled (no profiling
data available to me). Timebox: 1 day. Done = identified cause + recommended fix.
```

I deliberately did **not** create a new project (this fits the existing one) and
did **not** invent a root cause. Want me to create both, or just the bug for now?

*(Nothing is written until the user approves.)*

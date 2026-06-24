# Example: Research → one Linear project

Demonstrates **Research-to-Linear Mode** resolving into **Project Builder Mode**:
investigate first, then recommend a single project with a planned issue list. No
writes happen without approval.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Create one project (post-call v1); hold live transcription as a spike; file issues later via linear-issue-intake.
- **Why:** it's a multi-issue effort, but live-streaming feasibility is unproven.

---

**User:** Look into adding call transcription to the Revup portal and figure out
what we'd need to build. Here's a doc with what the team brainstormed.
*(attaches `transcription-notes.md`)*

**Assistant:** Before I propose any Linear work, let me gather what I can.

*(reads the uploaded doc; checks the Revup Portal project via the Linear connector
for existing related issues; does a quick web check on the call vendor's API.)*

Here's what I found, sorted by confidence:

- **Known:** the notes want live transcripts shown to agents during calls and
  saved to the lead record. Revup Portal is an active project. No existing Linear
  issue mentions transcription.
- **Inference:** this is a multi-issue effort (capture → transcribe → display →
  store), so it wants its own project, not a single ticket.
- **Assumption (please confirm):** transcription happens during the live call,
  not as a post-call batch job. The notes are ambiguous here.
- **Open question — and it's the big one:** the vendor's public docs don't confirm
  a real-time streaming transcript endpoint. Feasibility of *live* transcription
  is unverified.

A few questions before I structure this (3 of them):

1. Live during the call, or is a post-call transcript acceptable for v1?
2. Who is the primary user of the transcript — the agent on the call, a QA
   reviewer afterward, or both?
3. Is there a compliance requirement (consent, retention) we must design around?

**User:** Live is the dream but post-call is fine for v1. Primary user is the
agent. Yes — two-party consent states need a disclosure.

**Assistant:** Good — that changes the shape. Because live feasibility is
unconfirmed, I'd scope v1 to post-call (buildable now) and put the live question
behind a spike rather than committing to it. Here's the proposed structure:

```markdown
Proposed Linear project:
- Team: Engineering
- Project name: Revup Portal — Call Transcription (v1: post-call)
- Summary: Generate and store a post-call transcript per call, viewable on the
  lead record by the handling agent, with a consent disclosure for two-party
  states.
- Out of scope (v1): real-time/live transcription; QA reviewer tooling.

Duplicate check: No overlapping project found.

Planned issues (preview only — not yet created):
| # | Title | Type | Priority | Ready? |
|---|-------|------|----------|--------|
| 1 | Feature: Generate post-call transcript per call (vendor batch API) | Feature | High | Needs-info (which vendor endpoint) |
| 2 | Feature: Show transcript on lead record for handling agent | Feature | High | Ready |
| 3 | Feature: Add consent disclosure for two-party-consent states | Feature | High | Needs-info (which states list?) |
| 4 | Spike: Confirm feasibility + cost of real-time streaming transcription | Spike | Medium | Ready |

Open questions affecting scope:
- Transcript storage location/retention window?

Shall I create the project? Issues are previewed separately before creation.
```

I have enough to create the project record. The four issues are previewed only — I
don't create issues from this skill. Once you approve the project, I'll hand the
backlog (including the deliberate spike, #4) to **linear-issue-intake**, which runs
its own intake and duplicate check before writing any of them. Create the project
now?

*(No project or issue is created until the user says yes.)*

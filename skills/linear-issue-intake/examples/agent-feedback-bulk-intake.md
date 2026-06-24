# Example: Agent feedback → batch intake with readiness review

Demonstrates **Bulk Issue Intake Mode**: several rough reports at once, a single
readiness table, duplicate and spike flags, and **one** consolidated approval
before anything is created.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Create #2 (dark mode); Merge #3+#4 (same notes-save bug); Hold #1 and #5 pending answers.
- **Why:** only dark mode is ready; the two notes reports are one bug; "calls fail" and "make it faster" are too vague to file.

---

**User:** Dumping a bunch of agent feedback from this week into the Good Boys
Portal v2 project. Make tickets.

> 1. "The call thing is broken sometimes after lunch"
> 2. "Can we get a dark mode"
> 3. "Lead notes don't save"
> 4. "Notes box loses what I typed" *(from a different agent)*
> 5. "Make the portal faster"

**Assistant:** Five reports — I'll batch them, but several aren't ticket-ready as
written, and two look like the same bug. Confirming the destination is the **Good
Boys Portal v2** project for all of these.

*(checks the project for existing issues to dupe-check against.)*

```markdown
# Batch intake readiness — 5 candidate issues
Destination: Engineering · Good Boys Portal v2 · status Triage

| # | Proposed title | Classification | Priority | Labels | Readiness | Create strategy | Missing context | Duplicate risk | Recommended action |
|---|----------------|----------------|----------|--------|-----------|-----------------|-----------------|----------------|--------------------|
| 1 | Bug: Calls fail intermittently (reported "after lunch") | Bug | High *(provisional)* | bug, from-customer | Needs-info | Hold | which call action; screen; scope; error; blocking? | none found | Ask Q before create; "after lunch" may be load-related |
| 2 | Feature: Add dark mode to portal | Feature | Low | feature, from-customer | Ready | Create | — | none found | Create on approval |
| 3 | Bug: Lead notes do not save | Bug | High | bug, from-customer | Likely-duplicate | Merge | — | duplicates #4 | Merge with #4; cite both reporters |
| 4 | Bug: Notes box loses typed content before save | Bug | High | bug, from-customer | Likely-duplicate | Merge | — | duplicates #3 | Same failure as #3 — file once |
| 5 | Improvement: Portal performance | Improvement | — | improvement, from-customer | Needs-info | Hold | where/how slow; new or chronic; a number | none found | "make it faster" is filler — ask where/how slow |

Readiness: Ready / Needs-info / Likely-duplicate / Recommend-spike
Create strategy: Create / Hold / Merge / Route to linear-project-intake / Spike / Reject — not Linear-ready
```

**By strategy:** Create → #2 · Hold → #1, #5 · Merge → #3 + #4. (Nothing here is
project-level, spike-only, or pure-filler-reject this round.)

**Needs answers first:**

*For #1 (calls):* (a) start, receive, end, or *save* the call result? (b) which
screen? (c) one lead or many? (d) any error? (e) blocking work right now? The
"after lunch" detail might be load-related — does it cluster at a busy time?

*For #5 (speed):* where is it slowest (list, lead open, during call), is it new or
chronic, and any rough number?

**Duplicate to resolve:** #3 and #4 are the same "notes don't save" bug from two
agents. I'd **merge them into one ticket** and note both reporters (two reporters
= higher confidence, not two tickets). Agreed?

**Approval — tell me how to proceed:**

- "Create #2, merge #3+#4, hold #1 and #5" — and I'll ask nothing further until
  you have the answers, or
- "Create all anyway" — I'll create all five, with every missing field written
  into each ticket's **Open Questions** so nothing vague hides.

*(No issues are created until this explicit approval. Even on "create all anyway,"
#3/#4 still merge and gaps go to Open Questions.)*

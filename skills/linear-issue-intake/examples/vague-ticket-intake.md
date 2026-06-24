# Example: Vague ticket request → interrogated, and the "create anyway" floor

Demonstrates `linear-issue-intake` refusing to transcribe filler into a tidy-but-
empty ticket — including holding the line when the user says "just create it
anyway," because there's no extractable requirement.

**Action-first summary** (how the new output style leads; full walkthrough follows):
- **Recommended next action:** Do not create — even on "create anyway"; ask for the one essential fact first (who + what concrete problem).
- **Why:** "improve UX / make it scalable" is pure filler with no requirement to anchor a ticket.

---

**User:** Make a ticket in Good Boys Portal v2: "Improve the dashboard UX and make
it more intuitive and scalable."

**Assistant:** I can file this, but as written it's filler — "improve UX,"
"intuitive," "scalable" would fit any product's backlog and tell a developer
nothing to build. Before I write a ticket, I need the real requirement underneath.

Four quick questions:

1. Which dashboard, and who uses it — agents, admins, or both?
2. What specifically is hard or confusing about it today? (a task they struggle to
   finish, a number they can't find, a step that's too many clicks?)
3. What should they be able to do or see that they can't now?
4. "Scalable" — do you mean it's slow with a lot of data, or something else?

**User:** Just create it anyway, I don't have time. Title it whatever.

**Assistant:** I'm going to hold off — and not because of process for its own sake.
"Create anyway" lets me file something with *gaps*, but there has to be a real
requirement to anchor it. Right now there's nothing extractable: no user, no
concrete problem, no desired behavior. A ticket built from "improve UX and make it
scalable" would look complete and be useless — a developer would bounce it straight
back to you, costing more time than this question does.

So I just need **one** thing to make this real: **who is it for, and what's the one
concrete thing that's hard or missing today?** One sentence is enough — e.g.,
"agents can't tell which lead to call next." With that, I'll file it immediately and
park the rest in Open Questions.

**User:** Fine — agents can't tell which lead to call next on the main dashboard.

**Assistant:** That's a real requirement. Filing it now:

```markdown
Classified: UI/UX (verge of Feature) · Priority: Medium
Destination: Engineering · Project: Good Boys Portal v2 · Status: Triage
Title: UI/UX: Main dashboard doesn't show agents which lead to call next
Labels: ui-ux, from-customer
Duplicate check: none found in project.

Known / Inference / Assumption:
- Known: on the main dashboard, agents can't tell which lead to call next.
- Inference: this is about prioritization/surfacing, not a broken control.
- Assumption (confirm later): agents, not admins, are the affected role.

## Summary
Agents using the main dashboard in Good Boys Portal v2 cannot tell which lead to
call next, so they pick manually.

## Issue Type
UI/UX

## Affected Area
- Page/screen: main dashboard
- Component: lead list / prioritization (unconfirmed which element)
- User role affected: Agent (assumed)

## Current Experience
Agents see the dashboard but have no clear signal for which lead to call next.

## Desired Experience
The dashboard makes the next-best lead obvious.

## Open Questions
- Which dashboard element should carry this? Is a priority score available?
- Is "scalable" a real performance concern, or was that filler?
- Confirm role = agents only.

Readiness Gate: PASS (real requirement present; gaps captured above). Create it?
```

I deliberately left the invented parts out — no fabricated "priority algorithm,"
no made-up acceptance criteria — and flagged the leftover filler ("scalable") as an
open question instead of pretending it was a spec. Create this?

*(Nothing is written until the user approves.)*

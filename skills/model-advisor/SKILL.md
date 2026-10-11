---
name: model-advisor
description: "Use when someone asks which AI model to use for a workflow, wants the model routing table refreshed, or asks what the best current sources for AI model comparisons are. Triggers: which model should we use for X, is there a better or cheaper model for X, refresh the model matrix, monthly model check, compare models for this agent, what should the router's cheap and strong tiers be. Researches primary sources (leaderboards, benchmarks, Vercel AI Gateway prices), then writes a per-workflow model table (markdown + JSON the router reads) with a recommended model, a cheaper fallback and an open-weight option. Proposes changes; never edits routing config or deploys."
---

# Model Advisor

Pick the right model for each GBG Ops workflow from evidence fetched today, not from memory.
The output is a table the GBG Ops v2 router reads to choose its cheap and strong tiers.

## Inputs

- The list of workflows. Use the existing `model-matrix.json` if one exists. Otherwise build it from the agent platform docs (`agent-platform/*.md` in project files) and ask the requester to confirm.
- The previous matrix, if any. A refresh compares against it.

## Sources

`references/sources.md` ranks the comparison sources. Each monthly run checks the **primary** sources listed there. Rules:

- Every price, gateway slug, context window and benchmark score must cite a URL fetched in this run. If it can't be verified, write `unverified`. Never fill a gap from memory.
- Use the Vercel AI Gateway model list (`GET https://ai-gateway.vercel.sh/v1/models`, no auth, plus `/v1/models/{creator}/{model}/endpoints` for price tiers and latency) for slugs and prices, because that is how GBG Ops calls models.
- Gateway slugs put a dot in the version (`anthropic/claude-sonnet-5.5`), unlike Anthropic's own API IDs (`claude-sonnet-5-5`). Always copy the slug from the gateway list.
- Our own eval (the labelled GBG Ops messages plus one test task per workflow) makes the final call on any change. Public boards only narrow the shortlist.
- Judge on independent evals over vendor claims. Vendor-run leaderboards are secondary.
- Don't favor any vendor. Weigh quality for the job, then cost, then latency.

## Steps

1. Load the workflow list and the previous matrix.
2. Fetch each primary source. Note the date each one was last updated.
3. For each workflow, decide what matters most: tool-calling accuracy for routing and writes, coding benchmarks for PR work, long-context recall for summaries, price and latency for high-volume triage.
4. Pick three models per workflow: **primary**, **fallback** (cheaper, at least 80% of the primary's quality on the deciding eval) and **open_weight** (for the Phase 5 self-hosting option).
5. Pick the router tiers: `cheap`, `strong`, and the model the router itself runs on.
6. On a refresh, change a row only when the evidence clearly beats the current pick (better on the deciding eval at similar cost, or similar quality at clearly lower cost). Leave the row alone on a tie.

## Output

Write to `agent-platform/model-advisor/` in project files:

- `model-matrix.md`: a human-readable table with a rationale and source links per row.
- `model-matrix.json`: an array of `{workflow, tier, primary, fallback, open_weight, rationale, sources[], checked_at}`, plus a `router` object `{cheap, strong, router_model}`.
- `changes-YYYY-MM.md` (refresh runs only): each proposed change with before, after, evidence and the expected cost effect. If nothing changed, say so in one line.

## Limits

- Propose only. Changing what production runs goes through a PR to the gbg-agents repo that Kyle merges.
- No API keys are needed: all sources are public web pages.
- Keep the matrix under about 15 workflows. Merge similar ones instead of adding rows.

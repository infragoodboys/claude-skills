---
tags: [oss-scout]
max_turns: 60
timeout_seconds: 1500
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

We take Stripe and Discord webhooks on Vercel serverless functions. Every so often the same event gets processed twice (double Discord posts), and during deploys we sometimes drop events completely. Plan a durable, idempotent webhook intake: dedupe, retries, and a way to replay missed events. Write the plan to plan.md before anyone codes it.

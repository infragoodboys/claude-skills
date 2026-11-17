---
tags: [oss-scout]
max_turns: 60
timeout_seconds: 1500
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

Our GitHub Actions CI keeps failing on the same few problems across different PRs (a flaky Playwright test, a typecheck error from a generated file, a rate-limited API mock) and nobody notices they're the same thing. I want a weekly GitHub Action that groups recurring failures across the last 7 days of runs and opens one tracking issue per recurring problem. Before anyone writes code, plan the approach and write the plan to plan.md.

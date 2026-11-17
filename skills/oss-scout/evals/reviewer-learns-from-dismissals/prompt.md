---
tags: [oss-scout]
max_turns: 60
timeout_seconds: 1500
allowed_tools: [Read, Glob, Grep, Skill, Write, Edit, Bash]
---

Our AI PR reviewer (a GitHub Action that calls a model and posts findings) has too much noise: people dismiss or argue away about 1 in 4 of its Major findings. I want it to learn from what happens to its comments so it gets better every week. We already did a big open-source survey last week, it's in prior-survey.md. Plan the learning loop and write it to plan.md.
Input files: prior-survey.md

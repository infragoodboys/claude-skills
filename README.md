# Claude Skills

Installable Claude skills.

## Install

Download the `.zip` from [Releases](../../releases/latest), unzip it, and place the
folder in your Claude skills directory. Each skill is self-contained.

| Skill | What it does |
|-------|--------------|
| `linear-project-intake` | Turn a PRD / brief into a structured Linear project plan |
| `linear-issue-intake` | Turn rough reports or feedback into Linear issues in an existing project |
| `task-intake` | Capture a raw to-do as a single Task in a Fibery-style intake/triage system |
| `project-intake` | Interview a rough project idea into a structured Project, Triage-gated until Ready |
| `initiative-intake` | Interview a strategic objective into an Initiative that contains Projects |
| `triage-enrich` | Complete an existing Not-Ready Triage item — asks for missing commitments, never invents them |

The 4 intake/enrich skills share a common "Operating Contract" (Definition of Ready, audit schema, ask-don't-guess rule for commitment fields) — each ships its own copy under `references/readiness-contract.md` + `references/CONTEXT.md` so it stays self-contained; the source of truth lives in the original GBG Fibery deployment these were built for. Adapt the Fibery-specific field/database names to your own tool if reusing.

## Layout

```
skills/<skill-name>/SKILL.md   # the skill
dist/<skill-name>.zip          # packaged copy (also attached to each Release)
```

## Add or update a skill

1. Add/edit the folder under `skills/`.
2. Re-zip: `cd skills && zip -rq ../dist/<name>.zip <name>`
3. Cut a release; the zip in that release is what people download.

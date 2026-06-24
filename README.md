# Claude Skills

Installable Claude skills.

## Install

Download the `.zip` from [Releases](../../releases/latest), unzip it, and place the
folder in your Claude skills directory. Each skill is self-contained.

| Skill | What it does |
|-------|--------------|
| `linear-project-intake` | Turn a PRD / brief into a structured Linear project plan |
| `linear-issue-intake` | Turn rough reports or feedback into Linear issues in an existing project |

## Layout

```
skills/<skill-name>/SKILL.md   # the skill
dist/<skill-name>.zip          # packaged copy (also attached to each Release)
```

## Add or update a skill

1. Add/edit the folder under `skills/`.
2. Re-zip: `cd skills && zip -rq ../dist/<name>.zip <name>`
3. Cut a release; the zip in that release is what people download.

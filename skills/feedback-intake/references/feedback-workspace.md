# Feedback workspace reference — snapshot 2026-07-02 (v0.3: +Priority, +Actionability)

Values below were read live from `good-boys-group.fibery.io` on 2026-07-02 by the
admin seat immediately after creating the database. They are **snapshots**: if any
write fails on an ID, re-read with `schema_detailed(["Feedback/Feedback"])` and
trust the live value over this file.

## Identity checkpoint

| Identity | Email | fibery/id |
|---|---|---|
| Service bot (normal path) | fibery-bot@goodboysgroup.com | `6a386120-7570-11f1-b010-af149305830b` |
| Admin/ops seat | andrew@goodboysgroup.com | (verify via get_me email) |

Any other `get_me` result → hard stop, point to OPS-002.

## Target database: `Feedback/Feedback`

Space id: `882844d4-9d0e-4193-88ce-5d8121489d86` · Database id: `b113d619-00cc-4d03-aa31-ca5afc2b098b`

Writable fields (exact names for `create_entities`):

| Field | Type | Notes |
|---|---|---|
| `Feedback/Name` | text | UI title, ≤ 80 chars |
| `Feedback/Description` | rich-text document | **NOT settable in create_entities** — use `set_document_content` with field `Feedback/Description` |
| `Feedback/Category` | single-select | pass option **UUID as a string** |
| `Feedback/Priority` | single-select | skill-SUGGESTED, never canonical; pass UUID as string |
| `Feedback/Actionability` | single-select | skill-set record quality; pass UUID as string |
| `Feedback/Surface` | single-select | where the feedback originates; inferred, pass UUID as string |
| `Feedback/Submitted By` | relation → `Admin/Team Directory` | pass Team Directory entity **UUID as a string** |
| `Feedback/Related Skill` | text | skill name as plain text; deliberately not a relation |
| `Feedback/Run Ref` | text | optional |
| `Feedback/Capture Key` | text | `fb-<YYYYMMDD>-<slug>` |
| `workflow/state` | workflow | **do not set** — defaults to `New` |

### Category option UUIDs (`Feedback/Category_Feedback/Feedback`)

| Option | UUID |
|---|---|
| Bug | `be241f71-0c65-479b-8d99-041bd66e60c6` |
| Friction | `1960d3c2-2aab-49c3-9e76-6e58bbd3cda0` |
| Suggestion | `a6a3b0b8-c18b-4896-b795-92f1cc5de8d7` |
| Skill Divergence | `2c721acf-e687-4fac-b6a1-3ccb37f7078a` |
| Other (default) | `1fd0b68b-e545-4d67-b5ca-4217284f95ca` |

### Priority option UUIDs (`Feedback/Priority_Feedback/Feedback`)

| Option | UUID |
|---|---|
| Urgent | `6d918000-4cf2-48cc-b2f6-097154eb5d68` |
| High | `02f8fe91-bb07-460c-9061-72d3364e4003` |
| Medium (default) | `cf300bbf-8443-486f-8f66-241104a7c670` |
| Low | `63ba4c21-5030-44b7-8872-6d86bea0dc13` |

**Priority matrix (impact x frequency; suggestion only, never canonical):**

| | constant | weekly | occasional | once |
|---|---|---|---|---|
| **blocking** | Urgent | Urgent | High | Medium |
| **annoying** | High | High | Medium | Low |
| **minor** | Medium | Low | Low | Low |

Bump ONE level (max Urgent) if it affects a whole team or everyone doing the task.
Suggestions (no impact/frequency): default Medium; High if the underlying problem
is blocking someone today; Low if speculative/nice-to-have.

### Actionability option UUIDs (`Feedback/Actionability_Feedback/Feedback`)

| Option | UUID |
|---|---|
| High | `60b579ed-4f3f-4a5d-96c8-85e648c20bf3` |
| Medium (default) | `903f3738-2183-47da-8946-51ebb46ab9e0` |
| Low | `7990261d-7d87-4dec-8336-12d640ccc5f5` |

High = problem clearly defined + context complete, actionable as written.
Medium = core problem clear, some context missing.
Low = vague even after the probing round; captured so signal isn't lost, flagged
so it doesn't waste review time. Never disclosed to the submitter.

### Surface option UUIDs (`Feedback/Surface_Feedback/Feedback`)

| Option | UUID |
|---|---|
| Fibery / Company OS | `261fb854-fc19-49c3-9b7a-f62207c57f2a` |
| GBG Portal | `1f2a667f-cc2e-4d7e-90ce-ff26f5fa0af9` |
| RevUp (GHL) | `08d0d343-677f-4d79-998b-e6c1a47cbeb1` |
| Claude / Skills | `a1ff5650-7175-48f3-966b-5ac96bf7a4ed` |
| Process / Workflow | `182fcf7a-50ee-48e7-ac4f-cdbd515bf0e9` |
| Access / Permissions | `d5d0feab-72d8-4595-808c-4a5335803acb` |
| Other (default) | `f619d553-90c0-422d-ad41-779b69aed241` |

Infer from the description; ask only if genuinely ambiguous. Never spend a probing
question on it when inferable.

### Workflow state UUIDs (`workflow/state_Feedback/Feedback`) — read-only for this skill

| State | UUID | Type |
|---|---|---|
| New (default) | `5202a9b8-8273-4331-a74f-0bf31c599ac5` | Not started |
| Reviewed | `09228d99-d687-40a2-b54c-be1008006295` | Started |
| Actioned | `1200d0a7-4588-4acc-a461-b020240cde88` | Finished |
| Dismissed | `1691f704-7770-4f79-b405-e0655304dc03` | Finished |

## Identity lookup: `Admin/Team Directory`

The ONLY permitted read into the Admin space. Match on `Admin/Name` with
`q/contains-ignoring-case?`. Confirm with: `Admin/Name`, `Admin/Email`,
`Admin/Role`. Use `fibery/id` for the `Feedback/Submitted By` relation.

If this query fails with a permission error, the pilot Viewer grant is missing —
stop and tell the user to flag it to Andrew.

Example query:

```json
{
  "q/from": "Admin/Team Directory",
  "q/select": {
    "Id": "fibery/id",
    "Name": ["Admin/Name"],
    "Email": ["Admin/Email"],
    "Role": ["Admin/Role"]
  },
  "q/where": ["q/contains-ignoring-case?", ["Admin/Name"], "<typed name>"],
  "q/limit": 10
}
```

## Related Skill

Plain text — record the skill name as the user states it (e.g. `project-intake`).
Do NOT query the Skill Library; the bot has no grant on Knowledge and Resources.

## Dedup query

```json
{
  "q/from": "Feedback/Feedback",
  "q/select": {
    "Id": "fibery/id",
    "Name": ["Feedback/Name"],
    "PublicId": "fibery/public-id",
    "Created": ["fibery/creation-date"]
  },
  "q/order-by": [[["fibery/creation-date"], "q/desc"]],
  "q/limit": 25
}
```

Compare titles yourself; surface overlap, never block.

## Audit ledger: `Projects Management/AI Mutations`

Append-only. Fail-closed: cannot append INTENT → stop, no Feedback write.

Writable fields:

| Field | Content |
|---|---|
| `Projects Management/Name` | `INTENT — feedback-intake: <title>` / `RESULT — created Feedback #<public-id>` |
| `Projects Management/Skill` | `feedback-intake` |
| `Projects Management/Run Id` | the Capture Key |
| `Projects Management/Tool` | `create_entities+set_document_content` |
| `Projects Management/Target DB` | `Feedback/Feedback` |
| `Projects Management/Entity Id` | `pending` (INTENT) / entity uuid (RESULT) |
| `Projects Management/Entity Public Id` | `pending` (INTENT) / public id (RESULT) |
| `Projects Management/Fields Written` | INTENT: planned fields + provenance + quoted approval token. RESULT: actual fields + Step-0 identity + any divergence from plan |

## Entity link format

`https://good-boys-group.fibery.io/Feedback/Feedback/<public-id>`

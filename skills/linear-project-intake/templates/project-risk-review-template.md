# Project Risk Review Template

Pressure-test risks and unknowns before previewing the project. The goal is to
separate *manageable risk* from *blocking uncertainty* — the latter means recommend
a spike, not a project (see `references/project-intake-principles.md` §3, §6, §8).

```markdown
## Risk & unknown review — [project]

### Risks
| Risk | Trigger | Impact (H/M/L) | Likelihood (H/M/L) | Mitigation | Owner/decision |
|------|---------|----------------|--------------------|------------|----------------|
|      |         |                |                    |            |                |

### Technical unknowns
| Unknown | Can a tool/doc resolve it now? | If not → spike? | Blocks which phase? |
|---------|-------------------------------|-----------------|---------------------|
|         | yes/no (what did the tool say) | yes/no          |                     |

### Dependencies
| Dependency | Type (team / project / vendor / data / approval) | Confirmed? | Sequencing constraint |
|------------|--------------------------------------------------|------------|-----------------------|
|            |                                                  |            |                       |

### Verdict
- [ ] Risks are manageable and named → project can proceed (with mitigations).
- [ ] A core unknown is unresolved and unestimable → recommend a SPIKE first; the
      project is premature. State the spike question and what evidence would let us
      proceed.
```

### Honesty rules

- Do not fabricate a mitigation, a confirmed dependency, or a feasibility claim. If
  it isn't confirmed by the user or a tool, it stays an unknown.
- A dependency you couldn't verify (e.g., a vendor capability) is "assumed," not
  "confirmed" — and likely a spike candidate.
- If feasibility of the core idea is the dominant unknown, the correct artifact is
  one spike, not a project full of build issues.

# Working conventions

This repo builds the `teach-me` skill. See README.md for the layout.

## Research
- Write research notes in `research/notes/<area>.md` using `research/notes/_TEMPLATE.md`, and grade every claim with the evidence grades in `research/PLAN.md` (Strong, Moderate, Practitioner, Contested), including boundary conditions.
- Never cite from memory. Verify each source against the primary text or a reputable review, then log it in `research/sources.md` with its link. Leads in PLAN.md are unverified until they appear there.

## Skill
- Every rule in `skills/teach-me/` should trace back to a finding in `research/notes/`. If it doesn't, either find the evidence or label it v0.
- Keep `SKILL.md` under 500 lines; move detail into `references/`.
- Explain the why behind each rule instead of writing MUSTs and ALWAYS. The model follows reasons better than commands, and reasons generalize to cases the rule didn't anticipate.

## Testing
- Testing follows `testing/PLAN.md` (rubric in `testing/rubric.md`, grader in `testing/grader-prompt.md`).
- Results and workspaces are gitignored (`testing/results/`, `skills/teach-me/evals/results/`, `skills/teach-me-workspace/`). Don't commit them.

## Upstream
- Don't edit anything in `upstream/`. It is a verbatim copy of Anthropic's `learn` skill, kept for attribution and as a test baseline.

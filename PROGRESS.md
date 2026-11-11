# Overnight progress log

The overnight run started 2026-11-11. Claude coordinates; agents do the work. Commits are pushed at each milestone.

## Waves

| # | Wave | Model | Status |
|---|---|---|---|
| 0 | Scaffold, plans, fretboard teardown (3 reviewers) | opus | done |
| 1 | Research: A+C, B+D+H, E+I, F+G | sonnet ×4 | running |
| 2 | Synthesis: rewrite SKILL.md + references from notes and teardown; no-slop pass; works on claude.ai | opus | queued |
| 3 | Testing: rebuild the fretboard lesson with the skill and grade it against the original; Driftstones artifact and session, with vs. without the skill; blind harsh grading | mixed | queued |
| 4 | Fix pass from test results; simple README; claude.ai package + Claude Code plugin install | opus | queued |

Token budget: 1 run per condition (not 3) tonight, research capped per agent, cheaper model for research and simulated learners.

## Log
- Wave 0: scaffold committed (408648c). The novice learner walkthrough quit on day 5 and scored 8/12 on its own shallow test (0/6 against the book's own pass criteria for lessons 02–07). See research/baseline/fretboard-teardown/.
- Teardown 01 (instructional design): 39 findings. D8 1/4; fails G2 with 15+ factual errors in the tabs. Root causes: syllabus instead of mastery, tabs written from memory and never checked, the answer key used as the self-check, revised by appending (stale learner-facing text). The "nothing hears the learner" finding was set aside per the user's direction: honor-system checks are inherent for motor skills.
- Teardown 03 (guitar teacher): about 30 factual errors (computed from standard tuning); the sequence keeps a blues-rock learner from blues for about 3 months; months-long pass gates. 12 lessons that generalize, in 03-guitar-teacher.md. Teardown complete, so Wave 0 is done.
- Wave 1 research: A+C, E+I and F+G are done. B+D+H stopped partway on the account's 5-hour usage limit (resets 6:30am ET), with partial notes saved. Weak spots to revisit: several primary PDFs were unreadable, only 3 videos were coded, and the claude.ai description limit conflicts between docs (1024 vs 200 chars).
- New user requirements: the skill can be long (depth goes in references/); artifacts must be visually polished and properly interactive (no slop).
- Wave 2a: SKILL.md rewritten (302 lines), plus deep references: gradual-release, diagnosis-and-feedback, retention, topic-research (new; YouTube and fact verification), five domain guides, annotated transcripts. Copy audit clean. Thin spots marked v0: writing, languages, coaching a physical skill unseen, codebase teaching.

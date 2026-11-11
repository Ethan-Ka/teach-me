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
- Wave 2b: artifact-blueprint.md (36 KB, a pre-ship checklist mapped to the teardown), artifact-craft.md (50 KB, visual and interaction patterns, sketches tested in a browser), two example lessons (SQL joins; guitar low E and A notes computed from tuning, Web Audio, a tempo ladder with a "not yet" path). No-slop audit: 0 fails. Browser check: no console errors at 1280/390/320 px.
- Wave 4a: simple README; Claude Code plugin and marketplace (`claude plugin validate` passes, warnings only); dist/teach-me.zip for upload in the Claude app (plus a `--short` 200-character build).
- Wave 3 (in progress): Driftstones post-test was 7/7 for both conditions, a ceiling effect, so learning gain didn't discriminate. Testing fix queued: a harder invented domain with interacting rules and traps, plus a weaker-memory learner simulator (e.g. retains only what was practiced, not what was read). Comparison tonight rests on blind process grading.
- Wave 3 done: with-skill beat baseline on both cases (fretboard 3.0 vs 1.17; Driftstones 2.83 vs 1.83). See testing/reports/iter-1.md. Iteration 2 fix pass dispatched.
- Iteration 2 fixes: verify prose against computed data (a checks array), discriminating items with a filtered generator, placement that routes, a mastery stop, typed final retrieval in a new context, self-check criteria checked against the domain, a phone-width core task, multiple-choice hygiene, drill validity. Examples updated; zip rebuilt.
- Iteration 2 results (testing/reports/iter-2.md): Brindle with skill 2.83 vs 2.17 on the rubric, but post-test 8/10 vs 10/10 and a G7 fail. Our iteration-2 placement routing let misconception holders (M3, M4) skip the only items that corrected them, through gates they answered correctly; the closing set and a 3-in-a-row streak didn't expose them either. Single run; the grader puts the real gap at about 1 point. Fretboard 3.17 (iter-1: 3.0), G2 fail on hand-written prose only (false box-join reason, sharps in flat keys, a false "all new keys" promise); all computed content was right.
- Iteration 3 fixes: misconceptions listed from the rules (dropped, over-applied, misordered); every path, including the shortest, exposes each one twice, asserted at load; skip gates must fail under every misconception they skip, with placement shown one item at a time; streaks count only once they've covered every misconception; "test me" is 2 to 3 random items; closing set chosen by coverage; feedback reasons, page promises and domain spelling checked; recall drills timed when the shortcut is counting. Both examples updated (guitar: one-at-a-time placement, a routes table with gate and coverage checks, a 3-item random test, a 2-round find test, recall timed to one bar at the goal tempo; SQL: one-at-a-time placement, a 2-variant test, a gate check). Checks pass headless; no overflow at 390 or 320 px. Zip rebuilt.

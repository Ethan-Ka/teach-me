# Iteration 3 results

One fresh Brindle Bridge build with the skill (Sonnet tutor, memory-limited learner). Not rerun without the skill; the baseline number is from iteration 2.

| Brindle post-test | Score |
|---|---|
| Iteration 3, with teach-me | 10/10 |
| Iteration 2, with teach-me | 8/10 |
| Baseline (no skill, iteration 2) | 10/10 |

## The 10/10 is weak evidence
The simulated learner skipped placement and read the page's JavaScript, so the score says little about what the lesson teaches. It shows the toll engine is right, not that the routing works for a learner who holds the misconceptions.

## The probe found M4 uncovered
A headless probe (iter-3-probe.md) ran a holder of each planted misconception through the page's own placement, gates, coverage sets and toll logic, 200 draws each.

- M1 to M3 were confronted at least once in every draw, though thinly (M3: one placement item, then a minimum of 1 per set).
- M4 ("the cap applies only to the crate charge, so salt can push past it") was not. No placement item has the cap binding with salt, so the M4 holder scored 7/7 and placed out of all five parts. Afterwards, the Part 6 test set missed M4 in 14/200 draws, the Part 8 set in 25/200, and both in 1/200: one full run with zero confrontation.
- The cause: the tutor's derived misconception list had "no cap" in place of M4, a near-miss slip with different wrong answers. The page's in-page coverage check passed, on the wrong list. Its M3 entry was also a near-miss ("free pass before salt" rather than "free pass right after crates").

## Fix (untested)
1. The derivation now includes mis-scoping (a rule applied to only part of the total, to the wrong quantity, or at the wrong stage) and boundary confusion, and says near-miss slips are not substitutes: two misconceptions differ if some case gives them different wrong answers. In SKILL.md, artifact-blueprint.md and diagnosis-and-feedback.md.
2. A pre-ship step: each misconception as a variant answer function, run through the page's real routing and random generators over about 200 seeds; the shortest route must confront each at least twice in every seed, no mastery or closing gate may pass while holding one, and the minimum across seeds is what counts. Checklist in artifact-blueprint.md, sketch in artifact-craft.md section 5.8.

Both are Practitioner (one probe) and v0 as rules until a rerun tests them.

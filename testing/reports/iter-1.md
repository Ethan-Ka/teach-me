# Iteration 1 results

Tutors ran on Sonnet, with one run per condition. Grading was blind and harsh, on Opus, using testing/rubric.md. In the grading files, P and Y were built with the skill; Q and X without it.

| Case | With teach-me | Without | Gates |
|---|---|---|---|
| Fretboard lesson (real domain, same request as the bad example) | **3.0** | 1.17 | Both fail G2 on factual slips (with: 3 minor; without: 2 major + 3 minor) |
| Driftstones lesson (invented domain) | **2.83** | 1.83 | Both pass |
| Driftstones post-test (simulated novice) | 7/7 | 7/7 | Ceiling effect: the test doesn't discriminate |

For reference, the original Fretboard Lesson Book scored D8 1/4 with about 30 factual errors.

## What the skill fixed
Placement checks, a prediction hook, worked → faded → solo practice, feedback that explains why, scoped mastery instead of a syllabus, and logic verified by computation. Both scoring engines were exactly correct across 88,572 stacks.

## What still fails (drives iteration 2)
1. Prose describing computed content is not checked against it (the source of every fretboard error).
2. Diagnostic and practice items don't separate the misconception from the correct rule (the opening question rewards the wrong model; 56% of the time a misconception holder clears practice uncontradicted).
3. Placement gives advice but never changes the path; practice doesn't stop when mastery is shown (the learner quit from tedium).
4. Final retrieval is recognition (multiple choice) rather than production in a new context.
5. Self-check criteria not checked against domain truth (the bar-12 root-over-V7 problem).
6. The core task needs sideways scrolling at phone width.
7. The longest multiple-choice option was the right one; there were decorative left borders and text overflow.

## Testing fixes
A harder invented domain with interacting rules, and a weaker-memory learner simulator. Multi-turn chat sessions have not been tested yet.

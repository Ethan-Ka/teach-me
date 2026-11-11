# Iteration 2 results

Tutors ran on Sonnet, with one run per condition. Grading was blind and harsh, on Opus, using testing/rubric.md. In the Brindle grading file, artifact 1 (brindle-1) was built without the skill and artifact 2 (brindle-2) with it. Fretboard was graded on its own against iteration 1.

| Case | With teach-me | Without | Gates |
|---|---|---|---|
| Brindle Bridge lesson (invented domain, memory-limited learner) | 2.83 | 2.17 | **With-skill fails G7** (M3 and M4 still held) |
| Brindle post-test (simulated learner) | **8/10** | **10/10** | |
| Fretboard lesson (vs iteration 1's 3.0) | 3.17 | not rerun | Fails G2 on hand-written prose only |

Grading files: iter-2-grading-brindle.md, iter-2-grading-fretboard.md.

## Brindle: the skill made the lesson better built and the learner worse off
The with-skill page was better on every rubric dimension, and its toll engine was exact on all 324 travelers. The learner still finished holding two planted misconceptions.

The cause was our own iteration-2 fix. "Placement that routes" let a learner skip a section by answering its gate question. But the gate questions for the free-pass and cap sections gave the same answer under the misconceptions (M3, M4) as under the true rule. So the learner who held them skipped exactly the items that would have corrected them. Nothing downstream caught it: the closing set never exposed M3 or M4, and practice that ended on 3 in a row missed both 36% of the time. The page's slip catalog also had no entry for M3.

This was a single run, and part of the item-7 loss came from the simulated learner applying M3 differently from the key. The grader estimates the true gap at about 1 point, not 2. The direction is real: the routing removes the corrective items for exactly the learner who needs them.

## Fretboard: right numbers, wrong prose
Every computed fret, note, interval and rhythm was right, and all 34 built-in checks passed. G2 failed on hand-written text only:
- The feedback for the box-join misconception gave a false reason (box 1 to box 3 skips nothing).
- Flat keys were spelled with sharps (the Bb minor root shown as A#).
- A memory check promised "everything is new keys" but reused drill keys.

Fixed since iteration 1: the bass beats, the bpm mismatch, recognition-only retrieval, placement that didn't route, and sideways scroll at phone width.

Still partly recurring: prose that contradicts content; an untimed root drill that can be solved by counting up from fret 0 (the thing the objective forbids); placement leaks (Q4 shows the answer to Q2, and part 2 can be skipped without a sharp or flat item); "test me" is always Ab, from a single fixed item; the box overlay stays visible on the top jam rung.

## What drives iteration 3
1. Every path through a lesson, including the shortest placement allows, carries at least two items that expose each misconception, listed systematically from the rules and checked in code.
2. A gate can skip a section only if every misconception that section repairs gets it wrong. Placement items appear one at a time.
3. Mastery streaks and closing sets count only when they cover every targeted misconception.
4. Prose, feedback strings and promises about the page are tied to computed data or checked, in the domain's own spelling.
5. Drills block the shortcut the objective forbids, and "test me" draws 2 to 3 random items.

Testing fix: pin each misconception's exact semantics in the persona file, and make simulated learners draw items with the page's own engine.

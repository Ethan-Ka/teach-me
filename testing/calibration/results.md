# Grader calibration results

Set: 6 items in `items/` (4 Brindle Bridge sessions, 2 lesson artifacts), scored against `key.md`. Each item was graded blind by a fresh `claude -p --tools ""` process run from an empty directory, which saw only `grader-prompt.md`, `rubric.md`, `brindle-bridge.md` and that one item (`run_grader.sh`). Comparison by `compare.py`. Raw outputs: `testing/results/calibration/run-1/` and `run-2/` (gitignored).

Pass bar (PLAN.md): every dimension within ±1 of the key and all gates agree. Gate PASS and N/A count as the same where the gate can't fire. Dimensions the key marks N/A (D1/D6 on artifacts, D8 on sessions) are left out of the error. Cells read key/grader; "–" = N/A.

## Run 1: original grader prompt

| Item | Grader verdict | Gates | D1..D8 key/grader | MAE | Mean signed | Calibrated |
|---|---|---|---|---|---|---|
| item-01 | PASS | agree | 3/3.0 4/3.0 3/3.0 3/3.0 4/4.0 3/3.0 4/4.0 –/– | 0.14 | -0.14 | PASS |
| item-02 | FAIL | agree | –/0 1/1 1/1 2/2 1/1 –/1 1/1 2/2 | 0.00 | +0.00 | PASS |
| item-03 | FAIL | agree | 0/0 0/0 0/0 0/1 0/0 1/1 1/1 –/– | 0.14 | +0.14 | PASS |
| item-04 | FAIL | G5(key P/grader F), G7(key F/grader P) | –/0 0/0 0/0 2/2 1/1 –/2 0/0 1/1 | 0.00 | +0.00 | FAIL |
| item-05 | FAIL | agree | 2/3 3/3 3/4 2/1 3/2 3/3 3/3 –/– | 0.57 | +0.00 | PASS |
| item-06 | FAIL | agree | 1/1 0/0 1/0 0/0 0/0 0/0 0/0 –/– | 0.14 | -0.14 | PASS |

Overall: MAE 0.17, mean signed error -0.03 (positive = lenient), 0 of 40 dimension scores off by more than 1. Pass bar NOT MET.

**Result: FAIL, on item-04 only (the beautiful reference page with a shallow quiz).** The dimension scores were tight everywhere (MAE 0.17, no score off by more than 1, mean signed error −0.03). The failures were two gate disagreements, one in each direction:
- **G7, lenient.** The grader passed G7 because rule card 2 states the lantern exception: "The artifact does address M2 in text ... Because it was addressed, the gate passes on its wording." It noted that the learner still held M2 at the end (post-test D2 = 10) and passed the gate anyway. A statement on the page counted as a repair.
- **G5, strict.** The grader failed G5 because the three quiz items are recognition only. The rubric's own D8 anchor 1 ("information plus a quiz bolted on") assumes such artifacts get past the gate and are penalized in the dimension. Failing the gate scores the same weakness twice.

The grader did catch the subtle failures in the other items: G3 on item-02 (it quoted both giveaway hints) and G2 on item-05 (it quoted the "rounds up" error and the confirmation at turn 10).

## Change to `grader-prompt.md`

Two sub-bullets added under Procedure step 2 (Gates):
1. *Judge gates by what happened to the learner, not by what appears in the material.* A misconception counts as addressed only if the learner met a case where it gives a different answer and had to work it or was checked on it. If the end-of-run evidence shows it is still held, G7 fails.
2. *Gates are floors, not quality grades.* G5 passes if the learner has to choose or produce anything at all. Shallowness costs points in D3, D5 and D8. Don't fail a gate for a weakness a dimension already scores.

Why these are general fixes and not patches for item-04: (1) is the rubric's core idea, that telling isn't teaching, applied to the gate where leniency is most tempting. Any rule that appears somewhere in a transcript or artifact would otherwise satisfy "addressed", in a session as much as in an artifact. (2) keeps gates and dimensions doing separate jobs. A gate checks whether something exists, and a dimension grades how well it was done. That keeps the gate decisions stable and leaves the low-quality signal to the scale built for it. Neither bullet names Brindle Bridge, lanterns or any item.

## Run 2: tightened prompt, all six items re-run (to check for regressions)

| Item | Grader verdict | Gates | D1..D8 key/grader | MAE | Mean signed | Calibrated |
|---|---|---|---|---|---|---|
| item-01 | PASS | agree | 3/4 4/4 3/3 3/3 4/4 3/3 4/4 –/– | 0.14 | +0.14 | PASS |
| item-02 | FAIL | agree | –/0 1/1 1/1 2/2 1/1 –/1 1/0 2/2 | 0.17 | -0.17 | PASS |
| item-03 | FAIL | agree | 0/0 0/0 0/0 0/1 0/0 1/1 1/1 –/– | 0.14 | +0.14 | PASS |
| item-04 | FAIL | agree | –/0 0/1 0/0 2/2 1/1 –/2 0/0 1/1 | 0.17 | +0.17 | PASS |
| item-05 | FAIL | agree | 2/3 3/3 3/3 2/1 3/2 3/3 3/3 –/– | 0.43 | -0.14 | PASS |
| item-06 | FAIL | agree | 1/1 0/0 1/0 0/0 0/0 0/0 0/0 –/– | 0.14 | -0.14 | PASS |

Overall: MAE 0.20, mean signed error +0.00 (positive = lenient), 0 of 40 dimension scores off by more than 1. Pass bar MET.

**Result: PASS.** All gates now agree. On item-04 the grader fails G7 for the right reason ("nothing makes the learner meet a case where M2 gives a different answer") and passes G5 as a floor ("meets the floor, though the items are recall-only"). The bullets did not loosen the other items: item-02 still fails G3 and passes G7, because there the learner actually worked the M1-divergent case. item-05 still fails G2.

## Leniency direction

- Run 1: mean signed error −0.03; run 2: +0.00. On dimensions the grader is neither lenient nor harsh overall. Its only real leniency was the G7 gate on item-04, now fixed.
- Item by item: the grader is slightly generous on the good session (item-01, D1 3→4) and slightly harsh on the factual-error session (item-05, D4 2→1, D5 3→2: it marks the tutor down for confirming the wrong rounding). Both are within ±1.
- It scores D1 and D6 on artifacts, which the key marks N/A (e.g. D6 = 2 on item-04). These scores aren't counted. The rubric should say whether D1 and D6 apply to artifacts.

## Caveats

- One grader sample per item per run. LLM variance isn't measured yet. Before trusting the grader on real runs, re-run the set 3 times and require the pass bar each time.
- The key reflects one author's judgment. Item-04's G5 and the D3 score on item-06 (Socratic guessing counts as talk but not as substantive work) are the most contestable calls. A human spot-check of the key (PLAN.md, "Human spot-checks") should come before the set is relied on.
- Everyone involved in this set (key author, grader and the reviewer of the grader) is the same model family. The human spot-checks are the guard against a shared blind spot.

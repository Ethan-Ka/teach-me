# Calibration key

Answer key for the items in `items/`. **Never pass this file (or this directory listing) to the grader.** The grader sees only `testing/grader-prompt.md`, `testing/rubric.md`, `testing/domains/brindle-bridge.md` and one item (`item-NN.md`, plus `item-NN.html` for artifact items). File names are neutral and the order is shuffled so the archetype can't be read off the name.

Every toll in every item was checked against the reference implementation in `brindle-bridge.md` (except where an item deliberately contains a wrong rule, noted below).

**Scoring conventions for comparison**
- Gates: PASS and N/A count as agreement with each other when the gate cannot be triggered by the run type (e.g. G1/G4/G6 on an artifact, G3 when there are no hints). FAIL must match FAIL.
- Dimensions: N/A in the key means the dimension doesn't apply to that run type (D1 and D6 on artifacts, D8 on sessions). If the grader scores an N/A dimension, it is reported but not counted in the error.
- Pass bar (PLAN.md): every scored dimension within ±1 of the key, and all gates agree.

## Map

| Item | Archetype (brief) | Type | Intended verdict |
|---|---|---|---|
| item-01 | (e) genuinely good | session | PASS |
| item-02 | (c) subtly bad: polished, giveaway hints, recognition-only practice | artifact | FAIL (G3) |
| item-03 | (a) obviously bad: demonstrate and narrate | session | FAIL (G1, G4, G7) |
| item-04 | (f) beautiful reference + shallow quiz | artifact | FAIL (G7) |
| item-05 | (d) subtly bad: good process, one uncorrected factual error | session | FAIL (G2) |
| item-06 | (b) obviously bad: Socratic stonewalling | session | FAIL (G7) |

## item-01: genuinely good (e)

Gates: G1 PASS, G2 PASS, G3 PASS, G4 PASS, G5 N/A, G6 N/A, G7 PASS.
- G3: turn 14 ("has the salt been added yet?"), 18 and 22 ("you listed six rules and used five") point to *where* the error is without containing the answer; the learner still had to apply the rule.
- G7: M2 voiced at turn 7, confronted at turn 8 with a discriminating 4-vs-5-crate pair the learner computes (turn 9); post-test D2 correct.

| Dim | Score | Justification |
|---|---|---|
| D1 | 3 | Turn 2 calibrates background and arithmetic; turn 6 probes the half-heard lantern idea and surfaces the exact misconception (M2). Not a 4: no re-diagnosis forced by surprising evidence beyond normal error repair. |
| D2 | 4 | Worked parallel example (t4) → guided pair (t8) → "show me" (t12) → "no help from me" (t20); on each error steps back exactly one level (t14, t18, t22), never re-explains the whole rule. |
| D3 | 3 | Learner does every computation from t5 on (~0.6–0.7 of substantive steps); tutor still states every rule. |
| D4 | 3 | Rules in small chunks, each with a concrete case; the 4-vs-5 crate pair is a non-example targeted at M2. Turn 10 bundles two rules, so not quite minimal-and-targeted. |
| D5 | 4 | Catches an illusion of understanding: "Ok, got it. Guild then salt" (t11) followed by doing it wrong (t13); feedback points to the next action without giving the answer. |
| D6 | 3 | "Can you just tell me if it's right?" (t21) is held with a narrower scaffold (t22); warm and specific. Only one pressure moment, so 4 is defensible. |
| D7 | 4 | Learner retrieves the order unaided and applies it to a fresh case (t21); tutor names what to practise next and when (t24). |
| D8 | N/A | Session. |

Verdict PASS, mean 3.43. Post-test 9/10.

## item-02: subtly bad, polished artifact with giveaway hints (c)

Gates: G1 N/A, G2 PASS, G3 **FAIL**, G4 N/A, G5 PASS, G6 N/A, G7 PASS.
- G3: the hint for practice 3 states "the Miller halves 12 to 6, and then you add the 5-coin salt fee: 6 + 5"; the hint for practice 4 states "the 10 doubles to 20". Both contain the answer, and the walkthrough shows the learner opened both before answering.
- G5 passes: there are inputs and choices, however shallow.
- G7: M1 was confronted (via a case whose hint showed the order) and the post-test D1 item is correct. Weak repair, but addressed.
- G2: every rule statement is correct.

| Dim | Score | Justification |
|---|---|---|
| D1 | N/A | Artifact; no pre-check exists (a 0 would also be reasonable). |
| D2 | 1 | Tell, then practice with no fading; hints collapse every exercise back to "tell". Variation exists but isn't driven by learner state. |
| D3 | 1 | Learner's only decisions are three multiple-choice recognitions, one true/false, and typing numbers read off hints (~0.15–0.3). |
| D4 | 2 | Correct, chunked, with reasons (hands full; fee not load). No non-example or discriminating case, so not 3. |
| D5 | 1 | Feedback is "Correct! Nice work!" / "Not quite, try again!" only. Hollow praise. |
| D6 | N/A | Artifact; no pressure moment possible. |
| D7 | 1 | Ends with a recognition quiz and a tutor-written summary ("You're ready for the bridge!"). No application. |
| D8 | 2 | Sections with interaction interleaved, right/wrong feedback only. Recognition-only checks and giveaway hints keep it from 3. |

Verdict FAIL (G3). Mean of applicable dims 1.33. Post-test 3/10.

## item-03: demonstrate and narrate (a)

Gates: G1 **FAIL**, G2 PASS, G3 PASS (no hints), G4 **FAIL**, G5 N/A, G6 N/A, G7 **FAIL**.
- G1: turn 2 computes the learner's own merchant (7 crates, Weaver, Dusk, lit, salt = 20) in full.
- G4: the learner never computes or decides anything; turn 3 repeats the tutor's answer, turn 7 states a belief.
- G7: M2 voiced at turn 7 ("as long as the lantern is lit you don't get doubled"); turn 8 moves on without addressing it; post-test D2 answered 10.
- G2: every rule the tutor states is correct (it is the learner who states M2).

| Dim | Score | Justification |
|---|---|---|
| D1 | 0 | Launches into all six rules at turn 2 with no question. |
| D2 | 0 | All telling, including three more worked examples (t4, t8). |
| D3 | 0 | Learner-work ratio ≈ 0. |
| D4 | 0 | Turn 2 is a ~350-word wall of text, repeated at turn 6. Correct content doesn't rescue it. |
| D5 | 0 | Only check is "Does that make sense?" (t10). |
| D6 | 1 | The stuck learner (t5) gets a slower re-lecture: not caving or stonewalling, but no foothold. |
| D7 | 1 | Tutor summary plus "Any questions?" (t12). |
| D8 | N/A | Session. |

Verdict FAIL. Mean 0.29. Post-test 0/10.

## item-04: beautiful reference with a shallow quiz (f)

Gates: G1 N/A, G2 PASS, G3 PASS (no hints), G4 N/A, G5 PASS, G6 N/A, G7 **FAIL**.
- G5 passes: the quiz requires choosing, so the letter of G5 is met. The weakness belongs in D8.
- G7: the persona holds M2. The card states the lantern exception once in prose, but nothing confronts the misconception with a case (persona rule: hold it until confronted with a case where it gives the wrong result). The walkthrough shows the learner recording "lantern lit = no doubling" and the post-test D2 answer is 10. Stating a rule is not addressing a misconception.
- G2: every rule statement and the worked example are correct.

| Dim | Score | Justification |
|---|---|---|
| D1 | N/A | Artifact; no activation or pre-check (0 would also be reasonable). |
| D2 | 0 | Entirely telling; the learner is never guided or handed a problem. |
| D3 | 0 | Three recognition clicks are the learner's only decisions. |
| D4 | 2 | Correct and gives the why (hands full, fee not load), with one worked example; but padded with decorative lore that serves no objective. |
| D5 | 1 | Right/wrong only ("✓ Correct"), on recall-of-a-number questions. |
| D6 | N/A | Artifact. |
| D7 | 0 | Ends with a decorative sign-off; no retrieval or application. A 1 is defensible because the recognition quiz sits near the end. |
| D8 | 1 | Textbook "information plus a quiz bolted on at the end". |

Verdict FAIL (G7). Mean of applicable dims 0.67. Post-test 2/10.

## item-05: good process, one uncorrected factual error (d)

Gates: G1 PASS, G2 **FAIL**, G3 PASS, G4 PASS, G5 N/A, G6 N/A, G7 PASS.
- G2: turn 8 says Millers' odd totals "round up"; the rule is round down. The learner applies it at turn 9 (15 → 8; true 7) and turn 13 (17 → 9), the tutor confirms "Correct" (t10), and it is never corrected. Post-test N3 answered 8.
- G3: turn 18 ("which rule could still change 20?") asks the learner to check; no answer in it.
- G7: M1 voiced at turn 11, confronted at turns 12–14 with a Miller case worked both ways.

| Dim | Score | Justification |
|---|---|---|
| D1 | 2 | One calibrating question (t2), answer used. No probing of specific confusion. |
| D2 | 3 | Example → guided → "without help" (t14) → on their own (t16, t20). Clear progression; no visible step back on error because the only errors were the tutor's. |
| D3 | 3 | Learner does all computations (~0.6). |
| D4 | 2 | Well chunked with a strong discriminating case for M1 (t12), but one rule is taught wrong, so it can't be above 2. |
| D5 | 3 | Real tasks; t18 turns a confirmation request into a check. Confirms a wrong answer as "Correct" at t10, so not 4. |
| D6 | 3 | "Can you just confirm" (t17) answered with a narrower question (t18). |
| D7 | 3 | Retrieval of the order unaided plus a fresh case (t20–21); no "what to practise next". |
| D8 | N/A | Session. |

Verdict FAIL (G2). Mean 2.71. Post-test 8/10.

## item-06: Socratic stonewalling (b)

Gates: G1 PASS, G2 PASS, G3 PASS, G4 PASS, G5 N/A, G6 N/A, G7 **FAIL**.
- G4 passes: the learner makes an attempt at turn 7 ("1 coin per crate, so 5 crates pays 5"). Uninformed, but an attempt.
- G7: M3 voiced at turn 9 ("maybe small loads go free?") and restated at turn 15; the tutor never addresses it.
- G2: the tutor states no domain facts at all, so nothing false.

| Dim | Score | Justification |
|---|---|---|
| D1 | 1 | Asks (t2), learner says they know nothing (t3), and the tutor ignores that and keeps asking them to derive rules they can't know. |
| D2 | 0 | All asking, never tells. |
| D3 | 1 | The learner produces all the talk, but none of it is substantive domain work: guesses with nothing to reason from, and visible floundering. |
| D4 | 0 | No explanation is ever given. |
| D5 | 0 | "Interesting!", "Good instinct": no information about correctness. |
| D6 | 0 | Stonewalls a genuinely stuck learner (t7, t11, t13). |
| D7 | 0 | Learner leaves saying they don't know how the tolls work; tutor praises that. |
| D8 | N/A | Session. |

Verdict FAIL. Mean 0.29. Post-test 0/10.

# Blind grading: Brindle Bridge artifacts (iter-2)

Grader inputs only: `testing/domains/brindle-bridge.md`, `testing/personas/novice-limited-memory.md`, and `brindle-*` files in this folder. I don't know how either artifact was produced. Rubric: `testing/rubric.md`, adapted for artifacts (gates G2, G5, G7; dimensions D1, D2, D4, D5, D7, D8).

## 1. Scores

| | Artifact 1 | Artifact 2 |
|---|---|---|
| G2 false domain statement | PASS | PASS |
| G5 has produce/decide activities | PASS | PASS |
| G7 misconception still held and never addressed | PASS | **FAIL** (M3, M4 still held; the routed path never confronted either) |
| D1 Diagnosis | 1 | 2 |
| D2 Tell/guide/do handoff | 2 | 3 |
| D4 Explanation quality | 3 | 3 |
| D5 Checking and feedback | 2 | 3 |
| D7 Retention and closure | 3 | 3 |
| D8 Artifact design | 2 | 3 |
| Dimension mean | 2.17 | 2.83 |
| Verdict | PASS | **FAIL** (G7) |
| Post-test (key from `posttest.py`) | **10 / 10** | **8 / 10** |

On the rubric dimensions, artifact 2 is the better-built lesson. On the outcome, it is worse. The cause is one design decision, its placement routing, described in section 4. The rubric dimensions don't catch it, and G7 does.

## 2. Post-test scoring

Key: 6, 17, 7, 18, 11, 20, 8, (8: lantern exception + doubling), 20 with rules named, (10: 4 crates, Dawn, Weaver/Miller).

| Item | Key | L1 answer | L1 | L2 answer | L2 |
|---|---|---|---|---|---|
| 1 N | 6 | 6 | 1 | 6 | 1 |
| 2 N | 17 | 17 | 1 | 17 | 1 |
| 3 N | 7 | 7 | 1 | 7 | 1 |
| 4 N | 18 | 18 | 1 | 18 | 1 |
| 5 M1 | 11 | 11, salt after guild | 1 | 11, salt after guild | 1 |
| 6 M2 | 20 | 20, lantern doesn't count at 5 | 1 | 20, same | 1 |
| 7 M3 | 8 | 8, doubled, then the free pass is checked on 8 | 1 | **0**, "Crates 2x2 = 4. That is 4 or less, so it is a free pass" | **0** |
| 8 explain | 0 vs 10 | lantern stops counting, doubling, free pass lost | 1 | same reasoning | 1 |
| 9 predict | 20 | 21 → 42 → 38 → 43 → cap 20, rules named | 1 | **25**, "The cap of 20 limits that crates/load amount, so 20. Then salt +5 = 25" | **0** |
| 10 design | 4/Dawn/guild | 4, Miller, Dawn, salt; explains Dawn | 1 | 4, Weaver, Dawn, salt; explains Dawn | 1 |
| **Total** | | | **10** | | **8** |

No half credit applies: every right number came from a correctly stated rule. Both learners missed one part of item 10: neither said why "no guild" fails (8 stays 8). A stricter reading gives each 0.5 on item 10 (9.5 vs 7.5), which doesn't change the gap. The preliminary check (about 10 vs about 8, missing items 7 and 9) is confirmed.

L2's wrong answers are exactly the M3 and M4 predictions in `posttest.py` (D3: M3=0; F2: M4=25). These are planted misconceptions that survived, not forgetting.

## 3. Engine verification (all 324 travelers)

I pulled each page's toll function out of the HTML and ran it in node against a Python port of `toll.py` over the full 9x3x3x2x2 grid.

- Artifact 1 `calc()`: **0 mismatches / 324.**
- Artifact 2 `run()`: **0 mismatches / 324.** Its load-time self-checks also pass (the `#banner` stays hidden in headless Chrome).
- Artifact 2's named-slip variants compared with the domain's misconception models:
  - `saltInLoad` = M1 (0 disagreements)
  - `lanternAny` = M2 (0)
  - `capBeforeSalt` = M4 (0)
  - **No variant matches M3.** The closest, `freeFirst` ("free pass before salt"), disagrees with M3 on 37 travelers. Artifact 2's catalog has no "free pass checked right after crates" slip. On post-test item 7 (2 crates, Dusk), no catalog slip produces 0, so an M3 answer would get the generic "does not match a slip I know".

## 4. Causal analysis of the post-test gap

### 4.1 Which items on each page discriminate M3 and M4

I computed this for every fixed item against `toll.py`. "Exposes" means the misconception's model gives a different toll from the true rules.

**Artifact 2 fixed items:**

| Item | Traveler | Exposes | On L2's path? |
|---|---|---|---|
| P1 | 8, none, Day, unlit, no salt | none | yes |
| P2 | 5, none, Dusk, lit, no salt | M2 | yes (corrected M2) |
| P3 | 9, Miller, Day, unlit, salt | M1 | yes (corrected M1) |
| **P4 (gates Part 2D, "Free pass and cap")** | 3, Weaver, Day, unlit, salt | **none**; options are 7, 5, Not sure | yes, answered right, so 2D was folded |
| **P5 (gates Part 3, "Why the order matters")** | 7, Miller, Dusk, lit, salt | M1, M2 only; the true toll lands on **exactly 20**, so the cap never fires | yes, answered right, so Part 3 was folded |
| B1–B3 | | M2 / none / none | yes |
| C1 | | M1 | yes |
| C2 | 2, Weaver, Dawn, salt | none | yes |
| **C3** | 1, Weaver, Day, unlit, salt | **M3** under `posttest.py` semantics (M3=0, true 5) | yes; L2 read it as not exposing (see 4.3) |
| D1, D2 | | none | **folded** |
| **D3** | 9, none, Day, salt | **M4** (25 vs 20) | **folded** |
| hook, fE1 | | none | **folded** |
| **fE2** | 2, Weaver, Dusk, unlit, salt | **M3** (0 vs 9) | **folded** |
| Challenge #3 | 5, Weaver, Dusk, lit, salt | M2, M4 | optional button; not used |
| Thursday set | | M1 only | "for later days"; not done |

**Generated pools:**
- **Artifact 2 Part 4 practice.** The bag holds 14 slips, and 3 right in a row ends the part. Monte Carlo over the page's own generator (200k runs): P(any draw exposes M4) = **0.33**, P(M3) = 0.42, P(neither) = **0.36**. L2's draws, made by running the engine in node, were tierFlat (9, none, **Dawn**, salt: over 20, but salt is waived, so M4 is silent), lanternAny, and guildFirst. None exposed M3 or M4.
- **Artifact 2 Part 5 closing set.** The pool is the "rich" travelers where 4 or more catalog slips differ. **0 of 58 expose M3, and 0 of 58 expose M4.** Its closing check can never catch either misconception, but it still told L2 "That clears the good-enough bar and the mastery bar."
- **Artifact 1 final test.** It has 8 items: 4 from a random trap category, 4 uniform. P(exposes M4) = 0.70, P(M3) = 0.43.
- **Artifact 1 all-six drill.** One uniform traveler exposes M4 9.5% of the time.
- **Artifact 1 trap categories.** "cap" exposes M4 27% of the time and "lantern" 40%; "free" exposes M3 17%. Nothing exposes M3 with certainty.

### 4.2 The causal chain for learner 2

1. **The placement items don't test the content they gate.** P4 is the only gate for Part 2D, yet M3 and M4 give the same answer as the true rules on it (7 = 7 = 7). P4 checks only the page's own `freeFirst` slip. P5 gates Part 3 but lands on exactly 20, so a learner who thinks the cap stops before salt still gets it right. So any learner holding M3 and M4, once P2 and P3 have corrected M1 and M2, deterministically places out of both parts that contain the only fixed M3/M4 items (D3, fE2). This doesn't depend on chance. Both P4 and P5 are also multiple choice with 1–3 distractors, so a pure guess places out of D 50% of the time.
2. **The route said the learner had the content.** "You placed out of this part: you got its placement traveler right." L2 reasonably didn't click "Do it anyway": "a learner who just got three right has no reason to." The walkthrough notes: "Part 2D (free pass and cap, the only place M3 and M4 have dedicated items) and Part 3 (order, ledger) were never seen."
3. **Nothing downstream closed the hole.** Practice is a 3-item random bag with a 36% chance of exposing neither misconception. The closing set has 0% for both. L2's log: "none of these three travelers had 1 or 2 crates, or a salt-pushed total over 20, so M3 and M4 were not exposed."
4. **The retention rule is not what failed.** L2 applied the cap twice ("cap applied 2+ (a real cap in practice 1: 21 became 20)") and the free pass "many times". Both counts pass the persona's 2× threshold. Those applications were *non-discriminating*: 21 at Dawn with salt waived, and totals far above 4. So the learner "learned" the rule along with the misconception. The persona holds a misconception "until the tutor directly confronts it with a case where it gives the wrong result", and no such case was on the path. **Length and placement skipping caused the failure through confrontation, not repetition.** The rules were practised. The misconception-breaking cases were folded away.
5. **The diagnostic layer was blind to M3.** With no M3 slip in the catalog, even a confrontation would have produced generic or wrong feedback. On C3, an M3 answer of 0 is labelled by the page as "a Weaver's cut can go below 0" or "salt is added before the guild step". Both diagnoses are wrong.

So yes, **artifact 2 failed to confront M3 and M4 with discriminating items on the path it routed this learner down**. The items existed (D3, fE2) but sat behind a gate that the misconceptions pass.

### 4.3 Simulator caveat (partly noise)

C3 (1 crate, Weaver, Day, salt) does discriminate M3 under `posttest.py`, where M3 returns 0 immediately. L2 instead applied M3 as "free pass after rule 1, then keep going": 2 → 0 → Weaver 0 → +5 = 5. It wrote "M3 held and not exposed", which is wrong under the key's semantics. Then on post-test item 7 it "stopped there" at 0. L1 used the key's semantics in its sandbox: 1 crate, salt, predicted 0. The two simulated learners operationalised M3 differently. Under the key's semantics, C3 would have produced a miss and a correction, and L2 would likely have got item 7 right, for 9/10. **So the item-7 loss is about half artifact and half simulator.** The item-9 (M4) loss is fully the artifact's: no discriminating item was on the path under either semantics.

### 4.4 Did artifact 1 deliberately drill M3 and M4?

**Not reliably. It got there partly by luck and partly through the learner's own initiative.**
- **M3** was confronted in the **learner's own sandbox experiment** on tab 3 ("Tried one more: 1 crate, none, Day, unlit, salt yes. Predicted 0"). The page suggests only the 4→5 crate lantern flip. Tab 1's last point ("A small load that would be 0 can end up charged if salt (+5) pushes it above 4") plausibly prompted the test, so the page earns some credit. But no required item forces an M3 confrontation, and the final test exposes M3 only 43% of the time.
- **M4** was confronted by **one random draw** in the all-six drill (Traveler C: 8, none, Dusk, lit, salt; answered 25). One uniform traveler does this 9.5% of the time. The page never states that the cap covers salt, except the trap tip "Cap is applied last, after everything", and the drill's feedback is generic ("Not 25. Re-read the rule..."). The real reason appeared only behind "Show me the answer".
- **Asymmetric method.** L1's log says "I simulated one plausible draw for each". Its drill, trap and test draws were *chosen by the simulator*, not generated by the engine. L2's draws were "generated by running the page's own engine". Traveler C is a suspiciously ideal M4 case. Under engine-random draws, my estimate is that artifact 1 confronts M4 before the post-test about 75–80% of the time (mostly through the final test plus its miss traces) and M3 about 45–60% (final test plus whether the learner tries the sandbox case).

### 4.5 Verdict on "is it noise?"

- **The gap's direction is real and structural.** Artifact 2's routing **deterministically** removes the M3/M4 items for exactly the learner who holds M3/M4. Its practice leaves M4 unconfronted about 67% of the time and its closing check 100%. Artifact 1 has no gate that hides content, and its final test reaches M4 about 70% of the time.
- **The size of the gap is inflated by noise.** Item 7 is partly the simulator's inconsistent M3 semantics on C3. L1's perfect score depended on a hand-picked drill draw and a self-initiated sandbox case.
- My expected difference over many runs is roughly 1 point (mostly item 9), not 2. **Neither artifact guarantees that every misconception is confronted on every path.** Artifact 2 is the one that actively routes around them.

## 5. Interaction classification (think vs. decoration)

**Artifact 1**

| Interaction | Class | Note |
|---|---|---|
| Tab nav | navigation | free jumping; nothing is sequenced or gated |
| Worked example "Reveal station N" | weak think | "say the number out loud" is unenforced, so it's a click-through |
| Predict & check sandbox | think, with a leak | clicking Check with an empty prediction shows the full trace and toll; the answer is available without committing |
| Step-by-step drill (typed per station) | think | rule text on screen at every station (a scaffold that never fades within the drill); "Show me the answer" escape |
| Drill level select (1-2 / 1-3 / all six) | control | the learner fades manually; the default stops at 3 stations, so free pass and cap are not drilled by default |
| Trap drills (typed final toll) | think | good targeting by interaction; categories are learner-chosen; Skip available |
| Final test (8 typed, no hints) | think | real unscaffolded retrieval; traces only for misses |
| Cheat card | reference | |

**Artifact 2**

| Interaction | Class | Note |
|---|---|---|
| Placement (5 MC) | think, but guessable | P2 and P4 are effectively 2-choice; P4 and P5 don't discriminate what they gate (section 4) |
| "Do it anyway" / Retake placement | control | |
| Worked examples per chunk | read | appropriately short, with "a different traveler from the ones you will do" |
| Chunk typed toll questions | think | named-slip feedback; "Show the working" is counted as a miss and offers "Try a similar one" |
| Part 3 hook (predict higher/lower/same) | think | |
| Faded ledger (3 blanks, then 6 blanks) | think | the best fading element in either page; folded for L2 |
| Practice (3 in a row, re-queue on slip) | think | adaptive, but too short and blind to M3 |
| "I've got this, test me" challenge | think | contains an M4 discriminator (#3); optional |
| Closing order textarea | think | keyword matcher; passed L2 while M3 was still held. The page admits "This matches keywords only" |
| Closing set of 4 | think | pool structurally excludes M3/M4 cases (0/58) |
| Thursday cold set, slips tally | think (deferred) | spacing plan |
| Booth tool | think | requires the learner's own answer first |
| Theme toggle, progress rail | decoration / navigation | |

## 6. Gate and dimension evidence

### Artifact 1
- **G2 PASS.** Every rule and claim checks out, including "Salt always makes the total at least 5, so a salt-payer (outside Dawn) never gets the free pass" (true, since guild ≥ 0). The engine matches on 324/324.
- **G5 PASS.** Typed drills, trap drills and the final test.
- **G7 PASS.** All four misconceptions were confronted with cases (see the walkthrough's misconception audit). M4 was confronted only by chance.
- **D1 = 1.** No diagnostic. It opens with exposition ("The big idea: a running total on an assembly line"). It pre-targets three known interactions but never finds out what *this* learner believes. The only evidence-based routing is the end-of-test line "use the Trap drills on those areas".
- **D2 = 2.** Clear tell → worked → sandbox → stepwise → final-only → test progression. Every shift is learner-chosen through tabs and selects, not triggered by evidence. The drill keeps the rule text on screen the whole time.
- **D4 = 3.** Rules are compact. The "Three interactions to burn in" card gives mechanisms ("their hands are full", "a fee, so rule 3 never touches it", "Salt always makes the total at least 5"). The station traces explain why at every step. The cap's scope over salt is never explained (gap for M4).
- **D5 = 2.** Feedback is a verdict plus a full trace ("Read the trace to see where yours diverged"). The drill's miss message is generic: "Not 25. Re-read the rule and the total you started this station with (41)". It never names the slip.
- **D7 = 3.** An 8-item unscaffolded final test on fresh travelers. No free recall of the rules and no schedule; the next step is only "Retake".
- **D8 = 2.** One worked example for the whole domain, then exercises. No per-chunk structure, no far transfer (nothing asks why or asks for a designed case), and random generators that leave misconception coverage to chance.

### Artifact 2
- **G2 PASS.** The rule text, the named-slip explanations and the hard-coded hook prose ("6, doubled to 12, then 4 off is 8") are all correct and checked at load. The engine matches on 324/324. Two minor non-domain overclaims: "You placed out of this part: you got its placement traveler right" implies mastery that P4 can't measure, and "clears ... the mastery bar" comes from a set that can't detect M3/M4.
- **G5 PASS.**
- **G7 FAIL.** L2's final ledger: "Still-held misconceptions: M3, M4." The page's discriminating items for both (D3, fE2) were folded by the route, and neither practice nor the closing set reached them.
- **D1 = 2.** It has a real placement step with slip-coded distractors, and the feedback names the slip ("10 is what you get if you think 'a lit lantern always counts at Dusk'"). It found M1 and M2. It can't score higher because two of the five placement items are invalid for the chunks they gate, and the slip catalog lacks M3. The diagnosis drove the failure.
- **D2 = 3.** Worked example → typed items per chunk → faded ledger (3 lines given, then 0) → final-only practice → closing with no feedback. Placement skips parts and practice re-queues on a slip, so the shifts are evidence-driven. Not 4, because the skip logic was wrong.
- **D4 = 3.** Short per-rule chunks, each with a worked example on a different traveler. The order hook contrasts the right order with a wrong one. The 2D text names the needed facts ("The free pass looks at the toll so far, salt included"; "The cap is last of all"), but this learner never saw it.
- **D5 = 3.** Feedback names the wrong number and the belief behind it, then explains why. The ledger points to the "First wrong line". Not 4: the closing order check accepted a learner who still held M3 (a missed illusion of understanding), and M3 answers have no named slip.
- **D7 = 3.** Free recall of the rule order, 4 fresh no-feedback travelers, a "Thursday, cold" spaced set and a slip tally. On the descriptors that is a 4. Held to 3 because the closing pool cannot surface M3/M4 (0/58), so the closure certified "mastery" in a learner holding two misconceptions.
- **D8 = 3.** Objectives → placement → chunks (worked example + exercises + feedback explaining why) → order synthesis → practice → retrieval → spacing. No far transfer (nothing asks "explain why" or "design a case", the formats of post-test items 8–10). The gating is broken.

## 7. Layout and design audit

- **Screenshots** (headless Chrome, 1280 and 400 px; 400 px rendered through a 400 px iframe because headless Chrome won't size a window that narrow), in `/private/tmp/claude-501/-Users-ethankawley-Documents-GitHub-teach-me/75ad0586-a539-4b3d-b9c7-6481b06a5d1b/scratchpad/shots/`:
  - Both pages reflow cleanly at 400 px with no horizontal scroll.
  - Artifact 2 at 400 px puts the 10-link progress rail, the theme toggle and a storage note (about 270 px) above the title.
  - Both render dark by default under the system preference. Artifact 1 has no manual theme toggle and no `data-theme` handling.
- **`audit.py`:** 5 WARN on each page, 0 FAIL.
  - Artifact 1: cyan accent (`#2f5d62`, `#7fc4c9`), amber line and highlight colors, and a colored left border on `.fb` feedback cards.
  - Artifact 2: cyan accent (`#1b5b73`, `#86c4da`) and a left border on the active rail item (a nav indicator, not really a card).
  - These are cosmetic and unrelated to learning.

## 8. Critique (most important first)

**Artifact 2**
1. **Placement gates must use items the gated misconceptions get wrong.** For example, replace P4 with 2, none, Dusk, unlit, salt (true 13, M3 gives 0) or with fE2. Make P5 or a P6 a salt-over-20 case such as D3. Use typed answers, not 2-option MC, for anything that can skip content.
2. **Add M3 ("free pass checked on the crate charge") to the slip catalog.** Derive the catalog systematically: every rule moved to every other position, plus every boundary.
3. **Pick the closing set by coverage, not by "≥4 slips differ".** Every known misconception should appear at least once. Also, don't end practice at 3-in-a-row until each unconfronted misconception has had a discriminating draw.

**Artifact 1**
1. **Add fixed, mandatory discriminating items for each interaction** (M3: 2, none, Dusk, unlit; M4: 9, Weaver, Dusk, lit, salt) to the drill and the final test instead of uniform random draws.
2. **Make drill feedback name the misconception** ("25 is what you get if the cap stops before salt") instead of "Re-read the rule".
3. **Add a diagnostic up front and a far-transfer item** (explain why 4 → 5 crates costs 10; design a 0-toll salt traveler). Also stop the sandbox from showing the toll when no prediction was typed.

## 9. What a lesson-building instruction set should change to prevent this

1. **A coverage invariant, checked mechanically.** For every misconception the builder names (and every "rule moved to another position" variant), every possible path through the artifact, including the shortest one placement allows, must contain at least **two discriminating items**: one confrontation with feedback that names the belief, and one later application. Both must be ones the learner actually answers. The builder should list the paths and assert this at load, the way artifact 2 already asserts engine facts.
2. **Skip logic has to be validated against the misconceptions.** Any item that lets a learner skip content must be one that every misconception covered by that content gets wrong. If a misconception passes the gate, the gate is invalid. Avoid gate items whose answer lands on a boundary (exactly 20, exactly 4), since boundaries mask rules. Don't let MC with fewer than 4 options skip anything.
3. **Build the slip catalog systematically, not from intuition.** Start from the rule structure: each rule applied at every other position, each threshold off by one, each exception dropped. Then check each named misconception against the catalog over the full input space (here, 324 travelers), and flag any misconception with no exact match.
4. **Final and closing checks must be stratified by misconception, not by "hardness".** A pool chosen as "many slips differ" quietly excluded every cap and free-pass case. Assert that the closing set covers every misconception. Don't print "mastery" unless it does.
5. **Random practice is not coverage.** Random generators are fine for volume, but each must sit on top of a fixed set of must-hit cases. A short streak rule (3 in a row) shouldn't end practice while any misconception is still unconfronted on this learner's record.
6. **Feedback names the belief.** Every miss should map the wrong number to the belief that produces it and say why that belief is wrong. Generic "re-read the rule" lets a learner fix the number without updating the belief.
7. **Include the transfer formats that will be assessed.** Add "explain why" and "design a case" items, not just compute-the-toll.
8. **Fix the test harness too.** Simulated learners must draw random items with the page's engine (L1 hand-picked its draws). The persona file should pin the exact semantics of each misconception (for example, M3 returns 0 immediately) so that two simulators don't apply it differently.

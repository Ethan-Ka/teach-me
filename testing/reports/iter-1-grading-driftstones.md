# Blind grading: Driftstones artifacts X and Y

Grader stance: harsh, blind. Every dimension starts at 2, and any other score needs evidence. Inputs: `drift-{X,Y}.html`, `-reply.md`, `-walkthrough.md`, `-posttest.md`, the rubric, the grader prompt and the domain file.

**Blindness caveat.** `drift-X-reply.md` lists output paths that include a directory name hinting at how X was produced. I saw it and did not use it. Every score below rests on page behaviour, engine checks and the walkthroughs.

**Ceiling caveat.** Both learners scored 7/7. X's fixed practice stack #2 (blue, red, red, blue) is *identical* to post-test item 3 (the M1 item), and its stack #4 is very close to post-test item 4, so X's post-test is partly rehearsed. The post-test does not separate X from Y. The weight below goes on process and design.

---

## Gates

| Gate | X | Y |
|---|---|---|
| G2: false domain statement left uncorrected | **PASS.** The engine matches the rules on all 88,572 stacks of 1–10 stones. The "floor never bites" box is true (proof given; min raw score = 0). | **PASS.** The engine matches on all 88,572 stacks. The appendix floor note is true (exhaustive check). The Part 8 feedback "counting the dropped blue ... gave 17 instead of 18" is correct. One unsupported claim about learners, not the domain: "Most people get this one wrong" (Part 1). |
| G5: no produce/decide activities | **PASS.** Typed practice stacks and a round total. | **PASS.** MC practice, typed fading trainer, round, build-to-target, typed retrieval. |
| G7: planted M1 still held at end | **PASS.** Walkthrough final state: "I believe each run doubles only its own stones". Post-test #3 = 14 with a per-run explanation. | **PASS.** Walkthrough: "only the stones in the run get doubled" (Part 3). Post-test #3 = 14, and #7 adds that a grey "can also break up a run". |

Neither run fails a gate.

---

## Scores

| Dim | X | Y |
|---|---|---|
| D1 Diagnosis | **1** | **2** |
| D2 Show → guide → do | **2** | **3** |
| D4 Explanation quality | **2** | **3** |
| D5 Checking & feedback | **2** | **3** |
| D7 Retention & closure | **2** | **3** |
| D8 Artifact design | **2** | **3** |
| **Mean** | **1.83** | **2.83** |

### Evidence

**D1.**
- **X = 1.** There is no pre-assessment. The only early question ("Check yourself", red, red, blue: buttons 11/7/8) comes *after* the rules are given. Every button returns the same explanation and the result changes nothing. The M1 answer (14) is not even offered: the walkthrough says "the 14 I wanted was not offered, so the misconception was only mildly poked".
- **Y = 2.** Part 0 asks three placement questions (top stone, counting runs, which stones drift) and returns a route message. The route is advice only: every part still has to be passed. None of the three probes M1. The cold-try hook was the natural place to diagnose M1, but its stack (B,R,R,B,B,G) scores 18 under both the correct rule and the whole-stack-doubling rule, so it cannot detect M1. The walkthrough confirms this: "I felt validated ... The misconception was NOT confronted here." Y is held above 1 because the Part 6 trainer re-levels on evidence (it moves up after 2 right and down after 2 misses).

**D2.**
- **X = 2.** The sequence is rules → one step-through example → free builder → practice → round. "Show steps" is available *before* any attempt in practice, and support never fades: stack 7 gets the same help as stack 1.
- **Y = 3.** Each rule gets its own worked example and checked practice (Parts 2–5). The Part 6 trainer then blanks 1, 2, 3, 4 and then all 5 steps, then hides the steps entirely, and drops back a level after 2 misses. The walkthrough shows that drop working: "missed twice in a row ... Back to level 3. 'That is normal.'" It is not a 4 because the placement route never actually lets a strong learner skip anything. The fade is also long enough that the simulated learner quit at level 4 ("the level-5 and level-6 typed items got tedious").

**D4.**
- **X = 2.** The rules are correct and concise, and the one worked example is the rulebook's own. There is no non-example for runs (for example a broken run, or a lone stone next to a run). The "why" behind the order is one sentence in a callout.
- **Y = 3.** It is chunked one rule per part, with an example each. It uses explicit non-examples:
  - "A lone stone is not a run"
  - "A grey in the middle does nothing"
  - "a run of three is doubled once, not once per pair"
  - the trap stacks in Part 4

  Each step carries an auto-generated "why" ("3 blue in a row: 9 doubles to 18. Lone stones keep their value"). It is not a 4 because nothing is aimed at a diagnosed gap. The Part 3 worked example (R,R,B,R → 13, where M1 would give 18) has a real contrast built in, but the page never points it out.

**D5.**
- **X = 2.** Practice has mistake models (`noDrift`, `noRuns`, `noCap`, `capAllBlues`, `base`) with useful messages, and the walkthrough found "forgot cap" and "forgot drift" helpful. But X has **no model for the planted misconception**: an M1 answer of 20 on stack 2 got "Go through D-B-R-C one step at a time". On 3 of the 7 fixed stacks the M1 answer *equals* the correct answer (the script confirms this for stacks 4, 5 and 6), so those stacks cannot catch it at all. Round feedback is the numbers only.
- **Y = 3.** Every MC distractor is tied to a named mistake. M1 is named outright: "You doubled every stone. Only stones inside a run are doubled." A miss produces a *fresh* stack, so the learner cannot just retry the same item. The trainer gives feedback per blank step, and the round names the wrong tile with its full trace. It is not a 4 because Y actively *creates* one illusion of understanding: the hook marks the M1 learner "Right." It also has the generator flaw described under Accuracy below. The typed retrieval feedback is generic ("You wrote N. The steps give M").

**D7.**
- **X = 2.** The last activity is a random round (one application), followed by a tutor-written cheat sheet. There is no unaided retrieval and no plan for what comes next.
- **Y = 3.** Part 8 asks for typed scores on fresh generated stacks "without looking", then shows a return plan with a date (1 day after a miss, 3 days if all right, then 6 and 12) and a "review due" banner when the learner reloads. Structurally that is a 4. It is held to 3 because the only conceptual retrieval item (the "why drift before capstone" MC) can be answered by picking the longest option, which is what the learner did: "it was the longest option".

**D8.**
- **X = 2.** It has some interaction, and the practice feedback explains. But there are no objectives beyond one goal line, no activation, the rules come in one chunk rather than one per rule, there is no fading and no end retrieval, and the builder has no task (decorative; see the interaction table).
- **Y = 3.** It has outcomes → placement and cold try → one chunk per rule (example + exercise + explained feedback) → fading → far transfer (build a stack to hit a target, a why-question) → spaced retrieval. That is close to the full 4 checklist. It loses the 4 because its most important exercise often fails to test its objective (generator defect below), the hook backfires on M1, and there is padding: a 45-minute lesson for a four-rule scoring system.

---

## Accuracy findings

I extracted each page's scoring function and ran it in Node against an independent reference implementation (`verify.js` in my scratchpad).

- **Exhaustive check:** all 88,572 stacks of 1–10 stones give **0 mismatches for X and 0 for Y**.
- **Post-test and worked example:** both are correct on RBB=14, RRG=8, BRRB=14, BBRRRB=18, BGBG=4, RRR=12, RRB=11 and BBRG=12.
- **Edge cases:** both are correct on:
  - drift of 8 with greys below (GGGGGGBB=12)
  - a 7-stone blue run with a cap (BBBBBBG=20)
  - a run of 3 (RRRG=12)
  - a grey run (GGR=2)
  - a long run cut by drift (BRRRRRRG=16)
  - a capped stack with no blues (BBGGRRG=8: the drifted blues are not charged)
- **Floor:** the minimum score before the floor across every stack up to 10 stones is 0. Both pages say the floor never bites, which is correct, and both give a valid reason.

**Ambiguities in the rules, and how each page handled them.** Both made the same reading on every point, and it agrees with the answer key.

| Ambiguity | X | Y |
|---|---|---|
| Is a run of 3+ doubled once, or once per pair? | Once. Flagged in the reply and the cheat sheet ("I read 'double' as one doubling per run"). This hedge made the learner doubt the page: "made me unsure about the page's own confidence". | Once. Flagged in the appendix and reply. Taught explicitly, with a `perPair` distractor. |
| Is a run the whole touching group, or overlapping pairs? | Implicit (whole group). Not flagged. | Flagged in the appendix. |
| Are drifted-off blues charged at the capstone? | Stated as fact in the Order box. Has a `capAllBlues` diagnosis. Not flagged as an interpretation. | Flagged. Has a `blueAll` distractor and a hook distractor. |
| Rules are numbered 1–4, but the order of use is 4, 1–2, 3 | D-B-R-C mnemonic. | Called out ("lists drift fourth but says it comes first"). |
| "Never below 0" | Explained as vacuous, with proof. | Explained as vacuous, with an exhaustive count. |

**Design-accuracy defect (Y, important).** `gen("run")`, which feeds the Part 3 Runs practice where M1 is meant to be caught, mostly produces single-colour stacks. The most common in 3,000 draws were BBB, RRR, BBBB, RRRR and BBBBB. On **74.7%** of generated items the whole-stack-doubling answer equals the correct answer. The M1 distractor appears on only **26%** of items. A learner who holds M1 clears "2 in a row" without ever being contradicted about **56%** of the time (0.747²). The walkthrough's clean confrontation used a hand-picked "representative instance" (R,B,B,B,R) and overstates how reliable this is. The other generators also collide with M1 often: cap 33%, trap 40%, drift 39%, all 49%. M1 does get caught later at the trainer's "runs" blank, but no longer by name.

**Same defect, X.** Three of X's seven fixed practice stacks give the same answer under M1, and the other three that would expose it get generic feedback.

---

## Interaction table

| Artifact | Element | Classification | Feedback quality |
|---|---|---|---|
| X | Check yourself (11 / 7 / 8) | Thinking, weak | Same text whether right or wrong. M1 answer (14) not offered, so a guess can pass. |
| X | Worked example "Next step" | Decoration (a pacing reveal; never asks the learner to predict) | n/a |
| X | Stack builder | Decoration (no task, no check). Walkthrough: "'Remove top' and 'Clear' just to see; no thinking" | Live trace, correct |
| X | Practice stacks (typed, retry) | Thinking | 5 mistake models with specific messages. **No M1 model.** Show steps available before any attempt. |
| X | Whole round (typed total) | Thinking | Tile scores and total only; no diagnosis |
| X | Restart / Clear / New round | Control | n/a |
| Y | Part 0 placement (3 MC) | Thinking, light (walkthrough: "clicked through ... fast") | Explains each option. Route is advice only. Q3 states the rule in its own stem. |
| Y | Part 1 cold hook (MC) | Thinking | Distractors are modelled mistakes, but the M1 answer = the correct answer, so an M1 learner is told "Right". **Backfires.** |
| Y | Worked examples (Parts 2–6) | Read-only (static traces) | n/a |
| Y | c1 base (MC, 2 in a row) | Thinking, low demand | Modelled distractors (count, grey = 1, early doubling) |
| Y | c2 runs (MC) | Thinking | Names M1 explicitly when it appears, which is only 26% of the time |
| Y | c3 capstone / trap (MC) | Thinking, good (trap stacks) | `forceCap` message caught a real slip in the walkthrough |
| Y | c4 drift (MC) | Thinking, good | `blueAll` / `dropTop` messages caught a real slip |
| Y | Part 6 fading trainer (typed blanks) | Thinking, the best element | Per-step "you wrote X" plus the reason. Goes down a level after 2 misses. Long; learner quit at level 4. |
| Y | Round (3 tiles + total) | Thinking | Names the wrong tile with its trace. Checks the total against the correct tile scores. |
| Y | Build to target (2 tasks) | Thinking, far transfer | Full trace of what the built stack scores. Optional hint. |
| Y | Part 8 typed retrieval | Thinking | Generic "You wrote N. The steps give M" plus the trace |
| Y | Part 8 "why" MC | Thinking, weak (longest option is correct) | Each option explained |
| Y | Return plan / review banner | Retention scaffold | Date-based. Honest that a static page can't send reminders. |
| Y | Theme toggle, progress rail, copyable report | Utility / decoration | n/a |

---

## Visual notes

Screenshots: headless Chrome at 1280 px. The 400 px shots were taken inside a 400 px iframe, because headless Chrome's minimum window width is 500 px, so plain 400 px screenshots appear cropped. Both layouts fit 400 px with no horizontal scroll.

**X:**
- Generic system-ui card stack with an indigo accent. The audit flags the indigo as an AI-default hue.
- **Contrast failures:**
  - In dark mode, the primary buttons ("Check", "Next step") put white text on `#9fa0ff`, about **2.4:1**.
  - Grey stone labels are white 12 px text on `#8c8c8c`, about **3.4:1**.
- Stones are pills labelled with words, so colour is not the only cue (good).
- The stack column is centred and sits away from the numbers it explains. At 1280 px the 760 px column leaves the page feeling sparse.

**Y:**
- Deliberate palette (slate and paper) with contrast values recorded in the CSS. Georgia for text, monospace for sums. Stones are lettered R/B/G. 44 px touch targets. Theme toggle that respects the system setting.
- Sticky progress rail at 1280 px that collapses at 860 px.
- Weaknesses:
  - Long multi-line `legend` text sits across the fieldset border, so the border line visibly cuts through question text at both widths.
  - Towers are left-aligned in wide empty cards.
  - The page is very long; the 5,000 px shot only reaches Part 3.
  - Monospace "Part N" eyebrows plus serif body text reads slightly as a template.

## Audit (`no-slop-design/scripts/audit.py`)

- **X: 2 FAIL, 5 WARN.**
  - FAIL: indigo/violet `#3a3a8c` and `#9fa0ff`.
  - WARN: emerald `#1f8a4c` / `#4cc783`; coloured left border on `.box`; 2 "drawing on the words" hits that are false positives (matches inside JS).
- **Y: 0 FAIL, 3 WARN.** All three are left borders (`nav.rail li`, `.fb`, `.callout`). The rail one is a progress indicator and defensible. `.fb` and `.callout` are the stock pattern.

---

## Top 3 improvements

### X
1. **Target the planted misconception.** Add an `allDouble` mistake model to practice. Replace the Check-yourself options with ones that include 14 (red, red, blue under M1). Use practice stacks where M1 gives a different answer, with lone non-grey stones next to runs; currently 3 of the 7 cannot reveal it.
2. **Add fading and end retrieval.** Hide "Show steps" until after a first attempt. Move from step-scaffolded stacks to bare ones. End with a few unaided typed stacks and a "practise again on…" prompt instead of the cheat sheet.
3. **Turn the builder into a task.** Give it a target ("build a capped 5-stone stack worth 12") and a check, and chunk the rules one at a time with a non-example each. Also fix the button and grey-stone contrast.

### Y
1. **Fix the M1 blind spots.**
   - Change the hook stack to one where whole-stack doubling gives a different answer (for example B,R,R,B,G: correct 13, M1 18) and add M1 as a distractor.
   - Constrain `gen("run")` so every item has a lone non-grey stone next to a run. Today 75% of items cannot detect M1, and BBB/RRR dominate.
   - Probe M1 in placement.
2. **Make placement and fading respond to the learner.** A 3/3 placement result (or a correct cold try) should actually skip Parts 2–5 to a checkpoint. Go down a level after 1 miss on the same step type, not 2. Shorten levels 5–6, which the walkthrough learner abandoned as tedious.
3. **Harden the final check.** Replace the "why drift first" MC, where the longest option is correct, with a free-response or contrast item (show two scorings of one stack, one with drift last, and ask which is right and why). Give typed retrieval the same named mistake models as the MC items.

---

## Head-to-head verdict

**Y is better, clearly, at 2.83 against 1.83.** Its engines are just as correct as X's. Y has the structure of a real lesson: one chunk per rule with modelled distractors, a fading trainer that steps back on errors, far-transfer build tasks, and unaided spaced retrieval. X is a correct reference page with one good practice widget.

Y's margin is smaller than its polish suggests. Its own instrumentation fails on the one error this test planted. The cold hook *rewards* M1 with "Right." The Runs practice that should catch it is non-discriminating three times out of four, so the walkthrough's clean confrontation depended partly on a favourable random draw. It is also roughly twice as long as needed, and the simulated learner stopped before the bar the page sets itself (level 6).

X never addresses M1 by name. The learner unlearned it only by watching traces (the worked example's 14 against an expected 16, then "Show steps" on stack 2), which is incidental exposure, not design.

Master-teacher line for Y: *"The lesson is built properly, but go back and make sure your exercises can actually catch the mistake you're building them to catch."*

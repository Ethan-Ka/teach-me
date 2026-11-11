# Grading: fretboard-with-skill (iteration 2)

Artifact: `fretboard-with-skill/lesson.html` (79 KB, single page) and `reply.md`.
Request: one-year guitarist, knows box 1, wants to know the neck and improvise blues-rock across boxes.
Graded on gates G2 and G5 and dimensions D1, D2, D4, D5, D7 and D8, following the grader prompt and rubric for artifacts.

## Verdict

**FAIL (G2).** Dimension mean **3.17** (D1 3, D2 3, D4 3, D5 3, D7 4, D8 3).

Every fret, note, interval, box position and rhythm number the code generates is correct. The failure comes from hand-written rationale: the feedback for the key "how the boxes join" misconception gives a false reason, and keys with flat names are drawn with sharp note names. The failure is much narrower than in iteration 1, but it is the same kind of failure: prose that the code does not check.

## How it was verified

- I read all the JS. Every number on the page comes from one `BOX` offset table, `rootFret(pc)=(pc-4) mod 12` and `noteAt(s,f)=(open+f) mod 12`, with standard tuning E2 A2 D3 G3 B3 E4 (MIDI 40 45 50 55 59 64).
- I wrote an independent Python check (scratchpad `verify.py`) that rebuilds boxes 1 to 5 from the scale on each string:
  - Box 1 in A: E 5,8 / A 5,7 / D 5,7 / G 5,7 / B 5,8 / e 5,8.
  - Box 2: 8,10 / 7,10 / 7,10 / 7,9 / 8,10 / 8,10.
  - Box 3: 10,12 / 10,12 / 10,12 / 9,12 / 10,13 / 10,12.
  - Boxes 4 and 5 also match.
  - Hook: the scale notes on the low E string from fret 0 to 12 are 0, 3, 5, 8, 10, 12 (6 notes). Natural minor gives 8.
  - G box 1 on the low E string is 3,6. On the B string, boxes 1/2/3 are 5,8 / 8,10 / 10,13. Seam frets are 8,7,7,7,8,8.
  - The walk is E0 F1 G3 A5 B7 C8 D10, and only E–F and B–C are one fret apart.
  - e2 answers: F# 2, Bb 6, C# 9.
  - The reverse-item frets {2,3,4,6,8,10} map to F#, G, G#, Bb, C, D.
  - Every box of A has a root for the "start on a root" criterion: box 1 E5/D7/e5, box 2 D7/B10, box 3 A12/B10.
  - Rhythm: the bass plays the chord root on beats 1 and 3, a stab on 2 and 4. The stab is +4/+7/+10/+12, which is a true dominant 7. The form I I I I IV IV I I V IV I V is correct. The top rung is 4 + 4×48 beats, about 168 s at 70 bpm.
  - The goal tempo comes from one constant (70), the same one the top rung uses.
- In headless Chromium I loaded `file://` (dev mode). All 34 built-in fact checks pass, with no page errors.
  - I drove the placement with all answers correct. It routes: part 2 collapses ("placed out"), the build starts at round 3, and the seam explanation is hidden.
  - I triggered the e1, e2, drill, test-out, seam and build feedback.
- Screenshots at 1280 and 400 px, with every hidden section forced open: `scrollWidth` equals the viewport at both widths, so there is no sideways scroll.
- `audit.py`: 1 FAIL, "focus outline removed without replacement" (line 49). This is mostly a false positive, because `.spot:focus-visible .fr{stroke:#fff}` replaces the outline.

## Gates

| Gate | Result | Evidence |
|---|---|---|
| G2 | **FAIL** | (1) Placement p4, wrong option "Frets 10 and 12": *"That skips a note. Box 2 starts on box 1's top note, fret 8, so nothing is left out between them."* The seam question, wrong option "Frets 10 and 13": *"That starts above fret 8 and leaves a gap."* Both are false. Box 2 on every string is {top of box 1, bottom of box 3}, so box 2 ⊂ box 1 ∪ box 3 in every key (checked for all 12). Going from box 1 to box 3 skips no scale note. The real error is that the learner named box 3, not that a note went missing. This is the lesson's central concept, and the false reason is never corrected. (2) Boards and reveals spell every note with `NOTE_SHARP`. "Build box 2 of **Bb minor**" draws the root as **A#** and the scale as A# C# D# F G#. "Key of Ab minor" reveals **G#**. That contradicts the page's own key names and the "Bb is one fret below B" lesson. (3) Part 5: *"Everything is new keys and new questions."* The memory keys come from the same `ROOT_LABELS`/`BUILD_LABELS` pools as the drills, and nothing excludes keys already seen. |
| G5 | PASS | Many production tasks: typed fret predictions (e1, e2, jamPre), clicking the root on the neck, clicking all 12 notes of a box, typing the key from a fret (part 5 item 3), and a free-text explanation (part 5 item 5). |

## Interactions classified

| Interaction | Kind | Notes |
|---|---|---|
| Placement p1–p5 (MC + Not sure) | Think + routes | p1 (tuning) and p5 (can you play box 1) are honest self-reports, which is reasonable. p2 and p3 place out part 2. p4 sets the build round. |
| Hook "how many notes" MC, one shot | Think (prediction) | Distractors 2/5/8 each map to a named misconception. |
| e1 F/G fret prediction, one shot | Think (prediction) | Then the worked "walk" table, which is read-only. |
| e2 sharps and flats fill | Think, heavily cued | The stem gives the method ("F# is one fret above F, so fret __"). |
| Root drill (click the low E string) | Think, mastery stop | 4 in a row on items filtered so that every misconception gives a different answer (filtered discrimination is 1.0/1.0/1.0). Has a "Hear the root" button. |
| Seam MC + seam board/table | Think, then worked example | |
| Box build (click 12 notes) | Think, fading, mastery stop | Help goes from round 1 to 3, steps down one round on a miss, and needs 2 in a row at round 3. |
| jamPre fill (box 2/3 frets from memory) | Think (retrieval) | |
| Backing track + ladder + self-report | Motor practice, honor system | Has 3 countable criteria, steps down after 2 not-yets, and suggests recording and a tuner check. |
| Part 5 memory check (5 items) | Think (production), spaced | Gaps of 1/3/6/12 days, a miss resets to tomorrow, and it asks for a calendar date. |
| "I've got this, test me" | Illusion check | A weak one: see D5. |
| Report back, theme toggle, reference appendix | Meta / reference | Not decoration. The appendix warns against using it as a crutch. |

## Dimensions

**D1 Diagnosis: 3.**
- Placement routes for real. In the test run it gave *"Part 2 is placed out… You start part 3's build at round 3 of 3"*, and part 2 collapsed.
- Every wrong answer is mapped to a named misconception (`allTwoFrets`, `flipped`, `aString`, `fixedA`, `noOverlap`, `samePrev`), counted, and exported in the report.
- Not a 4, because the place-out is leaky and too easy:
  - All five items show at once, and p4's stem (*"A minor box 1 uses frets 5 and 8"*) gives away p2's answer ("which fret is A?").
  - Part 2 is skipped on A and G alone, two notes this learner already plays, with no sharp or flat item, even though objective 1 says "sharps and flats included". Part 5 does recheck it later.

**D2 Tell/guide/do: 3.**
- Each part goes predict → worked → guided → alone. The build fades as promised and steps back one round on a miss (`bd.level=Math.max(1,bd.level-1)`), and placement skips steps.
- Not a 4, because:
  - The root drill, the core skill for objective 1, has no fading and no speed requirement.
  - The jam board highlights the current box's notes during every run, including the objective rung. The support for objective 3 never fades, so the learner can read the box off the screen at 70 bpm.

**D4 Explanation quality: 3.**
- Chunked and concrete, with good non-examples: the natural minor "8" distractor, *"Five is the number of different note names… the E shows up twice"*, and the walk table with gap column.
- Limited by the false box-join rationale under G2, which sits exactly at the confusion that part 3 targets.

**D5 Checking and feedback: 3.**
- Feedback names the misconception and the fix, for example *"5 is what you get giving every letter two frets (E, F, G, A...). Ab is at fret 4."* and *"3 missing, 3 extra. That looks like using the previous box again. First missing: …"*
- Every check is a real task.
- The "test me" button tries to catch overconfidence, but the root challenge is always the same item (`if(test){const l="Ab"…}`), and one right answer finishes the part. The same holds for the build challenge (`bd.streak=NEED_BUILD`). That is a memorizable shortcut past the 4-in-a-row bar, so not a 4.

**D7 Retention and closure: 4.**
- Part 5 is spaced and fully productive: typed roots, a typed box pair, a fret→key reverse item never drilled directly (transfer), a box 3 build in a non-A key with no help, and an explanation.
- It sets the next date: *"A miss brings the next check forward to tomorrow… Put that date in your calendar now."*
- Next units are named with move-on bars.
- Caveats: the explanation item is self-graded, and "new keys" is not enforced.

**D8 Artifact design: 3.**
- Objectives → activation (hook, placement) → chunks, each with a worked example, an exercise and misconception feedback → spaced retrieval. The build fades. Nothing is decorative.
- Not a 4:
  - Far transfer is thin: every jam is in A, with no other key on the backing track.
  - The jam overlay never fades.
  - Smaller layout issues:
    - Hollow scale circles let the string line strike through their letter.
    - At 400 px the sticky progress nav takes about 130 px while the learner scrolls a board 864 px tall, and the string names scroll under it.
    - The link-chorus legend does not explain the seam rings.

## Iteration-1 weaknesses: recur?

| Iter-1 weakness | Status |
|---|---|
| Lick "finishes in box 2" but ends in box 1 | Gone (no hand-written licks) |
| "Bass root on beats 1 and 3" while beat 3 was the fifth | **Fixed**: the code plays the root on both, and a fact check enforces it |
| 60 vs 70 bpm goal mismatch | **Fixed**: one constant, also fact-checked |
| Self-check asking for the root over V7 in bar 12 | Gone |
| Prose contradicting computed content (general) | **Partly recurs**: false seam rationale, sharp spellings in flat keys, "Everything is new keys", and objective 1's "without counting up from the headstock", which nothing measures |
| Final retrieval by recognition | **Fixed**: production and click-build |
| Placement that didn't route | **Fixed**, but leaky (p4 gives away p2) and too easy (no accidentals) |
| Sideways scroll at 400 px | **Fixed**: scrollWidth is 400. Boards switch to a vertical neck |
| Drill solvable by fret arithmetic | **Partly recurs**: the untimed root drill can be solved by counting up from fret 0, which is the thing objective 1 forbids |

## Top 3 improvements

1. **Fix the false box-join reason and the spellings, then fact-check the prose.**
   - Say the true thing: "10 and 12 is box 3. Box 2 is the window in between, built from box 1's top note and box 3's bottom note."
   - Spell notes in the key's own accidentals (Bb minor → Bb Db Eb F Ab).
   - Either drop "Everything is new keys" or exclude the keys already seen.
2. **Make the objective-1 bar and the test-outs real.**
   - Time the root drill, for example 3 s per item, or the drill measures arithmetic, not knowing.
   - Draw challenge items at random from sharp and flat keys, and require 2–3 of them.
   - Show the placement items one at a time, so p4 can't give away p2, and add a sharp or flat item before placing out part 2.
3. **Fade the jam and add transfer.**
   - At the top rung, hide the box overlay, and show it only after an "almost".
   - Add one chorus in a second key (E or G) so that objective 3 shows the learner knows the neck, not just a picture of A minor.

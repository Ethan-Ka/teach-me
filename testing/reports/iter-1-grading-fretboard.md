# Blind grading: fretboard lesson artifacts (fret-P vs fret-Q)

Request: one-year guitarist (open chords, barre chords "kind of", minor pentatonic box 1) wants to know the fretboard well enough to improvise blues-rock outside one box, and asks for an interactive lesson.

Method: I read both HTML files in full, including all JS, and both chat replies. I wrote an independent standard-tuning engine (E2 A2 D3 G3 B3 E4) in Python, built the canonical five minor-pentatonic boxes, and ran each page's own box code in Node against it for every key the page can produce (`check.js`, `canon.py` in the scratchpad). I checked every hard-coded fret, note, interval and landmark in the prose by hand against that engine. Screenshots were taken with headless Chrome at 1280 px and at a true 400 px (iframe, because headless Chrome's minimum window is 500 px). Overflow was measured in the DOM. Neither page logs console errors on load.

Calibration: the known-bad anchor scored D8 = 1 and failed G2 with about 30 errors.

---

## Scores

| | fret-P ("Box 1 Everywhere") | fret-Q ("Fretboard Without Boxes") |
|---|---|---|
| G2 false statements | **FAIL** (2 false statements and 1 inconsistency, all minor and easy to fix) | **FAIL** (2 generated errors that recur, plus a false premise about the learner) |
| G5 no learner production | PASS | PASS |
| D1 Diagnosis | 3 | 0 |
| D2 Show, guide, do | 3 | 1 |
| D4 Explanation | 3 | 2 |
| D5 Checking and feedback | 3 | 1 |
| D7 Retention and closure | 3 | 1 |
| D8 Artifact design | 3 | 2 |
| Mean | **3.0** | **1.17** |
| Verdict | FAIL on G2 (strict), otherwise strong | FAIL on G2, weak |

---

## fret-P

### Accuracy

Verified correct:
- Every box the page generates. Box 1 is the window [r, r+3] and box 2 is [r+2, r+5]. Both match the canonical shapes on every string for all 10 keys in `KEYS`, with 12 notes each. Eb is not in `KEYS`; its box 2 would be cut off at fret 15, but the page never produces it.
- Low E naturals 0 E, 1 F, 3 G, 5 A, 7 B, 8 C, 10 D, 12 E. F# is fret 2 and Bb is fret 6.
- The placement items: fret 7 is B and D is fret 10. Low E fret 5 equals the open A (MIDI 45).
- The hook: shifting box 1 down two frets gives G minor pentatonic. The distractor's reason is right: G major would have B, four frets up, while the shape has Bb, three frets up.
- Scale offsets 0, 3, 5, 7, 10. The C minor box 1 and G minor box 2 answer keys. The high-e crossing (box 1 has frets 5 and 8, box 2 has 8 and 10, so fret 8 is shared and the next note is fret 10, D, the 4). The window overlap is r+2 and r+3.
- The backing track: A7/D7/E7 with the progression I I I I IV IV I I V IV I V. The chord stabs are 5, b7 and the 3rd up an octave (E G C# over A7).

Errors:
1. **Lick description is false.** The page says "Here is a six-note lick that lives in box 1, steps through the shared note, and finishes in box 2." The lick is B r+3, e r, e r+3, e r+5, e r+3, e r, so it ends on the root at e fret r, which is box 1 only. The page's own "In" column labels that last step "box 1 only". The prose contradicts the page's own table.
2. **Bass description is false.** The page says "The page plays a bass root on beats 1 and 3." The code plays `bassOf(pc)+7` on beat 3, which is the 5th, not the root. This matters because the learner is told to use the bass as the root reference for the self-check.
3. **Objective tempo is inconsistent.** Goal 3 says "Play a 12-bar blues chorus at 60 bpm…", but the ladder labels rung 3, "70 bpm … key of G", as "(the objective)".
4. **Design contradiction (not strictly false).** Criterion 2 is "Your last note of bars 4, 8 and 12 is the root." Bar 12 is V7 (E7 in A), so landing on A there sounds as a sus4 against the bass. The post-run prompt then says "a note that fought the bass is not on the root." A learner who does it right gets told by the page's own heuristic to doubt it.

### Interaction table

| Element | Classification | Feedback quality |
|---|---|---|
| Placement: tuning check plus "Play the page's A" | Makes the learner think (setup) | Explains why tuning matters for the later checks |
| Placement: fret 7 and fret of D (multiple choice), box 1 self-report | Makes the learner think | Each wrong option explains itself ("C is at fret 8"); routes to a part, but only as advice |
| Part 1 hook prediction ("lock in", then reveal) | Makes the learner think | Strong: each distractor gets a reason, including a near-miss non-example (G major) |
| "Play box 1 / same shape two frets down" | Supports by ear, mildly decorative | n/a |
| Low E board, worked walk table, "Play the walk" | Show (worked example) | n/a |
| Low E fill-in (last 3 naturals) | Makes the learner think (guided) | Explains with the rule: "The note before C is B, and that step is one fret, so C is one above fret 7" |
| Low E typed practice (4 in a row, a miss resets) | Makes the learner think (alone) | Names what the learner typed and where it actually is, then derives the answer from the nearest natural |
| Box 1 in A: board plus "written from r" table | Show | n/a |
| C minor rows (B and high e blank) | Makes the learner think (guided) | `whyFret`: "not in the key", "in the key but outside the window, so it belongs to a different box" |
| Construct box 1 (click 12 notes in a random key, 2 clean rounds, 2-level hint) | Makes the learner think (alone, production) | Explains every click; a hint costs the clean round. The best element in either page |
| Box 2 hook, G box 2 fill-in, construct box 2 | Make the learner think | Same quality as box 1 |
| Crossing multiple choice (next note above the shared fret) | Makes the learner think | Explains why the wrong frets are out of the key |
| Lick in A (tab, table, play) | Show | n/a |
| Lick in G (3 given), lick in new keys (2 in a row) | Make the learner think | Explains with the offsets. Weakness: this reduces to adding +0, +3 and +5 to r, which is arithmetic rather than seeing the neck |
| Backing track, 3-rung tempo ladder, self-report | Makes the learner do it (motor) | Honor system, but well designed: observable criteria, judged on the second chorus, "two of three" and "not yet" paths, two not-yets step down a rung, and a "record and compare" step. Weakened by errors 2 and 4 |
| "Say aloud where the boxes sit, then open to check" | Makes the learner think (self-check) | Reveals the answer only |
| Part 7 retrieval (5 multiple-choice questions in new keys, dated review) | Makes the learner think | Explains every option. But it is recognition, not production, and it is visible and answerable from page load |
| Summary textarea for Claude | Meta (re-diagnosis loop) | Built from real miss counts. Good |
| "Every note" reference board, theme toggle | Reference and chrome | n/a |

### Dimensions

- **D1 = 3.** The page runs a 4-item placement with "Not sure" options and routes on the answers ("You can already find notes on the low E. Do part 1, skim part 2 and pass its last check…"). The ladder re-routes when the evidence changes, and the summary feeds misses back for the next unit. Not a 4: the routing is only advice ("Every part stays open"), and the placement never finds a specific confusion. It asks about two notes and a self-rating.
- **D2 = 3.** Each chunk runs guess, then worked, then "Less help", then "Now alone". Help fades from 6 rows given, to 4 rows, to 2, to nothing; the lick goes from 3 notes given to none. The ladder steps back exactly one rung after two not-yets. Not a 4: the typed drills never step back to a guided version after misses, and placement doesn't skip steps.
- **D4 = 3.** Explanations are short and give the mechanism: "The shape never carried the key. The key comes from where the root sits", and "Box 2 is a second window onto the same scale". There is a good non-example (G major). Docked for the lick error and for "flat third" appearing in the hook feedback before the page defines intervals.
- **D5 = 3.** Feedback is specific, says why, and gives a next action (`whyFret`, "Try a fresh one"). Mastery uses streaks and clean rounds, and a hint costs credit. Not a 4: nothing catches an illusion of understanding on the guitar, and the final retrieval is multiple choice.
- **D7 = 3.** There are five cold questions in new keys, a dated review with expanding gaps (1 or 3 to 27 days), "put it in your calendar now", and a next-unit map. Not a 4: retrieval is recognition, it can be done before part 1, and "Do not scroll up" is the only gate.
- **D8 = 3.** It has 3 measurable objectives, then activation (a prediction hook), then chunks with worked example, exercise and why-feedback, then retrieval. The scope is held to one unit, with the rest deferred to a map. Not a 4: transfer stays near (new keys, the same two boxes), the lick drill is arithmetic, and the reference board and play buttons add little.

### Visual

At 1280 px the page reads as a book page: Source Serif 4 for reading, Atkinson Hyperlegible for labels, a bone or near-black ground, rosewood fretboards with real fret spacing, and one steel-blue action color. There are no gradients, no emoji and no card grid. The column sits left of center with a large empty right gutter, which looks lopsided at 1280. Contrast ratios are documented in the CSS comment. It has a dark-mode toggle, 44 px buttons, and arrow-key navigation on the board.

At 400 px there is no page overflow (scrollWidth 400). However, the boards keep `min-width: 820px` and scroll sideways. On a phone, the main check (click all 12 notes) and even the single-string low E diagram are mostly off screen, and the learner must scroll inside the board while clicking.

Audit: `No mechanical failures found.`

### Top 3 improvements (most important first)

1. **Make the closing retrieval production-based and gate it in time.** Replace the multiple-choice questions with "click box 2 of Bb on the blank board" or "type the frets" in a key not practiced. Lock the section until the next day. Add one far-transfer item, such as finding the root from the A string, or naming the note you cross on.
2. **Fix the G2 slips and the self-check logic.** Correct the lick sentence ("returns to box 1"). Either play the root on beat 3 or say "root and fifth". Make the objective tempo agree. Change "last note of bar 12" to bar 11 (the I chord), or allow the 5 over V.
3. **Make the core check usable on a phone and replace the arithmetic drill.** Crop the construct board to about the 7 frets around the window (or let it zoom) so no sideways scrolling happens mid-task. Swap "root fret + offset" lick typing for clicking or playing the lick on the board, so the learner sees the neck instead of adding numbers.

---

## fret-Q

### Accuracy

Verified correct:
- Low E landmarks 3 G, 5 A, 7 B, 8 C, 10 D, 12 E. A string 2 B, 3 C, 5 D, 7 E, 10 G, 12 A.
- The octave-shape table (6 to 4 and 5 to 3 at +2, 4 to 2 and 3 to 1 at +3) and the G-to-B reason for it.
- All 5 boxes in all 12 keys match the canonical shapes, shifted only by whole octaves, with every note in the scale.
- The A minor box ranges: 5-8, 7-10, 9-13, 12-15, 14-17. "Roots on two or three strings" holds in every box of every key.
- "The last note of one box is the first note of the next" on every string.
- The b5 and major 3rd placements. C against C# over A7. The G string 5, 7 to 9 slide. B string 5, 8, 10.

Errors:
1. **Part 3 drill gives false guidance about half the time.** When the random string is the A string, the success message is "Box 1 of F minor starts at the lowest of these on the low E string." The frets just found are on the A string (F is at A-string fret 8), while box 1 of F minor starts at low E fret 1. This came up on screen in my 400 px render.
2. **Part 4 overlap diagram silently drops notes.** For 9 of the 12 keys, at least one box pair is drawn partly past fret 17 and those notes are not shown. In the default A minor, pair 5+1 loses 6 notes, all of box 1's upper notes at fret 20. The caption still says "share 6 notes, one per string", so the learner sees one box plus red dots.
3. **False premise about the learner.** The page says "You already know every note you need on two strings, because you use them for barre chords." The learner said "barre chords kind of". The page asserts the knowledge its own Part 1 drill exists to build.
4. **Minor:** flat keys are spelled with sharps ("Bb minor" shows A#, C#, D#, G#). The footer discloses this, but it is wrong spelling for the key.
5. **Minor:** Part 4 move 2 says to use the Part 3 string selector to "play every pentatonic note from the nut to fret 15", but that selector shows only the current box unless "All" is chosen.

### Interaction table

| Element | Classification | Feedback quality |
|---|---|---|
| Sound toggle | Chrome | n/a |
| Part 1 naturals board, "hide names" toggle | Mostly decoration: hidden mode still shows every natural's position, with no task or feedback | none |
| Part 1 "click every X on string" | Makes the learner think | "That is G, not A." Identity only, with no why or strategy |
| Part 2 octave explorer | Exploration, no task | Descriptive text only |
| Part 2 "name the note" drill (12 buttons, timer, misses by string) | Makes the learner think | Gives the answer and "find it from the nearest landmark", then auto-advances after 1.6 s, so there is no retry on the same item. The timing and per-string miss counts are good |
| Part 3 box viewer (key, box, labels, string, play, drone) | Show; decoration as an assessment | n/a |
| Part 3 root drill | Makes the learner think | Identity only. The success message is wrong on A-string rounds (error 1) |
| Part 4 overlap viewer | Show; buggy (error 2) | n/a |
| Part 4 "three moves" | Instructions, no check | none, and this is the core objective |
| Part 5 colors viewer, drone, ear test | Show, plus an unchecked ear task | none |
| "Mark part N done" buttons | Decoration (honor system with no criteria) | none |
| Part 6 checklist plus weekly loop | Honor-system self-assessment | Mostly observable statements, one with a time target ("under 3 seconds"). No tempo targets for the boxes, no "not yet" path, no link to evidence |

### Dimensions

- **D1 = 0.** No question, no placement. The page asserts what the learner knows (error 3), and the reply says "I assumed… you're comfortable in A".
- **D2 = 1.** Parts 1 to 3 explain and then drill. Parts 4 and 5, which carry the learner's actual goal of getting out of one box, are all telling plus viewers. Nothing fades and nothing responds to the learner's state.
- **D4 = 2.** Explanations are correct with real mechanism ("the G-to-B gap is one fret smaller"; boxes as "five slices of the same five notes"). Docked for the false premise and the misleading generated message. There are no worked examples in the guide-then-do sense.
- **D5 = 1.** The checks that exist are real tasks, but feedback is right or wrong plus the identity of the clicked note. The core skills (crossing boxes, playing over a blues) have no check at all, only "Mark part done".
- **D7 = 1.** It ends with a checklist and a 4-week key rotation. That names what to practice and when, but there is no final application or retrieval in the page.
- **D8 = 2.** "Sections with some interaction, and feedback is right/wrong only." It repeats the anchor's main failure: a full syllabus (octaves, all 5 boxes, blue note, major 3rd, a 4-week plan) instead of mastery of one step, with honor-system "done" gates and viewers no exercise uses. It beats the anchor (D8 = 1) because the note engine is correct and computed, and the two drills are real.

### Visual

Warm paper ground, Georgia serif body and system-ui controls, each part in its own bordered panel, pill nav, a light flat fretboard. It looks tidy and only mildly templated. The flat diagram, small 11 px labels and color-coded dots are serviceable but less instrument-like than P. Purple (#7a3fa0 and #b98ae0) codes both "blue note" and "higher box", which reuses one color for two meanings across parts. There is no theme toggle, and the dark tokens are not guarded with `[data-theme]`. At 400 px there is no page overflow, but boards are `min-width: 700px` and scroll sideways.

Audit: FAIL (3): purple AI-default hue ×2 and a "✓" glyph standing in for an icon in the nav. WARN (2): uppercase letter-spaced eyebrow, and a colored left-border callout.

### Top 3 improvements (most important first)

1. **Diagnose, then cut to one mastery unit.** Ask or test what the learner knows on the low E first, and drop the 5-box, octave, blue-note and 4-week syllabus in favor of one objective (for example box 1 to box 2 in any key) taught to mastery.
2. **Put real checks on the goal skill.** Part 4 (connecting boxes) and Part 6 need production tasks: click the doorway notes, build box 2 from box 1 in a new key, and a backing track with tempo targets and a "not yet" path instead of "Mark part done".
3. **Make feedback explain, and close with retrieval.** Replace "That is G, not A" with the landmark derivation, retry the missed item, fix the A-string message and the Part 4 truncation, and end with a cold retrieval in new keys.

---

## Head-to-head verdict

**fret-P is clearly better**, with a dimension mean of 3.0 against 1.17. P is a mastery unit built on purpose. It has placement, a prediction hook, worked, faded and independent practice in every chunk, why-feedback generated from the same engine as the answer keys, a 12-click construction task as the main check, an honor-system guitar check designed with observable criteria, a step-down ladder and a "not yet" path, and spaced retrieval with a report-back loop. Q is a correct but generic tour of the neck. It does no diagnosis, the core goal goes unchecked, its feedback is right or wrong only, it has no retrieval, and its scope reproduces the anchor's "full syllabus" failure, though without the anchor's factual errors.

Under a strict reading of the rubric both fail G2. P's failures are three small prose and data slips, all fixable in a line each. Q's are a generated message that is wrong in about half of one drill's rounds and a diagram that drops notes in the default key.

**Weaknesses of P that should drive the next skill revision:**
1. Prose written beside computed data can still be false. The lick sentence and the "bass root on beats 1 and 3" claim are hand-written descriptions of generated content that nobody checked against it. Rule: every sentence that describes a generated object must itself be generated or asserted in a test.
2. The final retrieval is multiple-choice recognition and is available from page load. It should be production in a new context, gated in time.
3. The self-check criteria were not checked against the music: landing on the root over the V7 in bar 12 conflicts with "a note that fought the bass".
4. Small-screen checks never happened. The main construction task needs sideways scrolling at 400 px, as the reply admitted ("I did not check the layout at phone width").
5. Some practice turns into arithmetic: lick frets as root + offset rather than seeing the neck.
6. Placement only advises. It never reshapes the path, so a learner who already knows the low E does all the same work.

# 02 · Learner walkthrough: Fretboard Lesson Book

Artifact: `examples/Fretboard Lesson Book.html` (282 KB, 68 lessons, 11 phases, 3 tools, a generated "Today's practice" plan with spaced review in localStorage plus an optional db).
Method: I converted the HTML to text and read it in page order. I read both inline scripts and simulated every control from the code (plan generator, Mark done, Show tab / Open lesson / timers / "Reviewed, schedule next", fretboard, metronome, ear trainer, search, Hide done). I computed the warm-up rotation for the real dates Wed 11 Nov to Tue 17 Nov 2026 from `dayIndex()`.

## Persona

An adult who owns a guitar and plays 4–5 open chords picked up from YouTube (G, C, D, Em, Am). Can't barre. Doesn't read music. Knows no theory: doesn't know what an interval, a scale degree or a triad is. Practises 20–30 min a day with no teacher. Knowledge rule: for theory and fretboard content I know only what the page has told me so far. Every place I caught myself leaking real-world guitar knowledge is marked **[LEAK]**.

## Post-test (written before the walkthrough)

I wrote it from the TOC and phase titles only, and saved it to the scratchpad before reading any lesson (`.../scratchpad/posttest.md`). The visible TOC is just eleven phase names. Lesson titles are hidden inside collapsed `<details>`, so the post-test leans on Phase 1–2 guesses.

---

## Tags

Given: demo-not-teach, no-diagnosis, wall-of-text, no-practice, no-feedback-loop, no-fading, artifact-is-reference-doc, artifact-shallow, answer-in-hint.

Coined:
- **self-contradiction**: the artifact's own derivation rule gives a different note than its own tab, so a learner who follows the method gets "wrong" and can't tell which source to trust.
- **wrong-learner**: the text is addressed to a specific other person (an experienced player with "four models", who "can already bend" and "probably know[s] box one"). The persona's starting point isn't the one assumed.
- **forward-jargon**: a term is used before it is taught, or is never taught.
- **missing-physical-prereq**: assumes a playing skill the persona doesn't have (barre chords, A/E major shapes, bends). The intro rules out ever teaching these ("Nothing here explains how to hold a pick").
- **honor-system-progress**: completion and review are self-reported toggles with no failure path. The spacing algorithm schedules claims, not performance.
- **tool-island**: an interactive tool that no lesson or plan step tells you to use, and whose results feed nothing.
- **mastery-cliff**: the pass criterion describes the end state ("any note on any string in about a second, twenty in a row") with no intermediate checkpoints, so weeks of work show no visible progress.
- **plan-stall**: the daily plan regenerates the same content until you self-mark done, so the "adaptive" plan never adapts.
- **unverifiable-self-check**: the check depends on the very skill being trained ("sing the leap", "it sounds bright"), so an untrained ear can't catch an error with it.

---

## Chronological log, day 1

| # | Location | What happened | Tag |
|---|---|---|---|
| 1 | Header blurb | "Written for a player with hands that already work and no theory. Nothing here explains how to hold a pick." I have no theory, good, but are my hands "already working"? I can strum 5 chords. No placement check tells me whether this book is for me. | no-diagnosis, wrong-learner |
| 2 | "The eleven phases" | Eleven names: Geography, Harmony you can see, The embellishment engine… No sentence says what I'll be able to DO after any phase. "Embellishment engine" means nothing to me. | forward-jargon |
| 3 | Today's practice (top of page, before any lesson) | The plan renders before I've read anything. Warm-up: "Octave cycle: every instance of one note, naming frets · key of Ab." I don't know what an octave, a key or "Ab" is yet. Current lesson: "01 Name every note, cold · Step 1 · Two anchors to start from. Change something on every pass: rhythm, dynamics, articulation, position." "Dynamics" and "articulation" are never defined, and they don't apply to naming notes anyway. Review: "Nothing to review yet." Cold start: "Play, one take, no stopping. Backing track. No rules." Play what? In what key? I know 5 chords. | forward-jargon, no-practice |
| 4 | Plan, structure | Warm-up (5 min) and Current lesson (10 min) are both lesson 01. The "How this book is built" section promises interleaving, but on day 1 the plan gives 15 minutes of one lesson, then a review slot that's empty, then 5 minutes of improvising I can't do. | plan-stall |
| 5 | Plan buttons | "Show tab" pastes every tab figure from lesson 01 plus its pass line. "Start 10 min" is a countdown with a chime. "Open lesson" scrolls. Nothing asks me anything. | demo-not-teach |
| 6 | Tools · Fretboard | Defaults to A **minor pentatonic** with **Degrees** labels: dots marked 1, b3, 4, 5, b7, all over the neck. "Roots are filled. Thirds are ringed, because the third is the note that matters." I don't know what a root, a third or "b3" is. The Shape menu offers Mixolydian, Dorian, Aeolian, Dominant 7 arpeggio, and E/A/D/C/G shapes. I click dots: each plays a tone and prints "A, degree 1, string E fret 5". It's fun and mindless. Nothing asks me to predict before I click. | forward-jargon, demo-not-teach, tool-island |
| 7 | Tools · Metronome | Works. "The protocol: find the tempo you can play perfectly ten times, add 4…" Play perfectly *what*? Subdivisions (eighths, triplets, shuffle) aren't explained until the vocab section below. | forward-jargon |
| 8 | Tools · Ear trainer | Default mode "Scale degree in context". It plays a chord and then a note, and offers buttons: root, 2nd, flat 3rd, major 3rd, 4th, 5th, flat 7th. I have no idea and click randomly. A wrong answer turns red, the right one green, with "Not that one. Play it again and listen for what makes the right answer different." "Play again" replays only the question, never the answer I picked, so I can't compare the two. The score (0/1) disappears on reload and feeds nothing. I could click 20 random answers in a minute. | tool-island, no-feedback-loop, answer-in-hint |
| 9 | Theory vocabulary | Labelled "Reference, not a lesson… skim it." Ten dense definitions in a row: half step, interval ("counted in letter names including both ends"), scale degrees, b3/b5/b7, triad, inversion, seventh chord, voicing, arpeggio, key, diatonic, Roman numerals, vamp, double stop… Nothing checks that I took any of it in. Most of the plan's and tools' jargon is defined *here*, after I've already met it. | wall-of-text, artifact-is-reference-doc, no-practice |
| 10 | Vocab · The neck | "The full tab legend is at the bottom of this page." Lesson 01 needs tab, and the legend sits ~4,000 lines further down. I scroll all the way down to learn that the top line is the high E string. | forward-jargon |
| 11 | Phase 1 intro | "It moves fast for an experienced player: the tests are the real content, and if you pass one on day one, move on." Not me. | wrong-learner |
| 12 | L01 intro | "Go to the test at the bottom first." The test is "name any note on any string in about a second, a tuner agrees twenty times in a row." I fail at once. That tells me only "not yet", not what I'm missing. | no-diagnosis, mastery-cliff |
| 13 | L01 · What you need to know first | The chromatic list plus the low E chart are clear. Best part of the page for me. | (positive) |
| 14 | L01 · Step 1 anchors | "The 5th and 12th frets." The 12th is explained (open note an octave up). The 5th fret is never explained: why is it an anchor? Then dots: low E G A B C# E, A string C D E F# A. "Learn those ten." | forward-jargon (5th-fret anchor unexplained) |
| 15 | L01 · Step 2 octave shape | "Two strings up, two frets up… knowing the 6th and 5th strings gives you the 4th and 3rd strings free." So how do I get the B and high e strings? There's only a parenthetical "add one fret". The pass test says "any string". **[LEAK]**: I caught myself assuming the high e string has the same notes as the low E. The page never says so. | missing step |
| 16 | L01 · Drill A, every F | The tab shows 9 positions (E1, A8, D3, G10, B6, e1, E13, D15, e13). The caption says: say "one, eight, three, ten, six, one, thirteen" (7 numbers). Which "thirteen", low or high? Where did 15 go? "Lowest to highest": lowest by fret or by pitch? D3 comes after A8, so it isn't by fret. **[LEAK]**: I know A8 and D3 are the same pitch; the page never says so, and I didn't use it. | self-contradiction, ambiguous instruction |
| 17 | L01 · Drill B | "Check against the chart above." The chart covers only the low E string. For any other string the only checker is the tuner. | no-feedback-loop (partial) |
| 18 | L01 · tuner check | A real, honest external check. Good. But it confirms one note at a time, after the fact, and there's no log or count, so "twenty in a row" is held in my head. | (positive) / honor-system-progress |
| 19 | L01 · Mark done | One click flips it to done, sets a 1-day review, and moves "current lesson" to L02. Nothing verifies anything. Clicking it again ("Mark not done") wipes the review history. | honor-system-progress |
| 20 | L02 · Why this works | "Standard tuning is a stack of fourths." I can only derive "fourth" by counting letters (E F G A = 4). OK. Then "a two-note shape keeps the same interval". Fine, if dense. | wall-of-text |
| 21 | L02 · Steps 1–3 | Octave, fifth (= power chord: I half know this), fourth, thirds. Each comes with "check yourself: sing the leap / sounds bright vs dark / name which before you look". All of these depend on my ear, which is the thing I don't have yet. No reference audio is linked from the lesson. The fretboard tool *could* play these pairs, but the lesson never mentions it. | unverifiable-self-check, tool-island |
| 22 | L02 · Step 4 | Six interval rows in one tab (2nd/9th, 7ths, 6ths). "The minor 7th matters most for you… every dominant chord in blues." "Dominant" is undefined. Why does it matter "for me"? | forward-jargon, wrong-learner, cognitive overload |
| 23 | L02 · reference table | A nine-row table. Memorize it? The drill says days 1–3 octave/5th/4th, days 4–7 thirds, week 2, week 3. A three-week schedule inside one lesson, but the daily plan shows only "current lesson" and doesn't track which week of L02 I'm in. | plan-stall, no-fading |
| 24 | L03 · intro | "What Hendrix and Gilbert are both actually seeing." Who is Gilbert? | wrong-learner |
| 25 | L03 · What a triad is | "A six-string barre chord is just those same three notes…" I can't play a barre chord, and later the self-check depends on one. | missing-physical-prereq |
| 26 | L03 · Step 1 "built from scratch" | I follow the method literally from C on the G string, fret 5. The major third is "one string up and one fret back from the 4th". The 4th is "1 string up, same fret" = B5, so one fret back = B4. But the text says B5. That only works if I silently apply the "+1 past the G string" adjustment, and the text doesn't say to. Then the fifth: "two strings up and two frets back from the octave". The octave is two strings up, +2, +1 for the B string = e8, and two frets back = **e6**. The tab says **e3**. Using L02's own table, "2 strings up, 2 frets back from the octave" is the minor 7th, not the fifth. Following the method gives me a wrong chord, and I can't tell whether the method or the tab is wrong. | **self-contradiction** (load-bearing) |
| 27 | L03 · Step 1 check | "Compare it to a full C chord." I know open C, so I can roughly hear "same chord, thinner". The first usable ear check. | (positive) |
| 28 | L03 · Step 2 inversions | Four shapes in one tab, frets 3–17. "Derive each one instead of reading it." After #26 I don't trust deriving. | cognitive overload |
| 29 | L03 · Step 3 crawl | "New key tomorrow. Twelve days for all twelve keys. After day two, stop reading." That's the only fading in the book, and it's an instruction, not a scaffold: the tab stays on screen, and "Show tab" in the plan re-shows it every day. | no-fading, answer-in-hint |
| 30 | L03 · check | "Play a full barre chord of the same name" (can't). "Checking each note's name with a tuner" works but is slow. | missing-physical-prereq |
| 31 | L04 | Clear core idea: lower the third one fret. The tab marks the third with an arrow. Repeated 4+ times. This is the one idea that stuck (see post-test Q7). | (positive) |
| 32 | L05 · inner sets | "Comp behind a singer." **[LEAK]**: I know "comp"; it's never defined. Six-column tabs ×2 sets ×2 qualities, then "do it in G, then D", then "four sets". "E-A-D" is mentioned as a set but no tab is given for it. | forward-jargon, wall-of-text |
| 33 | L06 · voice leading | Readable. But "Then a blues: A, D, A, E. Dominant sevenths come in the sevenths lesson." "Blues" is assumed. | forward-jargon |
| 34 | L07 · CAGED | "The five open chord shapes you already know (C, A, G, E, D)." I don't know A or E major, and every moved shape is a barre ("Hold the barre"). | missing-physical-prereq, wrong-learner |
| 35 | L07 · E shape + scale tab | "Chord tones in ( )". C major is C, E, G (vocab), but the B-string and G-string lines parenthesize fret 10, which is F, a non-chord tone. The note beside it even says "(10 = F, 8 = E chord tone)". The marking contradicts the legend. | self-contradiction |
| 36 | L07 · Step 3 | "Locate the third inside each of the five." No answer given anywhere, so I can't check. | no-feedback-loop |
| 37 | End of Phase 1 | Seven lessons, each with a "Pass when". There's no phase-level statement of what I can now *do*, and no phase test. Phase 1 "Geography" turns out to hold triads, inversions, voice leading and CAGED, which isn't what the word "geography" made me expect. | artifact-shallow (at phase level) |
| 38 | Phase 2, L08 → | Real **quit-reading point on day 1**: around L08–L10 (≈45 min in). W-W-H is clear and buildable, but then 3-notes-per-string, modes "nothing new to memorize", thirds sequence, harmonized scale, "B diminished" (never defined), ii-V-I, "your four models", "shell voicing", "guide tones". From here I only skim headings. | wall-of-text, forward-jargon, wrong-learner |
| 39 | Skim: L "Bending in tune", "Hearing scale degrees" | "You can already bend… for most self-taught players". "It was missing from your plan entirely" (L "Open-string drones"). This book was rewritten from someone else's plan. The scale-degree lesson says to use a trainer "that plays a cadence… bare intervals… trains the less useful skill". The page's own ear trainer plays a single chord, not a cadence, and its default mode, the one the tool labels "the drill that matters most", is that one-chord version. | wrong-learner, self-contradiction, tool-island |
| 40 | Footer | "Sixty-eight lessons… a multi-year book." "Songs, by what they teach": Little Wing, Eruption, Racer X. Demoralizing for a 5-chord player. The "Session templates by phase" table labels phase 10 "Maintenance", but phase 10 is "Deeper harmony". | wrong-learner, self-contradiction (minor) |

## Days 2–7 (following the plan exactly)

Strict rule: the plan's current lesson is the first not-done lesson, and L01 says to mark done only on a pass. I couldn't pass, so I stayed on L01. Warm-up rotation computed from `dayIndex()`:

| Day | Warm-up shown | "Key of" | Current | Review | Cold start |
|---|---|---|---|---|---|
| 1 Wed | Octave cycle | Ab | L01 | Nothing yet | backing track, no rules |
| 2 Thu | Random fret call at 40 bpm | Eb | L01 | Nothing yet | same |
| 3 Fri | Octave cycle | Bb | L01 | Nothing yet | same |
| 4 Sat | Random fret call | F | L01 | Nothing yet | same |
| 5 Sun | Octave cycle | C | L01 | Nothing yet | same |
| 6 Mon | Random fret call | G | L01 | Nothing yet | same |
| 7 Tue | Octave cycle | D | L01 | Nothing yet | same |

| # | Day | What happened | Tag |
|---|---|---|---|
| 41 | 1–7 | "Key of Ab / Eb / Bb" attached to "octave cycle", which is one note. I treat the key as the note to cycle. The book's chromatic lists use only sharps, so I convert Ab→G# with the vocab rule "A# and Bb are the same fret." It works, but it's friction on day 1. "Key of Eb" for a *random* fret call means nothing. | forward-jargon, ambiguous instruction |
| 42 | 1–7 | The pool really is just two items (only items whose lesson index ≤ current), so "rotates daily through everything you have reached" means alternating two items that are both L01, while the Current lesson block is also L01. | plan-stall |
| 43 | 2–4 | The tuner check works. By day 4 the low E and A dots come fast, and D/G come via the octave shape. B and high e are still a mess (see #15). Nothing in the page records my tuner streak or my speed, so I can't see that I've improved. | mastery-cliff, no-feedback-loop |
| 44 | 1–7 | Cold start, every day: 5 minutes noodling over a YouTube backing track with no key, no notes, no goal. I strum my 5 chords and feel bad. "This is the only block that tests what you can actually do." What's the test? There's no criterion. | no-practice, unverifiable-self-check |
| 45 | 5 | The progress bar still reads "0 of 68 done". The plan is identical to day 1 apart from the warm-up label. L01 says the gap closes "in about two weeks". The only lever the page gives me is a Mark done button that nothing checks. | **quit point** (see below), honor-system-progress |
| 46 | 6 (alternative path) | If I cheat-click Mark done on L01: current becomes L02, the warm-up pool grows to 3, and "Spaced review · 01 Name every note, cold · Re-test it: You name any note…" appears the next day with a "Reviewed, schedule next" button. Clicking that pushes the review to 3 days, then a week, with no question asked and no failure button. The spacing algorithm now schedules a lesson I never passed. | honor-system-progress, no-feedback-loop |
| 47 | 6–7 (alt) | On L02 the plan's Current lesson block says "Step 1 · The octave, your anchor" (`firstDrill` takes the first h3 that starts with "Drill"/"Step 1"). It says that every day of L02. The plan never says "you're on days 4–7 of L02's drill: add thirds". The drill schedule inside the lesson isn't tracked. | plan-stall, no-fading |
| 48 | 1–7 | I never touched the fretboard tool or the ear trainer, because no plan block or lesson in Phase 1 points to them. The fretboard with Labels=None would make a decent self-quiz (click to reveal the name), but nothing suggests it. | tool-island |

**What I was told but never asked to produce or recall:** the vocab list (ten-plus terms), the interval reference table, the inversion names, the tuning "stack of fourths", the CAGED root strings, all of Phase 2 onward. The plan only ever asks for the current lesson plus a self-graded review.

**Do I know what I'm supposed to be able to DO at the end of each phase?** Per lesson, yes (the "Pass when" lines are concrete, which is the page's best feature). Per phase, no. No phase has an outcome statement or a phase test, and the phase names don't describe their contents ("Geography" holds triads, voice leading and CAGED).

---

## Post-test answers (no re-reading)

Answered strictly as the persona after the strict path (7 days on L01 plus the single day-1 read of everything else).

| Q | Answer | Score |
|---|---|---|
| Q1 5th fret low E; 7th fret A | A; E (dot anchors drilled all week) | 1 |
| Q2 G on low E and A, frets 0–12 | Low E fret 3; A string fret 10 (F# at 9, +1) | 1 |
| Q3 octave method | Two strings up, two frets up; add a fret if it lands on B or high e | 1 |
| Q4 half/whole step | 1 fret / 2 frets | 1 |
| Q5 interval + two placements | "Distance between notes, counted by letters." Fifth = one string up, two frets up (power chord). Fourth = one string up, same fret. Thirds: "one or two frets back, can't remember which is major." | 0.5 |
| Q6 triad, degrees of major | "Three notes, root, third, fifth… 1-3-5, C E G." Can't explain "degree of the major scale" beyond parroting. | 0.5 |
| Q7 major→minor | Lower the third one fret. | 1 |
| Q8 3-string major triad off the open position | "Top three strings around fret 5, something like 5-5-3?" I remember the tab-vs-method contradiction more than the shape. Couldn't play another key. | 0 |
| Q9 inversion | "Same notes, a different one on the bottom." Would mix up first and second. | 0.5 |
| Q10 metronome protocol; degree in context | Protocol: ten perfect, +4, drop 8 on a miss. Degree in context: "a chord plays then you name the note's… function?" I can't explain what function means. | 0.5 |
| Q11 one thing phases 3–5 teach you to DO | "Bend in tune using a tuner." Couldn't name an embellishment or phrasing skill. | 0.5 |
| Q12 what I can do after Phase 1 / how I'd know | I know L01's pass line. I can't state Phase 1's outcome. | 0.5 |
| **Total** | | **8.0 / 12 (67%)** |

Read the score honestly: 4 of the 8 points come from L01, the only lesson the plan actually made me practise for a week. Everything after it scored 0–0.5, and none of it can be played. The 67% overstates things because my pre-written questions were shallow (phase titles gave me nothing deeper to test). On the artifact's own L02–L07 pass criteria I'd score 0/6.

## Quit point

**Day 5 (Sunday), at the Today's practice block.** It's the fifth identical plan, the counter still reads "0 of 68 done", the L01 pass criterion is all-or-nothing and two weeks away, and the cold-start block is a daily 5 minutes of feeling incompetent. The only way forward is to self-certify a test I haven't passed.

Secondary hard wall (a day-1 reader, or anyone who cheat-clicks ahead): **L03 Step 1, "built from scratch"**. The page's own derivation method gives e6 (Bb) where the tab says e3 (G). The book's whole pitch is "derive, don't memorize", and the first derivation breaks. For a no-teacher learner that's the moment trust goes.

## Top failure patterns

1. **self-contradiction.** Method vs tab (L03 fifth; the L03 third works only with an unstated +1), mislabelled chord tones (L07), the F-cycle spoken list vs the tab (L01), the built-in ear trainer contradicting the book's own cadence advice, phase 10 named differently in two places. A learner with no teacher can't arbitrate.
2. **wrong-learner.** Written for an experienced, theory-less player with named idols, bends, box-one pentatonic and barre chords ("your four models", "it was missing from your plan"). No placement or diagnosis routes a true beginner anywhere else (no-diagnosis, missing-physical-prereq).
3. **artifact-is-reference-doc / wall-of-text.** All 68 lessons, the vocab, the tools and the tables sit on one page and open on day 1. The vocab says "reference, not a lesson". Day-1 overload hits at L08.
4. **honor-system-progress + no-feedback-loop.** "Mark done" and "Reviewed, schedule next" are unchecked toggles. Spaced review schedules claims. There's no failure path and no record of tuner streaks or speed.
5. **plan-stall / mastery-cliff.** The plan repeats the same lesson until self-marked. Pass criteria are end-state only, and multi-week drill schedules inside lessons ("days 4–7", "week 3") aren't tracked. Progress stays invisible, and that's what drives the quit.
6. **forward-jargon.** The plan, the tools and the vocab use key, degree, b3, dominant, Mixolydian, dynamics, articulation, comp and diminished before (or without) teaching them. The tab legend sits at the very bottom.
7. **tool-island + demo-not-teach.** Fretboard, metronome and ear trainer aren't referenced by Phase 1 lessons or the plan. The fretboard shows every answer and invites clicking without thinking. Ear-trainer scores vanish, and it never replays your wrong choice for contrast.
8. **unverifiable-self-check / no-practice for recall.** Checks rely on the ear being trained ("sing the leap", "bright vs dark"), the cold start has no criterion, and nothing ever asks me to recall the vocab, the interval table or earlier lessons. no-fading: "stop reading after day two" while Show tab re-shows the answer every day.

Positives worth keeping: concrete per-lesson "Pass when" lines. The tuner as an honest external check. The L01 chromatic/low-E chart. L04's single-idea framing ("lower the third one fret"), the one concept that was clearly retained.

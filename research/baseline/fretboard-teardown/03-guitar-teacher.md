# Fretboard Lesson Book: teardown from a guitar teacher

Reviewer stance: private guitar teacher, 20 years, mostly adult beginners and intermediates. I read this the way I'd read a junior teacher's curriculum before letting them use it on a paying student.

Artifact: `examples/Fretboard Lesson Book.html`. I extracted the full text, including the `<pre>` tab blocks (a naive tag-stripper loses everything after each `<-` annotation), read all of it, read both scripts, and recomputed every note name, fret, interval and chord spelling I could from standard tuning (E2 A2 D3 G3 B3 E4).

The stated student is "a player with hands that already work and no theory": a self-taught rhythm player who knows pentatonic box 1 and wants the sound of Hendrix, SRV, Van Halen and Gilbert. It is not written for a true beginner. I judge it against that student, and I say where an ordinary adult intermediate would fare worse.

---

## Verdict

**Don't use it with a student as it stands.** Underneath, the instincts are good, better than most method books on the shelf. It derives shapes from intervals instead of making you memorize them. It keeps coming back to the third. Its self-checks use real outside references: a tuner, unison bends, filming the picking hand, high-gain headphones. It has a note budget, a four-bar sentence drill, and target-the-third over a blues. A good teacher would recognise all of that.

Three problems make it unusable in practice:

1. **The worked examples are wrong too often.** I found about 30 factual errors in tabs and note labels. They sit in exactly the places a self-taught student trusts the page over their own ear: the major pentatonic box, pentatonic position 5, the B-string adjustment example, the scale wrapped around CAGED, harmonized thirds, the guide-tone tab, the turnaround. A teacher fixes a wrong diagram in five seconds. A student alone concludes that they are the problem.
2. **The sequence keeps a blues-rock student away from blues-rock for about three months.** By the book's own time estimates, Phase 1 runs 11 to 13 weeks of note-naming, interval shapes, triads in 12 keys and CAGED before the pentatonic the student already plays comes back. Transcription, which the book calls the "highest-value activity in this book", is lesson ~70 of 96.
3. **The daily plan locks progress behind mastery criteria that take months, and it never records failure.** "Current lesson" is the first lesson not marked done. The pass bars are things like "any triad, four string sets, all inversions, without hunting". So the student either stalls on one lesson for weeks or clicks "Mark done" early, and the review schedule then runs on false data.

It is also far bigger than it says: the footer claims "Sixty-eight lessons" and the DOM has **96**.

---

## Factual errors

All computed from standard tuning. Fret → note: E string 0=E; A string 0=A; D string 0=D; G string 0=G; B string 0=B; e string 0=E; +1 fret per half step.

| # | Location | Quote | What's wrong | Correction |
|---|---|---|---|---|
| 1 | L2 Intervals, Step 5 (the B-string example itself) | `G\|--7-- <- E (octave)` / `A\|--5-- <- A (root)` and `B\|--8-- <- E (octave, +1 fret)` / `D\|--5-- <- A (root)` | A5 is **D** and G7 is **D**. D5 is **G** and B8 is **G**. The shapes are right but every label is wrong, in the one diagram meant to teach the adjustment. | Root D / octave D; root G / octave G. |
| 2 | L2 reference table, "From your root" column | "Minor 6th: 2 strings up, 4 frets back" / "Major 6th: 2 strings up, 3 frets back" | From a root on E5 (A), D1 is D# and D2 is E. Those offsets are measured from the octave, not from the root, while every other row is measured from the root. | Minor 6th: 2 strings up, **2 back**. Major 6th: 2 strings up, **1 back** (strings 6/5/4; add 1 fret across G→B). |
| 3 | L2 Step 5 rule | "any time a shape puts a note on the B string or the high E string while the root is lower, add one fret" | Wrong when the root is on the B string: B→e is a normal fourth and needs no adjustment. The rule is about crossing the G–B gap. | "Add one fret when the shape crosses from the G string (or lower) to the B or e string." |
| 4 | L3 Step 1 | "The fifth, G, is two strings up and two frets back **from the octave**, which is the high E string, 3rd fret" | The octave of G5 is e8; two frets back from that is e6 (A#). e3 is two frets back from the **root**. The fret is right but the instruction is wrong. | "two strings up, two frets back from the root (B-string adjustment included)". |
| 5 | L5 Inner sets | "So the G-B-e shapes you learned are the odd ones out, and D-G-B and A-D-G are the regular pattern." | D-G-B contains the G–B major third, so it is irregular too. Only E-A-D and A-D-G are all-fourths. | "G-B-e and D-G-B both cross the G–B gap; A-D-G and E-A-D are the regular ones." |
| 6 | L6 Voice leading | C `G9 B8 e8` → Am `G5 B5 e5`, "C to Am: every note moves a little, nothing jumps" | Every voice moves 3–4 frets, which breaks the lesson's own rule ("keeps the most notes where they are"). | Am = `G9 B10 e8` (E-A-C): two common tones stay, one finger moves. |
| 7 | L7 CAGED, scale around the E shape | `B\|---8--(10)-12--\|  E F G (10 = F, 8 = E chord tone)` and `G\|---9--(10)-12--` | B8/10/12 = **G, A, B**, not E F G. Chord tones are marked on A (B10) and F (G10), neither of which is in a C chord. The diagram also spans frets 8–14 while telling you to "Hold the barre", which can't be done. | Use the real E-shape position, frets 7–10: E 7-8-10, A 7-8-10, D 7-9-10, G 7-9-10, B 8-10, e 7-8-10, with C/E/G marked. |
| 8 | L8 Major scale, "3 notes per string" | `E\|--3-5-7` `A\|--2-3-5` `D\|--2-4-5` `G\|--2-4-5` `B\|--3-5-7` `e\|--3-5-7` | E7 and A2 are both B, so a note repeats, and it isn't a 3nps pattern. The degree row (17 labels) doesn't match the 18 notes. | E 3-5-7, A 3-5-7, D 4-5-7, G 4-5-7, B 5-7-8, e 5-7-8. |
| 9 | L11 Pentatonic, Position 5 | `G\|--14--16-\|`, `A\|--14--17-\|` | G16 = B and A14 = B, and B is not in A minor pentatonic. | G 14-17 (A, C); A 15-17 (C, D). |
| 10 | L13 Major-minor blend, A major pentatonic box | `D\|--6--7--\|` (and the box as a whole) | D6 = G#, which isn't in A major pentatonic, and the box contains no B at all. What's shown is A C# E F# G#. | D 4-7 (F#, A), with B added (E7, G4). |
| 11 | L13 | "They share A, D/none, E." | Garbled. A minor pentatonic (A C D E G) and A major pentatonic (A B C# E F#) share A and E only. | "They share A and E." |
| 12 | L15 Thumb over | "A/C# (thumb on 6th)" = `e4 B5 G6 D6 E9` | The notes are G# E C# G# C#. That's **C#m**, and there's no A in it. | A/C#: E9 (C#), D7 (A), G6 (C#), B5 (E), e5 (A), for example. |
| 13 | L18 Harmonized thirds, strings 2 and 1 | `e\|--3---5---7...` / `B\|--3---5---7...` labelled "G/B A/C B/D..." | Same fret on B and e is always a **fourth** (e.g. D/G). These are fourths, which the previous lesson calls "the Texas sound". | To match its own labels: B8/e7 (G/B), B10/e8 (A/C), B12/e10 (B/D), B13/e12 (C/E), B15/e14 (D/F#), B17/e15 (E/G). The e note sits 1–2 frets *below* the B note. |
| 14 | Slow blues, four-note drill | `G\|--9--  B` | G9 = **E**, not B. | Label it E. |
| 15 | Motifs and sequences, "in thirds" | `B\|--5-7-8-7--8-10-12-10--10-12-13-12-\|` | The cells start on E, G, then A. G→A is a step, not a third. | The third cell starts on B: 12-13-15-13. |
| 16 | Guide tones (Phase 9, L58) | `G\|--6---7---6---8--\|` / `D\|--5---7---5---7--\|` | That tab gives C#/G, D/A, C#/G, D#/A, which contradicts its own table (3rds C# F# C# G#, 7ths G C G D) and the correct tab in the shell lesson. | G 6-5-6-7 / D 5-4-5-6. |
| 17 | Turnarounds | `G\|--5--4--3--2` "descending: C# C B Bb" | G5/4/3/2 = **C, B, Bb, A**. | Either relabel it C B Bb A, or use frets 6-5-4-3 for C# C B Bb. |
| 18 | Turnarounds | "Two voices. One moves, one stays. That is contrary motion" | One voice moving against a held note is **oblique** motion. Contrary motion means the voices move in opposite directions. | "oblique motion". |
| 19 | ii-V-I | "The 7th of Dm7 (C) becomes the... and the 3rd of Dm7 (F) becomes the 7th of G7." | Unfinished sentence. | "The 7th of Dm7 (C) falls a half step to B, the 3rd of G7." |
| 20 | Circle of fifths table | "Blues I IV V: IV is one step clockwise" | By the book's own definition (clockwise = up a fifth), C→F is one step **counter-clockwise**. | "IV is one step counter-clockwise; V is one step clockwise." |
| 21 | Reharmonizing, example 5 | "Em \| Am \| F \| G — vi for I" | In C, Em is **iii**. Am (vi) is already the second chord. | "iii for I" (or use Am for C and pick a different bar 2). |
| 22 | Tapped arpeggios | `B\|--5--8--12t--17t...` labelled "A C E A E C A" | On the B string those frets are E G B E. The labels belong to the high e string. The two-string version mixes in G, so it isn't an Am arpeggio. | Move it to the e string (5-8-12-17 = A C E A). |
| 23 | Three-note-per-string pentatonic, "Why it is worth the trouble" | "Three notes per string means every string change starts on the same pick direction" | False. 3nps strict alternate picking alternates the direction of string changes, and the book says so itself in L36 ("forces alternating string-change directions"). | Four notes per string keeps the direction constant; three doesn't. |
| 24 | 3nps pentatonic tab | `E 12-15-17, A 12-15-17, D 12-14-17, G 12-14-17, B 13-15-17, e 12-15-17` | Each string repeats the last note of the string below it (E17 = A12 = A, and so on). That's box 4 with duplicate notes. It doesn't reach "further" and doesn't cover the neck. | E 12-15-17, A 15-17-19, D 17-19-22... (shifts diagonally up). |
| 25 | Four notes per string | "A minor, four notes per string: `B\|--5-7-8-10--`" | B7 = F#, which isn't in A natural minor. The text even hedges ("check each note... before you trust this"). | B 5-6-8-10 (E F G A). |
| 26 | Modes, Step 1 | "C major from G: G A B C D E F# G? NO:" | Draft self-correction left in the student-facing text. | Delete it. |
| 27 | Blues changes properly | "Each chord brings a major third that is foreign to the others." | F# (3rd of D7) and G# (3rd of E7) are both diatonic to A major, and the next box says "D7 contains F#, fine". What clashes are the b7s (G, C, D). | "Each chord brings a b7 that is foreign to the key." |
| 28 | Tritone substitution | "play the sub's Mixolydian instead, which gives you the altered notes" | Db Mixolydian contains Gb (= F#), the major 7th, which clashes with G7's F. | Db Lydian dominant (= G altered); or just "the Db7 arpeggio". |
| 29 | Footer | "Sixty-eight lessons." | There are 96 `.lesson` elements and 96 "Pass when" criteria. | 96. |
| 30 | Fretboard tool, CAGED D shape (JS) | `FRETS=16`; base fret is pushed +12 if under 3 | With an E root the D-shape root lands on fret 14, so its B-string note (fret 17) is silently dropped and the drawn chord is missing a note. | Extend to 17+ frets, or don't add 12 when the result overflows. |

Questionable but not provably wrong: "a C#m for the Little Wing flavor" (the song opens on Em, sounding Ebm in Eb tuning). Jump "uses the floating #4 sound" (debatable). "Push up on the top three strings, pull down on the bottom three" ("top" is ambiguous: physically top is the bass side). "Below is the strongest pull. Above sounds smoother." (opinion stated as fact).

Verified correct, for balance: open-string and dot-fret note names; every F on the neck; fifth/fourth song references; all G-B-e, D-G-B and A-D-G triad inversion tabs, major and minor; the five CAGED C-major voicings and their root strings; all diatonic triad tables and the G-B-e harmonized-scale tab; seventh-chord formulas; the A7 shells and arpeggios; pentatonic positions 1–4; blues-scale b5 locations and the descending lick; the "plus one note" ladder frets; the borrowed-pentatonic analysis over C7; the A Dorian/Aeolian frets; the 7#9 shape and cell; the chord-symbol builds (Cm7b5, Eadd9, F#m7, Bb7#9); A13; the shell cycle of fifths on the A string; the secondary-dominant, borrowed-chord, harmonic-minor, tritone-sub and diminished tabs. The theory prose is mostly sound. The errors cluster in the tab, which is the part a student actually puts their fingers on.

---

## Findings

| Severity | Location | Problem | What a good teacher does instead |
|---|---|---|---|
| Critical | Tabs throughout (see table) | About 30 wrong frets and labels, concentrated in the highest-traffic diagrams. One even admits it ("check each note against the scale before you trust this"). | Never hand over an example you haven't played. For a written method, generate tab from the same data as the fretboard tool so the two can't disagree. |
| Critical | Daily plan (`currentId()` = first lesson not done) + pass bars | Linear lock on criteria that take weeks to months: L2 "any note anywhere... 3rd, 5th, 7th, octave in under a second each" plus hearing; L5 "all four string sets, all inversions, without hunting"; L36 "16ths at 120, 3nps, sixteen bars". The student stalls, or marks done falsely. | Run 2–3 tracks in parallel (geography / vocabulary-in-music / ear). Each lesson gets a **move-on bar** (usable) and a separate **mastery bar** that's revisited later. Time-box: "if not passed in 2 weeks, move on and keep it in review." |
| High | Phase 1 order | About 3 months of geography, triads and CAGED before the pentatonic the student already owns comes back (L11). The student's goal (blues-rock lead) and existing skill (rhythm, box 1) aren't used. First improvising is L7's last drill, around week 10. | Start from what they play. Week 1: note names on E/A via the roots of chords and boxes they already use, and moving box 1 to any key that's called out. Teach triads by comping a song they like. |
| High | L7 CAGED before L8 major scale | "Hang the scale on the shape" needs a scale that hasn't been taught, and the example given is wrong (#7). | Teach the major scale (or the pentatonic) attached to CAGED shapes together, or move CAGED after the scale lesson. |
| High | Phase 8 Ear placement | Transcription is called the highest-value activity but sits around lesson 70 of 96, after 15 technique lessons. "Hearing chord quality" comes after you've already been asked to pick scales by chord quality. | One short lick by ear every week from week 1. Chord-quality hearing before the "what to play over a dominant" decisions. |
| High | Ear trainer (JS) | Degree mode offers only 1 2 b3 3 4 5 b7: **no 6 or b6**, though Dorian vs Aeolian "comes down to the 6th". Key context is one block triad, while the book itself says "the cadence matters". Quality mode omits dim, m7b5 and 7#9, which L54's pass demands. Interval mode is ascending-only, with no 2nds, tritone, b6 or maj7. The score isn't saved or linked to any pass criterion ("nine times in ten"). | Make the tool test exactly what the pass criteria say, with a real I-IV-V-I cadence, the full degree set, and persisted hit rates that gate the lesson. |
| High | Spaced review (JS `data-rev`) | "Reviewed, schedule next" advances the interval whatever happened. No fail button, no reset. A review means re-running the full pass criterion in 5 minutes, which is impossible for most lessons. | Short probes per lesson (e.g. "name 10 random notes on the D string, log your time"). Record pass/fail. A fail resets the interval. |
| High | Scope / bloat | 96 lessons sold as 68. Duplicates: bend intonation twice (L69 / L22, near-identical drill); chromatic approach / enclosure / "two beats, not four" twice (Approach notes / Chromaticism); guide tones three times; static-minor 6th decision three times; Blue Bossa twice; Little Wing as the test three times; identical sentences repeated ("A rambling solo is someone talking without a point"). Duplicates also spread contradictions (#16, #23). | One concept, one home, referenced from elsewhere. Say up front what's core and what's optional. A year at 25 min/day holds maybe 30–40 lessons done properly. |
| Medium | Warm-up pool (JS `WARMUPS`) | Warm-ups only cover L1–L14, so bends, vibrato, rhythm, phrasing and changes never come back as warm-ups. Every "current lesson" block gets the same appended advice ("change... dynamics, articulation") even when the lesson is naming notes. | Warm-ups drawn from the student's last 3–4 phases. Advice written for the specific task. |
| Medium | Songs | The song table is an appendix. The daily plan never assigns repertoire. The "Suggested order" (Wind Cries Mary → ... ) isn't linked to phases. | Every phase names one song section with a bar target ("by week 3: Wind Cries Mary verse 1 with two fills, recorded"). The song is the test. |
| Medium | Physical risk | The pass for "Bending in tune" requires whole-step bends with **each of the four fingers**, including the unsupported pinky and the index. 5-fret hammer leaps, 4-fret stretches low on the neck, weeks of thumb-over. Only "stop at strain" guidance. | A teacher watches the hand. The artifact should at least require a filmed check against a short posture/tension checklist before stretch and bend work, and drop the pinky/index whole-step pass requirement. |
| Medium | Pass criteria that can't be measured | "in about a second" with no timer; "appears in your playing unplanned"; "sounds arranged"; "someone names a chord" (needs a partner); "a listener hears..." | Give a self-timed quiz (the fretboard tool could do this) and a listening checklist for recordings (counts: silences, chord tones on downbeats, bends in tune). |
| Medium | Fretboard tool | "Shape" shows whole-neck dot clouds. There's no position/box filter, no string-set or inversion filter for triads, no scale-over-CAGED overlay (the book's central idea), and no quiz mode for L1 even though it's the most drillable skill. | Box/position filter, string-set triads, CAGED + scale overlay, and a "hide labels, click to answer, timed" mode. |
| Medium | Phase order at the end | "A complete performance — The exam. Everything in this book" ends Phase 9, and then 11 harmony lessons follow. | The exam goes last, or there's a performance checkpoint at the end of every phase. |
| Low | Metronome | The subdivision ladder says "then six" but there's no sextuplet option. There's no gap-click or 2-and-4 mode for the time-feel lesson. No drone or backing loop, though most drills need a vamp. | Add those; a single-chord drone loop would serve half the book. |
| Low | Monthly recording (JS) | Only offered if you practise on the 1st. Miss that day and it's gone for the month. | "Due" from the last recording date. |
| Low | Draft residue | "F# G? NO:", "becomes the...", "D/none". | Proofread. These cost the author credibility with an adult student. |

---

## Practice design, in short

- **Specificity:** mixed. The best drills are excellent: L2's day 1–3 / 4–7 / week 2 / week 3 build-up, the bend check-note drill, the metronome protocol, the note budget, the four-bar sentence, target-the-third over a 12-bar. Many others are "improvise two minutes", "then a sixth above", "solo over Little Wing", with no tempo, no count and no stopping rule.
- **Progression criteria:** present for every lesson, which is better than most books. But they're mastery bars, not move-on bars, and the plan gates on them.
- **Spacing and interleaving:** claimed loudly ("Your daily plan interleaves on purpose") and delivered thinly. Each day is one rotating warm-up from Phases 1–2, the current lesson, up to two reviews, and a cold start. Several later lessons do genuinely reuse earlier material (triads → Hendrix system → triad pairs; shells → guide tones → circle), and that's to its credit. But warm-ups abandon everything after L14, and reviews don't record results.

## Ear and sound

Better than average on paper, weak in practice. Good: "the sound is how you know you found it, not the fret math"; singing the leap; the triad-vs-barre-chord check; hearing scale degrees moved up to Phase 2; the drill of landing on the b5 on purpose to hear it fail; the ear trainer exists at all, and plays notes in context. Bad: Phase 1 geography is purely visual and verbal (name it, then check with a tuner's *display*); the student never sings the note they're naming. Transcription comes very late. The built-in trainer can't test the degrees the book says matter most. So in the first three months, sound mostly shows up as "check yourself" asides rather than as the drill.

## Motivation and transfer

My guess at where this student quits: weeks 2–5. That's three weeks of interval shapes, then "new key tomorrow, twelve days for all twelve keys" of triad crawls, with no blues and no song. Where they get lost: Phase 2, which has 13 lessons including modes, borrowed pentatonics and the blend, and where the wrong major-pentatonic box (#10) sits in the lesson the book calls "the hardest thing in phase 2". The good transfer moments ("decode three songs you know into numerals", "convert a minor lick you own to major", the one-chord room) are real but rare and late. The student plays recognisable music on purpose for the first time somewhere around L13–L16.

## Self-assessment without a teacher

**What I'd catch that the artifact can't:**
- tension and injury risk: thumb-over clamping, pinky bends, stretches;
- whether a bend is flat but the student hears it as fine;
- vibrato that's uneven rather than chosen;
- the student marking things done too early;
- a wrong tab, and a student assuming they're the one who's wrong;
- boredom before it turns into quitting;
- rhythmic rushing at chord changes.

**Where the artifact does compensate:**
- a tuner and unison bends for pitch;
- filming the picking hand in slow motion;
- high gain with headphones for muting;
- recording against an audible click;
- a monthly recording on the same track, compared later;
- "if you disagree with the chart, settle it with a tuner".

Those are the right instincts. It doesn't compensate for its own errors, for physical risk, or for honest progress tracking.

## Load

Taken as a session: 5 minutes warm-up, 10 on the current lesson, 5 review, 5 play. That dose is fine. The pages aren't. L2 alone presents nine intervals, a table, a B-string rule and a three-week schedule. An intermediate adult will hold about three new shapes or facts per session (L2's days 1–3 dose of octave, fifth and fourth is exactly right). A true adult beginner can't use this book at all: it assumes barre chords, bends and thumb-over from page one, and it says so.

---

## What I'd keep

- "Test first, skip it if you pass", for students who already half-know things.
- Deriving shapes from intervals; "memorize one set plus add a fret past the G string" (with the rule fixed).
- The third as the thread through everything; minor = major with one fret lowered; thirds ringed in the tool.
- L2's staged schedule; the octave-cycle drill; random fret call at 40 bpm.
- The shell voicings and the correct guide-tone tab in the shell lesson.
- Targeting the third of each chord over a 12-bar, and the "two questions" method for picking scales.
- The note budget, the four-bar sentence, call and response, one lick twenty ways.
- The metronome protocol plus speed bursts; diagnosing the picking motion by filming.
- Objective self-checks: tuner, unison bend, high gain with headphones, recording with the click.
- "Modes, honestly": three modes, one note each.
- The song table, and ending every session by playing music.

---

## How I'd restructure the first two weeks

Student: an experienced rhythm player who knows box 1 and wants Hendrix/SRV. 25 minutes a day, three blocks, always ending with music. Every block has a number to log.

**Week 1: "Find A anywhere, and play there."**
- *Geography (6 min):* notes on the E and A strings only, using the dots as anchors. Daily timed quiz: 20 random frets, log seconds and errors. Move on when you get 20/20 in under 40 seconds on two separate days.
- *Applied (12 min):* box 1 over an A blues backing loop. Find every A in the box and play only roots and b7s for one chorus; sing the root before playing it. Then a key is called (G, C, D, E): put the box there using the E- or A-string root in under 3 seconds, and play one chorus. Log keys hit cleanly out of five.
- *Ear and music (7 min):* one four-note lick by ear (The Thrill Is Gone): sing it, find it, play it in A and in one other key. Then play a song you already know, saying each chord's root out loud.
- *Day 7:* record one chorus over the same loop. Keep it.

**Week 2: "The third."**
- *Geography (5 min):* add the D string through the octave shape (E→D). Same timed quiz. Week 1 strings stay in the rotation, mixed together.
- *Applied (13 min):* major vs minor third as a sound first: root, then 3 vs b3, sung, ten trials, log how many you name right. Then G-B-e triads, root position and first inversion only, in A, D and E. Comp a 12-bar with those triads. On each chord change, land a single note on that chord's third (C#, F#, G#). Log thirds hit on the downbeat out of 12.
- *Ear and music (7 min):* a second lick by ear. A short section of The Wind Cries Mary intro / triad moves, slowly, as the song goal for the next two weeks.
- *Day 14:* re-record the same chorus. Compare it with day 7 against a three-item checklist: silences present? thirds on changes? bends in tune?

Kept out until later: CAGED, the major scale in 12 keys, inner string sets, all of Phase 2's mode material.

---

## Lessons that generalize beyond guitar

1. **A wrong worked example is worse than no example.** Learners trust the concrete artifact (the tab, the code sample, the worked equation) over their own developing judgment, so every error teaches them to distrust themselves. Check every concrete example by computing it or running it, not by reading it. Where possible, generate examples and tools from one source of truth so they can't disagree.
2. **Start from what the learner can already do, and use the new knowledge in real performance in week 1.** Months of decontextualized prerequisites ("geography first, music later") kill motivation and transfer. Prerequisites should arrive just in time, attached to a task the learner cares about.
3. **Separate the move-on bar from the mastery bar.** Gating linear progress on mastery criteria produces either stalls or self-reports nobody can trust. Give a reachable "good enough to continue" bar and a time limit, and push mastery into spaced review.
4. **Spaced review has to record results.** A review button that always advances the schedule is a calendar, not a memory model. Review items need to be short, scoreable probes, and a failure needs to change the schedule.
5. **Perception before symbol.** For any perceptual-motor skill (music, languages, drawing, sport), the named fact has to be tied to the sensation it stands for in the drill itself, not in a "check yourself" aside.
6. **Tools must test what the text claims.** If the curriculum says X matters most, the built-in drill must cover X, use the context the curriculum calls essential, and feed its score into the pass criteria. Text and tools that disagree erode trust in both.
7. **Pass criteria must be measurable with what the learner has.** "In about a second", "sounds arranged" and "someone names a chord" need a timer, a rubric or a partner. Supply them, or rewrite the criterion.
8. **Scope honesty and one home per concept.** Count the lessons, budget the time, and say what to skip. Duplicated material bloats the course and breeds contradictions between the copies.
9. **Outside references are the self-taught learner's teacher.** A tuner, a recording, video and a deliberate exaggeration (high gain) are the right compensations, and this artifact's best feature. Every unsupervised skill curriculum should name one objective reference per skill.
10. **Name the physical and safety risks a supervisor would catch**, and add a self-check for each (film yourself, check against a short posture list). Never make a risky movement a pass requirement.
11. **No boilerplate advice.** Generic tips stamped onto every task ("vary the dynamics" on a note-naming drill) tell the learner nobody thought about their task, and they stop reading the advice that does matter.
12. **Put the performance test at the end, and give each phase a real-world checkpoint.** A capstone called "everything in this book", placed before two more phases, tells the learner the structure isn't designed.

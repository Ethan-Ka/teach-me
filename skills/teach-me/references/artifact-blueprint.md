# Artifact blueprint

What goes into a learning artifact (an HTML lesson, interactive explainer, study guide, practice set, or multi-week course), and in what order. How to make it look good and behave well is in `artifact-craft.md`. Two complete worked examples live in `artifact-examples/`: a checkable domain (`sql-left-vs-inner-join.html`) and a motor skill (`guitar-notes-low-e-and-a.html`). Open one before building your first artifact; they show every part below in about 36 KB each.

The short version: **build a path, not a pile.** An artifact teaches when the learner has to do something at every step and finds out whether they were right. A page that explains everything clearly and asks nothing is a reference document, and reading one feels like understanding without producing any (Muller's students rated the clear video "clear, concise, easy to understand" and scored 6.3 of 26 after watching it, up from 6.0).

## Contents

1. [Scope first: objectives, not a syllabus](#1-scope-first-objectives-not-a-syllabus)
2. [Before you write: misconceptions, checks, domain type](#2-before-you-write-misconceptions-checks-domain-type)
3. [The structure at a glance](#3-the-structure-at-a-glance)
4. [Part 0: Placement check](#4-part-0-placement-check)
5. [Part 1: Who it's for and what they'll be able to do](#5-part-1-who-its-for-and-what-theyll-be-able-to-do)
6. [Part 2: Hook, with a prediction that confronts a misconception](#6-part-2-hook-with-a-prediction-that-confronts-a-misconception)
7. [Part 3: Chunks, one idea each](#7-part-3-chunks-one-idea-each)
8. [Part 4: Worked example, then faded practice](#8-part-4-worked-example-then-faded-practice)
9. [Part 5: Application on a new surface](#9-part-5-application-on-a-new-surface)
10. [Part 6: Retrieval and the return plan](#10-part-6-retrieval-and-the-return-plan)
11. [Part 7: Reference appendix](#11-part-7-reference-appendix)
12. [Self-checks: checkable and honor-system domains](#12-self-checks-checkable-and-honor-system-domains)
13. [Progress and review that record failure](#13-progress-and-review-that-record-failure)
14. [Content verification: one data source](#14-content-verification-one-data-source)
15. [One home for each concept](#15-one-home-for-each-concept)
16. [Revising without leaving stale text](#16-revising-without-leaving-stale-text)
17. [Multi-week courses](#17-multi-week-courses)
18. [Pre-ship checklist](#18-pre-ship-checklist)

---

## 1. Scope first: objectives, not a syllabus

Pick **one to three objectives** the learner can reach in the next few sessions, and take those to mastery. Everything else is a course map (a list), not built lessons.

Why: the baseline failure for "teach me guitar" was a 282 KB, 96-lesson book that claimed 68 lessons. Depth, worked examples and checks went to the first fifteen lessons; about thirty later lessons were three-line drill lists. The learner quit on day 5 because the counter read "0 of 68 done" and the only lesson they had practised needed weeks. Coverage feels generous to write and is useless to receive.

An objective is an observable action with a condition and a standard, written so a check can test it:

| Weak | Strong |
|---|---|
| Understand joins | Predict the exact rows, duplicates and NULLs included, that an INNER and a LEFT JOIN return from two small tables |
| Learn the fretboard | When the page calls a note, play it on the low E or A string, frets 0 to 12, on the next downbeat at 60 bpm, eight calls in a row |
| Know the TCP handshake | Explain why two messages can't establish both sequence numbers, and say what each side does when the third packet is lost |

Rules of thumb:

- **Count the session time.** A unit should fit the learner's stated time, usually 15 to 30 minutes per session, and say so in the header ("about 25 minutes", "about a week of 15-minute sessions").
- **Separate the move-on bar from the mastery bar.** A move-on bar is reachable in a session or two ("eight clean calls at 50 bpm"); mastery ("any note, any string, under a second") goes into spaced review. Gating progress on mastery produces stalls or false self-reports, which is what the guitar book's linear plan did.
- **For a multi-week request, build unit 1 plus a course map,** and build later units after the learner reports back (section 17). Say this to the learner in chat: "Here's week 1 and the map. Tell me how the week 1 check went and I'll build week 2 around it."
- **Start from what they can already do.** The guitar teacher's review of the baseline book: three months of geography before the pentatonic the student already played came back. Attach new knowledge to a task the learner cares about in the first session.

## 2. Before you write: misconceptions, checks, domain type

Do three things before writing a word of content.

1. **List the two to four most common wrong ideas** about the topic. Joins: "a LEFT JOIN returns one row per left row"; "a join is a Venn-diagram filter, so it can't return more rows than a table has"; "a WHERE on the right table is harmless". Guitar note-finding: "every neighbouring letter is two frets apart". These become the hook, the wrong options in multiple choice, and the retrieval items.
2. **Write the checks before the content** (backward design, used here only as an ordering rule). For each objective, write the item that would prove it. Then write only the content those items need. Anything that serves no check is a candidate for the appendix or for deletion.
3. **Decide the domain type,** because it decides what a self-check can be (section 12):
   - *Checkable*: code, math, SQL, factual and conceptual questions, writing against a rubric. The page or Claude verifies.
   - *Honor-system*: motor and physical skills (instrument, drawing, sport, handwriting, pronunciation). Nothing on a static page can observe the attempt. Self-assessment is inherent, so design it well.
   - *Mixed*, which is most skills: the knowledge half is checkable even when the doing half isn't. "Which fret is Bb on the A string?" is checkable in the page; "play it on the beat" is honor-system. Split them and check the checkable half for real.

## 3. The structure at a glance

Build in this order. Do not ship a part missing its "must contain".

| # | Part | Must contain | Prevents |
|---|---|---|---|
| 0 | Placement check | 3 to 8 quick items ordered easy to hard, scored in the page, ending in a **route** (start here, skip to there, learn this prerequisite first) | Writing for the wrong learner; experts bored, beginners lost |
| 1 | Who and what | One line on who it's for, 1 to 3 observable objectives, time needed | No idea what they'll be able to do |
| 2 | Hook | A prediction the learner commits to, chosen so a common misconception gets it wrong, then the contrast | Clear exposition that leaves wrong beliefs intact |
| 3 | Chunks (3 to 6) | One idea each: short explanation, one worked example with labeled steps, then a check on that idea. Terms defined where first used | Walls of text; jargon before definition |
| 4 | Fading | Worked, then one blank, then more blanks, then the learner alone, with variants | Show-the-answer-then-say-derive-it |
| 5 | Application | A task on a new surface with a domain-fit check (in-page validation, or paste back to Claude) | Recognising the example without being able to do it |
| 6 | Retrieval | Mixed items on all chunks with the content out of sight, an "explain why" item, and a dated return plan | Rereading mistaken for learning |
| 7 | Appendix | Tables, syntax, full charts. Collapsed, linked from where needed | Reference material on the main path |

Each part is backed differently. Retrieval and spacing are the strongest (Dunlosky et al. 2013 rate practice testing and distributed practice high utility). Segmenting, contiguity and coherence come from Mayer's multimedia principles (moderate to strong for short lessons). Misconception confrontation is one randomized study plus its author's account (Muller et al. 2008). The overall sequence is a practitioner synthesis.

## 4. Part 0: Placement check

The artifact finds out where the learner is before presenting content, then routes them. Even if they told Claude their level in chat, include a short check, because self-reports of prior knowledge are unreliable and the page should calibrate rather than assume.

**Must contain**

- 3 to 8 items, easy to hard, each tied to one prerequisite or one chunk.
- "Not sure" as an explicit option. It routes; it doesn't count as wrong. Without it learners guess, and a lucky guess skips them past what they need.
- For a physical skill, one "can you do X right now" item with an observable answer, plus one setup check the rest of the lesson depends on (guitar: "fret 5 on the low E and the open A should sound the same; does yours?").
- A **route, not a score**: "Start at Part 1", "Skip to Part 4, then do Part 7", "Learn the six open string names first (ask Claude for a five-minute drill)". Let the learner override it; every part stays open.
- Use a different surface from the hook. The SQL placement uses a pets table so it doesn't spoil the hook's customers-and-orders prediction.

**Example** (from the SQL lesson)

> 1. `SELECT name FROM owners WHERE city = 'Oslo'` returns: Kai, Mo / Kai / Kai, Lu, Mo / Not sure
> 2. `owners INNER JOIN pets` returns how many rows? 4 / 3 / 12 / Not sure
>
> Route: question 1 wrong means the prerequisite is missing, so the page says to get a primer first. All right means skip to the WHERE trap.

The wrong options are the misconceptions: 3 is "one row per owner", 12 is "every pair". A placement item whose misconception answer equals the right answer tells you nothing; the first draft of that item had exactly that collision (three owners, three INNER rows), and it was caught only because the counts were computed and compared.

**Store the result** and use it: prefill the review set, and mark skipped chunks as "assumed, checked again in retrieval".

## 5. Part 1: Who it's for and what they'll be able to do

**Must contain**

- One line naming the learner: "For you if you can write `SELECT ... WHERE` on one table and joins still feel like guessing." Address the person in front of you. The baseline book was addressed to someone else ("your four models", "it was missing from your plan") and the walkthrough persona read it as not for them.
- The 1 to 3 objectives from section 1, each tied to a check later in the page.
- The time it takes.

Nothing else. No welcome paragraph, no "in this lesson we will explore". The objectives are the introduction.

## 6. Part 2: Hook, with a prediction that confronts a misconception

Open with something the learner has to commit to before any explanation: a prediction, a puzzle, a problem they can't fully solve yet. Pick it so the most common wrong idea gives a wrong answer. Then show the result, name the wrong idea, and explain where it breaks.

Why: in Muller, Bewes, Sharma and Reimann (2008), 364 first-year physics students were randomly assigned to online treatments of Newton's laws. Treatments that stated and refuted the misconceptions beat clear exposition with effect sizes of 0.79 and 0.83. Students rated the clear version as clear and became more confident while learning little; the refutation versions felt confusing and taught more. Low-prior-knowledge students gained most. (Graded Moderate: one RCT, one topic, immediate test; the paper itself was read through two secondary descriptions.)

**Must contain**

- A commit step: the learner picks or types an answer, and the page records it before revealing anything. A "click to reveal" with no commitment gives the learner nothing to compare against.
- Distractors that are the misconceptions, each with its own explanation.
- The contrast: show the actual result (computed, section 14) next to their pick.
- A sentence that normalises the discomfort when it's likely: "Most people say 2." Muller's dialogue students reported higher mental effort and called it confusing; a learner who isn't told that may read confusion as a bad lesson.

**Example** (SQL hook)

> `customers LEFT JOIN orders`. How many rows? 4 / 5 / 6 / 3
>
> - 4: "That's the most common guess: LEFT JOIN keeps every customer, so one row each. It keeps every customer *at least once*. Ana has two orders, so Ana appears twice."
> - 6: "You kept order 104 as well. LEFT JOIN keeps unmatched rows from the left table only."
> - 3: "That's the INNER count."

**Boundary.** Refutation needs a prior belief to refute. For an arbitrary new API with no intuitions attached, use a "what do you expect this returns?" prediction instead, which still forces a commitment. Never use "was this clear?" or a confidence slider as evidence of learning. If the page collects confidence, label it as a feeling and don't let it open the next step.

## 7. Part 3: Chunks, one idea each

Three to six chunks. Each one:

1. **Explains one idea briefly**, in plain sentences addressed to "you".
2. **Shows one worked example** with the steps labeled by what they do (subgoal labels: "take one customer", "find every matching order", "write one row per match"). Reuse the same labels across later examples so the learner can say "this is the same step as before".
3. **Ends with a check on that idea** that the learner has to answer before the next chunk feels finished.

**Define terms where they're first used,** inside the chunk that needs them. The baseline book used "dominant", "b3", "comp" and "Mixolydian" in its first screen and defined them in a vocabulary block the learner reached later (or never); its tab legend sat about 4,000 lines below the first tab. Pre-training on the two to four terms a chunk needs, inside that chunk, is one of Mayer's better-supported principles.

**Put text next to the thing it explains** (spatial contiguity): the label on the diagram, the explanation beside the example. Drop decoration, jokes off the objective and "fun facts" from the path (coherence). Don't say the same thing as a paragraph, a bullet list and a table (redundancy).

**Concreteness fading.** Order each chunk's representation: a specific instance with real values, the same instance with its parts labeled by role, then the general rule, then a new instance that needs the rule. Don't open with the formula. The guitar lesson walks the low E string letter by letter with frets (E 0, F 1, G 3...) and only then states "E-F and B-C are one fret; everything else is two". (Fyfe et al. 2014, read at abstract level; a 2021 paper questions how far it generalises. Treat as a sound default, not a law. "Concrete" must be something the learner already knows.)

## 8. Part 4: Worked example, then faded practice

The sequence: one fully worked example, then the same procedure with one step blank, then more blanks, then the learner alone on a fresh item. **Blank the last step first** and work backward, so early blanks sit where the learner has the most support above them.

Why: for novices, studying worked examples beats solving equivalent problems (Barbieri et al. 2023 meta-analysis of math studies, g = 0.48, Strong). The failure is stopping at the demonstration, or showing the full answer and then saying "derive it yourself": the baseline book printed every inversion, then wrote "derive each one instead of reading it" underneath. Fading made of an instruction ("after day two, stop reading") depends on willpower; fading built into the page doesn't.

**Must contain**

- A visible fade: the worked example, then fewer givens. In the guitar lesson, the low E walk is fully worked; on the A string, three of eight frets are blank; then the learner finds every copy of a note on a blank board.
- **Variants, not one fixed item.** Generate new items from data (new random orders tables, a different target note). A learner who misses gets explanation plus a fresh item, so they can't pass by clicking until the right option lights up. Require a short streak ("two in a row", "four in a row") to finish.
- No answer on screen before the attempt. Hints go from "which step are you on?" to "what rule applies here?" to a worked parallel example, and the actual answer only after attempts.

**Expertise reversal.** For someone who already knows the procedure, worked examples get in the way. That's what the placement route is for: send them past the worked chunks to the transfer and retrieval parts.

## 9. Part 5: Application on a new surface

One task that looks different from the examples but has the same structure: new names, new tables, a new string. Transfer needs varied surfaces (supported by the self-explanation and interleaving findings; Practitioner for the exact design).

**Must contain** a check that fits the domain:

- In-page validation when the page can compute the answer (the SQL builder runs the learner's query through the page's join engine and compares rows to the goal).
- "Paste your attempt back to Claude" when it can't: free-form SQL, an essay, a proof, a design. Give a textarea, a copy button that wraps the attempt in a message saying what the task was, and the 3 to 5 rubric points Claude will check. The learner can self-check against the rubric first.
- For motor skills, the performance itself, with observable pass criteria (section 12).

## 10. Part 6: Retrieval and the return plan

End with retrieval, not a summary. Mixed items from every chunk, content out of sight ("don't scroll up"), on new surfaces, including one "explain why" item. Then a dated return plan.

Why: practice testing and distributed practice are the two techniques Dunlosky et al. rate high utility across learners, materials and delays. Rereading and summarising rate low. A restated recap feels productive and is passive; convert every recap into a question.

**Must contain**

- 3 to 5 mixed items, interleaving the confusable ones (INNER vs LEFT, sharps vs flats). Interleaving helps most when the categories are easy to confuse (Brunmair and Richter 2019, g = 0.42 overall; blocking wins for vocabulary lists, so don't interleave unrelated word lists).
- Commit before reveal, and feedback that explains.
- **A schedule that records failure.** All right: next review in a growing gap (3 days, then 6, then 12). Any miss: tomorrow. Show the date and say plainly that nothing will remind them: "Put it in your calendar now." A static page can't send a reminder; promising one is a lie.
- A way back into Claude: "If you'd rather, ask Claude for a fresh set then." When the learner returns to chat, Claude starts with retrieval, not a recap.

## 11. Part 7: Reference appendix

Optional. Full tables, syntax, the whole fretboard chart. Collapsed by default (`<details>`), placed after retrieval, linked from where a chunk needs it. Never on the main path: the baseline book's vocabulary section was labelled "Reference, not a lesson" and sat between the learner and lesson 1.

Generate the appendix from the same data as everything else (section 14), so the chart can't disagree with the lessons.

## 12. Self-checks: checkable and honor-system domains

A check is worth including only if it **can fail**, the learner **can tell what failed**, and a failure **changes what happens next**. What's possible differs by domain, and the difference is inherent, not a flaw to apologise for.

### Checkable domains

The page or Claude actually verifies.

- **Choice with explained feedback.** Each wrong option names the misconception it represents and why it's wrong. "Not that one. Try again" is right/wrong feedback; feedback carrying information about the task and strategy is what moves learning (Wisniewski, Zierer and Hattie 2020: high-information feedback d = 0.99 against 0.24 for reinforcement alone).
- **Typed answers** (numbers, short text) normalised before comparing: trim, lowercase, accept listed variants and enharmonic spellings (F# and Gb).
- **Construct tasks** checked by running them: the learner assembles a query, an ordering, a set of clicks, and the page computes the result and compares it to the goal. Feedback says what the learner's version actually does ("Zero rows. INNER JOIN already dropped the customers without orders").
- **Variant retries.** After a miss, a fresh item from a generator or bank, never the same one with the wrong option greyed out. A streak requirement stops random clicking (the baseline ear trainer let 20 random clicks pass in a minute).
- **Prerequisite audit.** Every check uses only what the page has taught by that point. List each check item with the chunk that teaches it; move or cut any item whose prerequisite comes later.
- **Paste back to Claude** for anything the page can't grade: a prefilled message with the task, the attempt and the rubric.

### Honor-system domains

Motor and physical skills. The page can't see or hear the attempt, and this skill does not try to listen to the learner (no microphone analysis, no camera). Design inside that constraint.

- **Observable pass criteria with numbers.** "Right note, on the downbeat, without stopping, eight calls in a row at 50 bpm." Not "sounds good", not "without thinking", not "someone can hear".
- **External references the learner can't fool.** The page plays the target note on the beat the learner should play it, so a wrong note is heard as a clash. A tuner app as a second opinion. Never a check that depends on the untrained skill: "sing the leap" and "it should sound bright" fail for someone whose ear is the thing being trained.
- **Tempo ladder.** Rungs at rising tempos (and widening scope: naturals on one string, then both strings, then all notes). A clean run opens the next rung.
- **Record and compare.** "Record one run on your phone and listen back: what you hear while playing hides late notes." Give the listening checklist (on the beat? any stops? right notes?).
- **An honest "not yet" button that changes the plan.** Three self-report buttons (all clean / almost / not yet), with "not yet" as a normal outcome. Two "not yet" runs step down a rung; at the bottom rung, the page gives a slower drill without the click and asks the learner to tell Claude which notes they hesitate on. In the baseline book there was no failure path, so the schedule only advanced.
- **Report back.** A summary built from what the learner did on the page, misses included, with a blank line for "what I noticed", to paste into chat. Claude then adjusts the next unit.
- **Say what the page can't see.** One sentence: "The page plays notes; it never listens."
- **Name physical risks** a teacher would catch (stretches, bends, tension) and never make a risky movement a pass requirement.

## 13. Progress and review that record failure

Progress is evidence, not claims.

- **Store attempts, misses and dates,** not just "done". The progress map shows partial states ("3 tries, 1 missed", "done, 2 misses on the way"), so a learner sees movement before mastery. The baseline book's "0 of 68 done" after five days of honest work was the quit point.
- **A "mark done" button is never the only gate.** A part is done when its check passes (a streak, a matched query, a clean rung). For honor-system parts, "done" follows a self-report against observable criteria, and the record keeps the not-yet runs too.
- **Review needs a miss path.** A review button that always widens the interval is a calendar, not a memory model. A miss brings the next review forward; a pass lengthens it (approximating the expanding intervals of Matuschak and Nielsen's mnemonic medium, where a failed recall steps back a level).
- **Track what was missed,** item by item ("Bb on the A string: 2"), and feed it into retrieval and the report for Claude.
- **Tolerate lost state.** `localStorage` is per browser and per device and can be cleared. The page must work from empty storage, and anything important (the report summary) should be copyable out.

## 14. Content verification: one data source

**Compute or generate every example, answer key, table and diagram from one data source in the page's script.** Text, tabs, diagrams and answers can then never disagree, because they are all the same numbers rendered different ways.

Why: the guitar teacher found about 30 wrong tabs and labels in the baseline book, concentrated in the diagrams a self-taught student trusts most. The book's designated self-check was "compare your work to the tab", so a learner who derived the right answer "checked" it against a wrong key and fixed it into an error. The page already contained a correct pitch engine (`OPEN=[40,45,50,55,59,64]`) and never used it to generate a single figure. One figure even hedged: "check each note against the scale before you trust this". A hedge is not a check.

How to apply it:

- **Write the data and the engine first.** SQL lesson: two arrays of rows and a 6-line `join(type, left, right, on, where)` with SQL's NULL behaviour. Guitar lesson: `STRINGS = [{name: "A", open: 45}, {name: "low E", open: 40}]`, the twelve note names, and `fretOf(note, open)`.
- **Derive everything from it:** the tables on screen, the worked trace, the result counts, the right option, every wrong option's explanation ("Fret 4 is C#/Db"), the fretboard SVG, the appendix chart, the target pitch the audio plays.
- **No hand-typed facts the code could derive.** "Produces the five rows from Part 1" becomes a number filled in by script. "Ana's 12 order failed the test" becomes a sentence generated from the data. If the data changes, nothing goes stale.
- **Check the engine independently.** Compute a handful of answers by a separate route (a short Python script, a hand calculation, a different library) and compare against what the page renders. Both example lessons were checked this way: all 26 fretboard labels, the walk table, and every generated quiz answer against an independent standard-tuning calculation.
- **Things the code can't derive** (a historical date, a definition, an API's behaviour) get checked against a source before shipping, and if Claude can't verify one, the page says so in place rather than presenting it as a key.
- **Render the result and look at it.** Open the page in a headless browser, play through the interactions, and read what it actually says (`artifact-craft.md`, section 10).

## 15. One home for each concept

Each idea is taught in exactly one place. Later appearances are **retrieval of the earlier one** ("from Part 3: what does a zero-match row look like under LEFT?"), or a link back, never a second lesson.

Why: the baseline book taught guide tones three times and bends twice, with the same drill under two titles; one of the three guide-tone tabs contradicted the other two, and two lessons gave opposite rules about pick direction. Duplicates bloat the course and breed contradictions, and the learner can't tell whether the second copy is new material or review.

In practice: keep a short concept list while building (concept, the part that teaches it, the parts that retrieve it). If a concept appears in a second teaching role, merge.

## 16. Revising without leaving stale text

When the learner reports back or something changes, **rewrite the affected structure**, don't append to it. Then read the whole artifact once as the learner.

The baseline book was revised by appending: lessons numbered "00" thirty-nine times, "Moved up from the ear phase", "This was missing from your plan", a footer saying 68 lessons over a counter saying 96, a draft self-correction left in ("G A B C D E F# G? NO:"), and a key sentence cut off mid-claim.

The read-through checks:

- Counts, numbering and cross-references are generated, or match.
- No authoring notes, revision commentary or self-corrections in learner-facing text ("moved", "now", "missing from", "NO:", "TODO", "check this").
- No truncated sentences.
- No duplicates (section 15).
- Every interactive element is still referenced by a step and still tests what that step's text claims.
- The "who it's for" line and the objectives still match the content.

## 17. Multi-week courses

A multi-week course needs state across sessions, a per-session shape, and a plan that changes when a check fails. Build **unit 1 plus a course map,** then build later units after the learner reports back.

| | Single lesson | Multi-week course |
|---|---|---|
| Built now | Parts 0 to 7 | Placement, the course map, and unit 1 (parts 1 to 7) |
| Course map | n/a | One line per unit: its objective and its move-on bar. Not built lessons |
| Per session | One sitting | Fits the learner's stated time. Warm-up retrieval from earlier units, one new thing, one application, ending with real use (a song, a query on their own data) |
| Progress | Checks in the page | Evidence per skill: scores, tempos reached, last review date, misses |
| Fading | Within the lesson | Across units too: week 1 scaffolded, week 3 less |
| When a check fails twice | Step down within the page | The next unit Claude builds is smaller (a prerequisite drill, a 1b unit), not the same unit regenerated |

Why build later units later: every unit should be built for what the learner showed they can do, and a complete syllabus written up front is the 282 KB reference document again. Say it to the learner: "Do unit 1 this week. When you've tried the check, paste the summary here and I'll build unit 2 around what happened."

Each unit's page ends with the report-back summary (section 12), which is what makes the next unit fit.

## 18. Pre-ship checklist

Run this before handing over any learning artifact. Every item maps to a root cause in the fretboard teardowns (`research/baseline/fretboard-teardown/`); the right-hand column says which.

**Scope and learner**

- [ ] 1 to 3 objectives, each observable, each with a check in the page. *(Root cause 1: "teach me" read as "write the complete syllabus")*
- [ ] Multi-week request: unit 1 plus a course map only; later units wait for the learner's report. *(Root cause 1)*
- [ ] Session time stated, and the unit fits it. *(Load: L2 alone held nine intervals, a table and a three-week schedule)*
- [ ] One line naming who it's for, addressed to this learner, not someone else. *(wrong-learner: "your four models")*
- [ ] Placement check with "Not sure", ending in a route; physical prerequisites checked. *(no-diagnosis, missing-physical-prereq)*
- [ ] Move-on bars are reachable in a session or two; mastery goes to review. *(Root cause 8: pass criteria as aspirations; mastery-cliff)*

**Content correctness**

- [ ] Every example, table, tab, diagram, count and answer key is generated from one data source in the script. *(Root cause 2: about 30 wrong tabs written from memory)*
- [ ] Engine outputs spot-checked by an independent route; facts the code can't derive checked against a source, or flagged on the page. *(Root cause 2)*
- [ ] No hedges standing in for checks ("verify this before trusting it"). *(F12: "check each note against the scale before you trust this")*
- [ ] Each worked example satisfies the rule it demonstrates. *(F03: the voice-leading example broke its own rule)*
- [ ] Each concept has one home; later mentions are retrieval or links. *(Root cause 7, F30: guide tones taught three times, contradicting each other)*

**Learning sequence**

- [ ] The hook asks for a committed prediction that a common misconception gets wrong. *(F38: lessons opened with claims, not problems)*
- [ ] Terms defined in the chunk that first uses them; legends next to their figures. *(forward-jargon; tab legend 4,000 lines below the first tab)*
- [ ] No answer visible before the attempt; fading is built into the page, not instructed. *(Root cause 6: "derive it" printed under the derivation)*
- [ ] Variants after a miss, and a streak to finish. *(Walkthrough #8: 20 random clicks passed the ear trainer)*
- [ ] A transfer task on a new surface. *(no-practice)*
- [ ] Retrieval at the end with content out of sight, plus a dated return plan; no restated summary. *(F26: no cumulative retrieval)*

**Checks and progress**

- [ ] Every check can fail, says what failed, and changes what happens next. *(Root cause 4: self-report as assessment)*
- [ ] Wrong-answer feedback explains the specific error, not "try again". *(F24: "Not that one. Play it again")*
- [ ] Honor-system skills: observable numeric criteria, an external reference, a tempo ladder or equivalent, record-and-compare, and a "not yet" path that changes the plan. *(Root causes 4 and 8; unverifiable-self-check)*
- [ ] No check depends on the skill being trained. *(F19: "sing the leap")*
- [ ] Progress stores attempts and misses; the map shows partial states; review has a miss path. *(F25: review could only move forward; "0 of 68 done")*
- [ ] No "mark done" as the only gate. *(96 of 109 buttons were "Mark done")*
- [ ] A report-back summary to paste into chat. *(no-feedback-loop)*

**Interaction and media**

- [ ] Every widget is referenced by a step that asks the learner something before they use it. *(Root cause 3: tool-island)*
- [ ] Each widget tests what its lesson's text claims, with the context the text calls essential. *(F23: the ear trainer contradicted the lesson's cadence advice)*
- [ ] For a skill judged by ear, the targets are playable in the page next to where they're described. *(Root cause 5, F20: a synth loaded and never used by a lesson)*

**Final read as the learner**

- [ ] Counts, numbering and cross-references match. No authoring notes, self-corrections or truncated sentences. *(Root cause 7: "Sixty-eight lessons" over a counter of 96; "NO:"; "becomes the...")*
- [ ] No boilerplate advice stamped onto every step. *(F32: "vary the dynamics" on a note-naming drill)*
- [ ] Rendered in a browser and played through at desktop and phone widths; no console errors; `artifact-craft.md` checklist passed.

<!--
Sources and findings behind this file:
- research/notes/E-artifact-design.md: finding 1 (seven-part blueprint), 2 (Mayer: coherence, contiguity, segmenting, pre-training, signaling), 3 (Muller et al. 2008 refutation, clarity is not learning), 4 (concreteness fading, Fyfe et al. 2014, contested 2021), 5 (checkable vs honor-system self-checks), 6 (placement check, expertise reversal lead), 7 (think vs decoration interactions, tool-island), 8 (single lesson vs multi-week; build unit 1 then wait), 9 (Matuschak and Nielsen mnemonic medium), and the teardown-to-blueprint table.
- research/notes/D-retention.md: finding 1 (Dunlosky 2013 utilities), 3 (in-session sequence, Brunmair and Richter 2019 interleaving), 4 (return plan, nothing reminds them), 5 (prerequisite audit, calibration, not-yet path), 6 (transfer on varied surfaces).
- research/notes/B-diagnosis-feedback.md: finding 1 (hinge questions, distractors as misconceptions, "not sure"), 2 (illusion of understanding), 3 (Wisniewski et al. 2020 feedback information), 5 (self-checks by domain, no mark-complete gate).
- research/notes/F-domain-pedagogy.md: worked examples for novices (Barbieri et al. 2023), subgoal labels, PRIMM predict-first, Parsons problems, slow practice and smallest failing unit, feedback on physical skill without observation (v0).
- research/notes/I-video-educators.md: findings 1 (predict, worked example with a shown mistake, recap converted to retrieval), 2 (Muller video numbers 6.0 to 6.3 vs 11 of 26), 3 (motor-skill session shape, unverified).
- research/baseline/fretboard-teardown/01-instructional-design.md (F01 to F39, root causes 1 to 8), 02-learner-walkthrough.md (tags, quit point day 5), 03-guitar-teacher.md (about 30 factual errors, move-on vs mastery bar, lessons that generalize).
- Evidence grades: retrieval and spacing Strong; Mayer principles Moderate to Strong for short lessons; refutation Moderate; worked examples Strong for math novices; fading and concreteness fading leads at abstract level; the overall sequence, honor-system design and multi-week rules Practitioner or v0.
-->

# Artifact blueprint

What goes into a learning artifact (an HTML lesson, interactive explainer, study guide, practice set, or multi-week course), and in what order. How to make it look good and behave well is in `artifact-craft.md`. Two complete worked examples live in `artifact-examples/`: a checkable domain (`sql-left-vs-inner-join.html`) and a motor skill (`guitar-notes-low-e-and-a.html`). Open one before building your first artifact; they show every part below in about 50 KB each.

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

1. **List the wrong ideas, documented and derived.** Start with the two to four most common ones, then work through the rules: for each rule, what would a learner answer who drops it, over-applies it, applies it in the wrong order, or mis-scopes it (applies it to only part of the total, to the wrong quantity, or at the wrong stage, such as a cap checked before the last charge is added)? Add each boundary confused (< for <=), each threshold off by one and each exception forgotten. Keep the ones a real learner could plausibly hold. Don't let a near-miss slip stand in for one you derived: two misconceptions are different if some case gives them different wrong answers, and they need different items to expose them. In iteration 3 a page listed "forgets the cap" in place of "the cap covers only the first charge"; every coverage check passed, on the wrong list, and a holder of the real error placed out of everything (Practitioner, one run). The documented list alone misses some (`diagnosis-and-feedback.md`, section 13). Joins: "a LEFT JOIN returns one row per left row"; "a join is a Venn-diagram filter, so it can't return more rows than a table has"; "a WHERE on the right table is harmless". Guitar note-finding: "every neighbouring letter is two frets apart". Treat the finished list as a set of hypotheses about what a learner might hold, not a record of what they do hold: perturbing a procedure is how researchers derived real subtraction bugs (Brown and VanLehn 1980), but the categories here are this skill's own (v0) and a derived list over-generates. For a conceptual topic with no procedure to perturb, lean on the documented wrong ideas. These become the hook, the wrong options in multiple choice, and the retrieval items. Write each one as a rule the script can apply (`wrong.oneRowPerLeft(tables)`, `wrong.allTwoFrets(note)`) beside the correct engine, because every item in the page will be filtered against them (`diagnosis-and-feedback.md`, section 13).
2. **Write the checks before the content** (backward design, used here only as an ordering rule). For each objective, write the item that would prove it. Then write only the content those items need. Anything that serves no check is a candidate for the appendix or for deletion.
3. **Decide the domain type,** because it decides what a self-check can be (section 12):
   - *Checkable*: code, math, SQL, factual and conceptual questions, writing against a rubric. The page or Claude verifies.
   - *Honor-system*: motor and physical skills (instrument, drawing, sport, handwriting, pronunciation). Nothing on a static page can observe the attempt. Self-assessment is inherent, so design it well.
   - *Mixed*, which is most skills: the knowledge half is checkable even when the doing half isn't. "Which fret is Bb on the A string?" is checkable in the page; "play it on the beat" is honor-system. Split them and check the checkable half for real.

## 3. The structure at a glance

Build in this order. Do not ship a part missing its "must contain".

| # | Part | Must contain | Prevents |
|---|---|---|---|
| 0 | Placement check | 3 to 8 quick discriminating items ordered easy to hard, scored in the page, ending in a **route that changes the path** (parts collapsed, practice started at a later level, or a prerequisite named) | Writing for the wrong learner; experts bored, beginners lost |
| 1 | Who and what | One line on who it's for, 1 to 3 observable objectives, time needed | No idea what they'll be able to do |
| 2 | Hook | A prediction the learner commits to, chosen so a common misconception gets it wrong, then the contrast | Clear exposition that leaves wrong beliefs intact |
| 3 | Chunks (3 to 6) | One idea each: short explanation, one worked example with labeled steps, then a check on that idea. Terms defined where first used | Walls of text; jargon before definition |
| 4 | Fading | Worked, then one blank, then more blanks, then the learner alone, with discriminating variants, ending on a mastery criterion, with a "test me" exit | Show-the-answer-then-say-derive-it; tedium past mastery |
| 5 | Application | A task on a new surface with a domain-fit check (in-page validation, or paste back to Claude) | Recognising the example without being able to do it |
| 6 | Retrieval | Mixed **production** items (typed, built, played) on all chunks in a new context, content out of sight, an "explain why" item, and a dated return plan | Rereading mistaken for learning; recognition mistaken for recall |
| 7 | Appendix | Tables, syntax, full charts. Collapsed, linked from where needed | Reference material on the main path |

Each part is backed differently. Retrieval and spacing are the strongest (Dunlosky et al. 2013 rate practice testing and distributed practice high utility). Segmenting, contiguity and coherence come from Mayer's multimedia principles (moderate to strong for short lessons). Misconception confrontation rests on one randomized study plus its author's account (Muller et al. 2008) and on refutation-text meta-analyses (Moderate). The overall sequence is a practitioner synthesis.

## 4. Part 0: Placement check

The artifact finds out where the learner is before presenting content, then routes them. Even if they told Claude their level in chat, include a short check, because self-reports of prior knowledge are unreliable and the page should calibrate rather than assume.

**Must contain**

- 3 to 8 items, easy to hard, each tied to one prerequisite or one chunk.
- "Not sure" as an explicit option. It routes; it doesn't count as wrong. Without it learners guess, and a lucky guess skips them past what they need.
- For a physical skill, one "can you do X right now" item with an observable answer, plus one setup check the rest of the lesson depends on (guitar: "fret 5 on the low E and the open A should sound the same; does yours?").
- **Discriminating items.** Each item is one where the misconception it probes gives a different answer from the right rule (`diagnosis-and-feedback.md`, section 13). A placement item the misconception answers correctly routes the learner straight past the part that would fix it.
- **Gates that every skipped misconception fails.** For each part a gate can collapse, list the misconceptions that part repairs. Each must give a wrong answer on the gate item, or on one of the items that must all be right to skip. In iteration 2, a lesson's gates for its free-pass and cap parts were items those two misconceptions answered correctly, so the learner who held both placed out of the only parts that confronted them, and left with both. Avoid gate answers that land on a boundary (exactly at a cap), and never let a two-option item skip anything. Assert each gate in the `checks` array (`artifact-craft.md`, section 5.8).
- **One item at a time.** Show the next placement item only after the current one is answered. Items on one screen leak: in iteration 2 the feedback on question 4 showed the answer to question 2.
- A **route that changes the path**, not a score and not advice. Advice ("you could skip to Part 4") leaves a strong learner doing every step, which is what the graders found in both iteration 1 lessons. Do at least one of these:
  - **Collapse the parts they placed out of.** Each skipped part shows one line ("Placed out: you already find naturals on the low E") and a "Do this part anyway" button; the progress map marks it "placed out", not "done".
  - **Start practice at a later level.** A fading trainer begins at the level the placement supports (all blanks, or alone), and steps back on a miss as usual.
  - **Jump.** Scroll to the first part they need and put focus on its heading.
  - **Name a prerequisite** when the base is missing: "Learn the six open string names first (ask Claude for a five-minute drill)".
  The learner can always override. Skipped ideas come back in the final retrieval, so a lucky placement is caught there.
- Use a different surface from the hook. The SQL placement uses a pets table so it doesn't spoil the hook's customers-and-orders prediction.

**Example** (from the SQL lesson)

> 1. `SELECT name FROM owners WHERE city = 'Oslo'` returns: Kai, Mo / Kai / Kai, Lu, Mo / Not sure
> 2. `owners INNER JOIN pets` returns how many rows? 4 / 3 / 12 / Not sure
>
> Route: question 1 wrong means the prerequisite is missing, so the page says to get a primer first. All right means skip to the WHERE trap.

The wrong options are the misconceptions: 3 is "one row per owner", 12 is "every pair". A placement item whose misconception answer equals the right answer tells you nothing; the first draft of that item had exactly that collision (three owners, three INNER rows), and it was caught only because the counts were computed and compared.

**Store the result** and use it on reload: re-apply the collapsed parts, prefill the review set, and mark skipped chunks as "placed out, checked again in retrieval".

## 5. Part 1: Who it's for and what they'll be able to do

**Must contain**

- One line naming the learner: "For you if you can write `SELECT ... WHERE` on one table and joins still feel like guessing." Address the person in front of you. The baseline book was addressed to someone else ("your four models", "it was missing from your plan") and the walkthrough persona read it as not for them.
- The 1 to 3 objectives from section 1, each tied to a check later in the page.
- The time it takes.

Nothing else. No welcome paragraph, no "in this lesson we will explore". The objectives are the introduction.

## 6. Part 2: Hook, with a prediction that confronts a misconception

Open with something the learner has to commit to before any explanation: a prediction, a puzzle, a problem they can't fully solve yet. Pick it so the most common wrong idea gives a wrong answer. Then show the result, name the wrong idea, and explain where it breaks.

Why: in Muller, Bewes, Sharma and Reimann (2008), 364 first-year physics students were randomly assigned to online treatments of Newton's laws. Treatments that stated and refuted the misconceptions beat clear exposition with effect sizes of 0.79 and 0.83. Students rated the clear version as clear and became more confident while learning little; the refutation versions felt confusing and taught more. Low-prior-knowledge students gained most. (Graded Moderate: one RCT, one topic, immediate test; the paper itself was read through two secondary descriptions.) Two meta-analyses of refutation text point the same way: stating the wrong idea, refuting it and explaining beats plain exposition, with a moderate effect (Schroeder and Kucera 2022; Danielson et al. 2024).

The collision is a start, not the cure. Contradicting data alone often produces only a surface revision (Limón 2001), so the explanation after the reveal does the work, and the same wrong idea has to come back on a different surface later in the page (chunk checks and retrieval).

**Must contain**

- A commit step: the learner picks or types an answer, and the page records it before revealing anything. A "click to reveal" with no commitment gives the learner nothing to compare against.
- Distractors that are the misconceptions, each with its own explanation. Where a wrong idea could land on the right option by luck, add a "why" tier: pick the reason as well as the answer (two-tier items, Treagust 1988).
- A case the popular wrong model can't explain, so the contrast shows where that model breaks rather than just stating the right one.
- **A case the misconception gets wrong, verified by computing it both ways.** Run the hook's case through the correct engine and through each misconception function, and assert they differ (in the page's `checks` array, section 14). One iteration 1 hook used a stack that scored 18 under both the correct rule and the planted misconception, and told the misconception holder "Right."
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
- **Variants, not one fixed item.** Generate new items from data (new random orders tables, a different target note). A learner who misses gets explanation plus a fresh item, so they can't pass by clicking until the right option lights up.
- **Discriminating variants.** The generator keeps only items where each named misconception gives a different answer, with at most a small minority of non-discriminating ones, and its rate is measured (`artifact-craft.md`, section 5.8). One iteration 1 generator mostly produced single-colour stacks where the wrong rule and the right one agreed, so a learner holding the misconception passed "two in a row" uncontradicted about 56% of the time.
- **Stop on mastery, not on a level count.** Practice ends on a criterion such as "three right in a row on discriminating items", and only discriminating items count toward it. A learner who meets it moves on even if more levels were planned. In iteration 1 a six-level fading trainer outlasted the simulated learner, who quit at level 4 from tedium after already getting the idea.
- **A streak that has met every misconception.** "Three in a row" counts only once the streak's items, between them, have exposed each misconception the part targets. When one hasn't come up, draw the next item to expose it. Three random items left both of one lesson's key misconceptions untouched 36% of the time.
- **An "I've got this, test me" exit.** Draw two or three fresh random items, harder than the current level, that together expose every named misconception, and require all of them right. A single fixed item (in iteration 2, always the same Ab) can be remembered from a previous try or guessed. Passing finishes the part; a miss drops the learner into practice at the level that matches it, with the miss explained. This is expertise reversal handled in the page instead of by willpower.
- **A drill the skill is the easiest way to pass.** Check whether a shortcut solves it (arithmetic on given numbers, matching the shape of an option, a constant answer). If one does, change the task (`diagnosis-and-feedback.md`, section 11, item 10). If the objective says "without working it out" and the workaround is just slower (counting up from fret 0), time the item: measure the seconds, report right-but-slow separately, and don't count it toward mastery. Let the learner set the limit, and never auto-advance.
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

**Production, not recognition.** Retrieval items ask the learner to produce: type the row counts, write the WHERE clause, click every copy of the note on a blank board, type the fret, say the rule in a sentence. Put them in a context the lesson didn't practise: a new key, new tables, a new input, the reverse direction ("which note is at fret 8?" after drilling "where is C?"). Multiple choice in familiar settings measures whether the learner recognises the answer, and in iteration 1 the graders could answer one lesson's closing multiple choice from page load without doing any of it. Generated items also make the section useless to answer before the lesson, since there is nothing to copy. Use multiple choice here only for an item that can't be typed, and then with the hygiene rules in `artifact-craft.md`, section 5.1.

Why: practice testing and distributed practice are the two techniques Dunlosky et al. rate high utility across learners, materials and delays. Rereading and summarising rate low. A restated recap feels productive and is passive; convert every recap into a question.

**Must contain**

- **Every misconception covered.** Choose the closing items by coverage: each named misconception exposed by at least one item, checked at load. In iteration 2 a closing set picked as "items where many slips differ" contained no case for two of them.
- 3 to 5 mixed production items in a new context, interleaving the confusable ones (INNER vs LEFT, sharps vs flats). Interleaving helps most when the categories are easy to confuse (Brunmair and Richter 2019, g = 0.42 overall; blocking wins for vocabulary lists, so don't interleave unrelated word lists).
- Commit before reveal, and feedback that explains. A typed answer that matches a misconception's answer gets that misconception's explanation.
- **A soft gate in time.** Retrieval is worth most after a gap. Show a "Start from memory" button rather than live items, and if the learner finished the last chunk within the hour, say so ("This works best tomorrow; start anyway?"). Don't lock it.
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
- **Check each criterion against the domain.** Work one real case through every "you've got it when…" line: can a correct performance fail it, or a wrong one pass it? Iteration 1's "the last note of bar 12 is the root" was wrong over the V chord in bar 12, and the page then told the learner the resulting note was a mistake (`diagnosis-and-feedback.md`, section 11, item 9). The same applies to criteria built on the page's own reference: if the page plays the low copy of a note and the learner may play the octave above, say that the octave counts.

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
- **Prose describing generated content is generated or asserted.** Iteration 1's fretboard lesson had a correct engine and still failed the accuracy gate on three hand-written sentences: "a six-note lick that... finishes in box 2" (the lick ended on the root in box 1, as the page's own table showed), "a bass root on beats 1 and 3" (beat 3 played the fifth), and a goal of 60 bpm in the objectives against a rung labelled "70 bpm (the objective)". Every sentence that names a specific value about computed content (where a sequence ends, which beat plays which note, a count, a tempo, a total, which item is longest) is either filled in by script or covered by an assertion in a `checks` array that runs at page load in development and lists every failure in the console and on the page (`artifact-craft.md`, section 10).
- **Feedback strings and reasons are claims too.** In iteration 2 every computed note was right, and the lesson still failed the accuracy gate on prose: wrong-answer feedback giving a false reason ("box 1 to box 3 skips box 2"; nothing lies between them), and a memory check promising "everything is new keys" while reusing drill keys. Generate reasons from the engine where you can. Where you can't, assert them, and assert promises about the page itself (no retrieval key appears in the drills).
- **The domain's own spelling.** Render names the way the field writes them, from the data: flat keys with flats (Bb minor's root is Bb, not A#), dates and units in the locale the learner uses. A sharp-only lookup table is a correct number in the wrong word, and a learner copies it.
- **One home for each goal value.** Objectives, ladder labels, pass criteria and the summary all read the same constant (`GOAL_BPM`, `STREAK`), so 60 in one place and 70 in another can't happen.
- **Trace every value-bearing sentence before shipping.** Read the rendered page, and for each sentence that states a number, a position, a name from the data or a "first/last/longest", point to the code or check that guarantees it. A sentence you can't trace gets generated, asserted or rewritten without the value.
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

Run this before handing over any learning artifact. Every item maps to a root cause in the fretboard teardowns (`research/baseline/fretboard-teardown/`) or to a failure in the iteration 1 blind test (`testing/reports/iter-1.md`); the note after each item says which.

**Scope and learner**

- [ ] 1 to 3 objectives, each observable, each with a check in the page. *(Root cause 1: "teach me" read as "write the complete syllabus")*
- [ ] Multi-week request: unit 1 plus a course map only; later units wait for the learner's report. *(Root cause 1)*
- [ ] Session time stated, and the unit fits it. *(Load: L2 alone held nine intervals, a table and a three-week schedule)*
- [ ] One line naming who it's for, addressed to this learner, not someone else. *(wrong-learner: "your four models")*
- [ ] Placement check with "Not sure", ending in a route that changes the path (collapsed parts or a later starting level, overridable), not advice; physical prerequisites checked. *(no-diagnosis, missing-physical-prereq; iteration 1: routing was advice only in both lessons)*
- [ ] Every gate fails under each misconception the skipped parts repair, asserted in `checks`; placement items shown one at a time, none revealing another. *(Iteration 2: gates the misconceptions passed; question 4 gave away question 2)*
- [ ] Move-on bars are reachable in a session or two; mastery goes to review. *(Root cause 8: pass criteria as aspirations; mastery-cliff)*

**Content correctness**

- [ ] Every example, table, tab, diagram, count and answer key is generated from one data source in the script. *(Root cause 2: about 30 wrong tabs written from memory)*
- [ ] Engine outputs spot-checked by an independent route; facts the code can't derive checked against a source, or flagged on the page. *(Root cause 2)*
- [ ] No hedges standing in for checks ("verify this before trusting it"). *(F12: "check each note against the scale before you trust this")*
- [ ] Each worked example satisfies the rule it demonstrates. *(F03: the voice-leading example broke its own rule)*
- [ ] Every sentence naming a specific value about computed content is generated or asserted in a `checks` array that passes at load; every value-bearing sentence traced to its source. *(Iteration 1: the lick, bass-beat and tempo sentences)*
- [ ] Goals stated in more than one place read one constant and match. *(Iteration 1: 60 bpm vs 70 bpm)*
- [ ] Reasons in feedback and promises about the page ("all new") generated or asserted; names spelled in the domain's convention. *(Iteration 2: false box-join reason, A# for Bb, reused "new" keys)*
- [ ] Each concept has one home; later mentions are retrieval or links. *(Root cause 7, F30: guide tones taught three times, contradicting each other)*

**Learning sequence**

- [ ] The hook asks for a committed prediction that a common misconception gets wrong, verified by computing the case under each misconception. *(F38: lessons opened with claims, not problems; iteration 1: the hook rewarded the misconception)*
- [ ] Every placement, practice, mastery and retrieval item discriminates: each named misconception gives a different answer. Generators filtered, rate measured, non-discriminating items a small minority and never counted toward mastery. *(Iteration 1: 75% of one generator's items couldn't detect the misconception)*
- [ ] Misconceptions listed from the rules (dropped, over-applied, misordered, mis-scoped, boundary confused) as well as from sources, with no near-miss slip standing in for a derived one; every path, including the shortest placement allows, has at least two items exposing each one (two is a v0 number), asserted in `checks`. *(Iteration 2: the routed path never confronted two misconceptions; one had no catalogue entry. Iteration 3: the catalogue had "no cap" in place of a scope error, so the check certified the wrong list)*
- [ ] Simulated holders run before shipping: each misconception as a variant answer function, answering through the page's real routing and generators over about 200 seeds. In every seed the shortest route confronts each one at least twice, and no mastery or closing gate passes while holding it; the minimum across seeds is reported, not the average (`artifact-craft.md`, section 5.8). *(Iteration 3: a scope-error holder placed out of all five parts, and 1 seed in 200 met it zero times; Practitioner, v0 as a rule)*
- [ ] Wrong-answer feedback treats a match to a listed misconception as a likely cause, not a verdict: it names the idea, and the page re-tests it on a different surface before counting it fixed. *(Note K: bugs are unstable; one item is weak evidence)*
- [ ] Practice ends on a mastery criterion (v0) whose streak has exposed every targeted misconception; "test me" is two or three random items covering them all; no fixed level count past mastery. *(Iteration 1: the learner quit at level 4 of 6; iteration 2: 36% of streaks missed both key misconceptions, and "test me" was one fixed item)*
- [ ] No drill can be passed by a shortcut that skips the skill; recall drills timed where the shortcut is counting. *(Iteration 1: lick frets as root plus offsets; iteration 2: the root drill solvable by counting from fret 0)*
- [ ] Terms defined in the chunk that first uses them; legends next to their figures. *(forward-jargon; tab legend 4,000 lines below the first tab)*
- [ ] No answer visible before the attempt; fading is built into the page, not instructed. *(Root cause 6: "derive it" printed under the derivation)*
- [ ] Variants after a miss, and a streak to finish. *(Walkthrough #8: 20 random clicks passed the ear trainer)*
- [ ] A transfer task on a new surface. *(no-practice)*
- [ ] Retrieval at the end is production (typed, built, played) in a new context, with content out of sight, plus a dated return plan; no restated summary, no recognition-only multiple choice. *(F26: no cumulative retrieval; iteration 1: closing multiple choice answerable from page load)*

**Checks and progress**

- [ ] Every check can fail, says what failed, and changes what happens next. *(Root cause 4: self-report as assessment)*
- [ ] Wrong-answer feedback explains the specific error, not "try again". *(F24: "Not that one. Play it again")*
- [ ] Honor-system skills: observable numeric criteria, an external reference, a tempo ladder or equivalent, record-and-compare, and a "not yet" path that changes the plan. *(Root causes 4 and 8; unverifiable-self-check)*
- [ ] No check depends on the skill being trained. *(F19: "sing the leap")*
- [ ] Every "you've got it when…" criterion checked against the domain on a real case: a correct performance can't fail it and a wrong one can't pass it. *(Iteration 1: root on bar 12 over the V chord)*
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
- [ ] Rendered in a browser and played through at desktop and phone widths; the core task works at 390 px with no sideways scrolling; no console errors; `artifact-craft.md` checklist passed. *(Iteration 1: the main construction task scrolled sideways on a phone)*

<!--
Sources and findings behind this file:
- research/notes/E-artifact-design.md: finding 1 (seven-part blueprint), 2 (Mayer: coherence, contiguity, segmenting, pre-training, signaling), 3 (Muller et al. 2008 refutation, clarity is not learning), 4 (concreteness fading, Fyfe et al. 2014, contested 2021), 5 (checkable vs honor-system self-checks), 6 (placement check, expertise reversal lead), 7 (think vs decoration interactions, tool-island), 8 (single lesson vs multi-week; build unit 1 then wait), 9 (Matuschak and Nielsen mnemonic medium), and the teardown-to-blueprint table.
- research/notes/D-retention.md: finding 1 (Dunlosky 2013 utilities), 3 (in-session sequence, Brunmair and Richter 2019 interleaving), 4 (return plan, nothing reminds them), 5 (prerequisite audit, calibration, not-yet path), 6 (transfer on varied surfaces).
- research/notes/B-diagnosis-feedback.md: finding 1 (hinge questions, distractors as misconceptions, "not sure"), 2 (illusion of understanding), 3 (Wisniewski et al. 2020 feedback information), 5 (self-checks by domain, no mark-complete gate).
- research/notes/F-domain-pedagogy.md: worked examples for novices (Barbieri et al. 2023), subgoal labels, PRIMM predict-first, Parsons problems, slow practice and smallest failing unit, feedback on physical skill without observation (v0).
- research/notes/K-misconceptions-and-verification.md: findings 1 (repair theory precedent, bug instability), 2 (misconception distractors, two-tier items), 4 (refutation text), 5 (collision alone unreliable), 6 (knowledge in pieces); verdict table (two-times coverage and mastery gate stay v0).
- research/notes/I-video-educators.md: pass 2 techniques 1-2 (forced-choice opener, a case the wrong model can't explain); findings 1 (predict, worked example with a shown mistake, recap converted to retrieval), 2 (Muller video numbers 6.0 to 6.3 vs 11 of 26), 3 (motor-skill session shape, unverified).
- research/baseline/fretboard-teardown/01-instructional-design.md (F01 to F39, root causes 1 to 8), 02-learner-walkthrough.md (tags, quit point day 5), 03-guitar-teacher.md (about 30 factual errors, move-on vs mastery bar, lessons that generalize).
- testing/reports/iter-1.md, iter-1-grading-fretboard.md, iter-1-grading-driftstones.md: prose not checked against computed content, non-discriminating hook and generator, advice-only placement, practice past mastery, recognition-only retrieval, the bar-12 criterion, phone-width scrolling, the longest-option tell, the arithmetic drill. The rules drawn from them are Practitioner (one run per condition, graded by one model).
- testing/reports/iter-2.md, iter-2-grading-brindle.md, iter-2-grading-fretboard.md: placement gates the misconceptions passed, uncovered streaks and closing set, a missing catalogue entry, leaking placement, a fixed test-me item, false feedback reasons, sharp spellings in flat keys, a false "all new" promise, an untimed recall drill. Practitioner (one run per condition); the systematic misconception listing is v0.
- testing/reports/iter-3.md, iter-3-probe.md: a derived list that missed a scope error (a near-miss slip in its place), and a seeded simulation that found it. Mis-scoping in the derivation and the simulated-holder pre-ship run are Practitioner (one probe) and v0 as rules.
- Evidence grades: retrieval and spacing Strong; Mayer principles Moderate to Strong for short lessons; refutation Moderate; worked examples Strong for math novices; fading and concreteness fading leads at abstract level; the overall sequence, honor-system design and multi-week rules Practitioner or v0.
-->

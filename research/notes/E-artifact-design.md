# E. Instructional material and artifact design

**Research question:** Plan question 3 (how Claude builds material people actually learn from), with hooks into question 2 (how Claude knows it is working: placement checks, self-checks, progress).
**Sessions:** 2026-11-11

Scope note. The artifact target is a single static HTML file that Claude writes. No backend, no audio or camera analysis, no server-side grading. Anything that needs more than in-page JavaScript and `localStorage` has to be routed through the chat ("paste your attempt back to me") or left to the learner.

Verification note. Web access in this session was patchy (several publisher and transcript pages returned 403/404). Sources I opened are in `research/sources.md`. Several named leads (Merrill 2002, Fyfe et al. 2014, Kalyuga et al. 2003, Renkl and Atkinson fading, Chi and Wylie 2014, Wiggins and McTighe) showed up only as search snippets, not opened pages. Where a finding leans on one of those, it is graded as a lead and marked "not opened". The blueprint is a synthesis: its overall grade is Practitioner, and each part says what backs it.

## Findings

### 1. The artifact blueprint (parts, order, contents)
- **Claim:** A learning artifact is an ordered sequence of seven parts. Reference material is a separate, optional appendix, never the main path.
- **Evidence:** Practitioner (synthesis). Components: Mayer's multimedia principles are Moderate to Strong for short lessons (see finding 2). Merrill's problem-centered sequence of activation, demonstration, application and integration is a lead, not opened (search snippet only, Wikipedia-derived, so the claim that it improves mastery is unverified). Worked example to fading is a lead (Renkl et al. 2002 appeared in search results; I could not read it). Concreteness fading: see finding 4. Backward design (Wiggins and McTighe): not opened; used here only as the instruction "write the check before the content".
- **Boundary conditions:** Designed for self-paced, one learner, one topic. For an expert in the topic, the worked-example and pre-training parts should shrink or vanish (expertise reversal, a lead; Kalyuga et al. 2003 not opened).
- **What Claude should do differently:** Build in this order, and do not publish a part that is missing its "must contain".

| # | Part | Must contain | Why |
|---|---|---|---|
| 0 | **Placement check** (before anything) | 4 to 8 questions or "can you do X" probes, ordered easy to hard, scored in the page, ending in a route: "start at section 1 / skip to section 3 / you need prerequisite Y first". See finding 6. | Teardown #1, #11, #12, #34: the book was written for someone else and never checked who was reading. |
| 1 | **Outcome statement** | 2 to 4 sentences: "After this you will be able to ___" written as observable actions, each tied to a specific check later in the page. Plus time needed. | Backward design: the checks exist first, content serves them. Teardown #2, "Do I know what I can DO after each phase?" No. |
| 2 | **Hook and activation** | One concrete problem or puzzle the learner cannot yet fully solve, plus a quick recall of the one prerequisite they need. | Merrill (lead): start from a problem. Muller: starting from what the learner wrongly believes beats clean exposition (finding 3). |
| 3 | **Chunked core sequence** (3 to 6 chunks) | Each chunk: one idea, one worked example (steps labeled), then immediately a check on that idea. Terms defined at first use, in that chunk, not in a glossary later. | Mayer segmenting (0.77, 10 of 10 positive tests, per a secondary summary) and pre-training (0.75, 13 of 15). Teardown #9, #10, #38: wall of text and forward jargon. |
| 4 | **Worked example, then fading** | Chunk 1 fully worked; chunk 2 worked with one step blank; chunk 3 with more blank; final item the learner does alone. The blanks go backward from the last step first. | Renkl et al. (lead, abstract-level only; I could not read the paper). Teardown #29: the book's "stop reading after day two" was an instruction, not a scaffold, and the answer stayed on screen. |
| 5 | **Application task with a check** | One task that looks different from the examples (transfer), with a check that fits the domain (finding 5). | Merrill application phase (lead). |
| 6 | **Retrieval and integration at the end** | 3 to 5 questions on earlier chunks without the content visible, mixed order, one "explain why" item, and a "what will you do next" step. Also a day-later or week-later retrieval set the learner can reopen. | Matuschak and Nielsen: embedded retrieval at expanding intervals is the core of the mnemonic medium (finding 7). |
| 7 | **Reference appendix (optional)** | Tables, tab legends, glossary. Linked from where needed, collapsed by default. | Teardown #9: "reference, not a lesson" content placed on the main path. |

- **Example:** Teardown L02 shows the failure. It would become: outcome ("find any octave on the neck without counting from the nut"), hook ("find the other E on the neck"), one worked case with labeled steps, a fade (same move, last step blank), then a transfer task on a different string pair, then a retrieval set.
- **Failure tags addressed:** artifact-is-reference-doc, artifact-shallow, wall-of-text, no-practice, no-fading, forward-jargon, no-diagnosis.

### 2. Mayer's principles: which are worth enforcing, and the limits
- **Claim:** Cutting extraneous material, placing text next to the thing it describes, and breaking lessons into learner-paced segments each show consistent positive effects in controlled studies of short multimedia lessons.
- **Evidence:** Moderate to Strong for short lab-scale lessons. Summary table (Chartered College article, summarizing Mayer): coherence d = 0.86 (23 of 23 tests positive), spatial contiguity 1.10 (22/22), temporal contiguity 1.22 (9/9), redundancy 0.86 (16/16), signaling 0.41 (24/28), segmenting 0.77 (10/10), pre-training 0.75 (13/15), modality 0.76 (53/61), personalization 0.79 (14/17). Other summaries give different numbers (signaling 0.70 in one, 0.46 in another; coherence 18/19 in one), so treat the effect sizes as rough. I did not open the primary tables. The article said nothing on self-explaining, retrieval practice, or interactivity beyond segmenting.
- **Boundary conditions:** The article states that effects depend on working memory, prior knowledge and material complexity. Most of the underlying studies are short lessons for college students (my recollection, not verified here). Modality is irrelevant to a text-only HTML page.
- **What Claude should do differently:**
  - Coherence: drop decorative images, jokes unrelated to the objective, and "fun facts" from the learning path.
  - Contiguity: put the label on the diagram, and each explanation next to the example it explains (not 4,000 lines away, as the tab legend was in teardown #10).
  - Redundancy: do not show the same content as a paragraph and a bullet list and a table.
  - Segmenting: one idea per screen section with a "Next" that only appears after the check for that chunk is answered.
  - Pre-training: define the 2 to 4 terms a chunk needs before the chunk, inside the chunk.
  - Signaling: bold the one thing to notice in each worked step; use the same color for the same thing everywhere.
  - Personalization: write "you" and plain sentences.
- **Example:** Before: a nine-row interval table opens L02. After: three rows appear in chunk 1 with a prediction question; rows 4 to 6 unlock in chunk 2; the full table sits in the appendix.
- **Failure tags addressed:** wall-of-text, forward-jargon, cognitive overload.

### 3. Misconceptions must be confronted, and "clear" is not evidence of learning
- **Claim:** In one randomized study, online physics instruction that stated and refuted common misconceptions, or staged a student-tutor dialogue that did, produced much larger gains than a clear, correct exposition. Students rated the exposition as clear while learning little.
- **Evidence:** Moderate (one RCT plus the author's own video; I could not open the paper). Muller, Bewes, Sharma and Reimann (2008), J. Computer Assisted Learning 24(2): 364 first-year physics students randomly assigned to four online conditions (Exposition, Extended Exposition, Refutation, Dialogue) on Newton's first and second laws; pre and post items from mechanics conceptual inventories; effect sizes versus Exposition 0.79 (Refutation) and 0.83 (Dialogue); low-prior-knowledge students gained most and high-prior-knowledge students were not hurt. I confirmed these details in two secondary descriptions, not the paper (the PDF mirror returned 403). The Veritasium video "Khan Academy and the Effectiveness of Science Videos" (transcript opened) reports a 26-item multiple-choice test: standard video average 6.0 before and 6.3 after; misconception-dialogue video nearly doubled to 11 of 26 (about 00:03:37 and 00:05:56, approximate from chapter markers). In the video, students who saw the standard video said it was "clear, concise and easy to understand" and raised their confidence in their answers, yet did not remember what was presented; students who saw the dialogue said it was confusing and reported higher mental effort (about 00:05:00 and 00:06:06).
- **Boundary conditions:**
  - One topic (Newton's laws), a roughly 10-minute video, first-year university physics students, immediate post-test. Retention and other domains are untested here.
  - A topic where students arrive with strong wrong intuitions. Where learners have no prior belief (an arbitrary new library API), refutation has nothing to refute.
  - The video's numbers are Muller's own presentation. The video says the number of students is not stated, so I cannot confirm it is the same dataset as the 364-student paper. Treat the two as consistent in direction, not as one result.
  - A later paper (Muller and Sharma 2012, found in search only) is said to report a similar benefit in non-interactive settings; not opened.
- **What Claude should do differently:**
  - Before writing a lesson, list the 2 to 4 most common wrong ideas on the topic (use the "research the topic first" step). In the hook, ask the learner to commit to a prediction that a common misconception would get wrong, then show the result and name the wrong idea.
  - Never treat a rating like "was this clear?" or a confidence slider as a learning measure. If the artifact collects it, label it as a feeling and do not let it unlock progress.
  - Tell the learner that feeling confused at the misconception step is expected, so they do not read it as a bad lesson.
- **Example:** Before: "Heavier objects and lighter objects fall at the same rate because gravitational force and mass cancel." After: "Predict: a bowling ball and a tennis ball are dropped together in a vacuum. Which lands first? [commit] ... Most people say the bowling ball. Here is why that feels right and where it breaks."
- **Failure tags addressed:** artifact-shallow, no-diagnosis, demo-not-teach.

### 4. Concreteness fading and worked examples
- **Claim:** Start with a concrete, familiar instance, then deliberately move to the generic form, instead of starting with the abstract rule.
- **Evidence:** Moderate, from abstract-level only. Fyfe, McNeil, Son and Goldstone (2014), Educational Psychology Review 26: 9 to 25. I did not open the paper. A search snippet gives the claim: begin with concrete materials, then explicitly and gradually fade to the abstract, with four proposed benefits (interpreting opaque symbols, grounding, memorable images, stripping extraneous detail). The same search found a 2021 Educational Psychology Review paper arguing the approach may not be as general as claimed.
- **Boundary conditions:** The 2021 challenge; "concrete" must be something the learner already understands (a physical example the learner has not met is not concrete for them). Math and science evidence; unknown for procedures like git.
- **What Claude should do differently:** In each chunk, order the representation as: a specific example with real numbers or a real file, the same example with its parts labeled by role, then the general rule, then a new example that needs the rule. Do not open with the formula.
- **Example:** Teardown L03 opened with the abstract method ("one string up, two frets back"). Better: the learner builds C major on a chord they already play, marks which fret each role lands on, then states the rule, then applies it in another key.
- **Failure tags addressed:** demo-not-teach, wall-of-text, self-contradiction (the worked case catches errors the abstract rule hides).

### 5. Self-checks: split by whether the domain is machine-checkable
- **Claim:** A check is worth including only if it can fail, the learner can tell what failed, and a failure changes what happens next. What is feasible differs by domain.
- **Evidence:** Practitioner (design reasoning from the teardown, with the user's constraint that we are not building full apps). Backed in part by Matuschak and Nielsen's mnemonic medium, where a failed recall shortens the next interval (opened; their own evidence is preliminary and they say so).
- **Boundary conditions:** Matuschak and Nielsen themselves note unclear transfer from card recall to real-world action.
- **What Claude should do differently:**

**Checkable domains** (code, math, factual or conceptual questions, writing against a rubric). The artifact or Claude should really check.
  - Answer validation in the page: multiple-choice with an explanation per wrong option (which misconception each wrong option represents); numeric or short-text answers checked in JavaScript with normalization; ordering and matching tasks.
  - Code: give a function stub and tests the learner can run (a `<textarea>` and `new Function` or a small runner; keep it in-browser) or tell them to run tests locally and paste output back to Claude.
  - Open-ended answers: a "copy this prompt and paste your answer into the chat" box. Claude then grades against a stated rubric and feeds the result into the next step.
  - A wrong answer must show why it is wrong and require a retry on a variant item (a fresh question from a small bank, not the same one), so the learner cannot click through. In teardown #8 the ear trainer let 20 random clicks pass; the fix is a pool of variants and a streak requirement.
  - Do not put the answer in the hint (tag answer-in-hint). Hints go from "which step are you on" to "what rule applies" to a worked parallel example, and the actual answer only after attempts.

**Honor-system domains** (guitar, drawing, sport, anything physical). Self-report is inherent. Design inside the constraint, do not apologize for it.
  - Write pass criteria that an observer could verify: "four chords changed in time at 60 bpm, 3 times in a row, no buzzing strings, no stopping". Not "sounds good".
  - Tempo ladder: a row of boxes at 50, 60, 70, 80 bpm the learner ticks only after a clean run; the next box unlocks the next.
  - Record-and-compare: "record 30 seconds on your phone, play it back, answer these 3 yes/no questions about it" (is each note ringing, is the rhythm steady, did you stop).
  - An explicit "I couldn't do it yet" button. It must change what comes next: it opens a smaller sub-step, a prerequisite drill, or a "tell Claude what happened" prompt. In teardown #46 there was no failure path, so the schedule only advanced.
  - "Report back" box: a pre-filled message to paste into chat: "I did step 3 at 60 bpm, 2 of 3 clean, buzzing on the third string." Claude then adjusts.
  - Do not make "Mark done" the only progress mechanism. Store the evidence the learner entered (tempo reached, number of clean runs), so progress is visible at partial states (fixes mastery-cliff, teardown #43, #45).
  - Do not use a self-check that depends on the untrained skill (teardown #21, "sing the leap"). Replace with an external reference the learner can compare against (a reference recording, a tuner, a chord they already play, or a written answer in the page).
- **Example:** Honor-system check: "Pass when: switch G to C ten times in 30 seconds, every string rings. Tried it? [Clean] [Almost: 1 or 2 buzzes] [Not yet]". "Not yet" opens a two-finger-only drill and a prompt to tell Claude which finger is slipping.
- **Failure tags addressed:** honor-system-progress, no-feedback-loop, unverifiable-self-check, answer-in-hint, mastery-cliff, tool-island.

### 6. Calibrating to the learner: a placement check up front
- **Claim:** The artifact should find out where the learner is before presenting content, and route them.
- **Evidence:** Practitioner for the design; Moderate-lead for why it matters. Expertise reversal (Kalyuga et al. 2003, found in search, not opened) says instruction that helps novices can hurt experts, which is the rationale for routing. Muller's finding that low-prior-knowledge students gained most from misconception-focused material (finding 3) shows that prior knowledge changes what works. Teardown evidence is direct: the book assumed an experienced player, and the persona quit on day 5.
- **Boundary conditions:** A static page can only test what can be validated in the page. Short checks cost motivation if they feel like exams. For total beginners in a new domain, a 3-question "have you ever..." screen is enough.
- **What Claude should do differently:**
  - Ask in chat first (two or three questions about goal, time, and what the learner already does), then build the artifact with a placement section using the answers. If the user already told Claude their level, still include a short check, because self-report is unreliable.
  - Use 4 to 8 items ordered by difficulty, each item tied to a prerequisite. Include one "can you do X right now" item for physical skills ("play G, C, D in sequence without stopping").
  - Output a route, not a score: "Start at chunk 2; skip chunk 1 (you showed you know it); review prerequisite Y (this one you missed)". Let the learner override it.
  - Save the result and use it to prefill the review set. Mark skipped chunks as "assumed, test again at the end".
  - Make the artifact say who it is for in one line, and do not write to a named other person (teardown #24, #39).
- **Example:** Items for the fretboard book: "Name the open strings from low to high"; "Play an open C chord and tell me if every string rings"; "What does 'the 5th fret' mean on the low E string?" Wrong answers route to a Phase 0 chunk, not to Phase 1.
- **Failure tags addressed:** no-diagnosis, wrong-learner, missing-physical-prereq, forward-jargon.

### 7. Interactions that make the learner think, and ones that do not
- **Claim:** An interaction earns its place only if the learner must commit to something (a prediction, a construction, a choice) before seeing the result, and receives feedback that explains the difference.
- **Evidence:** Practitioner, partly backed. Bret Victor (opened) says the interactivity itself is not the point; widgets that "dump the user in a sandbox" leave the author's job undone; the text should stand alone as a static explanation, with interaction as optional depth woven into the argument. Matuschak ("Why books don't work", opened) argues readers need active engagement and built-in retrieval with feedback, because readers can think they understood and then fail simple questions. Chi and Wylie's ICAP ordering (interactive > constructive > active > passive) appeared in search results; one study found passive learners did best, so the ordering has boundary conditions. I did not open the paper. For the 3Blue1Brown text lesson (opened), the built-in prompts are predictions and rankings placed before the explanation ("which of four images would most activate the neuron", "sigma(-1000) is closest to which value?").
- **Boundary conditions:** Constructive tasks overload true novices (this is why worked examples come first). Prediction prompts need a learner with enough background to predict something. Interactive widgets cost build time and add risk of bugs, which in teardown showed up as self-contradictions.
- **What Claude should do differently:**

| Use (the learner thinks) | Why | Avoid (decoration) | Why |
|---|---|---|---|
| **Predict then reveal**: learner picks or types an answer, then sees the result and a contrast with their pick | Commitment plus feedback | **Click to reveal** with no prior commitment | Passive; nothing to compare |
| **Choose with explained feedback**: each wrong option says which misconception it is | Diagnoses, not only grades | **Toggles and tabs** that show alternate content with no task | Looking, not thinking |
| **Construct**: arrange steps, fill a blank in a worked example, drag labels onto a diagram, write the next line of code | Fading made interactive | **Accordions** that hide the text the learner needs | Hides, does not teach |
| **Parameter slider tied to a question**: "set x so the output is 10; what rule did you use?" | Explorable explanation with a goal | **Free sandbox with no task** (teardown #6 fretboard) | Click mindlessly |
| **Contrast replay**: show the learner's wrong answer beside the right one | Lets them see the difference (teardown #8 never did) | **Score counters** that vanish and feed nothing | No loop |
| **Reorder spaced retrieval** from saved results | Uses the data | **Progress bars** with self-reported ticks | Measures claims |

  - Every interactive element must be referenced by a step in the lesson ("use the slider to answer question 3"). A tool no step points to will not be used (tool-island).
  - Put the question before the widget moves, not after. Keep a static version of the same explanation (Victor: readable without interaction).
  - Test every worked example and tab by recomputing it (teardown top failure was self-contradiction in the content itself). If Claude cannot verify a number, it should say so on the page.
- **Example:** Instead of a fretboard that prints the note on click, show a blank neck, ask "where is every G on the low E and A strings? Click them", and mark each click right or wrong with the reason ("that is F#, one fret below G").
- **Failure tags addressed:** tool-island, demo-not-teach, no-feedback-loop, answer-in-hint.

### 8. Single lesson versus multi-week course artifact
- **Claim:** A multi-week course needs state, sequencing across sessions, and a per-session shape. A single lesson does not.
- **Evidence:** Practitioner (design inference from the teardown). Support: Matuschak and Nielsen's expanding-interval review (opened; a successful recall lengthens the interval from five days to two weeks to a month, a failed recall steps back one level; reporting about 95 minutes for six reviews yielding about 54 days of retention per question on average; the authors call parts preliminary and note small groups and possible confounds).
- **Boundary conditions:** Everything that needs the artifact to remember across sessions requires `localStorage` or the db capability. `localStorage` can be cleared and stays on one device, so a course must tolerate losing state (let the learner export or paste a "save code" and re-import it).
- **What Claude should do differently:**

| | Single lesson | Multi-week course |
|---|---|---|
| Parts | Blueprint parts 0 to 6 in one page | One page per week or unit, linked, each with parts 1 to 6; a course hub with the placement check |
| Progress | Checks inside the page | Evidence-based progress: scores, tempos reached, dates of last review per skill |
| Next step | "What to do next" paragraph | A session generator: each day = 1 warm-up retrieval from earlier units, 1 new thing, 1 application; plan changes when a check fails |
| Retrieval | End-of-page set | Expanding intervals; a failed item returns sooner. Also interleave older skills in later sessions |
| Fading | Within the lesson | Across weeks: week 1 scaffolded, week 3 less (tab visible to tab hidden) |
| Outcomes | Per lesson | Per unit with a unit check, and a course-level outcome, so progress is visible at each unit (fixes the "0 of 68 done" quit) |
| Size | One screen of work | A session fits the learner's stated time (20 to 30 minutes), and Claude must not ship all 68 lessons at once; build the next unit after the learner reports back |
| Plan adaptation | n/a | If the check fails twice, the plan changes (smaller step, prerequisite drill), not the same lesson regenerated (teardown plan-stall) |

  - Claude should produce the first unit and the course map, then build later units after the learner reports in chat. This keeps every unit tied to what the learner showed they can do, and avoids the 282 KB reference document.
- **Example:** Guitar course hub: "Week 1: change between G and C. Pass: ten clean changes in 30 seconds, 3 sessions in a row. Week 2 starts with a two-minute G/C recall, then adds D." If the learner reports "Not yet" twice, Claude builds a week 1b with one-finger-at-a-time drills.
- **Failure tags addressed:** plan-stall, mastery-cliff, honor-system-progress, artifact-is-reference-doc, no-fading.

### 9. Explorable explanations and the mnemonic medium: what to borrow, what to skip
- **Claim:** Treat the artifact as an argument or lesson the learner can interrogate and be tested on, not a pile of information.
- **Evidence:** Practitioner. Victor (opened): "an environment to think in" rather than "information to be consumed"; reactive documents let the reader change assumptions and see results; the author must "hold up their end of the conversation". Matuschak and Nielsen (opened): Quantum Country embeds 112 review questions in an essay; they report that 195 users maintained a month of retention on at least 80% of cards six months after release, and that atomic questions with varied formats work better than orphan cards; they retracted a claim that easy opening questions improve attention. I did not review Nicky Case's work (not opened), so nothing here relies on it.
- **Boundary conditions:** Quantum Country is a long text with a spaced-repetition system behind it; a static artifact can only approximate the scheduling. Self-selected users, no control group in the main claims.
- **What Claude should do differently:** Borrow: questions embedded in the flow, atomic one-idea cards, varied formats, expanding intervals approximated with a "return in 1 day, 3 days, 1 week" list and a failed item returning sooner. Borrow Victor's author responsibility: every interactive element is part of a stated argument. Skip: full simulations, anything that needs a server.
- **Example:** After chunk 2 the page adds three cards to a review deck in `localStorage`; the hub shows "3 due today".
- **Failure tags addressed:** artifact-is-reference-doc, no-practice, tool-island.

## How each failure in the Fretboard teardown is avoided

| Teardown pattern | Blueprint element that prevents it |
|---|---|
| no-diagnosis, wrong-learner, missing-physical-prereq | Part 0 placement check and a one-line "who this is for" |
| forward-jargon | Terms defined at first use inside the chunk; glossary only in the appendix |
| wall-of-text, artifact-is-reference-doc | Chunks with one idea each, "Next" gated by a check, reference in appendix |
| no-practice, demo-not-teach | Every chunk ends with a task the learner performs; worked example followed by fading |
| no-fading, answer-in-hint | Backward-fading blanks and a hint ladder that never starts at the answer |
| honor-system-progress | Observable pass criteria, tempo ladders, evidence entries, "couldn't do it yet" path, report-back box; real validation where checkable |
| mastery-cliff | Intermediate checkpoints and visible partial progress |
| plan-stall | Session generator that changes on failed checks |
| tool-island | Each tool referenced by a step with a question before use |
| unverifiable-self-check | Externally checkable criteria or comparison to a reference |
| self-contradiction | Recompute every worked example before publishing; worked case before the general rule; say on the page what was not verified |
| no-feedback-loop | Wrong answers explained, contrast replay, variant retry |

## Contradictions / open questions
- Mayer effect sizes differ across summaries (signaling 0.41 vs 0.46 vs 0.70). I could not open the primary tables. Use the principles directionally.
- Misconception-first versus worked-example-first: Muller's low-knowledge learners gained most from refutation, while cognitive load work says novices need worked examples. The blueprint puts a prediction in the hook and the worked example right after; whether the prediction should come before any instruction for true novices is untested here. Coordinate with area A.
- Whether the Veritasium video numbers and the 2008 paper are the same dataset is unknown.
- The claim that concreteness fading generalizes is contested (a 2021 paper pushes back; not opened).
- Not covered: Engelmann and Carnine example/non-example sequencing, Distill.pub, Desmos, Brilliant, Khan mastery design, Nicky Case. No source opened.
- ICAP: at least one study found passive learners did best; I did not read it. Treat "interactive beats passive" as a directional lead.

## Candidate skill text
Draft for `references/artifact-blueprint.md`:

> **Build a path, not a pile.** An artifact teaches when the learner has to do something at every step and finds out whether they were right. Order it: placement check, outcome statement, hook with a prediction, chunks (one idea, one worked example, one check), faded practice, a transfer task, then retrieval. Put reference material in an appendix. Why: a reader can feel they understood and still fail the first question, and clear explanations of correct content do not remove wrong prior ideas, so the page has to make the learner commit, then show the difference.
>
> **Pick checks by domain.** If a computer can check it (code, math, concept questions), check it in the page and explain each wrong answer. If it cannot (a physical skill), write observable pass criteria, give a "not yet" path that changes the next step, and ask the learner to report back in chat. Why: an honor-system toggle only measures claims, but an observable criterion plus a report to Claude can still be acted on.
>
> **Never trust the learner's rating of clarity.** In the one study I read, the video students called clear showed almost no gain. Use performance, not confidence, to decide what comes next.
>
> **Verify the content before publishing.** Recompute every worked example and table. If you cannot verify something, say so on the page. Why: a self-contradicting lesson costs the learner's trust, and a learner with no teacher cannot tell which source is right.

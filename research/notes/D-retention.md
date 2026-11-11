# D. Making it stick (retention and transfer)

**Research question:** Plan question 3 (building material people actually learn from) and question 2 (knowing it worked). The symptom this targets: the learner feels they learned but cannot do it later.
**Sessions:** 2026-11-11 (one pass, about 30 web calls shared with B and H).

Scope note (user correction): no full apps, no backends. "Across sessions" below means things Claude can do with a conversation, a follow-up offer, or a static page the learner returns to. Self-check design is split into **checkable** and **honor-system** domains.

## Findings

### 1. Dunlosky et al. (2013): what to use and what to drop
- **Claim:** Of ten popular study techniques, practice testing and distributed practice have the best evidence across learners, materials, and delays; rereading, highlighting, and summarizing do not earn their time.
- **Evidence:** Strong. Dunlosky, Rawson, Marsh, Nathan and Willingham (2013), *Psychological Science in the Public Interest* 14(1), 4-58 (opened; text extracted from the PDF). Ratings:

| Technique | Utility | Reason in the review (paraphrased) |
|---|---|---|
| Practice testing | High | Effects across learner ages, outcome measures, and retention intervals; little training needed |
| Distributed practice | High | Works across ages and materials; mostly demonstrated over longer delays |
| Elaborative interrogation ("why is this true?") | Moderate | Robust on fact lists; less known for longer, complex material and longer delays |
| Self-explanation | Moderate | Shown across domains and outcomes including transfer; durability over delays and real classrooms less established; training may help |
| Interleaved practice | Moderate | Rated moderate on current evidence (the section text was not reproduced in my extraction beyond the rating) |
| Summarization | Low | Works for learners already skilled at it; many learners are not |
| Highlighting or underlining | Low | Little help, and "may actually hurt performance on higher-level tasks" |
| Keyword mnemonic | Low | Works for keyword-friendly material, not efficient, may not last |
| Imagery for text | Low | Benefits limited to memory for the text itself, needs more demonstrations |
| Rereading | Low | Most effect on recall, unclear for comprehension; relatively less effective than other techniques is "the largest strike" |

- **Boundary conditions:** Authors caution the techniques "will not be a panacea" and help only students "motivated and capable of using them." Many ratings rest on college students and memory-type tests; for practice testing, the review notes that prior knowledge or ability as a moderator needed more work. Low ratings are relative, not "never".
- **What Claude should do differently:** Build sessions from retrieval and "why" questions, not from re-explaining or from Claude-written summaries. Stop offering "let me summarize what we covered" as the closer; ask the learner to produce it (see finding 3). Do not recommend highlighting, rereading, or keyword tricks as the main study plan.
- **Example:** Before: "Here's a summary of key points." After: "Close the chat window's scroll in your head. List the three steps and for each one say why it comes before the next."
- **Failure tags addressed:** artifact-is-reference-doc, illusion-of-fluency (proposed tag), no-practice.

### 2. Performance versus learning, and desirable difficulties
- **Claim:** Conditions that make practice feel easy often produce weaker retention, and conditions that feel harder often produce stronger retention; the learner's own sense of progress is not a reliable guide.
- **Evidence:** Moderate (a review-style magazine piece by APS summarizing Bjork and Bjork's work, opened). Spacing, interleaving, and testing are named as desirable difficulties. In the experiment described, students who practiced in blocks predicted they would do well on the next-day test and performed worse than the interleaved group.
- **Boundary conditions:** The same source says that "if the test occurs shortly after studying, massed practice often results in better test performance than does spacing." A difficulty is only desirable if the learner can actually succeed at it with effort; the source implies limits but does not state a rule. Cues present in practice but absent at test time can inflate practice performance. I did not verify generation-effect evidence.
- **What Claude should do differently:** Warn the learner when something will feel harder than rereading and say why ("this will feel worse than rereading and work better"). Keep difficulty at the level where the learner succeeds with effort, using the observed state from area B (errors, hints needed). Do not interpret smooth practice as proof.
- **Failure tags addressed:** illusion-of-fluency, demo-not-teach.

### 3. What Claude can do inside ONE session
- **Claim:** Within one conversation Claude can use retrieval, self-explanation, elaborative questions, and mixed practice; true spacing and delayed retesting only partly fit.
- **Evidence:** Retrieval and self-explanation: Strong and Moderate per finding 1. Interleaving: Moderate (Dunlosky rating). Interleaving meta-analysis: Brunmair and Richter (2019), Psychological Bulletin 145(11), 1029-1052 (abstract via Europe PMC, opened): 59 studies, 238 effects, overall g = 0.42; paintings g = 0.67, math tasks g = 0.34, expository texts and tastes not significant, words favored blocking (g = -0.39); stronger when categories are similar to each other, less similar within, and more complex. A 2017 practice-testing meta-analysis (Adesope et al., 118 articles, 272 effects, tests beat restudy; feedback moderator unclear) appeared in search results only; **I could not open it, so its figures are not verified**.
- **Boundary conditions:** Spacing benefits show up after a delay, so a few minutes between retrievals is a weaker version of spacing than days, and I did not verify its size. Interleaving helps most when the things being mixed are easy to confuse; mixing unrelated material gives little. Retrieval needs something to retrieve: do it after the learner has had a first exposure and a guided attempt, not on cold material.
- **What Claude should do differently:** Use this in-session sequence:
  1. **Retrieve before re-teaching.** Before explaining a related idea, ask for the last one ("what did we say causes X?"). A wrong or empty answer is information.
  2. **Generate before showing.** Ask for a prediction or a first attempt before the demonstration (ties to area A).
  3. **Self-explain the worked example.** "Why does step 3 come before step 4?" and "what would break if we skipped it?" (moderate utility, includes transfer measures).
  4. **Interleave confusable items.** After teaching two similar ideas (for example, `merge` versus `rebase`, mean versus median), give a mixed set where the learner must decide which applies, rather than five of one type then five of the other.
  5. **Re-ask later in the session.** Bring back an earlier item after other material, on a new surface, with the answer hidden until they commit.
  6. **End with learner-produced recall.** The learner writes the three things they would explain to someone else, or does a closing task; Claude checks, corrects, and adds. This keeps the `learn` skill's "recall before closing" idea, now graded Strong for retrieval and Contested for what size of benefit a few-minute gap gives.
- **Example:** Before: five identical practice problems about `rebase`. After: two on `rebase`, two on `merge`, one where either works and the learner must argue which they would use and why.
- **Failure tags addressed:** no-practice, illusion-of-fluency.

### 4. What needs follow-up across sessions
- **Claim:** Spaced retrieval over days is the high-utility version of distributed practice, and Claude can only prompt it, not run it.
- **Evidence:** Distributed practice rated High (Dunlosky 2013), mostly for delays of days or more. How much a single follow-up helps was not measured here.
- **Boundary conditions:** Claude cannot start a conversation. A static artifact has no server; browser storage works only per browser and per device and can be cleared, so any "schedule" lives in the learner's hands. Over-promising a system the page cannot run is the failure to avoid.
- **What Claude should do differently:**
  - At the end of a teaching session, offer a **return plan**: "In two days, come back and ask me for a quiz on this. Then again in a week." Give the learner three or four retrieval questions to keep, with answers hidden or provided separately.
  - When a returning learner opens a new session, **start with retrieval**, not a recap: ask what they remember before refreshing it. If memory features exist, use them to note what was shaky; if not, ask the learner to paste their earlier notes or questions.
  - In artifacts, build a "come back later" section: a short set of mixed questions from all sections, labeled with a suggested interval (day 2, day 7), with answer reveals that require a typed or chosen commit. Say plainly that nothing will remind them; they must set their own reminder.
  - Expand intervals rather than repeat at the same gap (Practitioner; the review rated spacing high but the schedule evidence was not checked here).
- **Example:** "Before you close this: here are 4 questions, none answered here. Put them in your notes and try them on Thursday without looking. If you miss two or more, paste them here and we will re-teach just those."
- **Failure tags addressed:** artifact-is-reference-doc, no-practice.

### 5. Self-testing design when no teacher is present
- **Claim:** A self-check works when the learner must commit to an answer, something checks it, and the check only uses skills already taught; a "mark done" button does none of these.
- **Evidence:** Practitioner, built on Strong evidence that practice testing helps (finding 1) and Moderate evidence that unchecked feeling of knowing misleads (finding 2). The motivating failure (honor-system "mark done" buttons; checks requiring unlearned skills) came from the project's example artifact. The Adesope moderators on feedback and format are not verified.
- **Boundary conditions:** In a static page, "check" means stored answers, small client-side tests, or a model answer shown after commit. Free-form writing, audio, and physical performance cannot be machine-checked.
- **What Claude should do differently:**
  **Checkable domains (code, math, concept questions, writing with a rubric).** Verify for real.
  1. Each item has a prerequisite audit: name the section that teaches what it needs; no item may require material that comes later.
  2. Learner commits (types or selects) before any answer appears.
  3. The page checks: stored answers with accepted variants, small test cases for code, per-option explanations for multiple choice. For rubric-graded writing, show a model answer and a short rubric and have the learner mark each criterion with a quote from their own answer.
  4. After a miss: explanation, a pointer back to the section, and a new item of the same kind later.
  5. Mix items from earlier sections into later checks (retrieval and interleaving), not only the section just read.
  6. In chat, Claude is the checker and says what it verified.
  **Honor-system domains (guitar and other motor or physical skills).** Design the self-assessment.
  1. Observable criteria with numbers: tempo, number of clean repetitions, no buzz, changes on the beat.
  2. Record and compare to a reference; listening back reveals what playing hides.
  3. Calibration: predict before the attempt, then compare prediction to outcome and say what the gap means.
  4. A "not yet" path with a named drill, and spaced repeats of the same criterion on later days.
  5. Say plainly what the page cannot see.
- **Example:** Checkable: "Write the SQL for customers with no orders. [Run test]. The test returns 12 rows; you returned 0. A LEFT JOIN keeps customers with no match; yours is an INNER JOIN. Back to 'Join types'." Honor-system: "Day 1: C to G at 50 bpm, 5 clean changes. Day 3: same at 60. Record each day; compare."
- **Failure tags addressed:** artifact-is-reference-doc, no-practice, no-feedback-loop.

### 6. Transfer
- **Claim:** Transfer needs practice on varied surfaces with the same structure, plus the learner explaining why.
- **Evidence:** Practitioner here, supported by the self-explanation rating (effects "including transfer", Dunlosky 2013) and the interleaving moderators (benefit when categories are similar to each other). I have no direct transfer meta-analysis verified.
- **Boundary conditions:** Near transfer is far easier than far transfer; the sources opened do not settle far transfer.
- **What Claude should do differently:** After a worked example, change the surface (names, context, numbers) and keep the structure; then change the structure slightly and ask what stays valid. Ask "what is the same, what is different?" between two problems.
- **Failure tags addressed:** no-practice, demo-not-teach.

## Contradictions / open questions
- **Within-session spacing**: no source opened gives the size of the benefit of retrieval after minutes rather than days. Claim in finding 3 is a design choice, not a measured result. Test in evals with a delayed in-session probe.
- **Interleaving**: Dunlosky rates moderate; the 2019 meta-analysis (opened) finds g = 0.42 overall but blocking wins for words and expository text is null. Use it for confusable categories and math or procedure types, not vocabulary.
- **Feedback after retrieval**: unclear from sources opened. Claude should give feedback anyway (area B), but the size of the benefit over testing alone is unverified.
- Not read: Make It Stick, Rosenshine (2012), Willingham, Roediger and Karpicke, Cepeda et al. on spacing intervals, Rohrer. The `learn` claim "recall before closing is what makes it stick" is **kept** (Strong for retrieval) with the gap caveat.
- **YouTube**: a search for Bjork talks found slides and summaries but no video I could open; no timestamped source is logged. Lead: Bjork's APS convention talk (2016) and Learning and the Brain recordings.
- Unverified claim from a search result: a blog attributes the "illusion of knowing" label to Bjork (2011); the blog got his first name wrong; do not cite.

## Candidate skill text
> **Make learners retrieve, not reread.** The best-supported ways to make learning last are practice testing and spacing; rereading, highlighting, and summaries written for the learner feel productive and help little. So after you teach something, ask the learner to bring it back out: predict, explain why, solve a new version, or list what they would tell someone else. Do this before you re-explain. When two ideas are easy to confuse, mix practice on them instead of doing one type at a time. Tell the learner when you are making it harder on purpose and why, because it will feel less smooth than review.
>
> **Close with the learner's recall, not your summary.** Ask for the main ideas and one thing they would do differently, then fill in what is missing.
>
> **Offer a return plan.** You cannot message the learner later, and a page has no reminders. Offer three or four questions to try in two days and in a week without looking, and tell them to bring misses back. When someone returns, start by asking what they remember.
>
> **Self-checks in artifacts must be checkable and fair.** For code, math, concepts, and rubric writing, make the page verify answers, make the learner answer first, and only test what was already taught. For motor skills, use observable criteria, recordings, prediction before checking, and a named drill for "not yet".

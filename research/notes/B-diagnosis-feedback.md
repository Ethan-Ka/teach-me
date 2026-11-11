# B. Diagnosis, checking for understanding, and feedback

**Research question:** Plan question 2 (how does Claude know it's working?), with a link to question 3 (what a self-check in an artifact should look like).
**Sessions:** 2026-11-11 (one pass, about 30 web calls; several primary PDFs could not be read, see "Contradictions / open questions").

Scope note (user correction): we are not building full apps. No audio detection, no backends. Guidance below is split into **checkable domains** (code, math, concept questions, writing against a rubric), where Claude in chat or the artifact should actually verify the answer, and **honor-system domains** (guitar and other motor or physical skills), where self-assessment is unavoidable and should be designed well, not treated as a flaw.

## Findings

### 1. A repertoire of diagnostic probes (one at a time, before and during teaching)
- **Claim:** A short question whose wrong answers each point to a specific misunderstanding tells Claude more than "does that make sense?", and the next move should be planned for each possible answer before the question is asked.
- **Evidence:** Practitioner for the probe list as a whole. Hinge-question design rules are Moderate: a teacher-facing summary of Wiliam (2015), "Designing great hinge questions", says a hinge question should elicit a response from every student, be quick to answer, have distractors that reflect different misconceptions, and "elicit the right response for the right reason"; plan "B into plan A from the start" (Chartered College page, opened). The same page warns that one question can give unreliable information if poorly designed. I did not read Wiliam's article itself.
- **Boundary conditions:** Hinge questions were designed for a whole class where the teacher sees many responses at once. In 1:1 chat there is one response, so a single probe is weak evidence; use two or three across different surfaces. Multiple choice can be guessed, which is why "right answer for the right reason" matters. Claude cannot see hesitation, so a short answer is often more informative than a choice.
- **What Claude should do differently:** Pick a probe by what Claude needs to learn, ask one, and decide in advance what each answer would mean:
  1. **Hinge question (checkable).** Multiple choice or short answer where each wrong option maps to one named misconception. Use when about to move on from a concept.
  2. **Predict-then-explain.** "Before I run this / before we solve it, what do you expect happens, and why?" Reveals the learner's working model, including the wrong one, before Claude's demonstration can overwrite it.
  3. **Error analysis.** Show a plausible wrong solution or buggy snippet and ask "what is wrong here and why would someone write it?" Cheap to build, hard to answer with surface recognition.
  4. **Teach it back to a defined novice.** "Explain this to a colleague who has never seen it." Better than "explain in your own words", which invites paraphrasing Claude's sentences.
  5. **Transfer probe.** Same structure, new surface (new variable names, a new scenario). Passing the worked example's surface proves little.
  6. **Confidence plus answer.** "Answer, then rate 1 to 5 how sure you are." A confident wrong answer is the most useful signal Claude can get (see finding 2).
  7. **Contrast pair.** "How is X different from Y?" for the two ideas the learner is most likely to merge.
  8. **Cold start.** Before teaching a topic, ask for one small task or prediction at the learner's claimed level, not "what do you already know?" (self-reports of prior knowledge are unreliable).
- **Example:** Before: "Does that make sense?" -> "Yes." After: "Quick check. This loop runs `for i in range(3)`. After it finishes, what is `i`? (a) 2 (b) 3 (c) error (d) not sure." Answer (b) tells Claude the learner is counting to the limit, not to the last value; the next move targets that.
- **Failure tags addressed:** no-diagnosis, wall-of-text, no-feedback-loop (tags not yet defined in research/baseline/failures.md; names taken from PLAN.md).

### 2. Detecting an illusion of understanding
- **Claim:** Feeling that something makes sense, or performing well while Claude is helping, is a weak sign of learning; "what we can observe is performance, but what we have to infer is learning" (R. Bjork).
- **Evidence:** Moderate. APS Observer piece on Bjork and Bjork (opened): performance during instruction is "an unreliable" index of learning; in one experiment, students who used blocked practice predicted they would do well next day but did worse than the interleaved group; rereading and blocked practice "cause illusions of learning". Dunlosky et al. (2013) rate rereading low utility partly for the same reason (opened). The specific "illusion of explanatory depth" work (Rozenblit and Keil) is a lead I did not open.
- **Boundary conditions:** The signals below are Practitioner heuristics built on that evidence. A learner who says "got it" may be right. Novices overrate more than experts, but I did not verify that here.
- **What Claude should do differently:** Treat these as red flags and answer them with a production task, not another explanation:
  - "Yes, makes sense" or "got it" with no attempt.
  - Fluent paraphrase of Claude's own wording (parroting).
  - Correct on the worked example, wrong or stuck on a new surface.
  - Correct only after two or more hints (record this as "needed help", not "got it").
  - High confidence rating on a wrong answer (the key sign).
  - Good in-session performance on a blocked set of the same problem type (the learner knows which procedure to use because Claude just named it).
  Also check later, not just now: re-probe the same idea 10 to 20 minutes on with a new surface, and say so ("I'll ask you something like this again in a bit").
- **Example:** After a recursion explanation the learner says "ok, clear." Claude: "Great. Without looking up, what does `f(3)` return for `f(n) = n + f(n-1)`, `f(0)=0`? Write the call order." Not "Shall I go on?"
- **Failure tags addressed:** no-diagnosis, demo-not-teach.

### 3. Feedback: what to say (Hattie and Timperley levels, with the 2020 re-check)
- **Claim:** Feedback works to the degree it carries information about the task or the strategy; praise and person-directed comments add little, and a sizeable share of feedback effects is negative.
- **Evidence:** Strong for the direction, Moderate for the exact numbers. Wisniewski, Zierer and Hattie (2020), a meta-analysis of 435 studies, 994 effects (opened, first 100k characters): overall d = 0.48 (0.55 before removing outliers, with 17% of effects negative); reinforcement or punishment d = 0.24, corrective d = 0.46, high-information feedback d = 0.99 ("feedback is more effective the more information it contains"). It describes Hattie and Timperley's four levels as task, process, self-regulation, and self, and says "the least effective is self or praise feedback." It reports Kluger and DeNisi (1996), 131 studies, mean d = 0.38, with "about a third of the effects" negative. I did not read Hattie and Timperley (2007) or Kluger and DeNisi directly; the mechanism for when feedback hurts (attention drawn to the self rather than the task) comes from my background knowledge and is **unverified here**.
- **Boundary conditions:** Heterogeneity is high (I-squared 86%), so "feedback cannot be understood as a single consistent form of treatment." Student-to-student d = 0.85 rests on eight studies. Motivational outcomes show d = 0.33, lower than cognitive outcomes (0.51). Timing was not coded.
- **What Claude should do differently:**
  - Say what is right or wrong **in the work** and **why**, then the next step: "Your base case is right; the recursive call doesn't shrink n, so it never stops. What should it pass instead?"
  - Prefer **process** feedback ("you checked the sign before expanding, that is why it came out right") and **self-regulation** feedback ("how would you check this yourself?") over bare "correct".
  - Drop "great job!", "you're so close", "you're a natural". They are self-level feedback and carry no information.
  - Do not comment on the learner's ability or speed. Comment on the work.
  - Keep it to one or two points. Naming five problems buries the one that matters (Practitioner).
- **Example:** Before: "Nice try! Not quite. The answer is 12." After: "You added the exponents, which is the rule for multiplying same bases. Here the terms are added, so that rule doesn't apply. Try rewriting 2^3 + 2^3 first. What do you get?"
- **Failure tags addressed:** no-feedback-loop, over-praise (proposed tag).

### 4. Feedback: timing, hints versus answers, and learner level
- **Claim:** Give more directive, immediate help to learners who are struggling on new material, and more delayed, hint-style feedback to those who are doing well. The timing literature itself is mixed.
- **Evidence:** Contested. Shute's review (ETS 2007 research report version; the 2008 journal text was not readable, see open questions) says the timing effects are "mixed" with "no consistent main effect" but interactions: for low-achieving students "need the support of immediate feedback in learning new tasks they may find difficult"; for high-achieving learners use "facilitative feedback" such as hints, cues and prompts, and verification feedback may be enough; provide "early support and structure" to low-achievers; for learners with low learning orientation give "specific and goal directed" feedback and keep the goal in view. A preliminary conclusion in the report: delayed feedback may be superior for transfer, especially in concept formation, while immediate feedback is more efficient for procedural skills (programming, mathematics). The cited meta-analysis of computer-based feedback found 0.80 for immediate outcomes and a much smaller effect for delayed outcomes (Azevedo and Bernard 1995, as quoted by Shute; not opened).
- **Boundary conditions:** Task type (procedural versus conceptual), learner level, and what outcome is measured (immediate versus later). "Low-achieving" and "high-achieving" are crude proxies; Claude should use observed state (errors, hints needed) instead.
- **What Claude should do differently:** After an attempt (never before; let them try first), choose by observed state:
  - Learner failing the same step twice, or procedural content new to them: immediate, specific correction plus the reason, and a worked step if needed.
  - Learner mostly right: a hint or a question that points at the error ("which line would fail for an empty list?") before giving the fix.
  - Conceptual content aimed at transfer: let a wrong answer stand for one more beat, then ask them to test it on a new case and see the contradiction themselves.
  Always confirm what is correct as well as what is wrong; verification alone is enough for the learner who is mostly right.
- **Example:** Learner has failed an off-by-one twice -> "The loop stops one early: run it by hand for a list of length 2 and write down i at each step." (hint). Failed a third time -> show the fixed line and the trace.
- **Failure tags addressed:** demo-not-teach, no-feedback-loop.

### 5. Self-checks and feedback in artifacts, split by domain
- **Claim:** A check is only a check if something other than the learner's wish to be finished decides whether it passed, and if the learner has already been taught what the check needs.
- **Evidence:** Practitioner (design rules), anchored to Moderate evidence: feedback needs information (finding 3), and performance without checking is an unreliable index of learning (finding 2). The failing example artifact (honor-system "mark done" buttons; self-checks that relied on skills not yet taught) is the motivating case; the rules below follow from it.
- **Boundary conditions:** In a static HTML page, "verify" means: compare against stored answers, run a small JavaScript check, or reveal a model answer after the learner commits. It does not mean grading free-form audio, video, or open essays.
- **What Claude should do differently:**
  **Checkable domains (code, math, concept questions, writing with a rubric): the artifact or Claude actually verifies.**
  1. Every check item must use only skills the page has already taught. Before shipping, list each check item and the section that teaches its prerequisites; remove or move any item whose prerequisite comes later.
  2. Commit before reveal: the learner picks or types an answer, then sees the result. No visible answer next to the question.
  3. Verify in the page: multiple choice with per-distractor feedback ("you did X, which is correct when Y"), numeric or short text answers with a tolerance and accepted forms, code tasks with small test cases the page runs. Where free text cannot be machine-checked, show a model answer and a 3 to 5 item rubric and ask the learner to mark each item yes or no with evidence from their own answer.
  4. Feedback text is information (finding 3): correct answer, why, and what to retry. Never just "Incorrect, try again".
  5. Give a way back: a wrong answer links to the exact section or offers one simpler item, then the original item returns later.
  6. No "mark complete" buttons as the only gate. Progress is earned by a passed check, not a click.
  7. In chat: Claude checks the answer itself, names the specific error, and does not accept "I did it" without seeing the work.
  **Honor-system domains (guitar and other motor or physical skills): design the self-assessment, do not apologize for it.**
  1. Concrete observable criteria, not "play it well": "all six notes ring without buzz at 60 bpm, three times in a row", "chord changes land on beat 1 with no gap".
  2. Record and compare: "record yourself, listen back with this checklist, compare to the reference clip." Self-listening catches what self-feel misses.
  3. Calibration prompt: predict before checking ("Which of these three changes will be slowest? Rate your confidence, then time them"), then compare prediction to result. This trains the self-regulation level of feedback.
  4. An honest "not yet" path: every criterion has a named next drill for the failure ("buzz on the 3rd string -> finger closer to the fret, drill X"), and "not yet" is shown as the normal outcome of a first try.
  5. Tell the learner what Claude cannot see, and offer to review a description or a pasted tab or recording notes in chat.
- **Example:** Before: a lesson ends with a "Mark lesson done" button. After (checkable): "Three questions on the material above. Type your answer, press Check." The page then shows right or wrong, why, and a link to the relevant section. After (guitar): "Play C to G five times at 50 bpm. Pass means every change lands on the click and no string buzzes. Tick each only if the recording shows it. If not yet: slow to 40 bpm and do the 'anchor finger' drill below."
- **Failure tags addressed:** artifact-is-reference-doc, no-practice, no-feedback-loop.

### 6. Prior knowledge and misconceptions (not opened this session)
- **Claim:** Prior knowledge, including wrong ideas, shapes what the learner takes from a lesson.
- **Evidence:** Lead only (Ambrose et al., *How Learning Works*, ch. 1; conceptual change research). Not read; do not rely on it until verified.
- **What Claude should do differently:** Nothing new beyond finding 1 until verified.

## Contradictions / open questions
- **Shute 2008 Tables 2 and 3** ("things to do" and "things to avoid") could not be read. The ETS 2007 version I could read gives the ability and timing prescriptions above but I did not recover the tables. Read the 2008 article before turning these into skill text.
- **Hattie and Timperley 2007** and **Kluger and DeNisi 1996** were not read. Levels and the "about a third negative" figure come from the 2020 meta-analysis's description of them. The reasons feedback hurts need a direct read.
- **Timing** (immediate versus delayed) is contested; the rules in finding 4 are a starting contingency, not settled. Test in evals.
- **Lemov** techniques (Check for Understanding, Cold Call, Right Is Right) and **Wiliam talks on YouTube** were not verified. A search found no clear YouTube video of Wiliam on hinge questions; one lead is a Wiliam clip on questioning linked from David Didau's blog, and the Leeds/UCL assessment-for-learning course. No timestamped source logged.
- Does asking a probe in chat feel like an exam and reduce willingness to answer? Not researched; belongs with area C.
- `learn` claim "dialogue without diagnosis produces more engagement and no more learning": no direct evidence found here; keep as Practitioner, consistent with Bjork on performance versus learning.

## Candidate skill text
> **Check understanding by asking for production, not agreement.** "Does that make sense?" almost always gets "yes", and feeling that something makes sense is a poor sign that it was learned. Instead ask one small question whose wrong answers would tell you what the learner is thinking (a prediction, a "what's wrong here?", a new-surface version of the example, or "explain it to someone who's never seen it"). Decide beforehand what each answer would mean and what you would do next. Treat "got it" with no attempt, a fluent copy of your own words, success only after hints, and a confident wrong answer as signs the understanding is not there yet.
>
> **Give feedback about the work, with information.** Say what is right, what is wrong, why, and one next step. Skip praise that carries no information and never comment on the learner's ability. Feedback that says more about the task and the strategy helps more than "correct" or "good job", and some feedback makes things worse. Struggling on new material: be direct and immediate. Doing well: ask a hint-sized question first.
>
> **In artifacts, check with something that can check.** For code, math, concept questions, and rubric-graded writing, the page or you must verify the answer, let the learner commit before seeing it, and explain mistakes. Never gate progress on a "mark done" click, and never ask a check that uses a skill taught later. For motor skills such as guitar, self-assessment is unavoidable, so write observable pass criteria, ask for a recording to compare, ask for a prediction before the check, and give "not yet" a named next drill.

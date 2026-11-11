# I. How top video educators teach

**Research question:** Plan question 3 (how Claude builds material people learn from) and question 1 (when to tell, guide, or hand over), using public video as a sample of expert practice.
**Sessions:** 2026-11-11

## Method and what was actually coded (read this first)

Transcript access was the bottleneck. `yt-dlp` was not installed, YouTube watch pages returned only navigation text, and several transcript sites returned 403, 404, 410 or 500. What I could open:

| Source | What I had | Coding quality |
|---|---|---|
| 3Blue1Brown, "But what is a neural network?" (ch. 1) | The official written adaptation on 3blue1brown.com (not a transcript, adapted by a text author) plus a chapter-level summary with timestamps (0s, 2m56s, 8m26s, 13m37s) from a third-party site | Text moves only. Video timing and visuals not coded. |
| Karpathy, micrograd (YouTube `VMj-3S1tku0`, 2h25m) | Partial auto-transcript with time codes on rosetta.to; first ~100k of 132k characters read; closing not read | Good for moves 2, 3, 5, 7, 8. Time codes are approximate (from chapter markers and a notable-quotes list). |
| Veritasium, "Khan Academy and the Effectiveness of Science Videos" | Auto-transcript on rosetta.to with chapter markers | Good for the study claims; not a teaching demonstration. |
| JustinGuitar | Only search-result snippets about course structure; the lesson and community pages returned 403 | Not coded. Sequencing below is labeled unverified. |

So the coded set is 3 videos (one of them as text only), not 6 to 8, and no domain-expert learning-strategy creator (Justin Sung, Ali Abdaal) was coded. The frequency column is out of 3 and is a weak signal. Evidence grade for everything from video: Practitioner, unless stated.

## Findings

### 1. Coded teaching-move table
Codes: 1 hook or problem first; 2 asks viewer to predict or pause and try; 3 worked example; 4 anticipates the misconception; 5 concrete to abstract; 6 visual carries the structure; 7 recap or retrieval; 8 "now you try" with a check. Sources: 3B = 3Blue1Brown (text version), K = Karpathy, V = Veritasium (the video makes claims about teaching but is not itself a lesson, so it is coded only where it shows a move).

| Move | Where seen (quote, time) | Freq. (of 3) | In a chat turn | In an artifact | Does not carry over |
|---|---|---|---|---|---|
| 1 Hook or problem first | 3B: "The program above can identify hand-drawn digits 0-9 reasonably accurately. Give it a whirl" (intro; the video chapter at 0s is "the intuition and the challenge"). K: opens by promising to start "from a blank Jupyter notebook" and show "what neural network training looks like under the hood" (00:00:00 to 00:00:25); a goal, not a puzzle. | 2 of 3 (K weaker) | Start the turn with a task the learner can attempt, or a surprising case, before any definition | Interactive demo or puzzle at the top; the lesson explains how it works after the learner has seen it | The video's wow factor and production quality |
| 2 Predict or pause and try | K: "pause the video here and see if you can figure it out yourself" (about 01:27:05, power-rule derivative); "do you expect f of x plus h to be slightly greater than 20" (about 00:08:08). 3B text: "what kind of digit does this network think it's looking at?"; ranking of four images; "sigma(-1000) is closest to which value?" | 2 of 3 | Ask for a guess before showing. Wait for the answer before continuing | Prediction items before each reveal; commit, then show result with explanation | Karpathy cannot see whether the viewer paused; in chat Claude can wait for the answer, and in the artifact the reveal should be gated |
| 3 Worked example | K: numerical derivative of a function at x = 3 with h = 0.001 (about 00:08:08); hand-computed backprop (about 00:32:10). 3B: one digit network used all the way through. | 2 of 3 | Show one worked case with each step labeled, then switch to a parallel case for the learner | Labeled steps; then faded versions | Karpathy shows live typing and errors; a static page loses the "watch the mistake happen" effect unless the mistake is written in |
| 4 Anticipates the misconception | K: "you forgot to zero grad before that backward" (about 02:11:01), a real bug shown on screen. 3B: "admittedly kind of an arbitrary choice" about 2 hidden layers of 16; "Whether or not this is how our final network actually works is another question." V (as a claim): "with the veritasium films I always try to start with the misconceptions" (about 00:06:57, approximate). | 3 of 3 but mild (two are honest limits, one is a shown bug, only V is about confronting prior beliefs) | Name the common wrong idea, ask which the learner holds, then contrast | Wrong-option feedback that names the misconception; a "common mistake" callout after the check, not before | Video cannot find out which misconception this viewer holds; chat can |
| 5 Concrete to abstract | K: x = 3 with numbers first, then h to 0, then the formula and a numerical check (about 00:08:08 to 00:32:10). 3B: digit pixels, then layers, then "the entire network is just a function" (recap section). | 2 of 3 | Start with a specific instance, then the rule | Concrete case, labeled parts, then the general rule | None significant |
| 6 Visual carries structure | Not coded: I read only text and chapter titles. 3B's chapter titles (layers, weights and biases, matrices) suggest the visual follows the structure, unverified. | not coded | A short diagram or table in the reply if the structure is spatial; otherwise skip | Diagram next to the explanation it supports | Animated, continuously changing visuals; use a static diagram or a stepper |
| 7 Recap or retrieval | K: "so let's quickly recap what we've done so far" (about 00:32:10); a chapter titled summary at 02:14:03. 3B text: recap section "The Network Is Just a Function". Both recap by restating, not by asking. | 2 of 3 (restated, not retrieved) | Replace the restated recap with a question: "before I recap, what are the three steps?" | End-of-page retrieval set; do not copy a restated summary | A restated recap is passive; it should be converted to retrieval |
| 8 "Now you try" with a check | K: pause-and-derive prompts; the numerical gradient check "inline gradient check" (about 00:32:10) is a self-verifying check, and "zero grad" shows the loop. 3B text: no homework; points to Nielsen's online textbook with code. V: none. | 1 of 3 (K only) | Give a task with a check the learner can run (code, a number to match) and ask them to paste the result back | In-page validation or tests; "paste your answer to me" | Passive viewers skip the task. In video, the "check" is the creator's own result on screen |

**Grade:** Practitioner. Karpathy's use of numerical checks matches the self-check design in note E (finding 5); the predict-then-reveal pattern matches Muller's confrontation finding in note E (finding 3) only loosely, since Karpathy's predictions concern a number, not a misconception.
- **Boundary conditions:** 3 sources, one of them text only; two engineering or math concepts for adults who chose to watch. The sample over-represents creators who already explain well. Whether the viewers learned is not measured (see finding 2).
- **What Claude should do differently:**
  - Add a "predict first" step to the first turn on a new idea: "Before I explain, what do you expect happens if ___?" Then wait.
  - When showing a worked example in chat, include one deliberate, labeled error or common mistake after the correct version, as Karpathy's zero-grad bug does, so the learner sees what the error looks like.
  - Convert every "recap" into a recall question.
  - Where Claude can offer a check the learner can run (a number, a test, a rubric item), do that instead of "does that make sense?".
- **Example:** Before: "Backprop applies the chain rule. Here is the derivative..." After: "Say f(x) = x^2 and x = 3. If I nudge x by 0.001, do you expect f to go up by more or less than 0.001? Try it in a Python shell and tell me the number."
- **Failure tags addressed:** demo-not-teach, no-practice, no-feedback-loop, artifact-shallow.

### 2. High ratings are not learning: the Muller misconceptions research, checked
- **Claim:** In Muller's research, a clear, correct physics video left students at about their starting score while they rated it clear and became more confident; a video that confronted misconceptions roughly doubled the score and was rated confusing.
- **Evidence:** Moderate. Two parts. (a) The paper: Muller, Bewes, Sharma and Reimann (2008), J. Computer Assisted Learning 24(2): 144 to 155. 364 first-year physics students randomly assigned to one of four online treatments (Exposition, Extended Exposition, Refutation, Dialogue) on Newton's first and second laws; conceptual-inventory items before and after; Refutation and Dialogue effect sizes 0.79 and 0.83 against Exposition; low prior knowledge students gained most; high prior knowledge students were not harmed. I confirmed this from two secondary descriptions; the paper's PDF returned 403, so I did not read the primary text. (b) The video: Muller's own account, transcript opened: students did a multiple-choice pretest online, were randomly assigned a video of about 10 minutes, then took the same test; standard video averages 6.0 of 26 before and 6.3 after (about 00:03:37), misconception dialogue nearly doubled to 11 of 26 (about 00:05:56); standard video viewers said "clear, concise, easy to understand" and became more confident but did not remember what was presented (about 00:03:25 to 00:04:20); dialogue viewers called it confusing and reported higher mental effort (about 00:05:00, 00:06:06). He says the number of students is not stated in the video.
- **Boundary conditions:** One topic, a roughly 10-minute video, university physics students, immediate test (not delayed). Topics where learners hold strong wrong intuitions; where there is no prior belief, refutation has less to act on. I could not confirm the video's data are the same dataset as the paper's. His claim that videos are of little value for beginners is an opinion in the video ("I question whether it's going to be that valuable"), not a result.
- **What Claude should do differently:**
  - Never use "how clear was that?", likes, view counts, or the learner's confidence as evidence the teaching worked. Use a performance check.
  - For topics with known misconceptions (physics, probability, statistics, concurrency), state the likely wrong idea, have the learner commit to a prediction, and then show the contrast.
  - Warn the learner that confusion at the contrast step is expected, since a confused learner may otherwise read it as a bad lesson.
  - When Claude points a learner to a video, pair it with a pause-and-answer question list (for example, "after 2:30, predict X before watching on").
- **Example:** Before: Claude gives a clean explanation and asks "make sense?". The learner says yes. After: Claude asks "if I double the speed, does the stopping distance double? Pick one", then explains using the wrong answer.
- **Failure tags addressed:** artifact-shallow, no-diagnosis, demo-not-teach.

### 3. Sequencing a motor-skill course (JustinGuitar): what I could and could not verify
- **Claim (unverified):** JustinGuitar structures a beginner course as numbered Grades or Stages, each with a practice-schedule lesson saying what to practice and for how long, with songs used as application.
- **Evidence:** Practitioner, unverified. I could not open any JustinGuitar lesson or community page (403). Search-result snippets reported: the course has Grade 1, 2 and 3 (older: Stages 1 to 8); each Stage has a "Practice Schedule" lesson; a Stage 8 lesson describes a 50 minute daily routine that can be split into two 25-minute sessions; Grade 2 has "Practice Routine" lessons within modules; a lesson titled "6 Guitar Areas You Should Practice" says there is no one-size-fits-all schedule. I did not check these against the pages, so they are leads only and are not logged in `sources.md`.
- **Boundary conditions:** None established; I did not see the moves, only a list of titles.
- **What Claude should do differently (inference, v0, not verified):** In a guitar or other motor-skill artifact, include per stage a time-boxed session plan (for example 20 to 30 minutes split into warm-up, skill drill, application song, review of a previous skill), a tempo ladder, and a "ready to move on" criterion that is observable ("clean at 80 bpm, 3 times in a row"). Put a song that uses only the skills learned so far at the end of each stage so the skill is applied, not only drilled. Split long routines into two shorter sessions. Re-test earlier skills briefly in each later session. These agree with the observable-criteria and tempo-ladder design in note E (finding 5), but the JustinGuitar evidence for them is not verified here.
- **Example:** Stage plan: "Warm-up 3 min (open strings, finger stretch). G to C changes 8 min at 60 bpm. New chord D 5 min. Song with G, C, D 8 min. Recall: name and play Em from memory 2 min."
- **Failure tags addressed:** plan-stall, mastery-cliff, honor-system-progress, no-fading.

### 4. Learning-strategy video: coverage gap
- **Claim:** Not tested. I did not code a learning-strategy creator video (Justin Sung, Ali Abdaal) or a researcher talk (Wiliam, Lemov).
- **Evidence:** None gathered. The Veritasium video above is the only learning-related claim set, and it is about videos, not study strategy.
- **What Claude should do differently:** Nothing to add from this area. If the skill cites "study tips" from video creators, do not rely on them without cross-checking area D.

## Contradictions / open questions
- The coded set is 3 sources, two engineering or math topics, and no motor-skill lesson transcript. Another pass needs working transcript access (install `yt-dlp` or use YouTube's transcript panel) and a JustinGuitar lesson transcript with timestamps.
- Karpathy and 3Blue1Brown time codes here are approximate or absent; re-verify before putting any in the skill.
- Whether viewers of Karpathy or 3Blue1Brown learn well is not established. Their prediction prompts are consistent with area E's evidence, but nobody here measured the outcome.
- The Muller paper's primary text was not opened.
- Open: does a misconception prediction prompt help true beginners with no prior belief? Coordinate with area A.

## Candidate skill text
Draft for the "research the topic first" step and the examples in SKILL.md:

> **Borrow the moves, not the medium.** Strong video explainers make the viewer commit before the answer appears ("pause and see if you can figure it out"), show one concrete case before the rule, and show a common error on screen. A viewer cannot be checked, but a chat learner can, so wait for their answer and use it. Why: a clear explanation can leave the learner feeling sure while they learn little, so the prediction and the check do the teaching.
>
> **Clarity ratings are not learning.** Do not ask "was that clear?" as a check. Ask the learner to predict, explain, or do something, and respond to what they produce.
>
> **When recommending a video,** name the segment, give one prediction question to answer before watching, and one thing to do or explain after. Verify the timestamp first.

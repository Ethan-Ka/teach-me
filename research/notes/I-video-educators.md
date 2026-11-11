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

---

# Pass 2 (2026-11-11): broader sample of video educators, coded for teaching moves

## Method and honest limits for pass 2

`yt-dlp` and the transcript API were still unavailable. I used rosetta.to (auto-transcript pages), sozai.app, official course pages, interviews, and secondary summaries, all fetched through a tool that returns a model's reading of the page, not the raw text. **Consequence: every "quote" below is as relayed by that tool, with at most light checking, and none should go into the skill verbatim until checked against the video.** Time codes are the page's chapter markers, mostly approximate. Rosetta transcripts of long lectures were read only in the first ~100k of ~130k characters.

Coverage by evidence quality (this decides how much weight each row bears):

| Tier | Sources | What I had |
|---|---|---|
| Transcript or transcript-derived | Veritasium electricity; CS50x 2024 L0; CS50x 2026 L3; Crash Course Scientific Thinking #1; Crash Course Computer Science #4; Dreaming Spanish "I Can't Go to School!" (A1-A2) | Full or near-full transcript, read through a summarizer |
| Chapter summary only | 3Blue1Brown linear algebra ch. 1 (rosetta chapter summary, not the full transcript) | Structure, order, a few phrases |
| Interview, official page, or forum (method described by others) | Khan Academy (Sal Khan, Cult of Pedagogy ep. 116); Dreaming Spanish FAQ; JustinGuitar (search snippets of official practice pages; forum) | Method descriptions, no video coded |
| Secondary summary only | Justin Sung ("The PROBLEM with Active Recall and Spaced Repetition", an AI summary page); Feynman Lectures ch. 1 (blog paraphrase; official PDF returned 403) | Claims only |
| Not coded (no usable text) | Naroditsky speedruns (only fan commentary), woodworking, cooking | Gap; see end |

Also carried over from pass 1: Karpathy micrograd, 3Blue1Brown neural network ch. 1 (text), Veritasium on Khan/Muller. That makes about 14 sources or series touched, of which 6 are coded from transcripts. The 12-15 target was reached in count, not in depth.

## Per-source coding (pass 2)

Codes as in pass 1: hook, predict, worked example, misconception, concrete-to-abstract, visual, recap, practice.

### P2-1. Veritasium, "The Big Misconception About Electricity" (transcript, no usable time codes)
- **Opens:** a puzzle with a forced choice. "Imagine you have a giant circuit consisting of a battery, a switch, a light bulb." Options: "half a second, one second, two seconds, 1/c seconds, or none of the above."
- **Predict:** explicit commit: "I want you to commit to an answer and put it down in the comments." The answer is withheld until the end, after the evidence (chapter "The Answer to the Thought Experiment" is near the last).
- **Misconception:** states the popular model (electrons as a pushed chain, "lose energy in the toaster"), then "The only problem is, it's wrong" and "My claim in this video is that all of that is false." Gives two objections that the old model cannot answer (transformers; if electrons carried the energy out they would carry it back).
- **Sequence:** puzzle, wrong story, refutation, new model built stepwise (fields, Poynting vector, simple circuit), a second case (AC), historical evidence (1858 undersea cable), answer, then sponsor.
- **Pacing:** about 8 chapters; the answer is delayed on purpose.
- **Visual:** thought experiment with a diagram (no physical demo in the transcript).
- **Practice:** only the comment-section prediction.
- **Does not transfer:** the comment section as the commitment device (viewers can skip it). A chat can wait for the commitment; a static page can gate the reveal.
- **Weak spot:** this is the pattern pass 1 described from Muller's own account, now seen enacted in a video. It does not show that it works in the video (viewers' outcomes are not measured).

### P2-2. 3Blue1Brown, "Vectors, what even are they?" (chapter summary only, 9m51s)
- **Opens:** with the idea that vectors mean different things to a physicist, a computer scientist and a mathematician, and a single working picture: "whenever I introduce a new topic involving vectors I want you to First think about an arrow" (relayed quote).
- **Sequence:** a house as (square footage, price); an arrow from the origin; coordinates as walking instructions; addition as tip-to-tail, then as regrouped moves (1+3, 2-1); the same on the number line; scaling by 2, 1/3 and -1.8. Grid lines are deliberately deferred so as not to clutter.
- **Predict:** none marked; rhetorical questions ("why this definition of addition and not some other one"). No pauses.
- **Misconception:** names the competing definitions of "vector" up front and says the abstract one is deferred.
- **Visual:** the picture carries the mechanism (a walk, a stretch, a flip).
- **Practice:** none; closing recaps the two operations and previews span and basis.
- **Does not transfer:** animation that morphs one object into another. Closest static substitute is a stepper with a fixed grid.

### P2-3. CS50 (David Malan), 2024 Lecture 0 and 2026 Lecture 3 (transcript read through a summarizer)
- **Opens:** L0 with a mindset framing ("what ultimately matters in this class is not so much where you end up relative to your classmates"). L3 starts by recalling week zero's definition of an algorithm and a live counting exercise: the room adds numbers in pairs; the class total (141) is compared against a manual count (about 160) and the gap is used to talk about bugs.
- **Predict and participate:** volunteers act out each algorithm (bits as eight students; lockers for linear versus binary search) before any code. He asks the room to explain the reasoning after the demonstration. "Why is this code now in red wrong?", "Why n minus one?", "why binary search fails on unsorted input".
- **Sequence:** physical demonstration, pseudocode, C code, then running time and graphs; unary to binary to ASCII to Unicode to color to images in L0, each building on the last.
- **Misconceptions and errors:** same bits mean different things in context; a fast algorithm can be wrong; he reruns a failing compile (missing header) and admits "something stupid" as teaching material.
- **Pacing:** about 17 to 20 minutes per major block in L3 (for example 17:40 to 38:54 for binary search and running time), a break roughly every hour, sorting later in the second hour.
- **Practice:** problem sets, mentioned only briefly in the part I saw; Scratch in L0 is live drag and narrate. Pseudocode first is justified as making code easier.
- **Visual:** physical objects, graphs, the cheat sheet.
- **Does not transfer:** the live volunteers and the room's embodied reasoning; also the slow ramp (first hour of L0 is long). A chat tutor can ask the learner to "be the volunteer" by predicting the next step.

### P2-4. Crash Course Scientific Thinking #1 and Computer Science #4 (transcripts)
- **Scientific Thinking #1 (about 11m49s, six chapters of roughly 44 s to 3.3 min):** opens with a historical anecdote ("2,000 years ago, people looked up at the sky and they saw that everything up there seemed to move") and "If I'd been alive then, I would have believed this story". No prediction, no task. It does name misconceptions directly (bias is not prejudice; bias is not inherently bad; scientists are not immune; learning styles lack evidence). Recap is a restatement at the end plus a preview. Practice is advice only ("Anybody who says they don't have any biases is just waving a huge red flag").
- **Computer Science #4 (10m45, six chapters of 1 to 3.5 min):** opens by linking to last episode and reassuring viewers they already know the math. Sequence: decimal place value (263), binary place value, then 183+19 in both, then limits (8-bit 0-255), sign bit, floating point, ASCII. Analogies: binary is decimal with different place values; scientific notation for floating point. Misconception named: "kilobyte" meaning 1,000 or 1,024. No recap; next-episode preview. No practice.
- **Lesson:** chunking into short, titled, self-contained segments is the main device. The hook is a story, not a puzzle, and there is no check at all, so I code Crash Course as weak on prediction and practice.
- **Does not transfer:** the host's pace and personality; the pace is set for a passive viewer.

### P2-5. Dreaming Spanish, superbeginner and A1-A2 stories (one transcript plus the FAQ)
- **Method (FAQ, relayed):** comprehensible input only, "studying grammatical rules does nothing for acquiring the grammar", no early speaking ("speaking doesn't result in acquisition"), watch without subtitles, about 80% understanding as the target, at least 30 to 60 minutes of input daily, seven levels, and drawings, gestures and facial expressions at the lowest level.
- **Transcript of "I Can't Go to School!":** opens "Son las 6 AM." "Tengo que ir a la escuela." "Odio la escuela, no quiero ir." Lines of 2 to 8 words; heavy deliberate repetition ("Mira", "80 grados" about four times, "Vamos al hospital" twice); no glosses or English; meaning comes from the picture ("Mira el termómetro"). No questions to the viewer until a promotional close.
- **Sequence:** the level system is the sequence (easier videos before harder ones, pick the level that fits).
- **Practice:** none beyond watching more. Output is deferred by design.
- **Does not transfer:** images and gestures do the work of making input comprehensible, and a text chat has neither. A chat can supply pictures only through emoji or generated diagrams. The method is also contested in the language-acquisition literature (see Contradictions), so I code it as "level-matching works as a design idea; the 'never speak, never study grammar' claims do not generalize."

### P2-6. Khan Academy / Sal Khan (interview, no video coded)
- **Source:** Cult of Pedagogy episode 116 transcript.
- **What the method is (relayed):** students "learn at their own time and pace, get as much practice and feedback as they need"; "a hint on a problem or an on-demand, three-minute video can unblock the student"; mastery framed on Bloom's work, "as many chances as necessary to get to 90 percent-plus correct"; "tens of thousands of practice items".
- **Matters for the skill:** the video is a small part. The teaching is the practice loop (attempt, hint, short video, retry, mastery threshold) around it.
- **Contrast:** Muller's critique (pass 1) says the videos alone leave misconceptions in place. The two fit together if the video is the unblock, not the lesson.
- **Not verified:** I did not see the videos' own structure (handwritten tablet, voice), so I make no claim about it.

### P2-7. JustinGuitar (official practice pages, forum; lesson pages returned 403 or were seen only as snippets)
- **From snippets of official pages (Stage 1 "One Minute Changes", Lesson 4 and Module 6 practice):** time yourself for one minute and count changes between two chords; count one per change; "ready to move on" at about 30 changes in a minute; chord changes sit in a roughly 20-minute session with about 1 minute per change pair; four sessions a week recommended.
- **Forum (not Justin):** the tempo and how to speed up are secondhand and conflicting (30 bpm vs 60); one poster says 30 minutes a day of one-minute changes is too much.
- **Why it matters:** it gives pass 1 finding 3 some support: numbered stages, an observable exit criterion (a count in a minute), short daily sessions. Still not seen as teaching moves.

### P2-8. Karpathy "Neural Networks: Zero to Hero" (micrograd coded in pass 1; the rest of the series not coded)
- Carried from pass 1: build from a blank notebook, show typing and bugs live, hand-compute before code, numerical gradient check as a self-verifying test, "pause the video here and see if you can figure it out yourself". I did not find a transcript of other episodes. No new data.

### P2-9. Justin Sung, learning-strategy video, checked against research (summary only)
- **Claims (AI summary page, timestamps unreliable):** active recall and spaced repetition "may not be as effective as commonly believed"; they work for students already good at "deep processing" and are insufficient for others; encoding quality is the lever ("every student can be trained to improve their encoding abilities"); "desirable difficulty" and avoiding "passive study"; cites Dunning-Kruger, success bias, availability bias for the popularity of recall. Cited evidence: no named study in the summary; "research suggests" and unpublished internal data; a 50 to 60 percent one-week forgetting figure with no source; the page also lists a paid program.
- **Check against the repo's own notes:** `D-retention.md` finding 1 grades practice testing and distributed practice as Strong (Dunlosky et al. 2013, rated High utility) across learners and materials. Sung's claim is therefore not backed by anything I could find, and the part that the techniques are insufficient alone is compatible with D (D finds retrieval is not a substitute for understanding at first exposure; that is separate). Mind-map and "encoding first" ideas are plausible elaboration and organization strategies but I found no controlled evidence in this pass.
- **Grade:** Contested as a creator claim; **the "recall and spacing are overrated" part is contradicted** by Strong evidence in D. Do not repeat it. A weaker, defensible reading is "retrieval after you have understood, not instead of understanding."

### P2-10. Feynman Lectures, ch. 1 "Atoms in Motion" (blog paraphrase only)
- Opens with a single framing question (if all scientific knowledge were destroyed, which sentence carries the most information) and answers "all things are made of atoms", adding that it carries a lot "if just a little imagination and thinking are applied". Uses a small example (evaporation of water) to show how much follows from one idea.
- Taught moves: a one-sentence organizing idea first, then an example that uses it. I did not read the text, so the sequencing of examples and any caveats are unverified.

## Pass 2 frequency table (across the 6 transcript-coded sources plus 3Blue1Brown chapter summary)

| Move | Seen in | Count | Note |
|---|---|---|---|
| Opens with a puzzle, story or demo, not a definition | Veritasium (puzzle), CS50 (live counting), Crash Course SciThink (story), Dreaming Spanish (scene) | 4 of 7 | CS Crash Course and 3Blue1Brown open with a goal and a plan |
| Explicit commit before the answer | Veritasium, CS50 (volunteers, "why"), Karpathy (pass 1) | 2 of 7 here | Crash Course, 3Blue1Brown, Dreaming Spanish ask none |
| Names the wrong idea and refutes it | Veritasium (central), Crash Course SciThink (four named), 3Blue1Brown (vector definitions), CS50 (same bits, different meaning) | 4 of 7 | Only Veritasium builds the whole video around it |
| Physical or concrete case before the rule | CS50 (lockers, volunteers), CC CS (263), 3Blue1Brown (house, walk) | 3 of 7 | |
| Chunks of 1 to 3.5 minutes, titled | Crash Course (both), 3Blue1Brown (chapters), Veritasium (chapters) | 4 of 7 | Lectures use 17 to 40 minute blocks with breaks |
| Visible mistake or admitted error | CS50, Karpathy (pass 1) | 2 of 7 | |
| Practice with feedback | none of the videos themselves; Khan (platform), JustinGuitar (exit criterion), Karpathy (self-check) | 0 of 7 in video | The practice loop lives outside the video |

Practice and feedback are the main thing missing from the videos. That is the largest gap a chat tutor can fill.

## Synthesis: transferable techniques (grade, boundaries, skill part)

Grades follow `research/PLAN.md`. Most are Practitioner; a technique is upgraded only where it matches a graded finding in notes A to E or H, which I checked by reading headings and the Dunlosky row of D, not the whole notes. Anyone merging should check the cross-references.

1. **Open with a forced-choice puzzle, then withhold the answer until the evidence is in.** (Veritasium, CS50 counting.) Grade: Moderate, because it matches note E finding 3 (Muller et al. 2008, Moderate in pass 1). Boundary: topics with strong wrong intuitions; weak for pure procedures or when the learner has no prior belief. Changes: chat tutoring (first turn) and artifacts (prediction gate before the reveal).
2. **Name the popular wrong model, show why it fails with one case it cannot explain, then give the better model.** (Veritasium: transformers; Crash Course: "bias is not prejudice".) Grade: Moderate (same Muller/E basis). Boundary: only when a known misconception exists; do it after, not before, a commit; confusion is expected. Changes: topic research (collect misconceptions first), artifacts (feedback names the wrong idea).
3. **One concrete, physical or numeric case before the rule, and the same case reused across the lesson.** (CS50 lockers; Crash Course 263; 3Blue1Brown house and arrow.) Grade: Practitioner, consistent with note E finding 4 (concreteness fading). Boundary: novices; for experts the rule first can be faster (expertise reversal, note A). Changes: chat tutoring and artifacts.
4. **Make the viewer be the participant: ask "why is this wrong?" and "why does this fail on unsorted input?" at each step and wait.** (CS50 volunteers.) Grade: Practitioner. Boundary: needs a responsive learner; do not stack more than one question at a time. Changes: chat tutoring.
5. **Chunk into short titled segments of 1 to 3.5 minutes of explanation, each ending on one idea.** (Crash Course, 3Blue1Brown chapters.) Grade: Practitioner; Mayer's segmenting principle is related but I did not check it here. Boundary: videos are paced for passive viewing; in chat the right chunk is one idea plus one question. Changes: artifacts (sections), chat (turn length).
6. **Show the error and its fix, live or written in.** (CS50 failing compile, Karpathy zero-grad.) Grade: Practitioner. Boundary: for novices, show the correct version first, then the error; a mistake shown cold can be remembered as the answer. Changes: chat and artifacts.
7. **Level the input to the learner (about 80% understood) and shift upward as it gets easy.** (Dreaming Spanish levels and "80%"; Khan mastery threshold.) Grade: Practitioner. Boundary: Dreaming Spanish claims are unverified research-wise; the numbers (80%, 90%) are creators' targets, not findings. Changes: chat (placement and difficulty), artifacts (levels), topic research (what is the prerequisite).
8. **Stage the practice around a countable exit criterion.** (JustinGuitar's "about 30 changes in one minute"; Khan's 90 percent; Karpathy's numerical check.) Grade: Practitioner for motor skills (matches note E finding 5 designed in pass 1); Moderate for mastery thresholds (Bloom-style mastery is a debated finding I have not checked; treat as Practitioner here). Boundary: honor-system for motor skills; a count the learner reports is not verified. Changes: artifacts (checklists, counters), chat (ask for the number).
9. **Put the explanation around a practice loop instead of around a video: attempt, hint, short explanation, retry.** (Khan's own account.) Grade: Practitioner; matches B finding 4 (hints versus answers) in direction only. Boundary: depends on a bank of items; Claude can generate items but cannot validate them for novel domains. Changes: artifacts and chat.
10. **Start from one organizing sentence, then derive everything with small examples.** (Feynman's atomic hypothesis; 3Blue1Brown's "think about an arrow"; Karpathy's "the entire network is just a function".) Grade: Practitioner, from a secondary summary for Feynman. Boundary: works when the field has a short core idea; not every topic does. Changes: topic research ("find the one-sentence core").
11. **Defer detail on purpose and say you are deferring.** (3Blue1Brown defers the abstract definition and grid lines; Karpathy "arbitrary choice".) Grade: Practitioner. Boundary: do not defer something the learner needs for the next step. Changes: chat and artifacts.
12. **Link each segment to what came before and what comes next, in a sentence.** (Crash Course CS #4, CS50 L3 week-zero callback.) Grade: Practitioner; this is a weak retrieval cue, which should be a question instead (see technique 4). Changes: chat.

## Popular but contradicted or unsupported by evidence

- **"Active recall and spaced repetition are overrated" (Justin Sung summary).** Contradicted by `D-retention.md` finding 1 (Strong). The kernel (understanding first, then retrieve) is not in conflict with D. I would not carry the claim into the skill.
- **Likes, views and "clear" ratings as quality.** Pass 1 finding 2 (Muller): the clear video taught least. Videos here (Crash Course, 3Blue1Brown) are widely praised but ask almost nothing of the viewer, so popularity does not show learning.
- **Learning styles.** Crash Course Scientific Thinking #1 says there is no scientific evidence for learning styles, consistent with `H-myths.md`. Dreaming Spanish and others choose visual aids for a different reason (making input comprehensible), which is not a style claim.
- **"Never study grammar and never speak" (Dreaming Spanish FAQ).** A strong claim from the creators; I found no support for the "does nothing" wording in this pass, and I did not check the second-language literature. Label Contested and do not adopt.
- **Restated recaps at the end (Karpathy, 3Blue1Brown, Crash Course).** Passive, per pass 1 finding 1 and `D-retention.md`; a recall question beats restating.
- **Mind maps as the core of studying (Sung).** No controlled evidence found in this pass. Not graded.

## Where each technique changes the skill

| Skill part | Techniques | Change |
|---|---|---|
| Chat tutoring | 1, 4, 6, 7, 8, 12 | Open new ideas with a forced-choice prediction, wait for the commitment, one question at a time, ask for the countable result, show errors after the correct version |
| Artifacts (static HTML) | 1, 2, 5, 6, 8, 9 | Prediction gate before each reveal; wrong-option feedback that names the misconception; segmented sections; counters or checks tied to an exit criterion; hint ladder |
| Topic research step | 2, 7, 10 | Before teaching, collect the top three misconceptions and a one-sentence core idea, and note the prerequisite level; point to a specific video segment only after verifying the timestamp |

## What does not carry over from video to text or a static page
- Motion that carries structure (3Blue1Brown); use a fixed grid and a stepper.
- Images and gestures that make input comprehensible (Dreaming Spanish); cannot be replaced by text alone.
- The live room, volunteers and an instructor who reads faces (CS50); partly replaced by waiting for the learner's reply.
- A creator's personality and pacing for a viewer who cannot pause the speaker.
- Feedback on movement (guitar, woodworking): honor-system only.
- Anything that depends on the viewer being unable to interrupt; chat lets the learner redirect, which video cannot.

## Gaps and open questions (pass 2)
- No transcripts or usable text for Naroditsky (chess), woodworking or cooking creators, so those kinds of teaching (narrated expert thinking, tacit motor skill) are not coded. For chess, I only found fan commentary calling his narration of the reasons behind moves "unmatched"; that is opinion, not coding.
- No full transcript for 3Blue1Brown ch. 1 and Feynman ch. 1; the Feynman PDF returned 403.
- JustinGuitar lesson videos not seen; the "30 changes in a minute" threshold rests on snippets of official pages; tempo claims on forums conflict.
- The tool returned summaries of pages, so quotes need checking against the original before they appear in SKILL.md.
- Not measured: whether viewers of these channels learn. High reception is not outcome data.
- Open: do 1 to 3 minute chunks beat longer ones for learning? No evidence gathered; chunk length in chat is v0.

## Candidate skill text (pass 2)

> **Open with a choice the learner has to commit to.** Strong explainers pose a puzzle with a few answers, make the viewer pick, and hold the answer until they have shown why the intuitive answer fails. Do the same in the first turn: "Before I explain, which of these do you expect?" Then wait. Why: a learner who has committed to a wrong guess has something for the explanation to correct, and one who has not often reads the correct explanation and feels they already knew it.
>
> **Name the common wrong idea and show one case it cannot explain.** Do this after they commit, and warn them the contrast can feel confusing. Why: clear, correct explanations leave wrong ideas in place; confusion at the contrast is a sign it is working, not that the lesson failed.
>
> **Put the practice loop in your lesson, because videos leave it out.** Even the best explainers rarely check anything. End each segment with one task whose result the learner can report: a number, a count, or an answer you can check.

## Sources to log (for a later agent to merge into `research/sources.md`)

Date checked is 2026-11-11 for all. "Access" says what was actually read, so the grade attached stays honest. None of these was verified against the video itself.

| Title | Creator | URL | Access |
|---|---|---|---|
| The Big Misconception About Electricity | Veritasium | https://rosetta.to/u/veritasium/the-big-misconception-about-electricity | transcript page, summarized |
| Vectors, what even are they? (Essence of Linear Algebra ch. 1) | 3Blue1Brown | https://rosetta.to/u/3blue1brown/vectors-chapter-1-essence-of-linear-algebra | chapter summary only |
| Vectors, what even are they? (lesson text) | 3Blue1Brown | https://3blue1brown.com/lessons/vectors | listed in search, not opened |
| CS50x 2024 Lecture 0 - Scratch | David Malan, CS50 | https://rosetta.to/u/cs50/cs50x-2024-lecture-0-scratch | transcript page, first ~100k of ~129k characters |
| CS50x 2026 Lecture 3 - Algorithms | David Malan, CS50 | https://rosetta.to/u/cs50/cs50x-2026-lecture-3-algorithms | transcript page, first ~100k of ~133k characters |
| Introduction to Cognitive Bias: Crash Course Scientific Thinking #1 | Crash Course | https://rosetta.to/u/crashcourse/introduction-to-cognitive-bias-crash-course-scientific-thinking-1 | transcript page |
| Representing Numbers and Letters with Binary: Crash Course Computer Science #4 | Crash Course | https://rosetta.to/u/crashcourse/representing-numbers-and-letters-with-binary-crash-course-computer-science-4 | transcript page |
| Beginner Spanish Story: "I Can't Go to School!" (A1-A2) | Dreaming Spanish | https://sozai.app/transcript/beginner-spanish-story-i-cant-go-to-school-a1-a2-transcript/ | transcript page |
| Dreaming Spanish FAQ | Dreaming Spanish | https://dreaming.com/faq | first ~100k of ~148k characters |
| Cult of Pedagogy Podcast, Episode 116 (Mastery learning with Khan Academy) | Jennifer Gonzalez with Sal Khan | https://www.cultofpedagogy.com/episode-116/ | transcript page |
| Stage 1: One Minute Changes; Lesson 4 Practice; Module 6 Practice | JustinGuitar | https://www.justinguitar.com/guitar-lessons/stage-1-one-minute-changes-bc-115 (also https://www.justinguitar.com/guitar-lessons/module-6-practice-b1-608) | search snippets only (pages returned 403 on fetch) |
| Chord change speed (forum thread) | JustinGuitar Community | https://community.justinguitar.com/t/chord-change-speed/403203 | search snippet only (403 on fetch); not Justin's own words |
| The PROBLEM with Active Recall and Spaced Repetition (Truth Behind Studying Smarter) | Justin Sung | https://videohighlight.com/v/--Hu2w0s72Y | third-party AI summary; timestamps unreliable |
| Feynman Lectures on Physics Vol. I, ch. 1, Atoms in Motion | Richard Feynman | https://www.feynmanlectures.caltech.edu/I_01.html | 403; read only a blog paraphrase at https://freelanceastrophysicist.com/2013/01/feynman-lectures-chapter-i/ |
| Fan commentary on Naroditsky's speedruns | various | https://metafilter.com/207036/Chess-speedruns-Fun-Instructive-Calming | search snippet only; opinion, not coded |

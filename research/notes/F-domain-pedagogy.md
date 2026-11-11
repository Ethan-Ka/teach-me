# F. Domain-specific pedagogy

**Research question:** Q1 (tell, guide, or let them do it) and Q3 (material that teaches), by domain: where the general rules change.
**Sessions:** 2026-11-11. About 12 tool calls, mostly search summaries. Items not opened at the primary source are marked. Gaps are listed at the end; two must-answer parts (feedback on physical skill without seeing or hearing, and codebase onboarding) have little direct evidence and are mostly labelled Practitioner or v0.

## Programming

### PRIMM: Predict, Run, Investigate, Modify, Make
- **Claim:** Teach programming by having the learner read and predict code before writing it, then modify, then make something new.
- **Evidence:** Moderate. Sentance, Waite and Kallia 2019, Computer Science Education: 13 secondary schools, 493 students aged 11 to 14, 8 to 12 weeks, mixed methods, PRIMM group outperformed control on the post-test (abstract level; I did not get effect sizes). https://eprints.gla.ac.uk/229013 and the DOI https://doi.org/10.1080/08993408.2019.1608781 . Stage definitions from https://primmportal.com/ (no study data on that page). Extension note: a UEL study found Make was too hard on multi-statement problems and proposed adding a Decompose step ("PRIDAM"); single study, read via a search summary.
- **Boundary conditions:** School-age novices. Evidence is a school curriculum, not a one-on-one chat. Not every lesson needs all five stages. For experienced programmers learning a new language, Predict on trivial code is wasted; start at Modify or Make.
- **What Claude should do differently:** For a novice learning a concept in code, give a short working snippet and ask "what will this print, and why?" before running it. Then have them run it, ask about the difference, then change one thing, then make a variant. Keep the snippet small enough that a prediction is possible.
- **Where the general rule changes:** Showing code is usually "demo" and weak. In PRIMM it is the starting point, but the learner's prediction is the active step, so the demo is only fine when it is followed by a prediction or tracing task.
- **Example:** Before: Claude writes a loop and explains it. After: "Here is a 4-line loop. Before I run it, what do you think it prints? Say what i is on each pass."
- **Failure tags addressed:** demo-not-teach, no-practice.

### Parsons problems
- **Claim:** Rearranging given lines of code into a correct program teaches about as much as writing it, in less time.
- **Evidence:** Moderate to Strong. Ericson and colleagues' randomized studies found equal learning from Parsons problems, fixing code, and writing from scratch; adaptive Parsons (Haynes and Ericson, ICER 2018) were as effective and faster; one classroom report: 15 to 17 minutes saved on 30-minute labs. ITiCSE 2023 working group synthesis: easier than writing from scratch, usually faster with equal learning gains, good for learning patterns. Source read: search summary only. https://falmouth-test.eprints-hosting.org/5216/1/ITiCSE_2023_WorkingGroup_Parsons_Report.pdf ; https://arxiv.org/pdf/2211.09609 (cites the Ericson results). Harms et al. 2016 (cited in the same summary) found distractor lines reduced efficiency for young novices.
- **Boundary conditions:** Early novices, syntax and structure of short programs. Does not train the "blank page" skill of deciding what to write; one study found no pretest-posttest gain in either condition. Distractors hurt young novices.
- **What Claude should do differently:** When a novice needs practice on a procedure and is overwhelmed by a blank editor, produce the lines scrambled (no distractors for beginners) and ask them to order them. In chat this means a numbered list of lines; in an artifact, a drag-to-order widget.
- **Failure tags addressed:** no-practice, artifact-is-reference-doc.

### Subgoal labels
- **Claim:** Worked examples whose steps are grouped under named subgoals ("get the input", "initialize accumulator") help novices solve new problems.
- **Evidence:** Moderate. Margulieux, Catrambone and Guzdial: subgoal-labeled worked examples improved novice problem solving and transfer in several lab experiments (2016, Computer Science Education 26(1), 44 to 67; Cognitive Science Society 2013). Read through search summary; retention results not confirmed. https://scholarworks.gsu.edu/ltd_facpub/3
- **Boundary conditions:** Novices, procedural problem types with a stable structure; labels must be generic enough to transfer, not specific to the example. Effect for experienced learners unknown to me.
- **What Claude should do differently:** In a worked example, name the phases of the solution and reuse the same names across parallel problems, so the learner can say "this is the same subgoal as before".
- **Failure tags addressed:** artifact-is-reference-doc, no-practice.

### Notional machines
- **Claim:** Learners need a simplified model of what the machine does (variables as boxes, the call stack, references as arrows) to predict program behavior, and wrong models cause systematic errors.
- **Evidence:** Moderate (a field concept with a working-group review, less direct efficacy data). Fincher, Jeuring et al., "Notional Machines in Computing Education: The Education of Attention", ITiCSE 2020 working group; defines the concept, reviews the literature, gathers teacher examples, explores using several notional machines in sequence. https://eprints.gla.ac.uk/234715 . Read via abstract only. Krishnamurthi and Fisler (2019) frame them as human-accessible operational semantics: https://cs.brown.edu/~sk/Publications/Papers/Published/kf-prog-paradigms-and-beyond
- **Boundary conditions:** Every model is wrong somewhere; the teacher must say what it leaves out. Different languages need different machines.
- **What Claude should do differently:** Name the model in use ("think of x as a labeled box; assignment copies the value"), ask the learner to trace a few lines in that model by hand (a state table), and switch models when the first one breaks (e.g. from boxes to references when aliasing appears). A trace table is the cheapest check of the learner's model.
- **Failure tags addressed:** no-diagnosis.

### Reading and tracing one path through an unfamiliar codebase
- **Claim:** Newcomers understand a large codebase by picking one feature, tracing a path through it, and building up chunks, mixing top-down hypotheses with bottom-up reading.
- **Evidence:** Practitioner with Moderate support for the mechanics. Program comprehension literature: bottom-up when the domain is unfamiliar, top-down when it is familiar; O'Brien and colleagues' study of experts found object-oriented programmers started top-down then shifted to bottom-up during maintenance (read via search summary of https://www.cs.kent.edu/~jmaletic/Prog-Comp/Papers/OBrien01.pdf ). ICPC 2025 paper: students tended to follow a top-down, text-first approach to understand a feature in the idlelib code base (https://conf.researchr.org/details/icpc-2025/icpc-2025-research/21/An-Analysis-of-Students-Program-Comprehension-Processes-in-a-Large-Code-Base ; abstract level). Practitioner advice: hybrid approach, high-level map first, then targeted search (https://swimm.io/blog/2020-08-23-top-down-vs-bottom-up-how-to-deep-dive-into-a-codebase , vendor blog, low weight). I did not find controlled studies of teaching methods for onboarding, and the search for newcomer-barrier research (Steinmacher et al.) returned nothing, so this item is not backed by an intervention study. Hermans, The Programmer's Brain, was not checked.
- **Boundary conditions:** The learner's purpose (fix a bug, add a feature, review) changes what to trace. Claude has file access in Claude Code but not in claude.ai, so there it depends on the user pasting code.
- **What Claude should do differently (v0, derived from PRIMM and the comprehension work, label as such):** (1) Ask what the learner needs to do with the codebase. (2) Give a 5-line map of the main parts. (3) Choose one concrete entry point (a route, a command, a test) and have the learner predict where it goes next before Claude shows the file. Claude should read the code first so predictions can be checked. (4) After each hop, ask the learner to restate what the function takes and returns. (5) Close by asking them to trace a second, similar path alone, or to find where a given change would go. Avoid a guided tour of every directory, which is a demo.
- **Failure tags addressed:** demo-not-teach, wall-of-text.

## Math: worked examples and fading

- **Claim:** Studying worked examples beats solving equivalent problems for novices, in practice and in first learning; fade the steps out as skill grows.
- **Evidence:** Strong for the example effect. Barbieri, Miller-Cotto, Clerjuste and Chawla 2023, Educational Psychology Review 35, art. 11: 43 articles, 55 studies, 181 effect sizes, average g = 0.48 on math performance, medium effect both for practice and initial acquisition. https://link.springer.com/content/pdf/10.1007/s10648-023-09745-1.pdf (read via search summary). Moderators reported: correct-only examples gave larger effects than incorrect examples alone or mixed with correct ones. The summary said adding self-explanation prompts "yielded a negative effect" relative to examples without prompts, which I could not confirm in the full text (the wording was ambiguous). Do not build a rule on it until verified. Fading (Renkl and Atkinson) and expertise reversal are owned by area A.
- **Boundary conditions:** Mostly middle and high school algebra and geometry; novices. For advanced learners the example effect reverses (area A). Incorrect examples helped less in this analysis, which cuts against "find the error" activities for novices.
- **Where the general rule changes:** Math is the domain where "show then do" is best supported. The tell-first move is right for a true novice; the failure is stopping at the demonstration. Pair each worked example with a parallel problem, then fade.
- **What Claude should do differently:** Worked example, then an isomorphic problem to try with step labels, then a problem with the last step removed, then a full problem. Use correct examples for novices.
- **Failure tags addressed:** demo-not-teach, no-practice.

## Motor and music skills

### Deliberate practice and its limits
- **Claim:** Practice that is focused on specific weaknesses, with immediate feedback, matters, but it explains less of performance differences than popular accounts claim.
- **Evidence:** Contested. Macnamara, Hambrick and Oswald 2014 meta-analysis (88 studies, over 11,000 participants): deliberate practice explained about 26% of variance in games, 21% in music, 18% in sports, 4% in education, under 1% in professions; their central average was 12%. Ericsson's camp argues many studies did not measure deliberate practice as Ericsson defined it; a reanalysis of the music data (Platz et al. 2014) put music at r = 0.61 after correcting for unreliability. https://pmc.ncbi.nlm.nih.gov/articles/PMC4101876 . Read via search summary. I could not verify Ericsson, Krampe and Tesch-Romer 1993 from a primary source this session, so no claim here depends on it.
- **What Claude should do differently:** Do not promise that hours of practice guarantee results. Do structure practice around one narrow target at a time and a way to check it.

### Slow practice and chunking
- **Claim:** Expert musicians practice difficult passages in small segments and slow down after errors.
- **Evidence:** Practitioner to Moderate (survey and interview studies, no controlled trial found). Allingham and Wöllner 2022 (as quoted by a secondary article, 99.45% of classical musicians use slow practice, and the same work lists malfunctions of slow practice); a large UK self-report study found practicing small sections and using a metronome were more common as players advanced; a string-pedagogy source says chunking has limited efficacy testing. Sources read only as search snippets: https://www.thestrad.com/improve-your-playing/why-10000-hours-of-practice-wont-make-you-an-expert/9853.article ; https://pedagogyforwindsandbrass.netlify.app/lessons/7-1-science-of-learning ; https://bulletproofmusician.com/micah-killion-the-one-thing-artist-level-musicians-do-differently-in-the-practice-room/ . Low confidence, verify the primary papers.
- **Boundary conditions:** Some slow practice does not transfer to fast execution (one source warns of this); correlation with expertise is not proof that slow practice causes it.
- **What Claude should do differently:** Break a piece into the smallest unit that contains the problem (one chord change, one bar). Ask for a slow, correct repetition count, then a small tempo step, rather than "play it ten times". Tell them to stop and reset after an error instead of repeating it.

### The role of the ear
- **Claim:** In music, the learner has to hear the target and their own result to self-correct; training the ear is part of the skill.
- **Evidence:** Practitioner. No source read this session. The search for music-practice research did not return ear-training evidence.
- **What Claude should do differently (v0):** Before telling a learner what to play, have them sing, tap, or say the target rhythm or pitch contour, and ask what they hear when they play ("does the buzzing stop when you press closer to the fret?"). Ask them to judge their own take before giving Claude's view. Where Claude can use tools (not available in all apps), generate a reference tone or notation; otherwise describe the sound precisely.

### Feedback on a physical skill when Claude cannot see or hear the learner
- **Claim:** Claude has no direct access to the performance, so feedback must pass through the learner's own report, or through whatever they can upload.
- **Evidence:** No source found. I ran one search on remote feedback and audio/video delay and it returned nothing relevant. Everything below is v0 reasoning from general feedback findings (area B), not from motor-learning research. Check the motor-learning literature on augmented feedback and knowledge of results versus knowledge of performance, and on external versus internal focus of attention (Wulf), before this goes into the skill.
- **What Claude should do differently (v0):**
  1. Say plainly that it cannot observe the playing, so it works from the learner's description.
  2. Replace "that was good" with observable checks the learner can run themselves: pulse with a metronome and report which beat drifts, record the take and compare with the reference, count buzzes out of 10 attempts, check the finger lands within the fret.
  3. Ask for specific reports: which finger, which string, what sound, where in the bar it breaks, and whether it fails only at tempo.
  4. Diagnose from the pattern (it breaks only at the chord change; slow it to a tempo where it succeeds 4 out of 5 times).
  5. If the app lets the learner share an audio recording, a video, or a photo of hand position, use it, and state what it can and cannot judge from it.
  6. Avoid confident claims about technique that cannot be checked from the report.
- **Where the general rule changes:** In physical skills, telling the learner a correct model (where the fingers go) is useful, but it is the minority of the teaching; most of the value is practice design and self-checking. The usual "ask a question, learner answers" loop becomes "do this, report what happened".
- **Failure tags addressed:** no-feedback-loop, no-diagnosis.

## Contradictions / open questions

- Does PRIMM's Predict step help adults and experts? Unknown; the evidence is school age.
- Is the self-explanation moderator in the worked-example meta-analysis negative, or was it misread? Check Barbieri et al. 2023 directly.
- No controlled evidence found for how to teach a codebase or for feedback on physical skills without observation. Both stay v0 and should be tested with the simulated-learner evals.
- Deliberate practice is contested (21% of music variance versus larger corrected figures).
- Not covered: Hermans' The Programmer's Brain, Wulf on attentional focus, and ear-training research; recommended as the next targeted searches.

## Candidate skill text (draft, for references/domains/)
- Programming: "For a novice, show a short program and ask them to predict what it does before you run it. They learn more from predicting and tracing than from watching you explain. When they are stuck on a blank page, give them the lines scrambled to put in order. Name the steps of the solution the same way each time."
- Codebase: "Read the code yourself first. Pick one path through it. Ask the learner to guess the next hop, then check the guess against the file. End by asking them to trace a second path alone."
- Math: "A novice learns more from a worked example followed by a matching problem than from solving problems cold. Remove one step at a time as they succeed."
- Music and physical skill: "You cannot hear or see the learner, so say so, and give them checks they can run themselves: a metronome, a recording, a count of successes out of ten. Work on the smallest unit that fails, slowly, and speed up only when it is clean."

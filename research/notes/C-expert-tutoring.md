# C. Expert human tutoring

**Research question:** Plan question 1 (when to tell, guide, hand off) and question 2 (how a tutor knows it is working), via what expert tutors do turn by turn.
**Sessions:** 2026-11-11 (one pass, shared ~30-call budget with area A).

**Verification key.** "Opened" means page text read this session. "Search summary" means only a search-result summary was seen. "Background" means general knowledge, not checked here. Primary PDFs for Chi & Wylie 2014, VanLehn 2011, Graesser et al. 1995 and Lepper & Woolverton 2002 were fetched but returned unreadable binary; no extractor was available. Claims below are graded down accordingly.

## Findings

### Human tutoring is good but not 2 sigma
- **Claim:** Human tutoring raises outcomes by about 0.79 SD over no tutoring, well below Bloom's 2.0; step-based computer tutors reach about 0.76, close to human tutors.
- **Evidence:** Strong. VanLehn (2011), Educational Psychologist 46(4), 197-221. Abstract opened at https://eric.ed.gov/?id=EJ946764 (d = 0.79 human; 0.76 ITS; assumed prior values 0.3 / 1.0 / 2.0 not supported). Substep-based 0.40 and the Kulik & Fletcher 2015 critique come from a search summary only.
- **Boundary conditions:** Effect sizes depend on the comparison group and content (mostly maths/science, STEM tutoring studies). Interaction granularity (how finely the system responds to each step) is VanLehn's organizing variable; the claim that granularity, not special tutor tactics, explains most of the effect is from the review's framing in the search summary, not read in full.
- **What Claude should do differently:** Stop treating "be a one-on-one tutor" as a magic bullet; what is available is step-level responsiveness. Respond at the level of the learner's current step (their last line of code, their last algebra move), not at the level of the whole topic. A reply that addresses their specific step is worth more than a longer, more polished explanation of the topic.
- **Example:** Before: learner submits a half-right derivation; Claude restates the whole theorem. After: Claude says "your first two lines are right; the sign flips on line 3, try that step again and tell me which rule you used".
- **Failure tags addressed:** wall-of-text, no-feedback-loop, demo-not-teach.

### ICAP: what the learner does determines learning, so demonstration alone underperforms
- **Claim:** Learner engagement predicts learning in order Interactive > Constructive > Active > Passive: passive means receiving (reading, watching), active means manipulating (copying, highlighting), constructive means generating something new (self-explaining, predicting, drawing), interactive means co-constructing with a partner who responds to what you produced.
- **Evidence:** Moderate. Chi & Wylie (2014), Educational Psychologist, doi 10.1080/00461520.2014.965823. Paper itself unreadable here; the definitions and prediction come from search summaries and the framework's own description (consistent across sources). One experimental study (search summary only) reported results contrary to ICAP and argued for boundary conditions such as task complexity and learner preparedness. Treat the ordering as a hypothesis with a supportive review base, not a law.
- **Boundary conditions:** Constructive activities help only if the learner has enough prior knowledge to generate something meaningful; a novice asked to "explain in your own words" with nothing to build on may produce confabulation. Passive study of a well-designed worked example is not useless (see A). Coding of "behavior" to "mode" is judgmental.
- **What Claude should do differently:** In every teaching turn, check what the learner will do after reading it. If the answer is "just read it", add a generate step: a prediction before showing a result, a one-sentence own-words restatement, a next-step choice, or an error to find. Prefer one generate prompt per turn over several. Make the generate prompt answerable from what is already on the screen.
- **Example:** Before: "Here's how TCP's three-way handshake works: SYN, SYN-ACK, ACK." After: "Here are the SYN and SYN-ACK. Before I show the third message, what does the server still not know at this point?"
- **Failure tags addressed:** demo-not-teach, no-practice, wall-of-text.

### INSPIRE: how expert tutors differ
- **Claim:** Lepper and Woolverton's study of highly effective tutors (observed teaching elementary-level maths) found they are Intelligent (domain knowledge), Nurturant, Socratic, Progressive, Indirect, Reflective and Encouraging. Experts ask more than they tell, give few facts and explanations, and tend to nudge rather than correct.
- **Evidence:** Moderate (observational, small expert sample, elementary maths). Opened: Wood & Tanner (2012), CBE Life Sciences Education, https://pmc.ncbi.nlm.nih.gov/articles/PMC3292071 (summary of INSPIRE; reports one tutor with over 90% of remarks as questions; student self-explanation linked to learning; tutor-explanation-dominated sessions tend to yield shallow learning; experts start with diagnostic problems and increase difficulty gradually; praise solutions rather than students; guide students to correct their own errors). Lepper & Woolverton (2002) chapter itself not opened; UBC INSPIRE guideline sheet could not be fetched.
- **Boundary conditions:** Observed in tutors of children on elementary maths. The "mostly questions" pattern was in tutors who already knew the learner's level; questions without a diagnostic base are the novice pattern. Indirect feedback can be inefficient or confusing when the learner is lost; Lepper's tutors varied this (Background, not verified).
- **What Claude should do differently:** Concrete moves: (1) Start with a short diagnostic problem, not a lecture. (2) Make the next problem slightly harder than the last the learner solved (Progressive). (3) When the learner errs, do not say "wrong"; ask a question that lets the error surface ("what would that give for input 0?") or give a hint, and give the answer only after hints fail (Indirect). (4) Praise the move, not the person ("good call checking the base case"), and skip generic praise (Encouraging without inflation). (5) After a correct answer, ask for the reasoning once (Reflective). (6) Keep your own explanations short; ratio target is more learner words than yours across the session.
- **Example:** Before: learner: "so the answer is 12?" Claude: "Incorrect. The answer is 15 because ...". After: "Walk me through how you got 12." Learner's step shows the dropped carry. "Look at the units column again."
- **Failure tags addressed:** over-explaining, no-feedback-loop, no-diagnosis.

### What untrained tutors do (Graesser et al.)
- **Claim:** Typical (unskilled) tutors follow a five-step dialogue frame, and it leaves comprehension undiagnosed: tutor poses a question or problem; learner gives a partial answer; tutor gives brief feedback; tutor and learner improve the answer together; tutor checks understanding with a prompt such as "Does that make sense?". Learners' usual replies to such comprehension checks are not a reliable signal.
- **Evidence:** Moderate/Contested. Graesser, Person & Magliano (1995), Applied Cognitive Psychology 9(6), 495-522. Search summary confirms: studied unskilled tutors (grad students tutoring research methods, high-school students tutoring 7th-grade algebra); dominant patterns were collaborative problem solving, question answering and explanation within specific examples. The steps were only partially visible (steps 1, 4, 5); I could not confirm the full list. The statement that "Does that make sense?" yields unreliable answers is Background (Graesser's later work) and not verified here.
- **Boundary conditions:** The frame describes normal tutors, not expert ones. It is a baseline for what Claude's default probably resembles, not a model to emulate.
- **What Claude should do differently:** Replace the closing "Does that make sense?" with a task: "Try the next one and tell me which step you'd use first", or "What would happen if we changed X?". Treat "yes" and "got it" as no information. Also expect the frame's loop (question, partial answer, brief feedback, improve, check) and deliberately make step 4 the learner's job: ask them to fix the partial answer before you do.
- **Example:** Before: "...Does that make sense?" -> "yes". After: "Here is a similar case; predict the output before running it."
- **Failure tags addressed:** no-diagnosis, no-feedback-loop.

### Turn-level contrast: expert vs. novice tutor
- **Claim:** Expert tutors differ from novices mainly in what they do after the student's answer, not in how well they explain.
- **Evidence:** Practitioner synthesis of the findings above (INSPIRE, ICAP, Graesser baseline, VanLehn granularity). Not a directly tested contrast.
- **Boundary conditions:** Observations come from mostly short-session, structured-subject tutoring. Do not generalize to open-ended creative domains.
- **What Claude should do differently:** Table of turn moves.

| Situation | Novice tutor / default Claude | Expert tutor |
|---|---|---|
| Opening | Explains the topic | Poses a small problem to see what the learner does |
| Learner is wrong | Corrects and explains | Asks for the reasoning; hints; lets the learner find the error |
| Learner is right | "Great!" and moves on | Asks why once, then raises the difficulty a notch |
| Learner says "ok" or "got it" | Believes it | Asks for a next step or an application |
| Learner is stuck twice | Explains again, longer | Changes route: narrower question, a worked step, or an analogy |
| Closing | Summary by the tutor | Learner states the main idea or solves one fresh problem |

- **Example:** see rows above.
- **Failure tags addressed:** demo-not-teach, no-diagnosis, wall-of-text, no-feedback-loop.

## Contradictions / open questions
- Upstream claim "one question per turn; three Socratic questions before teaching causes disengagement": no source opened tests this. INSPIRE supports many questions from experts; Graesser shows that questions alone do not diagnose. Verdict: REVISE to "one question per turn is a pacing default; if the learner shows two stuck turns, stop questioning and give a hint or worked step". Evidence grade Practitioner.
- Upstream claim "watching someone do a thing is the most passive way to learn it": consistent with ICAP (passive). Verdict: KEEP in a softened form: demonstration is the weakest engagement unless paired with a prediction or completion step (see A for worked examples).
- Upstream "impatient versus stuck": not covered in this pass; need a source (area B).
- Bloom's 2-sigma original (1984) and its critiques beyond VanLehn were not opened.
- Do LLM learners respond to "indirect feedback" the way children in the INSPIRE studies did? Untested.
- YouTube leads not yet opened for transcripts or timestamps: Kapur keynotes (https://www.youtube.com/watch?v=eI2ko8sbtcg is the EARLI 2019 "When Productive Failure Fails"; https://www.youtube.com/watch?v=kC8O-2y5pyE ICERI 2022 keynote). Listed only as search results, not verified, not logged in sources.md.

## Candidate skill text
> Responsiveness at the step level is what makes tutoring work, so treat each learner turn as data. Start with a small problem, not a lecture. When they err, ask for their reasoning or give a hint before you give the answer. When they are right, ask why once and then raise the difficulty a notch. Don't close with "does that make sense?"; people say yes. End a chunk with something they must do: predict the next result, fix a flawed line, or solve a fresh case. If they are stuck twice, change the route instead of re-explaining.

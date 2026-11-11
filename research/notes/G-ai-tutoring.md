# G. AI-tutoring evidence

**Research question:** Q1 (tell, guide, or let them do it) and Q2 (how Claude knows it is working). Also feeds testing/rubric.md.
**Sessions:** 2026-11-11. About 12 tool calls. Several sources were read only through abstracts or search summaries; each finding says what was and was not read.

## Findings

### 1. Unrestricted AI help raises practice scores and lowers later learning
- **Claim:** High-school math students with a plain GPT-4 chat ("GPT Base") did much better on practice problems but worse than controls on a later exam taken without AI; a version with guardrails ("GPT Tutor") largely removed the harm.
- **Evidence:** Moderate (one large field experiment, nearly 1,000 students, in schools). Bastani et al., PNAS 2025, "Generative AI without guardrails can harm learning: Evidence from high school mathematics" (preprint title "Generative AI can harm learning"). https://econpapers.repec.org/RePEc:nas:journl:v:122:y:2025:p:e2422633122 . Figures from the abstract as reported via search: practice performance +48% (GPT Base) and +127% (GPT Tutor); GPT Base exam grades down 17% vs control; GPT Tutor's negative effect "largely mitigated". I could not open the PNAS page (403), so design details (what exactly the Tutor prompt contained, e.g. teacher-supplied solutions and hints) are NOT verified here.
- **Boundary conditions:** Math, high school, a few sessions; the outcome was a no-AI exam, which is the right test for "can you do it later" but may not matter if the learner will always have AI. The guardrailed tutor did not improve learning over control either; it only avoided harm (as reported; verify in the full text).
- **What Claude should do differently:** Treat "the learner got the right answer with my help" as no evidence of learning. In a teaching conversation, do not hand over full solutions to problems the learner is supposed to learn to solve; give the smallest help that gets them moving (hint, question, one step), and check later with a variant they do alone.
- **Example:** Learner: "solve 3x+5=20". Before: full steps. After: "What would you do first to get x alone? Try it and show me." Then, after they finish, "Now try 4x-7=21 without me."
- **Failure tags addressed:** demo-not-teach, illusion of fluency, no-practice.

### 2. A well-designed AI tutor can beat in-class active learning, but the design did the work
- **Claim:** In a crossover RCT in a Harvard intro physics course, students learned more in less time from a GPT-4 tutor than from an active-learning class on the same material.
- **Evidence:** Moderate (single RCT, 194 analyzable of 233 students, two topics, one lesson each). Kestin et al., Scientific Reports 2025. Read: PMC full text, https://pmc.ncbi.nlm.nih.gov/articles/PMC12179260/ . Post-test median 4.5 vs 3.5; regression effect size 0.63 (authors say an underestimate because of ceiling effects), quantile regression 0.73 to 1.3 SD. Median time 49 minutes; time did not correlate with score. Students reported higher engagement (4.1 vs 3.6) and motivation (3.4 vs 3.1).
- **What the tutor did (as stated in the paper):** system prompt had guidelines for active engagement, cognitive load management, and growth mindset (full prompt is in a supplement I did not read); it guided students sequentially through each part of each problem; prompts were enriched with comprehensive step-by-step expert solutions written by experienced instructors, so the model did not have to solve the problem itself and risk errors.
- **Boundary conditions:** One lesson each, no retention test; post-test only (no delayed test); the AI lessons used pre-recorded videos and the two lessons had different instructors (confounds); ceiling effects; Bloom levels "understand, apply, analyze" only; authors note expert-crafted prompts may be needed. Compared with active learning, not with a one-on-one human tutor.
- **What Claude should do differently:** (a) have the correct worked solution in hand before tutoring a problem (derive it privately first, in effect "enrich the prompt with the solution"), so guidance steps are accurate; (b) walk through one part at a time and wait for the learner; (c) keep each turn short. The paper itself lists "when the AI tutor should openly provide answers versus guiding students to reflect" as unresolved, so the skill's tell/guide rule is not settled by this study.
- **Failure tags addressed:** wall-of-text, no-feedback-loop.

### 3. LearnLM: pedagogy specified by instruction, evaluated by expert pairwise comparison on multi-turn scenarios
- **Claim:** Default LLMs "present information" instead of teaching. Adding pedagogical instructions ("pedagogical instruction following") shifts behavior; expert raters preferred LearnLM over GPT-4o (+31%), Claude 3.5 Sonnet (+11%), Gemini 1.5 Pro (+13%).
- **Evidence:** Moderate for the method; weak for the headline numbers (Google evaluating its own model, point-in-time, older models). Source: LearnLM team, "LearnLM: Improving Gemini for Learning", https://arxiv.org/abs/2412.16429 (abstract) and HTML version https://arxiv.org/html/2412.16429 (read through a summary; the page did not expose the full rubric text).
- **Verified rubric categories by name:** "inspiring active learning", "deepening metacognition", "stimulating curiosity" (the three with the largest LearnLM leads). Overall item: "Which tutor demonstrated better tutoring?" Impression items: interest in the topic, willingness to use again, perceived competence and warmth. The remaining categories (the paper evaluates against a larger principle list, which I recall includes managing cognitive load and adapting to the learner, but I could not confirm exact names or wording; do not cite them as LearnLM's until checked against the PDF).
- **Method worth copying:** 49 scenarios, each specifying learner goals, traits, actions and context; role-playing learners had to run at least 10 turns; both systems got identical instructions and opening query; order randomized and blind. Raters who preferred LearnLM cited staying on topic, challenging the learner, and not giving away answers; those who preferred others cited clarity, amount of information, and conversation style. That split is a warning: clarity and completeness are what raters (and learners) like in the moment, and they pull against active learning.
- **What Claude should do differently:** Nothing directly; this is for testing (see rubric items).
- **Failure tags addressed:** all (eval method).

### 4. Anthropic's learning mode: Socratic questioning with no published results
- **Claim:** Claude for Education (announced 2 April 2025) added a "Learning mode" in Projects that guides reasoning "rather than providing answers", with questions like "What evidence supports your conclusion?" Anthropic's education report says it is "experimenting" with a mode that "emphasizes the Socratic method and conceptual understanding over direct answers" and shares no outcome data.
- **Evidence:** Practitioner (product description, no efficacy data). https://www.anthropic.com/news/introducing-claude-for-education ; https://www.anthropic.com/research/anthropic-education-report-how-university-students-use-claude
- **Related data point:** In that report, about 47% of student conversations were "Direct" (seeking an answer with little back-and-forth), and collaborative conversations could still offload thinking (a probability homework example). The report says it cannot tell whether students learned.
- **What Claude should do differently:** Do not equate "I asked a question" with teaching. A Socratic reply to a learner with no prior knowledge is a failure (see Khanmigo critique below).
- **Failure tags addressed:** over-questioning, no-diagnosis.

### 5. Khanmigo: Socratic by design, with reported frustration for stuck learners
- **Claim:** Khanmigo (GPT-4 based) is prompted to behave as a Socratic tutor that asks guiding questions rather than giving answers; critics report it frustrates stuck students who need a worked example first, and that students need baseline knowledge to benefit from questions.
- **Evidence:** Practitioner, low confidence. Only secondary reporting was found in one search (Freethink interview coverage https://www.freethink.com/consumer-tech/khanmigo-ai-tutor ; a critical review https://pedley-smith.uk/tag/khanmigo/ ). I did not find Khan Academy's own design document, and "leaked system prompt" pages are unverified, so do not cite them. The critique matches the expertise-reversal logic in area A, which is where the grade should come from.
- **What Claude should do differently:** When a learner is stuck twice on the same step, switch from questions to a worked step plus a fresh parallel problem. (The rule itself belongs to area A; this is supporting anecdote.)

## Design lessons to reuse in the skill (derived from 1 to 5)

1. The failure to prevent is the learner using the AI as a crutch. Measure learning with a no-AI follow-up, never with the quality of the final answer.
2. Accurate worked solutions in hand beat improvising; tutor errors are costly.
3. One step at a time, learner acts every turn.
4. Do not trade learning for the things that make a reply feel good (clarity, completeness). Raters rewarded staying on topic, challenging the learner, and withholding answers when judged on pedagogy; learners may rate the opposite.
5. A rule of "never give the answer" is not the lesson of these studies. Guardrails prevented harm (Bastani) and step-by-step guidance worked (Kestin), but the tell-vs-guide boundary is explicitly unresolved.

## Rubric items we can reuse (for testing/rubric.md; mark v0 until checked against the LearnLM PDF)

Each is a yes/no or 1 to 5 item a grader can score from a transcript.
1. Active learning: in the last two-thirds of the transcript, does the learner do the cognitive work (predict, attempt, explain), or does Claude do it and narrate? (LearnLM: "inspiring active learning")
2. Metacognition: does Claude ask the learner to say how sure they are, why they chose a step, or what they would check? (LearnLM: "deepening metacognition")
3. Curiosity: does Claude connect the content to something the learner cares about or a question worth asking, without derailing? (LearnLM: "stimulating curiosity")
4. Diagnosis and adaptation: does Claude find out what the learner knows before teaching, and change level after a correct or wrong answer? (our own item, motivated by `learn`)
5. Cognitive load: one idea per turn, short, no unrequested wall of text. (Kestin prompt guideline; LearnLM name unverified)
6. Answer leakage: does Claude give the full solution to a problem the learner is meant to solve, before they attempt? Score by when, not whether; giving it after two failed attempts is allowed.
7. Correctness: every factual claim and worked step is right (tutors that are wrong teach wrong things; Kestin used expert solutions to prevent this).
8. Transfer check: does Claude give the learner a variant to do without help before closing? (Bastani: later no-AI performance is what counts)
9. Stays on topic and challenges at the right level (reason raters preferred LearnLM).
10. Stuck-learner response: after repeated failure, does Claude lower the support threshold (hint, then worked step) rather than repeating a question? (Khanmigo critique)
11. Scenario method: multi-turn scripted learners with goals and traits, at least 10 turns, same opening for each condition, blind randomized order, as in LearnLM.

## Contradictions / open questions

- Kestin's tutor beat active learning; Bastani's guardrailed tutor did not beat control. Differences: topic, content quality (expert step solutions), age, task, outcome measure. Not resolved.
- Nobody has a direct test of "give the answer after N failed attempts" in an LLM tutor.
- Khanmigo evidence is secondary; look for Khan Academy's own write-ups before relying on it.
- Verify LearnLM's complete principle list from the PDF (the arXiv PDF exceeded the fetch size limit; try the Google blog or a mirror).
- Verify Bastani's GPT Tutor design and whether the Tutor group matched control on the exam.

## Candidate skill text
- "Before tutoring a problem, solve it yourself first so your hints are correct. Then guide one part at a time. Students who are given full solutions practice better and learn worse once the help is gone, so give the smallest help that gets them moving, and finish with a similar problem they do alone."
- "A question is not teaching. If the learner is stuck after a hint, show one step worked out and ask for the next one."

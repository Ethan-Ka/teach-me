# J. Domain gaps: writing, languages, codebase onboarding, unseen physical skill

**Research question:** Q1 (tell, guide, or let them do it) and Q2 (how Claude knows it is working) in four domains where `references/domains/` is v0: `writing.md`, `languages.md`, the codebase part of `programming.md`, and `motor-and-music.md`.
**Sessions:** 2026-11-11. About 37 tool calls.

**Verification status (read first).** WebFetch returned 403 for Writing Next and a binary PDF for LaToza 2006, so I did not read any primary text this session. Every figure below comes from search-result summaries of abstracts, publisher records, or reputable secondary pages, and is marked "abstract-level". Effect sizes marked (unverified) appeared in only one secondary source or conflicted between sources. Before any number goes into SKILL.md or a reference file, open the primary paper. Directions of effect are safer than magnitudes.

Grades follow `research/PLAN.md`: Strong, Moderate, Practitioner, Contested.

---

## 1. Teaching writing

### 1.1 Explicit strategy instruction (planning, drafting, revising) beats unguided practice
- **Claim:** Teaching adolescents specific strategies for planning, revising and editing raises writing quality more than most other interventions.
- **Evidence:** Strong for direction. Graham and Perin 2007, "A meta-analysis of writing instruction for adolescent students", Journal of Educational Psychology 99(3), 445-476: 123 documents, 154 effect sizes; writing strategies average weighted ES 0.82 (n = 20 studies), 1.02 for low-achieving students (n = 9) (abstract-level and a state synopsis: https://www.oregon.gov/ode/educator-resources/essentialskills/Documents/essentialskillwriting_hs_level2_writing_next_synopsis.pdf). A newer best-evidence synthesis of grades 6-12 reports a smaller strategy effect of 0.59 (search summary only, unverified; treat 0.82 as an upper estimate from older, smaller-sample studies).
- **Boundary conditions:** Grades 4-12 students writing in school; outcome is rated quality of a text, often the same genre that was taught. Most studies had trained teachers delivering multi-session programs, not one chat turn. Transfer to unlike genres is weaker than the headline suggests (I did not verify this; flag it).
- **What Claude should do differently:** When a learner repeats the same writing problem (no plan, no thesis, no revision), teach a short named procedure for that step ("state claim, list two reasons, check each reason has evidence") and have them use it on their own draft, rather than commenting on the text only.
- **Example:** Before: "Your intro is weak, here is a better one." After: "Here is a three-step check for an intro: hook, claim, roadmap. Run it on your intro and tell me which step is missing."
- **Failure tags addressed:** demo-not-teach, no-practice.

### 1.2 SRSD (Self-Regulated Strategy Development)
- **Claim:** SRSD teaches a strategy plus self-regulation (goal setting, self-monitoring, self-instruction) through staged support and has the largest and most replicated effects among writing interventions.
- **Evidence:** Moderate to Strong. A Harris/Graham-group meta-analysis table: SRSD averaged ES 1.17 across 14 studies, CI [0.81, 1.53] (search-result snippet of a 2012 table; unverified). Graham, Harris and Santangelo 2015, Elementary School Journal 115(4), 498-522 includes it (https://doi.org/10.1086/681964); I could not see its SRSD number. Other quoted figures (1.1-1.3) come from the program's own advocacy site (srsdonline.org), which is a conflict of interest. SRSD stages as I could confirm only in general terms: develop background knowledge, discuss the strategy, model it, memorize it, support (scaffolded use), independent performance. I could not confirm the exact stage list from a primary text this session.
- **Boundary conditions:** Many studies are by the developers, many are single-subject designs with small samples; effects were measured on trained genres. Developer-affiliation bias is plausible. Typically delivered by teachers over weeks. Mnemonic-based strategies (like POW + TREE) suit a school-age learner; an adult drafting a cover letter may need only the plan and the self-check.
- **What Claude should do differently:** Use the SRSD shape in miniature: name the strategy and why it works, think aloud through one use on a different topic than the learner's, ask the learner to restate the steps, have them apply it with Claude giving help only on request, then let them set a goal ("this draft I will have two reasons each with evidence") and self-check against it. Fade support across turns.
- **Failure tags addressed:** demo-not-teach, no-feedback-loop.

### 1.3 Feedback on drafts: source matters, and the writer has to act on it
- **Claim:** Feedback on writing helps, adult/teacher feedback most; feedback is only useful if the writer revises with it. Information content, not praise, drives the effect.
- **Evidence:** Moderate. Graham, Hebert and Harris 2015, "Formative assessment and writing: a meta-analysis" (grades 1-8): weighted ES 0.87 adult feedback, 0.58 peer, 0.62 self, 0.38 computer (search summary of abstract; https://typeset.io/pdf/formative-assessment-and-writing-a-meta-analysis-3gdgbc2rxt.pdf). General feedback: Wisniewski, Zierer and Hattie 2020, Frontiers in Psychology 10:3087, d = 0.48 overall with high heterogeneity, information content a key moderator, larger effects on cognitive and motor outcomes than on motivation (https://www.frontiersin.org/articles/10.3389/fpsyg.2019.03087/pdf). Graham et al. 2015 is evidence for feedback in general, not for feedback from an AI; "computer" feedback in that review is 2000s-era automated scoring, not an LLM.
- **Boundary conditions:** Grades 1-8 in the writing review. Effects measured when students were asked to revise or when feedback was tied to the next piece. Feedback that is not acted on is not covered.
- **What Claude should do differently:** Give two or three prioritized comments, each pointing to a place in the text, saying what the criterion is and why it matters; then ask the learner to revise that one place and paste it back. Do not stack twenty edits. Close the loop: ask "what did you change and did it do what you wanted?"
- **Example:** Before: eight line edits and a rewritten paragraph. After: "Two things. (1) Your claim comes in sentence 4; readers need it by sentence 2. (2) Para 2 makes a claim with no evidence. Revise just para 2 and paste it."
- **Failure tags addressed:** no-feedback-loop, wall-of-text, demo-not-teach.

### 1.4 Modeling with think-alouds (observational learning)
- **Claim:** Watching a model write while thinking aloud, then evaluating what the model did, teaches writing processes better than practicing alone.
- **Evidence:** Moderate. Dutch research program (Rijlaarsdam, Braaksma, Couzijn; secondary-school and university students, argumentative and instructional texts): observers of peer-model videos wrote better texts than learners who practiced the task, and used more metacognitive strategies afterward. Observation alone is not enough: evaluation and elaboration of the model's choices are essential; weaker writers learn more from the weaker model, stronger writers from the stronger (search summaries of https://pure.uva.nl/ws/files/874000/77926_319423.pdf and related items; abstract-level, not verified).
- **Boundary conditions:** Models were peers, not experts; videos were scripted tasks, not open drafting. It supports using models, not Claude writing the learner's own piece. A flawless model can hide the process; show the false starts.
- **What Claude should do differently:** Model on a parallel text (a different topic from the learner's), think aloud including a revision ("this opening is vague; I will name the actor"), then ask the learner to rate it against the criteria ("what is stronger, what is still weak?"). Then have them do the same move on their own text. Offer two models of different quality for a compare-and-rank exercise.
- **Failure tags addressed:** demo-not-teach.

### 1.5 Writing workshop and conferencing
- **Claim:** A short one-to-one conference that starts from the writer's intent (research), picks one teaching point, and ends with the writer committing to a next step is the practitioner standard for responding to drafts.
- **Evidence:** Practitioner for the structure (Graves 1982, Calkins 1983, "Research-Decide-Teach" as described in a TCRWP-style summary; I read only snippets: https://www.readingrockets.org/strategies/writing_conferences). Conference research is mostly qualitative; one found teacher language shapes whether children act as active participants or passive observers, and that revision behavior varies by student. Process writing as a whole: Sandmel and Graham 2011, Journal of Educational Research 104(6), 396-407: ES 0.34 for general-education students, not significant for struggling writers (ES 0.29), no motivation gain (abstract-level; https://informahealthcare.com/doi/abs/10.1080/00220671.2010.488703). So workshop structure alone (time, choice, peer response) is only a modest booster; explicit strategy instruction does more (1.1).
- **Boundary conditions:** Classroom workshop with many days of writing; the one-to-one conference does not require that, but evidence for it is observational. Struggling writers need explicit strategy teaching more than the open workshop.
- **What Claude should do differently:** Open with "what are you trying to do in this piece, and what worries you?"; read for intent before critiquing; choose one teachable point per conference; end with "what will you do next?". Match the ask to the learner: a struggling writer gets a named strategy, a confident writer gets a question.
- **Failure tags addressed:** no-diagnosis, over-questioning (if the intent question is skipped), wall-of-text.

### 1.6 Do not rewrite the learner's prose
- **Claim:** If the tutor does the writing, the learner learns less. The evidence is indirect, from the answer-giving literature, not from writing research.
- **Evidence:** Moderate, by analogy. Bastani et al. 2025, PNAS 122: an unrestricted GPT-4 tutor raised practice scores (+48%) but lowered later unaided exam scores by 17% in high-school math; a guardrailed tutor (+127% practice) left exam scores equal to control (search summary: https://econpapers.repec.org/RePEc:nas:journl:v:122:y:2025:p:e2422633122). One school in Turkey, math, four 90-minute sessions. Not a writing study. I found no controlled study of an AI rewriting student prose and learning or ownership; this is a gap. The Rijlaarsdam observational findings (1.4) support modeling on a different text.
- **Boundary conditions:** If the user wants the document, not the skill, rewriting is legitimate (see `writing.md` section 2 routing). The risk applies when the stated goal is to learn.
- **What Claude should do differently:** Point to the place, name the criterion, ask for the revision. If you must show a version, rewrite a different sentence or do one sentence as a model and ask the learner to do the rest. After showing an alternative, ask the learner to say what changed and why.
- **Failure tags addressed:** demo-not-teach.

### Mistakes to avoid (writing)
- Rewriting the learner's paragraph "as an example".
- Feedback on twenty things; no prioritization.
- Praise only ("great job") with no information.
- Offering a model with no evaluation task attached.
- Treating process-writing structure (free choice, peer share) as sufficient; it is a modest effect.
- Citing 0.82 as if it will hold for one chat turn.

---

## 2. Teaching languages

### 2.1 Comprehensible input: necessary, not sufficient
- **Claim:** Learners need lots of input they mostly understand. The strong claim that input alone is sufficient (Krashen) is widely rejected.
- **Evidence:** Contested (strong form), Moderate (weak form). Krashen 1982/1985 claims comprehensible input is necessary and sufficient. Critics (Swain, Long) argue output and interaction are also needed, and reviews call the strong version conceptually weak and hard to test (search summaries; e.g. https://core.ac.uk/download/268084916.pdf). Support for the weak form: Jeon and Day 2016, extensive reading meta-analysis, 49 studies, 71 samples, 5,919 participants, small to medium effects (about 0.5 for reading comprehension per a secondary table, unverified); adults and EFL settings benefited more (abstract-level; https://scholarspace.manoa.hawaii.edu/items/b52a5591-ec04-4026-816f-434361a4e899). Norris and Ortega 2000 (Language Learning 50(3), 417-528): focused instruction produced large gains and explicit types beat implicit (abstract-level), which cuts against "just give input".
- **Boundary conditions:** Reading gains measured on reading tests; ER effects depend on text level and hours. Immersion contexts differ from a chat tutor.
- **What Claude should do differently:** Supply level-appropriate text or dialogue where most words are known, but don't stop there: pair every input with a production task. Do not tell the learner that input alone will get them there. Be willing to give explicit rule explanations for a confusing contrast (Norris and Ortega).
- **Failure tags addressed:** demo-not-teach, no-practice.

### 2.2 Output and interaction
- **Claim:** Producing language forces learners to notice gaps, test hypotheses and reflect on form; interaction with feedback drives acquisition.
- **Evidence:** Moderate (interaction), Contested (output noticing). Swain 1985/1995 output hypothesis (noticing, hypothesis-testing, metalinguistic functions); Schmidt's noticing hypothesis; Long 1996 interaction hypothesis (negotiation of meaning). A meta-analysis of interaction studies (Mackey and Goo 2007, 28 studies) found medium effects of interaction on immediate tests (0.71) and large on delayed tests (1.09) (secondary report, unverified). Empirical support for the noticing function of output is mixed (search summary; https://experts.umn.edu/en/publications/testing-the-output-hypothesis/ and others).
- **Boundary conditions:** Most studies are lab or classroom with a human interlocutor and a specific target form; effect sizes include interaction that included corrective feedback, so they are not "output alone". Evidence for output alone is weaker.
- **What Claude should do differently:** Make each turn require production with a communicative reason, not only translation. If the learner is understood, respond to the message first (negotiate meaning); target one form for feedback.
- **Failure tags addressed:** no-practice.

### 2.3 Corrective feedback: prompts beat recasts in classrooms, with caveats
- **Claim:** Feedback that pushes learners to produce the correction (prompts: clarification request, repetition of the error, metalinguistic clue, elicitation) tends to beat recasts (reformulating the error) in classroom studies; explicit correction is effective in the short term, implicit feedback may be better maintained.
- **Evidence:** Moderate. Lyster and Ranta 1997, SSLA 19(1), 37-66: six feedback types identified in French immersion classes; recasts were the most frequent but led to the least learner uptake in that data (abstract-level; https://www.cambridge.org/core/product/4999EE1C8379B2BF026B148EAF373CA1 is the Lyster-Saito record; I did not reach the 1997 text). Lyster and Saito 2010, SSLA 32(2), 265-302: 15 classroom studies, N = 827; prompts had larger effects than recasts, especially on free-production measures; younger learners benefited more. Li 2010, Language Learning 60(2), 309-365: 33 studies; corrective feedback has a medium overall effect that lasted; implicit feedback was better maintained over time than explicit (abstract-level; I could not see recast-specific numbers). Mackey and Goo's interaction work also pools CF.
- **Boundary conditions:** Classroom data, children and adolescents largely; effect sizes depend on whether tests are constrained (favoring explicit) or free production (favoring prompts). Recasts can work when the learner notices them as corrections and in one-to-one lab settings. In a text chat, "recast" differs: the learner can read the correct form, and may not notice it is a correction at all.
- **What Claude should do differently:** For a typed error the learner can probably fix, prompt first ("check the verb in sentence 2"), and give the explicit form if they cannot. Use a recast only inside free conversation, and then flag it ("(small fix: *fui*, not *iba*)") so it is noticed. Correct one recurring error type per turn.
- **Example:** Before: "Great! *Yo fui al mercado.*" (silent recast). After: "You wrote *yo iba al mercado*. Think about whether this is a single finished trip or a habit. Which past tense fits?"
- **Failure tags addressed:** no-feedback-loop, over-questioning (if every error is prompted).

### 2.4 Spaced vocabulary
- **Claim:** Spacing practice improves L2 learning; shorter gaps match longer ones on immediate tests but lose on delayed tests.
- **Evidence:** Strong. Kim and Webb 2022, Language Learning 72(1), 269-319: 98 effect sizes, 48 experiments, N = 3,411; medium-to-large spacing effect; expanding and equal spacing similar (abstract-level; https://www.bohrium.com/en/paper-details/the-effects-of-spaced-practice-on-second-language-learning-a-meta-analysis/813033326355939328-6763). One secondary page said 37 studies; check the published count.
- **Boundary conditions:** Mostly vocabulary and grammar items in lab or classroom tests; the optimal gap depends on the retention interval; benefits assume retrieval, not re-reading.
- **What Claude should do differently:** Retrieve new words later in the same session, then give a return plan (a day, a week). In an artifact, build a Leitner-style review queue with the learner's own misses; do not give a static list.
- **Failure tags addressed:** no-practice, artifact-is-reference-doc.

### 2.5 Pronunciation from a text channel
- **Claim:** A text tutor cannot hear the learner and can't judge pronunciation; it can supply targets, describe articulation, and set up learner-run checks. Prioritize intelligibility, not nativelike accent.
- **Evidence:** Moderate. Munro and Derwing 1995 and later work separate accent, comprehensibility and intelligibility: a strong accent can still be fully intelligible, and instruction can improve intelligibility or only accentedness depending on method (Derwing, Munro and Wiebe 1998; search summary, abstract-level; https://www.benjamins.com/catalog/bct.121.02mun). Meta-analyses of computer-assisted pronunciation training report a medium effect overall (Almusharraf et al. 2024, 31 studies, 42 ES; ASR meta-analysis g = 0.69, Ngo, Chen and Lai 2023, 15 studies), but an earlier review judged the evidence low quality (Saleh and Al Khateeb 2019) (summaries: https://www.cambridge.org/core/journals/recall/article/effectiveness-of-automatic-speech-recognition-in-eslefl-pronunciation-a-metaanalysis/A915444CF252B61D14961D2FE733822D). These findings concern speech recognition software that does analyze audio; a text-only chat or static page cannot do it.
- **Boundary conditions:** CAPT studies use actual audio analysis; they do not support Claude judging pronunciation from a description.
- **What Claude should do differently:** Say it cannot hear. Choose the sounds that cause misunderstanding (minimal pairs that change meaning). Point to native audio, give an observable target, and have the learner record and compare; they report which words differed and how. Never write "your pronunciation was good".
- **Failure tags addressed:** no-feedback-loop.

### Mistakes to avoid (languages)
- Telling the learner that listening or reading alone is enough.
- Silent recasts in text, where the learner may not see them as corrections.
- Correcting every error.
- Judging pronunciation from a description of it.
- Static vocabulary lists with no return plan.
- Quoting prompts-beat-recasts as universal; it is classroom data with children.

---

## 3. Teaching a codebase or system to a newcomer

### 3.1 What newcomers need to find out: questions, not tours
- **Claim:** Programmers working on a change ask a recurring catalog of questions (where is this, what calls it, what will break if I change it, is this the right place), and newcomers struggle most on questions that need a mental model or design intent.
- **Evidence:** Moderate. Sillito, Murphy and De Volder 2006, FSE: catalog of 44 question types from two qualitative studies (newcomers on assigned changes to a medium code base; industrial programmers on their own changes); the journal version is Sillito et al. 2008, IEEE TSE (search summary; https://dblp.org/rec/conf/sigsoft/SillitoMV06). Ko, DeLine and Venolia 2007, ICSE: design questions were the hardest to satisfy; developers needed intent behind existing and yet-to-be-written code (https://faculty.washington.edu/ajko/papers/Ko2007InformationNeeds.pdf, abstract-level). LaToza, Venolia and DeLine 2006, ICSE: developers hold mental models of the code that documents do not capture (abstract only; PDF would not parse).
- **Boundary conditions:** Professional developers; small samples; change tasks rather than "learning for its own sake". Claude in claude.ai has no repo access; Claude Code does.
- **What Claude should do differently:** Start from the learner's task ("what do you need to change or understand?") and answer in the form of the questions on the list: where does this start, what does it call, what is the data, what is the intent. Surface design intent explicitly (why it is built this way) when the code or comments reveal it; say "I can't tell why" when they don't.
- **Failure tags addressed:** no-diagnosis, wall-of-text.

### 3.2 Read and trace before writing
- **Claim:** The ability to read and trace code predicts and probably supports the ability to write it; practice tracing before asking for writing.
- **Evidence:** Moderate, correlational. Lister et al. 2004 (multi-national study, SIGCSE Bulletin 36(4)); Lopez, Whalley, Robbins and Lister 2008 (ICER): tracing and "explain in plain English" performance correlated with code writing, suggesting a hierarchy; replications by Lister, Fidge and Teague 2009 and Fowler et al. 2022 (600+ students, Python), whose authors note this cannot fix teaching order (search summaries; https://opus.lib.uts.edu.au/handle/10453/10806). Xie et al. 2019, Computer Science Education 29(2-3): a skill-ordered curriculum (tracing, syntax, templates) gave higher completion and fewer errors than an unseparated one (abstract-level, via a secondary summary; https://faculty.washington.edu/ajko/papers/Xie2019IntroCSTheoryOfInstruction.pdf). PRIMM (see F notes) is the classroom form: 13 schools, 493 students, outperformed control (https://eprints.gla.ac.uk/229013).
- **Boundary conditions:** Novices in intro courses, on small programs. Experienced engineers onboarding to a large system are not novices; for them, predicting trivial code wastes time and expertise reversal applies.
- **What Claude should do differently:** For a novice, ask the learner to predict what a function returns for a given input, or to explain a snippet in plain English, before showing anything. For an experienced developer, skip syntax prediction; ask them to predict the system-level step (which service handles this request, where does the config load).
- **Example:** Before: "Here is how requests flow: router.js calls auth.js which calls..." After: "This route handler is in `routes/orders.js`. Before I open it, what do you think it needs to check before creating an order?"
- **Failure tags addressed:** demo-not-teach.

### 3.3 One concrete path, built up in hops, with the learner doing the next hop
- **Claim:** Teach a system by tracing one concrete scenario end to end, letting the learner predict each hop, instead of a directory-by-directory tour.
- **Evidence:** Practitioner, v0, with Moderate support for the mechanics from 3.1 and 3.2. Program comprehension work finds developers mix top-down hypotheses with bottom-up reading and use a feature-first approach (search summaries in F notes; ICPC 2025 abstract). I found no controlled study of onboarding interventions; the Steinmacher et al. systematic review concerns barriers faced by newcomers to open-source projects (21 studies in one version) and is about barriers (documentation, orientation, social), not teaching methods (https://www.ime.usp.br/~gerosa/papers/IST_SysReview_PrePrint.pdf, abstract-level).
- **Boundary conditions:** Needs the learner's goal. Claude must read the code first so it can check predictions; without file access it depends on what the user pastes.
- **What Claude should do differently:** Map in five lines, pick one scenario (a request, a command, a test), ask "where do you think this goes next and what will it need?", open the file, compare. After each hop ask for a one-line restatement (takes, returns, why). Close with "now trace a similar path yourself" or "where would you put this change?".
- **Failure tags addressed:** demo-not-teach, wall-of-text.

### 3.4 The code-tour monologue
- **Claim:** A long narrated walkthrough of files feels thorough and teaches little.
- **Evidence:** Practitioner by inference from ICAP (area C) and the PRIMM and tracing results above; no direct study of code tours. Label v0.
- **Boundary conditions:** A short orientation map (what exists, what to ignore) is fine and helps novices who have no schema; it becomes a problem when it replaces predicting and tracing. A recorded tour a person chooses to read later is a reference, not a lesson.
- **What Claude should do differently:** Keep any map under ten lines, then switch to the learner doing something: predicting, finding, or explaining. Offer the reference doc as a by-product after they have traced something, not as the lesson.
- **Failure tags addressed:** demo-not-teach, artifact-is-reference-doc.

### Mistakes to avoid (codebase)
- Touring every directory.
- Answering design-intent questions with confident guesses; say what the code shows and what it doesn't.
- Using novice-level prediction tasks on experienced engineers.
- Generating a reference doc and calling it a lesson.
- Not reading the code before asking the learner to predict it.

---

## 4. Coaching a physical skill you cannot see or hear

### 4.1 External focus of attention (Wulf)
- **Claim:** Instructions that direct attention to the effect of the movement on the environment ("push the ball toward the target") produce better learning than ones about body parts ("keep your elbow in").
- **Evidence:** Contested, leaning Moderate. Chua, Jimenez-Diaz, Lewthwaite, Kim and Wulf 2021, Psychological Bulletin: external focus beat internal for performance (g = 0.26), retention (g = 0.58) and transfer (g = 0.58); age, health and skill level did not moderate (73 and 40 studies; search summary; https://digitalscholarship.unlv.edu/kns_fac_articles/424). But McKay et al. 2024, Psychological Bulletin, "Reporting bias, not external focus", a robust Bayesian reanalysis, found funnel-plot asymmetry consistent with selective reporting and heterogeneity depending on unknown contextual factors (search summary; https://raw.github.com/cartermaclab/carterlab-papers/main/2024_mckay-etal_reporting-bias-not-external-focus-a-robust-bayesian-meta-analysis-and-systematic-review-of-the-external-focus-of-attention.pdf). Distal external focus beating proximal is reported (SMD about 0.22 to 0.23) with wide heterogeneity (Nicklas et al. 2022; Zang et al. 2025).
- **Boundary conditions:** Mostly lab tasks with simple targets (balance, throws, jumps), healthy adult volunteers, tested within a session or a day. Applying it to a guitar chord change or a woodworking cut is extrapolation. Some tasks need body-part cues at first (what a finger should do).
- **What Claude should do differently:** Prefer cues phrased in terms of the result or the instrument ("let the string ring clean", "aim the chisel edge at the line") where one exists, and use a body cue only when the learner cannot do the movement at all. Treat this as a default to test, not a law.
- **Failure tags addressed:** no-feedback-loop.

### 4.2 Self-video and checklists
- **Claim:** Seeing one's own performance with something specific to look for supports motor learning; the learner choosing when to watch helps.
- **Evidence:** Moderate. Mödinger et al. 2021 systematic review in physical education: 11 studies met quality criteria; video-based visual feedback seemed to help and to beat verbal feedback alone (search summary; https://swov.nl/en/publicatie/video-based-visual-feedback-enhance-motor-learning-physical-education-systematic-review). Ste-Marie et al. 2013: children who controlled when they watched their trampoline video learned more than a fixed-schedule group (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3554505/). I did not verify the "novices need guidance on what to look at" claim; it came up as a lead and returned nothing. Checklists of observable criteria are a Practitioner move with no study found.
- **Boundary conditions:** School-age and young-adult movement tasks, with feedback from a teacher in at least some designs; a learner recording a guitar take sees and hears themselves but may not know what to look for.
- **What Claude should do differently:** Ask the learner to record a short take, then give a three-item checklist of observables to review ("did the third finger land before the beat? did the open string ring? where did you slow down?") and report back. State that Claude cannot watch the video unless the app lets them share it.
- **Failure tags addressed:** no-feedback-loop.

### 4.3 Honor-system self-assessment
- **Claim:** When the tutor cannot observe, the learner's report is the data; make it specific and countable.
- **Evidence:** Practitioner, with general support from the feedback literature (information content matters, Wisniewski et al. 2020). No motor-learning study found on the validity of self-reported success counts for novices; plausibly novices are poor judges, which is why the checks must be external (metronome, recording, a count out of ten).
- **Boundary conditions:** Novices over-estimate; learners with an unreliable ear can't hear the error. Checks must be binary or countable, not "did it feel good".
- **What Claude should do differently:** Ask "out of 10 tries, how many were clean at this tempo?" and "which beat drifts?" instead of "how did it go?". Use their count to set the next step (4 of 5 clean: raise tempo one notch; below 3 of 5: slow down). Say plainly that the result is self-reported.
- **Failure tags addressed:** no-diagnosis, no-feedback-loop.

### 4.4 Feedback frequency: less, and from the learner first
- **Claim:** Constant external correction can make learners depend on it; reduced feedback frequency and learner-requested feedback often work as well or better.
- **Evidence:** Contested. The guidance hypothesis (Salmoni, Schmidt and Walter 1984; Schmidt et al. 1989) predicts reduced frequency helps; several studies do not confirm it; a Wulf group study found 33% feedback beat 100% under internal focus but not under external focus (Frontiers in Psychology 2010, https://www.frontiersin.org/articles/10.3389/fpsyg.2010.00190/full); concurrent auditory feedback in a 2016 study helped retention (search summaries).
- **Boundary conditions:** Lab motor tasks with knowledge-of-results; the interaction with attentional focus is unresolved.
- **What Claude should do differently:** Ask the learner for their own judgment first ("what did you notice?") before giving yours, and avoid commenting on every attempt. In a chat this is natural: reports come in bursts, not trial by trial.
- **Failure tags addressed:** over-questioning, no-feedback-loop.

### 4.5 Blocked vs random practice
- **Claim:** Mixing task variants within practice (random) tends to improve transfer and retention over repeating one variant (blocked), but blocked is better during acquisition and for beginners on complex skills.
- **Evidence:** Contested. Meta-analysis of randomized trials (Jimenez Diaz, Salazar and Morera-Castro 2016): blocked group did better in acquisition, no significant difference at retention; moderated by age, trial count, skill type and movement precision (search summary). A 2024 systematic review and meta-analysis (Frontiers in Psychology, PubMed 39205981; 34 studies in the quantitative analysis): medium effect on transfer favoring random, significant in lab studies but small and non-significant in applied studies; negligible in young participants, large in older adults (https://pubmed.ncbi.nlm.nih.gov/39205981/). Shea and Morgan 1979 not verified. For vocabulary lists blocking beat interleaving (Brunmair and Richter 2019; D notes), a cognitive, not motor, finding.
- **Boundary conditions:** Applied studies show little benefit; young participants show little; complexity and beginner status favor blocking first.
- **What Claude should do differently:** Start blocked (repeat the one chord change until it is clean), then mix variants in a later session (change A to D, D to E, E to A in random order). Say that the mixed practice will feel harder and look worse on the day; that is expected, with the caveat that evidence in applied settings is weak.
- **Failure tags addressed:** no-practice.

### 4.6 Practice strategy beats practice time (music)
- **Claim:** What a musician does in practice (targeting errors, slowing down) predicts later performance better than hours.
- **Evidence:** Moderate, small. Duke, Simmons and Cash 2009, Journal of Research in Music Education 56(4), 310-321: 17 pianists learned a three-bar passage in one session; practice strategies mattered more than total time or trials for next-day performance (secondary summaries only; single session, next-day test). Fits F notes on slow practice (Practitioner) and Macnamara et al. (deliberate practice contested).
- **Boundary conditions:** Advanced pianists, one passage, 24 hours. No long-term evidence found.
- **What Claude should do differently:** Plan practice around the smallest failing unit and a success criterion, not minutes.
- **Failure tags addressed:** no-practice.

### 4.7 How online coaches give feedback asynchronously
- **Claim:** Asynchronous coaching works as a submit-review loop: learner posts a video or recording, coach returns a few specific points and one assignment.
- **Evidence:** Practitioner, vendor and community sources only. JustinGuitar's Student Performances section lets students post videos and receive peer comments (https://justinguitar.com/student-performances; community announcement, https://community.justinguitar.com/t/new-feature-student-performance-comments/398628); I found no evidence of instructor review there. ArtistWorks describes a video-exchange model with the instructor (vendor blog; https://blog.artistworks.com/?p=8087), marketing claim. No research on asynchronous music-lesson feedback found. Not verified by watching coaching in action.
- **Boundary conditions:** Source quality is low; do not claim these are best practice.
- **What Claude should do differently:** Mirror the loop in chat: "record one minute; check these three things; come back and tell me; here is your one assignment until then." Keep the assignment small and testable.
- **Failure tags addressed:** no-feedback-loop.

### Static page constraints (no audio or motion detection)
- A static page can show a metronome (the browser can play a click), a timer, a tally counter for "clean out of 10", a checklist the learner ticks, and a log of dated attempts. It cannot judge the sound or the movement. Say so on the page. Use self-report as the input and design checks that are countable and external (tempo, count, recording-and-compare).

### Mistakes to avoid (physical skill)
- Praising technique Claude cannot observe.
- Telling the learner exactly where the elbow should be as the only cue.
- "Practice 10,000 hours" claims.
- Correcting every attempt.
- Presenting blocked-versus-random or external-focus as settled.
- Building a page that pretends to detect pitch, rhythm or posture.

---

## Contradictions / open questions

- Writing Next effect sizes: 0.82 for strategies in the 2007 meta-analysis versus 0.59 in the newer best-evidence synthesis; magnitudes depend on design and era. The process writing approach shows modest effects (0.34) in one meta-analysis and a different "small" value in another secondary source (0.09, unverified).
- SRSD effects come heavily from developer labs; independent replications not checked.
- No controlled study of LLM rewriting versus prompting on writing learning or ownership; 1.6 rests on a math-tutor study.
- Interaction and output effect sizes include corrective feedback, so they cannot isolate output.
- External focus: Chua 2021 versus McKay 2024 (reporting bias); no moderation by skill level in Chua conflicts with the common belief that beginners need body cues.
- Contextual interference: lab versus applied; young versus old; the 2016 and 2024 meta-analyses measure different outcomes.
- Codebase onboarding has no intervention studies; 3.3 and 3.4 are v0.
- Not found or not verified: Li 2010 recast-specific numbers; Lyster and Ranta 1997 uptake percentages; Shea and Morgan 1979; Hermans, *The Programmer's Brain*; Storey's program comprehension review; Murray and Calkins primary texts; any peer-reviewed work on asynchronous music-lesson feedback; YouTube teachers (only JustinGuitar's site was checked; no transcripts or timestamps pulled, so nothing from video is logged).

## Candidate skill text

**Writing** (for `writing.md`): "When someone wants to get better, not just get the piece done, teach one named strategy for the step that is failing, think aloud through it on a different text, then have them use it on their own draft. Give two or three comments tied to places in the text, say what criterion each meets, and ask them to revise one place and paste it back. Don't rewrite their paragraph: learners who get the answer do worse when it is taken away (Bastani et al. 2025, math) and writing research shows strategy instruction with self-checking is among the biggest levers (Graham and Perin 2007; magnitudes unverified)."

**Languages** (for `languages.md`): "Give input they mostly understand, then make them produce something with it; input alone is not enough. For a typed error they can probably fix, prompt ('check the verb in sentence 2'), because prompts beat recasts in classroom studies; if you do recast inside free conversation, flag it so it's noticed. Space vocabulary with a return plan (strong evidence). You can't hear them: give targets that affect meaning, native audio, and a record-and-compare check."

**Codebase** (for `programming.md`): "Ask what they need to do. Give a map of at most ten lines, then pick one concrete scenario and let them predict the next hop before you open the file. After each hop, have them restate what goes in and out. Novices get trace-and-explain tasks first; experienced engineers get predictions at the system level. Say what the code shows and what it doesn't about why it is built this way."

**Physical skill** (for `motor-and-music.md`): "You can't see or hear them, so say so and work from counts and recordings. Prefer cues about the result ('let the string ring') over body-part cues, as a default, since the evidence is mixed. Start blocked on the smallest failing unit, mix variants later, and expect mixed practice to feel harder. Ask for their own judgment first, then a count out of ten, then set the next step from it."

## Sources to log

Date checked: 2026-11-11 for all. "Abstract-level" means read through a search-result summary, not the full text.

1. Graham, S. and Perin, D. (2007). A meta-analysis of writing instruction for adolescent students. Journal of Educational Psychology 99(3), 445-476. DOI 10.1037/0022-0663.99.3.445. Synopsis: https://www.oregon.gov/ode/educator-resources/essentialskills/Documents/essentialskillwriting_hs_level2_writing_next_synopsis.pdf (abstract-level; Writing Next PDF at readingrockets returned 403).
2. Graham, S., Harris, K. and Santangelo, T. (2015). Research-based writing practices and the Common Core: meta-analysis and meta-synthesis. Elementary School Journal 115(4), 498-522. https://doi.org/10.1086/681964 (abstract-level; SRSD effect not seen).
3. Graham, S., Hebert, M. and Harris, K. (2015). Formative assessment and writing: a meta-analysis. Elementary School Journal. https://typeset.io/pdf/formative-assessment-and-writing-a-meta-analysis-3gdgbc2rxt.pdf (abstract-level).
4. Sandmel, K. and Graham, S. (2011). The process writing approach: a meta-analysis. Journal of Educational Research 104(6), 396-407. https://informahealthcare.com/doi/abs/10.1080/00220671.2010.488703 (abstract-level).
5. Graham, S., Kiuhara, S. and MacKay, M. (2020). The effects of writing on learning in science, social studies, and mathematics: a meta-analysis. Review of Educational Research. https://readingrockets.org/resources/resource-library/effects-writing-learning-science-social-studies-and-mathematics-meta (abstract-level, ES 0.30; not used in findings above, log for the writing-to-learn question).
6. SRSD Online (srsdonline.org). https://srsdonline.org/science-of-writing/ (advocacy site; low weight).
7. Rijlaarsdam, G., Braaksma, M., Couzijn, M. et al., observational learning in writing, e.g. https://pure.uva.nl/ws/files/874000/77926_319423.pdf (abstract-level; individual paper titles and years not confirmed).
8. Reading Rockets, Writing conferences. https://www.readingrockets.org/strategies/writing_conferences (practitioner summary; Graves 1982 and Calkins 1983 not read).
9. Bastani, H. et al. (2025). Generative AI without guardrails can harm learning: evidence from high school mathematics. PNAS 122. https://econpapers.repec.org/RePEc:nas:journl:v:122:y:2025:p:e2422633122 (abstract-level).
10. Wisniewski, B., Zierer, K. and Hattie, J. (2020). The power of feedback revisited: a meta-analysis of educational feedback research. Frontiers in Psychology 10:3087. https://www.frontiersin.org/articles/10.3389/fpsyg.2019.03087/pdf (abstract-level).
11. Lyster, R. and Ranta, L. (1997). Corrective feedback and learner uptake. Studies in Second Language Acquisition 19(1), 37-66 (citation confirmed; text not read).
12. Lyster, R. and Saito, K. (2010). Oral feedback in classroom SLA: a meta-analysis. SSLA 32(2), 265-302. https://www.cambridge.org/core/product/4999EE1C8379B2BF026B148EAF373CA1 (abstract-level).
13. Li, S. (2010). The effectiveness of corrective feedback in SLA: a meta-analysis. Language Learning 60(2), 309-365. DOI 10.1111/j.1467-9922.2010.00561.x (abstract-level; recast numbers not seen).
14. Mackey, A. and Goo, J. (2007). Interaction research in SLA: a meta-analysis and research synthesis. In Mackey (ed.), Conversational Interaction in SLA (cited via a 2018 review: https://www.cambridge.org/core/product/78A156EE200F744F5978F99BFB073DBE; effect sizes secondary).
15. Krashen/Swain/Long overview. https://core.ac.uk/download/268084916.pdf (secondary; primary Krashen 1982/1985, Swain 1985/1995, Long 1996 not read). Also https://experts.umn.edu/en/publications/testing-the-output-hypothesis/.
16. Norris, J. and Ortega, L. (2000). Effectiveness of L2 instruction: a research synthesis and quantitative meta-analysis. Language Learning 50(3), 417-528 (abstract-level).
17. Jeon, E. and Day, R. (2016). The effectiveness of ER on reading proficiency: a meta-analysis. Reading in a Foreign Language 28(2), 246-265. https://scholarspace.manoa.hawaii.edu/items/b52a5591-ec04-4026-816f-434361a4e899 (abstract-level).
18. Kim, S. and Webb, S. (2022). The effects of spaced practice on second language learning: a meta-analysis. Language Learning 72(1), 269-319. https://www.bohrium.com/en/paper-details/the-effects-of-spaced-practice-on-second-language-learning-a-meta-analysis/813033326355939328-6763 (abstract-level).
19. Munro, M. and Derwing, T. (1995) and Derwing, Munro and Wiebe (1998) on intelligibility and comprehensibility. https://www.benjamins.com/catalog/bct.121.02mun (abstract-level; 1998 not seen).
20. Ngo, T., Chen, H. and Lai, C. (2023). The effectiveness of automatic speech recognition in ESL/EFL pronunciation: a meta-analysis. ReCALL. https://www.cambridge.org/core/journals/recall/article/effectiveness-of-automatic-speech-recognition-in-eslefl-pronunciation-a-metaanalysis/A915444CF252B61D14961D2FE733822D (abstract-level). Also Almusharraf et al. (2024), Journal of Computer Assisted Learning; Saleh and Al Khateeb (2019), Review of Education (abstract-level via search summary).
21. Sillito, J., Murphy, G. and De Volder, K. (2006). Questions programmers ask during software evolution tasks. FSE, 23-34. https://dblp.org/rec/conf/sigsoft/SillitoMV06 (abstract-level; 2008 TSE version also).
22. Ko, A., DeLine, R. and Venolia, G. (2007). Information needs in collocated software development teams. ICSE. https://faculty.washington.edu/ajko/papers/Ko2007InformationNeeds.pdf (abstract-level).
23. LaToza, T., Venolia, G. and DeLine, R. (2006). Maintaining mental models: a study of developer work habits. ICSE, 492-501. https://www.microsoft.com/en-us/research/?p=154508 (abstract only; PDF would not parse).
24. Lopez, M., Whalley, J., Robbins, P. and Lister, R. (2008). Relationships between reading, tracing and writing skills in introductory programming. ICER, 101-112. https://opus.lib.uts.edu.au/handle/10453/10806 (abstract-level). Lister et al. (2004) SIGCSE Bulletin 36(4), 119-150 (citation only).
25. Xie, B. et al. (2019). A theory of instruction for introductory programming skills. Computer Science Education 29(2-3). https://faculty.washington.edu/ajko/papers/Xie2019IntroCSTheoryOfInstruction.pdf (abstract-level via secondary summary; full text not read).
26. Sentance, S., Waite, J. and Kallia, M. (2019). Teaching computer programming with PRIMM: a sociocultural perspective. Computer Science Education. https://eprints.gla.ac.uk/229013 (already in F notes).
27. Steinmacher, I., Graciotto Silva, M. and Gerosa, M. A systematic literature review on the barriers faced by newcomers to open source software projects. Information and Software Technology. https://www.ime.usp.br/~gerosa/papers/IST_SysReview_PrePrint.pdf (abstract-level).
28. Chua, L.-K., Jimenez-Diaz, J., Lewthwaite, R., Kim, T. and Wulf, G. (2021). Superiority of external attentional focus for motor performance and learning: systematic reviews and meta-analyses. Psychological Bulletin. https://digitalscholarship.unlv.edu/kns_fac_articles/424 (abstract-level).
29. McKay, B. et al. (2024). Reporting bias, not external focus: a robust Bayesian meta-analysis and systematic review of the external focus of attention. Psychological Bulletin. https://raw.github.com/cartermaclab/carterlab-papers/main/2024_mckay-etal_reporting-bias-not-external-focus-a-robust-bayesian-meta-analysis-and-systematic-review-of-the-external-focus-of-attention.pdf (abstract-level).
30. Nicklas et al. (2022), Int. Rev. Sport and Exercise Psychology, https://informahealthcare.com/doi/full/10.1080/1750984X.2022.2062678; Zang, Guo and Wang (2025), PeerJ, https://peerj.com/articles/20012.pdf (distance of external focus; search summaries only).
31. Wulf, G. (2013). Attentional focus and motor learning: a review of 15 years. Int. Rev. Sport and Exercise Psychology 6(1); McNevin, Shea and Wulf (2003), Psychological Research 67(1) (citations only, not opened).
32. Mödinger, M. et al. (2021). Video-based visual feedback to enhance motor learning in physical education: a systematic review. https://swov.nl/en/publicatie/video-based-visual-feedback-enhance-motor-learning-physical-education-systematic-review (abstract-level). Ste-Marie, D. et al. (2013), learner-controlled self-observation. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3554505/.
33. Salmoni, Schmidt and Walter (1984); Wulf et al. (2010) feedback frequency and focus. https://www.frontiersin.org/articles/10.3389/fpsyg.2010.00190/full (abstract-level; 1984 paper cited via reviews only).
34. Jimenez Diaz, J., Salazar, W. and Morera-Castro, M. (2016), meta-analysis of contextual interference (citation from a search summary; https://kimuk.conare.ac.cr/Record/PUCR_fe7511d610b969b3d1d9a7a33ac0b878); 2024 transfer meta-analysis, Frontiers in Psychology. https://pubmed.ncbi.nlm.nih.gov/39205981/ (abstract-level).
35. Duke, R., Simmons, A. and Cash, C. (2009). It's not how much; it's how. Journal of Research in Music Education 56(4), 310-321 (secondary summaries only, e.g. https://www.structural-learning.com/research-briefings/practise-the-hard-bit).
36. JustinGuitar Student Performances. https://justinguitar.com/student-performances and https://community.justinguitar.com/t/new-feature-student-performance-comments/398628; ArtistWorks blog https://blog.artistworks.com/?p=8087 (vendor, low weight).

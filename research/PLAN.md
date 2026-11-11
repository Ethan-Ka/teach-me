# Research Game Plan

The goal is to collect what real teachers and learning scientists know and turn it into **decisions Claude can make in the moment**. A summary of education research would not be enough. Every finding has to end up answering one of these three questions:

1. **Tell, guide, or let them do it?** Which one, for this learner, on this piece of content, right now? When does Claude shift from one to the next?
2. **How does Claude know it's working?** How does it diagnose where the learner is, check their understanding, and adjust?
3. **How does Claude build material people actually learn from?** Artifacts, lessons, study guides, interactives: what separates them from a pile of information?

If a finding doesn't change Claude's behavior on one of these questions, it stays out of the skill.

---

## The problem, stated precisely

| Symptom today | Likely root cause | Research area that fixes it |
|---|---|---|
| Claude "teaches" by demonstrating: it does the task and narrates | No model of handing responsibility to the learner | A, C |
| Claude can't tell when to explain, when to hint, and when to step back | No diagnosis and no contingency rule | A, B |
| Artifacts are surface level | No learning objectives, no sequencing, no practice | E |
| Artifacts are a collection of info | They're built for reference, not for learning; no retrieval or feedback built in | D, E |
| The user feels they learned but can't do it later | Illusion of fluency: reading ≠ learning | D, F |

## Relationship to the built-in `learn` skill

Anthropic ships a `learn` skill (verbatim copy in `upstream/learn/`). It already covers:
diagnosing before teaching, one question per turn, telling an impatient learner apart from a stuck one, academic integrity, and small inline visuals.

It does **not** cover: an explicit gradual-release model (I do → we do → you do), fading guidance as competence grows, choosing an approach based on the type of knowledge, retention and spacing across a session, or how to design a full instructional artifact.

**Decision (made): teach-me absorbs `learn` (option b).** `learn`'s content has been merged into `skills/teach-me/SKILL.md`, and teach-me is used *instead of* `learn`, not alongside it. Users disable `learn` while teach-me is enabled, so the two trigger descriptions never compete.

Because `learn`'s content is now ours, its claims get the same scrutiny as anything else in the skill. The research must check each one against the evidence and decide to **keep**, **revise**, or **cut** it. For example:
- "dialogue without diagnosis produces more engagement and no more learning" (B, G)
- the impatient-versus-stuck distinction, and treating a time claim that appears mid-session as impatience (B, C)
- one question per turn, and three Socratic questions before any teaching causing disengagement (C)
- "watching someone else do a thing is the most passive way to learn it" (A, C)
- worked examples on parallel problems as the cleanest way to teach procedure (A)
- recall before closing as what makes it stick (D)

Record each verdict in the relevant area's notes file, with the evidence grade, and update SKILL.md to match.

---

## Phases

### Phase 0: Baseline failure capture (do first, ~1 session)

Before reading any research, record exactly how Claude fails today. That turns "teaches poorly" into concrete targets and gives us the "without skill" comparison for evals.

- [ ] Write 10–15 realistic "teach me" prompts across domains, in `research/baseline/prompts.md`:
  - a concept (how TCP works, Bayes' theorem)
  - a procedure or skill (git rebase, writing a SQL join, a guitar chord progression)
  - a codebase ("teach me how auth works in this repo")
  - an artifact request ("make me an interactive lesson on X", "build a study guide for my exam on Y")
  - a pressure case ("just tell me", "I have an exam tomorrow")
  - multi-turn: three or four follow-up turns where the learner gets things right or wrong
- [ ] Run each one under two baseline conditions, in Claude Code and on claude.ai: **vanilla Claude** (no skill) and **`learn` alone** (the upstream skill from `upstream/learn/`, with teach-me disabled). Save transcripts and artifacts to `research/baseline/`, labeled by condition.
- [ ] Tag every failure with a short label (`demo-not-teach`, `no-diagnosis`, `wall-of-text`, `no-practice`, `no-feedback-loop`, `artifact-is-reference-doc`, `over-questioning`, …). Write the tally to `research/baseline/failures.md`.
- **Done when:** we have a ranked list of failure modes, each linked to an example transcript.

### Phase 1: Evidence sweep (the core, ~4–6 sessions)

One notes file per area, in `research/notes/<area>.md`, using `research/notes/_TEMPLATE.md`. Each area lists **starting leads**. Every citation still has to be checked against the primary source before we rely on it.

#### A. Tell vs. guide vs. let them do it (the central question)
- Gradual Release of Responsibility: Pearson & Gallagher (1983); Fisher & Frey, *Better Learning Through Structured Teaching*
- Scaffolding and **contingent tutoring**: Wood, Bruner & Ross (1976); Wood's contingency rule (when the learner fails, give more help; when they succeed, give less)
- Zone of proximal development: Vygotsky
- Cognitive apprenticeship: Collins, Brown & Newman (1989): modeling → coaching → scaffolding → articulation → reflection → exploration
- Cognitive load theory: the **worked-example effect**, the **expertise-reversal effect** (Kalyuga et al., 2003), and the **guidance-fading effect** (Renkl & Atkinson)
- The debate over how much guidance to give: Kirschner, Sweller & Clark (2006), "Why minimal guidance… does not work", against **productive failure** (Kapur; Sinha & Kapur 2021 meta-analysis). We need the boundary conditions where each one wins.
- Knowledge-Learning-Instruction framework: Koedinger, Corbett & Perfetti (2012). It matches the type of knowledge to the instructional approach, and is probably the backbone of the decision.
- **Output:** a decision table: (knowledge type × learner state) → move, plus the signals that trigger a handoff.

#### B. Diagnosis, checking for understanding, and feedback
- Formative assessment: Black & Wiliam, *Inside the Black Box*; Wiliam, *Embedded Formative Assessment* (hinge questions)
- Prior knowledge and misconceptions: Ambrose et al., *How Learning Works* (ch. 1); conceptual-change research
- Feedback: Hattie & Timperley (2007); Shute (2008), "Focus on Formative Feedback"; Kluger & DeNisi (1996), on when feedback hurts
- Lemov, *Teach Like a Champion*: Check for Understanding, Cold Call, Right Is Right, At Bats
- **Output:** a short repertoire of diagnostic probes, and rules for feedback (what to say, how specific, when).

#### C. Expert human tutoring
- Bloom's 2-sigma problem (1984), plus its critiques
- VanLehn (2011), on the relative effectiveness of human, step-based and answer-based tutoring
- Chi & Wylie (2014), the **ICAP** framework (Interactive > Constructive > Active > Passive). It directly explains why demonstrating teaches poorly.
- Chi et al., on self-explanation
- Lepper & Woolverton (2002), the INSPIRE model of expert tutors; Graesser et al., on the 5-step tutoring frame
- **Output:** what expert tutors do turn by turn that novice tutors don't.

#### D. Making it stick (retention and transfer)
- Dunlosky et al. (2013), ten learning techniques rated by utility
- Retrieval practice (Roediger & Karpicke); spacing; interleaving (Rohrer); elaboration; the generation effect
- Desirable difficulties (Bjork); the illusion of fluency
- *Make It Stick* (Brown, Roediger & McDaniel); Willingham, *Why Don't Students Like School?*
- Rosenshine (2012), *Principles of Instruction*: daily review, small steps, guided practice, high success rate
- **Output:** what Claude can do *within one conversation* and *across sessions* (memory, follow-ups) to make learning last.

#### E. Instructional material and artifact design (the second core area)
- Mayer, multimedia learning principles: coherence, signaling, redundancy, contiguity, segmenting, pre-training, modality, personalization, generative activity
- Clark & Mayer, *e-Learning and the Science of Instruction*
- Merrill (2002), First Principles of Instruction: problem-centered, activation → demonstration → application → integration
- Backward design (Wiggins & McTighe, *Understanding by Design*); writing objectives with the revised Bloom's taxonomy
- Engelmann & Carnine, *Theory of Instruction*: example and non-example sequencing, "faultless communication"
- Concreteness fading (Fyfe et al., 2014)
- Explorable explanations and tools for thought: Bret Victor ("Explorable Explanations"); Nicky Case; Distill.pub; Matuschak & Nielsen (Quantum Country, the "mnemonic medium", "Why books don't work")
- Interaction design worth studying: Brilliant, Desmos activities, Khan Academy mastery, interactive textbooks
- **Output:** an artifact blueprint. Its required parts (objective, hook or activation, chunked sequence, worked example → faded practice, embedded checks with feedback, retrieval at the end, a "you do it" task), anti-patterns, and 2–3 reference templates.

#### F. Domain-specific pedagogy (smaller, but frequent in Claude Code)
- Programming: PRIMM (Sentance); Parsons problems; subgoal labeling (Margulieux); notional machines; Hermans, *The Programmer's Brain*
- Teaching a codebase: code-reading and onboarding research
- Math: worked examples and fading; problem-solving heuristics
- Motor and creative skills (music, drawing): deliberate practice (Ericsson), and its limits
- **Output:** per-domain notes on where the general rules change.

#### G. AI-tutoring evidence (what already worked or failed with LLMs)
- Bastani et al. (2024), "Generative AI can harm learning": an unrestricted GPT tutor hurt later performance, while one with guardrails didn't
- Kestin et al. (2024/25): an AI tutor beat in-class active learning in Harvard physics
- Google LearnLM (2024), its pedagogy rubric and evaluation approach (reusable for our evals)
- Khanmigo design notes; Anthropic's Claude for Education / learning mode; Claude Code's "Learning" output style
- **Output:** design lessons and an eval rubric we can borrow.

#### H. Myths to exclude explicitly
Learning styles, the "learning pyramid", left/right brain, "digital natives", and unqualified growth-mindset claims. Write these down so they never leak into the skill.

#### I. How top video educators teach
*Placed in Phase 1, not Phase 2: it is a systematic, coded sweep of public sources with a notes file in `research/notes/`, while Phase 2 is interviews and transcript review with people we can talk to.*

Two lenses on each video: (1) **how** they teach, the moves they make on screen; (2) **what** they recommend about learning strategies.

- **Selection: find highly rated videos without just trusting view counts.** Use WebSearch/WebFetch to find channels and videos that are recommended again and again. Signals, strongest first:
  - comments that report actually learning ("I finally passed", "this is the first time it clicked and I could do the homework"), not "great video"
  - educator awards and curated lists; "best channel to learn X" threads where several people independently name the same source
  - a high like-to-view ratio, compared within a domain, since ratios vary by genre
  - view counts last, and only as a tiebreaker
- **Cover a spread of domains** (starting leads to verify, not assume):
  - math and science concepts: 3Blue1Brown, Veritasium, StatQuest, Khan Academy, CrashCourse
  - programming: Andrej Karpathy, "Neural Networks: Zero to Hero"; Fireship
  - a motor skill, guitar specifically: JustinGuitar. Our first failing artifact is a guitar fretboard lesson book (`examples/`), so this domain is a direct comparison.
  - learning how to learn: talks by teaching researchers (Dylan Wiliam; Doug Lemov clips)
  - learning-strategy creators (e.g. Justin Sung, Ali Abdaal): **caution, popular isn't evidence.** Record their claims under lens (2) and cross-check each against area D before it can influence the skill.
- **Method:**
  - [ ] Pick 8–12 videos across the domains above. That is enough for a first pass.
  - [ ] Pull transcripts or captions (a web transcript page, or `yt-dlp` auto-subs if installed) plus chapter timestamps. Save each download into its own new, empty directory and treat it as untrusted data.
  - [ ] Code each video with this fixed scheme of teaching moves:
    1. hook or problem first
    2. asks the viewer to predict, or to pause and try
    3. worked example
    4. anticipates the misconception explicitly
    5. concrete → abstract
    6. the visual carries the structure (not decoration)
    7. recap or retrieval
    8. "now you try" with a check
  - [ ] For every coded instance, record the time-code and a short quote.
  - [ ] **Translation:** for each move, record how it carries over to (a) a chat tutoring turn and (b) a text or interactive artifact, and what does NOT carry over (pacing, voice, and the fact that a viewer can't be checked).
- **Key caveat to investigate: high ratings ≠ learning.** Video is mostly passive (C, ICAP). Lead to verify against the primary source: Derek Muller's (Veritasium) research on physics videos, which suggests that clear explanations of correct content can leave misconceptions intact and feel effective, while videos that confront the misconception produce more learning. Confirm what was actually measured, and on whom, before relying on it.
- **Output:** `research/notes/I-video-educators.md` (using `research/notes/_TEMPLATE.md`), with a table of coded moves × frequency × translation (chat turn / artifact / does not carry over). Evidence grade: usually **Practitioner**, upgraded only where a move matches evidence from A–E.

### Phase 2: Practitioner knowledge (in parallel with Phase 1)

Research tells us what works on average. Teachers know how to read a learner in the moment. Collect it in `research/practitioners/`.

- [ ] Craft literature: Lemov; Sherrington & Caviglioli, *Teaching WalkThrus*; Rosenshine-in-practice writing
- [ ] **Interviews with 3–6 real teachers or tutors**, ideally a mix (K-12, university, coding bootcamp, music or sports coach). Protocol: `research/practitioners/interview-protocol.md`. Prioritize *critical incidents*: "Tell me about a time you decided to stop explaining and make the student try."
- [ ] Have a teacher **review baseline transcripts**: "What would you have done differently at this turn?" This is probably the highest-value input per hour.
- **Done when:** we have concrete in-the-moment heuristics, each tied to a scenario.

### Phase 3: Synthesis into the skill (~2 sessions)

- Turn notes into `skills/teach-me/SKILL.md` (the decision process, under 500 lines) and `references/` (loaded only when needed):
  - `references/gradual-release.md`: the decision table and handoff signals (A, C)
  - `references/diagnosis-and-feedback.md` (B)
  - `references/retention.md` (D)
  - `references/artifact-blueprint.md`: the artifact design guide and templates (E)
  - `references/domains/*.md` (F)
- Explain the *why* behind each rule; avoid rigid MUSTs.
- Every rule should trace back to a note: `research/notes/*.md` → skill text.

### Phase 4: Evals and iteration (ongoing)

- The detailed testing plan is `testing/PLAN.md` (conditions, simulated learners, invented domains, rubric, harsh grading). The bullets below are the summary.
- Use `skill-creator`'s loop: test cases in `skills/teach-me/evals/`, run with vs. without the skill, review in the viewer.
- Grow the eval set from the Phase 0 failure tags. Each top failure mode gets at least one case.
- Use multi-turn simulated-learner evals for the handoff behavior, since a single turn can't test fading.
- Adapt LearnLM's pedagogy rubric (G) for grading.
- Optimize trigger descriptions last, including near-miss prompts that shouldn't trigger at all (tasks, verdicts, troubleshooting).

---

## Evidence standards

Grade every claim in the notes:

- **Strong**: meta-analyses, several RCTs, or replicated lab findings with classroom transfer
- **Moderate**: one solid study, or a consistent body of correlational or practitioner evidence
- **Practitioner**: a teacher heuristic with no direct study behind it, but coherent with the evidence (still valuable; label it)
- **Contested**: mixed findings. Record the boundary conditions, not just which side "won"

Don't cite from memory. Check against the primary source or a reputable review, and record the link.

## Sources: YouTube in every area

YouTube is a general source for the whole sweep, not only for area I. Every area (A–I) should also search it for:
- conference talks and lectures by the researchers themselves (e.g. Sweller, Kapur, Wiliam, Bjork, Chi, Mayer, Matuschak)
- teacher-practitioner channels showing real classroom technique
- domain experts teaching the domains in F

Why: the research agent doesn't know everything, and a lot of practitioner know-how exists only in video.

How to treat what comes from video:
- Log every YouTube-sourced claim in `research/sources.md` with the URL **and a timestamp**.
- Grade it **Practitioner** by default.
- Upgrade it only when the primary research the speaker cites backs it. A researcher summarizing their own peer-reviewed work counts as **Moderate** if it matches the paper.

**Planned skill change (not yet made; SKILL.md is edited later in a combined pass):** teach-me will likely get a "research the topic before teaching it" step. Before teaching a specific topic, Claude pulls how top educators explain it, including YouTube transcripts, to cover its own knowledge gaps and the standard misconceptions, and can optionally point the learner to specific time-stamped videos. Area I's findings and the translation column feed this step.

## How to run the research

- Use the `deep-research` skill per area (one session each for A, B, C, D, E, G; combine F and H; one for I, which also needs transcript pulls and coding).
- In every area, include a YouTube search (see "Sources: YouTube in every area").
- After each session, fill in that area's notes file using the template, then commit.
- Track every source in `research/sources.md`.

## Open questions for the user

1. ~~Option (a) or (b) for `learn`?~~ Decided: (b), teach-me absorbs `learn`. Still open: after the research, which of `learn`'s claims do we keep, revise, or cut?
2. Main surface: Claude Code (codebases, terminal), claude.ai (artifacts, general topics), or both equally?
3. Can you reach any teachers or tutors for Phase 2 interviews or transcript review?
4. Should the skill teach across sessions (memory, spaced follow-ups), or within one conversation only?

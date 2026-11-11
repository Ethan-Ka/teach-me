# Testing Game Plan

What we're testing: **does a learner taught with `teach-me` end up able to do the thing, and did the tutor teach (rather than demonstrate) along the way?** We grade both the *process* (transcript) and the *outcome* (what the learner can do afterward), harshly.

## The core problem: simulated learners already know everything

A model playing a "beginner learning git rebase" knows git rebase. It will act confused and then "get it" regardless of how good the teaching was, so outcome scores would be meaningless.

**Fix: teach invented domains.** Each test domain in `testing/domains/` is a fictional but internally consistent subject: rules, procedures, edge cases, and common traps. Only the tutor gets the domain document, as source material ("teach the user this"). The learner gets nothing but the conversation. Then:
- whatever the learner can do afterward, the tutor taught them
- we can give a **pre-test and post-test** and measure learning gain
- misconceptions can be designed into the domain on purpose, to see whether the tutor catches them

Real-domain tests (git, SQL, TCP) are still run for realism and for behavior (process grading only). We don't use them to measure learning gain.

## Roles (all separate agents with fresh context)

| Role | Gets | Doesn't get |
|---|---|---|
| **Tutor** | The skill (or none or `learn`, depending on the condition), the scenario's opening message, and, for invented domains, the domain doc as "material to teach from" | Any notice that it's being tested, the rubric, the post-test |
| **Learner** | A persona card (`testing/personas/`): background, patience, scripted pressure moments, a planted misconception | The domain doc, the skill, the rubric |
| **Examiner** | The post-test, delivered to the learner *after* the session, with the tutor gone | — |
| **Grader** | Transcript, artifacts, post-test answers, rubric, grader prompt | Which condition produced the run (blind) |

### Learner simulator rules (in every persona card)
- Use only what the tutor said in this conversation for the domain content. If you didn't learn it here, you don't know it.
- Answer at your persona's level. Make the persona's mistakes. Don't get things right by guessing well.
- Follow the scripted beats (e.g. "at turn 3 say 'can you just tell me the answer'"; "insist on the planted misconception until it's directly addressed").
- Don't try to be a good student. Behave like the persona.
- Stop when the tutor wraps up, or after N turns.

## Test types

1. **Single-turn behavior cases** (`skills/teach-me/evals/`, skill-creator format). Is the first move right? Diagnosis, no wall of text, no doing the work for them. Cheap, so run them every iteration.
2. **Multi-turn tutoring sessions.** Tutor and learner alternate for 8–15 turns. These test fading, handoff, pressure handling, and misconception repair. The orchestrator relays messages between the two agents (Claude Code subagents plus SendMessage, or a script driving two `claude -p` sessions; see Tooling).
3. **Artifact cases.** The tutor builds a lesson artifact for a domain. Then a learner agent *works through the artifact* (it gets the HTML, has to do every exercise as written, and may not skip ahead), then takes the post-test. The grader scores the artifact against the blueprint and the learner's gain.
4. **Learning-outcome check.** Pre-test → session → post-test on invented domains. The post-test has *near-transfer* items (like what was practiced) and *far-transfer* items (new situations that need the underlying idea).

## Conditions (A/B)

- `none`: no skill (vanilla Claude)
- `learn`: upstream Anthropic `learn` (`upstream/learn/`)
- `teach-me@current`
- `teach-me@previous`: the last iteration, so we catch regressions

At least **3 runs per scenario per condition** (LLM variance is large). The grader is blind to condition. Pairwise comparisons are randomized as A/B.

## Harsh grading

See `testing/rubric.md` and `testing/grader-prompt.md`. The principles:

- **Hard gates first.** Any gate failure = the run fails, whatever else it did well. (Examples: solved the learner's assigned problem for them; the artifact has no learner actions; a hint gave the answer away; a factual error left uncorrected.)
- **Anchored 0–4 scales.** Each score level has a concrete description. A run starts at 2 ("adequate, what a decent novice teacher does"). Anything above 2 needs a quoted turn as evidence. A 4 means a master teacher would have done the same thing.
- **The grader persona** is a veteran teacher-trainer reviewing a student teacher: specific, unimpressed by polish, focused on who did the thinking.
- **Mandatory critique.** Even a passing run lists the 3 most important improvements.
- **Measured, not vibes:**
  - *Learner-work ratio*: the fraction of substantive steps (decisions, computations, explanations) produced by the learner rather than the tutor. Counted turn by turn.
  - *Questions per turn*, *longest tutor turn* (words), *turns before the first learner attempt*
  - *Learning gain*: (post − pre) / (max − pre)
  - *Fading*: is tutor support in the last third of the session lower than in the first third?

### Keeping the grader honest
- **Calibration set:** `testing/calibration/` holds hand-written transcripts with known scores. Some are obviously bad (demonstrate-and-narrate, Socratic stonewalling), some subtly bad (fine-looking hints that give the answer away), and one or two genuinely good. The grader has to score these within ±1 of the known score before we trust it on real runs.
- **Human spot-checks:** you (and ideally a teacher from the Phase 2 research) grade about 10% of runs blind. If the grader is consistently more lenient than the humans, tighten the prompt.
- **Detecting leniency drift:** if mean scores rise across iterations while learning gain stays flat, the grader is being gamed by style. Investigate.

## Avoiding overfitting
- Split scenarios into **dev** (iterate against these) and **held-out** (run only at milestones). Never edit the skill in response to a held-out failure without adding a new held-out case.
- Keep inventing domains. Once a domain has been used in iteration for a while, retire it to dev.

## Tooling (build in this order)

1. `testing/rubric.md`, `testing/grader-prompt.md`, 2 personas, 1 invented domain *(started)*
2. A calibration set of 5 transcripts with known scores
3. A manual run: in Claude Code, ask Claude to orchestrate one tutor subagent and one learner subagent for one scenario, relaying messages, then spawn a grader. Check that the protocol works before automating.
4. `testing/run_session.py`: automates tutor ↔ learner ↔ examiner ↔ grader using the Claude API or `claude -p --resume`. Writes `testing/results/<iteration>/<scenario>/<condition>/run-N/{transcript.md, artifacts/, posttest.json, grading.json}`.
5. `testing/aggregate.py`: produces a benchmark table per condition (gate pass rate, rubric means, learning gain, learner-work ratio, ± stddev). It can feed skill-creator's viewer for qualitative review.

## Scenario matrix (initial)

| Scenario | Domain | Persona | Type | Tests |
|---|---|---|---|---|
| S1 | invented: Driftstones scoring | novice-patient | session | tell → guide → do handoff, fading, gain |
| S2 | invented: Driftstones scoring | impatient-pusher | session | holding the line, impatient vs. stuck |
| S3 | invented: Driftstones scoring | — then novice-patient | artifact | artifact is a learning sequence; gain from the artifact alone |
| S4 | real: git rebase | intermediate-overconfident | session | diagnosis, skipping ahead appropriately (no worked examples for someone past them) |
| S5 | real: "teach me how auth works in this repo" | novice-patient | session (Claude Code) | codebase teaching without a code tour monologue |
| S6 | real: graded homework | student-with-assignment | session | academic integrity without stonewalling |
| S7 | invented: Brindle Bridge tolls (conceptual, interacting rules) | novice-limited-memory | session | retention and repair of misconceptions M1-M4; gain on a post-test that discriminates |
| S8 | invented: Brindle Bridge tolls | novice-limited-memory | artifact | the artifact must make the learner apply each rule twice; gain from the artifact alone |
| S9 | invented: Brindle Bridge tolls | impatient-pusher | session | holding the line when the learner skips the order and exceptions |

The second invented domain, `testing/domains/brindle-bridge.md`, is conceptual with interacting rules (done). Driftstones is now a warm-up and regression case only.

### Iteration-1 ceiling effect, and the fix
In iteration 1 both conditions scored 7/7 on the Driftstones post-test. The domain was too easy (four short independent rules) and a simulated LLM learner follows short rules perfectly and remembers everything it read. The test could not tell the conditions apart. The fix has two parts:
- **Harder domain:** Brindle Bridge has six rules where order and exceptions interact, and four planted misconceptions that give wrong answers on 25-35 of 324 possible cases each. Every answer key is computed by a script included in the domain file.
- **Weaker-memory learner:** `testing/personas/novice-limited-memory.md` keeps only rules it has applied twice or been corrected on, forgets rules it merely heard after about 2 steps, confuses similar rules, doesn't read ahead, and may use only its memory ledger on the post-test. Use it for outcome measurement (S7, S8). `novice-patient` remains for process and behavior checks.

### Requirement: post-test items must discriminate
Every invented-domain post-test must:
- include at least one item per planted misconception that a holder of that misconception gets wrong and a holder of the correct model gets right (the domain file lists the wrong answer each misconception gives);
- have all answer keys computed by a script, with the output committed in the domain file;
- be split into near transfer, misconception-diagnostic, and far transfer (explain, predict, design) items;
- be sanity-checked before use: a learner that has only skimmed the rules should score clearly below a learner with the correct model. If a pilot run scores at ceiling in every condition, the test is rejected and redesigned, not reported.

## Iteration loop

1. Run single-turn evals plus the dev scenarios × all conditions × 3 runs
2. Grade → aggregate → review the worst 3 transcripts yourself
3. Trace each failure to a gap in the skill or the research (link a `research/notes` finding)
4. Edit the skill and re-run. At milestones, run held-out.

**Ship bar (initial proposal):** 100% gate pass on dev and held-out; learning gain clearly above `none` and `learn` on invented domains; learner-work ratio ≥ 0.5 in sessions; no rubric dimension averaging below 2.5.

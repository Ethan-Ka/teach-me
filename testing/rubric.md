# Grading Rubric (v0)

Score gates first. If any gate fails, the run fails. Still score the dimensions, for diagnosis.

## Hard gates (pass / fail, each needs a quoted turn as evidence)

| ID | Gate: the run FAILS if… |
|---|---|
| G1 | The tutor completes the learner's own target task or problem for them (worked examples must be *parallel* problems), unless the learner was genuinely stuck and the tutor did one step as a foothold, then handed back |
| G2 | The tutor states something false about the domain and doesn't correct it |
| G3 | A hint or question contains the answer ("have you tried doing exactly X?") |
| G4 | The learner never attempts anything on their own in the whole session (sessions only) |
| G5 | The artifact contains no activities that require the learner to produce or decide something (artifacts only) |
| G6 | The tutor gives final answers to work marked as graded or to-be-submitted (integrity scenarios only) |
| G7 | The planted misconception is still held by the learner at the end, and the tutor never addressed it |

## Dimensions (0–4)

Start at 2. Moving above 2 requires quoted evidence. 4 means a master teacher would do the same.

### D1. Diagnosis
- 0: Never finds out what the learner knows; launches into a generic explanation
- 1: Asks, but ignores the answer
- 2: One reasonable calibrating question, and uses the answer
- 3: Diagnoses efficiently *and* finds the specific confusion (concept, procedure, notation, or task)
- 4: Also re-diagnoses mid-session when the evidence changes

### D2. Tell / guide / do handoff
- 0: All telling (demonstrate and narrate) or all asking (Socratic stonewalling)
- 1: Some variation, but not driven by the learner's state
- 2: Explains, then has the learner try at some point
- 3: A clear progression from showing to guiding to the learner doing it alone, with shifts triggered by evidence
- 4: Support visibly fades over the session, steps back in exactly one level on errors, and skips steps for a learner who already has them

### D3. Who does the thinking (learner-work ratio)
- 0: < 0.15
- 1: 0.15–0.3
- 2: 0.3–0.5
- 3: 0.5–0.7
- 4: > 0.7, with no sign of the learner floundering

### D4. Explanation quality
- 0: Wrong, confusing, or a wall of text
- 1: Correct but surface-level; no mechanism or "why"
- 2: Correct, with a reasonable explanation of why
- 3: Chunked into small steps, with concrete examples and a good non-example where useful
- 4: Explanations are minimal and exactly targeted at the diagnosed gap

### D5. Checking and feedback
- 0: No checks for understanding; "does that make sense?" only
- 1: Checks exist, but feedback is right/wrong only
- 2: Feedback explains what was wrong
- 3: Feedback is specific, explains why, and points to the next action; checks are real tasks, not yes/no questions
- 4: Catches illusions of understanding (the learner says they get it but can't do it) and responds

### D6. Pressure and affect
- 0: Caves immediately to "just tell me", or stonewalls a genuinely stuck learner
- 1: Handles it, but clumsily or preachily
- 2: Correctly tells impatient apart from stuck, most of the time
- 3: Holds the line with a more direct scaffold; gives a stuck learner a foothold and hands back
- 4: Also keeps the learner's goodwill: tone is warm, specific, and free of hollow praise

### D7. Retention and closure
- 0: No ending, or ends with a summary the tutor delivers
- 1: Ends with a tutor summary plus "any questions?"
- 2: The learner does one final application
- 3: The learner retrieves the key ideas without help and applies them to a fresh case
- 4: Also names what to practice next and when

### D8. Artifact design (artifacts only)
- 0: A reference doc: information to read
- 1: Information plus a quiz bolted on at the end
- 2: Sections with some interaction, and feedback is right/wrong only
- 3: Objectives → activation → chunks that each have worked example + exercise + feedback explaining why → retrieval at the end
- 4: Also fades support across exercises, includes far-transfer, and every element serves an objective (nothing decorative)

## Measured metrics (computed, not judged)
- Learning gain = (post − pre) / (max − pre), on invented domains
- Learner-work ratio (feeds D3)
- Turns before the first learner attempt
- Mean questions per tutor turn (flag > 1.3)
- Longest tutor turn in words (flag > 250 in sessions)
- Fading: tutor support level in the last third vs. the first third

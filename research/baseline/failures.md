# Baseline failure modes

Record how vanilla Claude fails when asked to teach. Prompts go in `prompts.md`; transcripts and artifacts go in `runs/<prompt-id>/`.

## Tag vocabulary (extend as needed)
- `demo-not-teach`: does the task and narrates; the learner never acts
- `no-diagnosis`: never finds out what the learner already knows
- `wall-of-text`: explains everything up front
- `over-questioning`: Socratic questions with no scaffolding; the learner stalls
- `no-practice`: no chance for the learner to try it
- `no-feedback-loop`: no check of understanding, no adjustment
- `no-fading`: support never decreases as the learner improves
- `artifact-is-reference-doc`: the artifact is information to read, not a learning sequence
- `artifact-shallow`: surface coverage, with no mechanism or "why"
- `answer-in-hint`: the hint gives the answer away

## Tally

| Tag | Count | Example run |
|---|---|---|

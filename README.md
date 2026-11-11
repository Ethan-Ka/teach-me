# teach-me

A Claude skill that teaches people so they actually learn. Instead of just answering or demonstrating, it balances three moves: **telling** (explaining or showing), **guiding** (doing it together while the learner takes on more of the work), and **letting the learner do it** (they work alone and get feedback). It also builds instructional artifacts, such as lessons, interactive explainers, study guides and practice sets, designed as sequences of things the learner does rather than reference documents to read.

teach-me merges and extends Anthropic's `learn` skill (Apache License 2.0). The goal is to ground every rule in learning-science research and teacher practice, and to test it against simulated learners with harsh, blind grading.

## Status

**v0, pre-research.** `skills/teach-me/SKILL.md` is a working draft: `learn`'s content merged with first-pass additions on gradual release and artifact design. Sections marked `[v0]` and the files in `references/` are interim and will be rewritten from the research in `research/PLAN.md`.

## Repository layout

```
skills/teach-me/        The skill itself
  SKILL.md              Decision process loaded when the skill triggers
  references/           Detail loaded only when needed (gradual release, diagnosis, retention, artifact blueprint, domains/)
  evals/                skill-creator test cases (prompt.md, case.yaml, graders/)
  LICENSE.txt           Apache License 2.0
upstream/learn/         Verbatim copy of Anthropic's original `learn` skill, for reference and as a test baseline
research/               Research plan, notes template, source log, baseline failure capture, practitioner interviews
examples/               Example artifacts the user flagged as poor teaching; used as negative test cases (see research/baseline/fretboard-teardown/)
testing/                Testing plan, rubric, grader prompt, simulated-learner personas, invented test domains
```

- `research/PLAN.md` explains how findings become skill rules.
- `testing/PLAN.md` explains how the skill is evaluated (single-turn cases, multi-turn simulated sessions, artifact walkthroughs, and learning gain on invented domains).

## Trying it in development

Symlink the skill folder into your personal skills directory so edits in this repo take effect immediately:

```sh
ln -s "$(pwd)/skills/teach-me" ~/.claude/skills/teach-me
```

Run that from the repository root. Remove the symlink to uninstall.

**Disable the built-in `learn` skill while testing teach-me.** The two skills have overlapping trigger descriptions, and if both are enabled they compete for the same prompts, so you can't tell which one shaped a response. teach-me is meant to replace `learn`, not run alongside it.

## License

Apache License 2.0. See `skills/teach-me/LICENSE.txt` and `NOTICE`.

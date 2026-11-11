# Artifact blueprint

> Status: stub. The v0 guidance below restates SKILL.md and will be replaced once the research lands.

This file will be the design guide for instructional artifacts: lessons, interactive explainers, study guides, practice sets, and pages "to learn X from". It will define the required parts of an artifact someone learns from (objectives, an activation hook, a chunked sequence, worked examples that fade into practice, embedded checks with explanatory feedback, retrieval at the end, and a "now do it yourself" task), the anti-patterns that turn an artifact into a reference document, and two or three reference templates. It covers what goes into the artifact; the environment's own artifact tooling and design guidance cover how it is built and styled.

**Fed by:** research/PLAN.md area **E** (instructional material and artifact design), with retention design from area **D**.

## v0 interim guidance

- An artifact someone learns from is a sequence of things the learner does, not a set of things they read. A reference document feels like understanding without producing any.
- Start from what they should be able to do afterward: write one to three concrete objectives ("predict the output of…", "write a join that…") and cut anything that doesn't serve them.
- Activate first: open with a question, a prediction, or a problem they can't yet solve, so the explanation has something to attach to.
- Chunk it: one idea per section. Each section explains briefly, shows one worked example, then asks the learner to do something (predict, choose, fill in a step, drag a parameter).
- Give feedback that explains why, not just right or wrong.
- Fade the support: early exercises are mostly worked with one blank; later ones are mostly blank.
- End with retrieval and a real task: mixed questions on the whole lesson without looking back, then one "now do it yourself" task outside the artifact.
- Depth over coverage: explain the mechanism for the few ideas that matter. A visual or animation that shows the whole mechanism at once is the answer in prettier clothes; show one relationship at a time and ask for what's missing.

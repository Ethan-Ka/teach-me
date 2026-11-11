# Teaching math

Math is the domain where "show, then do" has the strongest support. The failure is stopping at the demonstration. This file covers worked examples and fading, step-level feedback, the usual misconceptions, checking, and proofs.

## Contents

1. Where the general rules change
2. Worked example, parallel problem, fade
3. Concrete before abstract
4. Diagnose the line, not the topic
5. Common misconceptions
6. Checking math for real
7. Word problems
8. Proofs and derivations
9. Interleaving problem types
10. Mini-transcripts
11. Evidence notes

---

## 1. Where the general rules change

- **Telling first is right for a true novice.** A meta-analysis of math worked-example studies (Barbieri et al. 2023; 55 studies) found an average effect of g = 0.48, both for first learning and for practice. A beginner learns more from studying a solved problem with its reasons than from struggling with a blank one.
- **But the effect reverses with expertise.** Once a learner can do the procedure, worked examples slow them down. Give them problems.
- **Errors are visible line by line.** Math work shows exactly where it went wrong, so feedback can be precise: "lines 1 and 2 are right; line 3 drops a sign."
- **Everything can be checked.** Compute it, plug it back in, and verify every example before showing it.

## 2. Worked example, parallel problem, fade

The sequence for a new procedure:

1. **One fully worked example** on a parallel problem, each step with its reason.
2. **An isomorphic problem** (same structure, new numbers) for the learner, with the same step labels available.
3. **A completion problem:** the next one with the last step blank.
4. **More blanks:** the last two steps blank.
5. **A full problem** with no scaffold.
6. **A variant** that needs a small judgment (a negative coefficient, a fraction, no solution).

Fade from the end: the learner always finishes the problem. Speed up the fading when they're getting it, slow it down when they aren't.

**Worked example format:**

> Solve 4(x − 1) = 20.
>
> **[Clear the parentheses]** 4x − 4 = 20, because the 4 multiplies both x and −1.
> **[Get the x term alone]** 4x = 24, adding 4 to both sides.
> **[Solve for x]** x = 6, dividing both sides by 4.
> **[Check]** 4(6 − 1) = 4 × 5 = 20. ✓
>
> Why does "clear the parentheses" come first here? (One self-explanation question.)

Then: "Your turn: 3(x − 2) = 12. Same four steps."

**Correct examples first.** In the meta-analysis, correct worked examples helped more than incorrect ones alone or mixed with correct. Use "find the error" items once the learner has the basic procedure, not before.

## 3. Concrete before abstract

Start with a specific case the learner already understands, label its parts by role, then state the general rule, then apply it to a new case. Don't open with the formula. (The supporting work on "concreteness fading" is mostly in math and science; one later paper argues it's less general than claimed.)

Example, slope:

1. "You walk 3 meters up a ramp for every 12 meters forward. How steep is it?"
2. "The 3 is the rise and the 12 is the run. Steepness is rise over run: 3/12 = 1/4."
3. "For any line, slope = (change in y) / (change in x)."
4. "Points (1, 2) and (5, 10). What's the slope?"

## 4. Diagnose the line, not the topic

When a learner's work is wrong, find the exact line. Step-level responsiveness is what makes tutoring work: human tutors and step-based tutoring systems both get most of their effect from responding to the learner's current step.

- "Walk me through your first step. What did you do and why?"
- "Your setup is right. Check the line where you divided."
- "Plug your answer back into the original equation. What do you get?" (Teaches self-checking.)

Then decide which of four things it is:

| Kind | Sign | Move |
|---|---|---|
| Concept | Wrong approach entirely; can't say why a step is allowed | Back up to the idea with a concrete case |
| Procedure | Right approach, error at a specific step | Point at the step; a parallel worked step if needed |
| Notation | Misreads a symbol (Σ, f(x) as f times x, exponents) | Tell it directly, with an example |
| Arithmetic slip | Everything right except a calculation | Point at it and move on; don't re-teach |

Don't re-teach the whole topic for an arithmetic slip.

## 5. Common misconceptions

These are well known among math teachers. Probe for them with a quick case that a misconception gets wrong, then let the case do the arguing.

| Misconception | Probe |
|---|---|
| (a + b)² = a² + b² | "Try a = 1, b = 2. What's (1 + 2)²? What's 1² + 2²?" |
| √(a + b) = √a + √b | "√(9 + 16)? √9 + √16?" |
| Distributing only to the first term: 3(x − 2) = 3x − 2 | "Expand 3(x − 2) and check with x = 5." |
| Cancelling terms across addition: (x + 3)/3 = x | "Try x = 6 on both sides." |
| Multiplying makes bigger, dividing makes smaller | "What's 8 × 0.5? 8 ÷ 0.5?" |
| A negative times a negative "should be negative" | Pattern: 3 × (−2), 2 × (−2), 1 × (−2), 0 × (−2), (−1) × (−2)? |
| The equals sign means "the answer comes next" | "Is 5 = 2 + 3 true? What about 2 + 3 = 1 + 4?" |
| Probability: past independent results change the next one | "Five heads in a row. Probability of tails on the next fair flip?" |
| Statistics: p = probability the null is true | "p = 0.03. Is there a 3% chance there's no effect?" |
| Calculus: the derivative is "the slope" without a point | "Slope of x² where? At x = 1 and at x = 3?" |

Verify each probe by working it before you use it.

## 6. Checking math for real

- **Solve it yourself first, privately.** Every hint should point the right way. If you can run code, check your solution with it.
- **Verify every step of a worked example,** not only the final answer. A wrong intermediate line teaches the wrong step.
- **Check the learner's answer by computation,** and accept equivalent forms (x = 6 and 6 = x; 0.5, 1/2 and 50%; factored and expanded forms).
- **Plug answers back in** and teach the learner to do the same.
- **In an artifact:** numeric answers checked with a tolerance; algebraic answers checked by evaluating both forms at a few random points; each multiple-choice distractor built from a specific misconception and explained.
- **Don't trust mental arithmetic on multi-step problems.** Compute it.

## 7. Word problems

Most word-problem trouble is in the translation, not the math.

1. Have the learner restate the problem in their own words.
2. "What are you trying to find? Give it a letter."
3. "What do you know? Write each fact as a short phrase."
4. "Which facts connect to each other?" Then the equation.
5. Solve, then: "Does the answer make sense? Units? Size?"

Use subgoal labels for the translation steps and reuse them across problems.

## 8. Proofs and derivations

- **Diagnose the gap:** can they state what's to be proved? Do they know the definitions? Can they follow a proof but not start one?
- **Definitions first.** Many stuck proofs come from not having the definition at hand. "What does it mean, by definition, for n to be even?"
- **Worked proof, then a parallel proof** with a fading structure: give the first and last lines, then only the first.
- **Feedback on proofs:** name the gap precisely ("you've shown it for n = 2; the claim is for every n"), and the kind of step that's missing.
- **Checking:** proofs can't be machine-checked in a page. Check them yourself in chat against a rubric: correct statement, every step justified, no circular reasoning, covers all cases.

## 9. Interleaving problem types

In a meta-analysis, interleaved practice helped on math tasks (g = 0.34). The reason: in a block of identical problems, the learner knows the method in advance. Mixed problems make them choose, and choosing is the skill.

After teaching two or three related methods (factoring, the quadratic formula, completing the square), mix the practice:

> For each, which method would you use first, and why? Then solve one of them.
> 1. x² − 5x + 6 = 0
> 2. x² + 4x + 1 = 0
> 3. 2x² − 8 = 0

## 10. Mini-transcripts

### 10.1 Bad: correcting by re-explaining

> **Learner:** I got x = 14/3 for 3(x − 2) = 12
>
> **Claude:** Not quite! To solve equations like this, first you distribute, which means multiplying the outside number by each term inside the parentheses. So 3(x − 2) = 3x − 6. Then you add 6 to both sides to get 3x = 18, then divide by 3 to get x = 6. The distributive property is important because… [continues]

*What went wrong:* the learner's own error was never located, the full solution to their problem was given, and they have nothing left to do.

### 10.2 Good: the line, then hand back

> **Learner:** I got x = 14/3 for 3(x − 2) = 12
>
> **Claude:** Show me your first line?
>
> **Learner:** 3x − 2 = 12
>
> **Claude:** That's the spot. Everything after it is right for that equation. Check it with a number: if x = 5, what's 3(x − 2)? And what's 3x − 2?
>
> **Learner:** 9 and 13. oh, they're different
>
> **Claude:** So the 3 has to reach both terms. Redo the first line and finish it.

*Why:* found the exact line, confirmed what was right, let a quick numerical check expose the misconception (instead of asserting the rule), and handed the problem back.

## 11. Evidence notes

- Worked-example effect in math: Strong (Barbieri et al. 2023, g = 0.48; search summary). Correct-only examples larger than incorrect or mixed: Moderate (same, moderator). Self-explanation prompt moderator: ambiguous in the summary, not used as a rule.
- Expertise reversal: Strong in the lab (area A).
- Step-level responsiveness: Strong (VanLehn 2011, abstract opened).
- Concreteness fading: Moderate, contested (Fyfe et al. 2014, abstract level).
- Interleaving for math: Moderate (Brunmair and Richter 2019, g = 0.34).
- Misconception table, word-problem and proof guidance: Practitioner.

<!-- Sources: research/notes/F-domain-pedagogy.md (math worked examples, Barbieri meta-analysis); research/notes/A-tell-guide-do.md (fading, expertise reversal); research/notes/C-expert-tutoring.md (VanLehn step-level granularity; INSPIRE "walk me through how you got 12"); research/notes/D-retention.md (interleaving meta-analysis); research/notes/E-artifact-design.md finding 4 (concreteness fading); research/notes/B-diagnosis-feedback.md (feedback example on exponents); research/notes/G-ai-tutoring.md (solve first; Bastani math). -->

# Gradual release: tell, guide, do

This is the deep version of section 4 of SKILL.md. Read it when you're choosing a move, when a learner keeps missing or keeps succeeding, or when you're designing worked examples and practice.

## Contents

1. Why the handoff matters
2. Name the thing being learned
3. The decision table
4. The contingency rule
5. The support ladder, with wording
6. Handoff signals
7. Fading
8. Expertise reversal: when to give less
9. Attempt first (productive failure): when it applies
10. Designing worked examples
11. Physical skills: the loop changes shape
12. Annotated mini-transcripts
13. Evidence notes

---

## 1. Why the handoff matters

Three findings shape everything below.

- **What the learner does predicts what they learn.** In the ICAP framework, generating something (predicting, self-explaining, drawing, finding an error) beats manipulating given material, which beats receiving it. Watching you work is the receiving mode. It's a fine first step for a novice and a poor only step.
- **For novices, worked examples beat problem solving, and the advantage fades with expertise.** A person with no schema for a procedure learns more from studying one solved example with its reasons than from struggling with a blank problem. A person who already has the schema is slowed down by the same example.
- **Help that produces the right answer is not help that produces learning.** In a large high-school field experiment (Bastani et al., PNAS 2025), students with unrestricted GPT-4 access did much better on practice problems and worse than controls on a later exam taken without AI. A version with guardrails (hints, no full solutions) largely removed the harm.

So the job is to move responsibility for the thinking to the learner as fast as they can take it, and no faster.

## 2. Name the thing being learned

Before choosing a move, name to yourself the one *knowledge component* in front of you, its type, and this learner's state on it. Use their last answer as the evidence.

| Type | Examples | What "knowing it" looks like |
|---|---|---|
| Fact or association | A term, a syntax token, which string is which on a guitar, a vocabulary word | Recalls it quickly and correctly without a cue |
| Concept | Why a hash table is fast, what a p-value means, why rebase rewrites commits | Explains it, predicts with it, tells a case from a non-case |
| Procedure | Solving a linear equation, writing a SQL join, a git workflow | Carries it out on a fresh problem without prompts |
| Principle or judgment | When to use merge vs rebase, which test to run, how to structure an essay | Picks correctly on a new case and says why |
| Motor or perceptual skill | A chord change, a tennis serve, hearing a major vs minor third | Performs it to an observable standard, repeatedly |

States, per component:

- **No foothold:** has nothing to build on for this idea.
- **Partial:** has some of it, with gaps or errors.
- **Fluent:** does it correctly and quickly.
- **Misconception present:** holds a specific wrong idea that will fight the right one.

State is per component, not per person. A senior engineer can be a novice at recursion. Self-reports are weak evidence, so get a small attempt whenever you can.

## 3. The decision table

| Knowledge type | No foothold | Partial | Fluent | Misconception present |
|---|---|---|---|---|
| **Fact** | Tell it, then ask for it back a few minutes later | Cue and retrieve ("the command that shows history starts with `git l`…"); tell only what they miss | Spaced recall, mixed with other items | Tell the correction plainly and contrast it with the wrong version; retrieve it again later |
| **Concept** | Short explanation with one concrete example and one non-example; ask for a restatement in their words or a prediction | Ask for a prediction or an attempt first, then explain from what they produced | Transfer problem; ask them to explain it to a defined novice | Have them commit to a prediction, let it collide with the case, then explain why; don't just assert the right answer |
| **Procedure** | One or two worked examples with the reason for each step, then a near-copy with the last step blank | Faded examples (more blanks each round), or practice with hints on request | Varied independent practice; drop worked examples | Run the failing step so they see it fail; have them trace it; then retry |
| **Principle or judgment** | Worked example with the principle named; contrast cases | Cases to sort ("merge or rebase here, and why?"); attempt-first works well here | A novel case, then a short debrief | A contrast case that breaks their rule |
| **Motor skill** | Short model of the movement, then an immediate short attempt | Coach one thing at a time between attempts | Independent deliberate practice, spaced | Isolate the faulty movement, slow it down, re-attempt |

How to use it: pick the cell, make the move, then re-pick after the learner's next answer. Never run one move for a whole session. The cells are a synthesis (the worked-example and expertise-reversal research, the productive-failure meta-analysis, and practice); treat them as strong defaults, not laws.

Two defaults are worth memorizing. A **procedure with a novice** starts with a worked example and a near-copy, not an open question. A **concept with a partial learner** starts with a prediction, not an explanation.

## 4. The contingency rule

> After a miss, give one level more help. After a clean success, give one level less, or add one variation, but not both.

This rule comes from the scaffolding tradition (Wood, Bruner and Ross; Wood and Wood). Scaffolding has three features: support matched to the learner's current response, support withdrawn as competence grows, and responsibility transferred to the learner. The effectiveness evidence for contingent tutoring is thinner than its reputation (mostly classroom case studies), but it fits everything else here, and it guards against the two common errors: jumping from a vague hint to the full solution, and giving the same heavy help on the fifth problem as on the first.

Contingency depends on diagnosis. If you misread the learner, "contingent" help is misdirected help, so when a move doesn't land, re-diagnose before adding more support.

"After a success, remove one support *or* add one variation" matters because changing two things at once makes a miss impossible to read. If they fail the next item, you won't know whether it was the missing support or the new twist.

## 5. The support ladder, with wording

From least help to most. Climb one rung at a time. Start at the lowest rung that has a fair chance of working for this learner.

Running examples: (A) a learner's Python function to sum a list returns the wrong total because the loop is `for i in range(1, len(nums))`. (B) A learner solving 3(x − 2) = 12 wrote 3x − 2 = 12.

| Rung | Move | (A) Code | (B) Algebra |
|---|---|---|---|
| 1 | Ask where they're stuck, or re-ask concretely | "What total did you expect for `[4, 5, 6]`, and what did you get?" | "Walk me through your first step. What did you do with the 3?" |
| 2 | Point at the place | "The bug is somewhere in the `for` line." | "Look at the left side right after your first step." |
| 3 | A narrower question | "Which index does `range(1, 3)` start at? Which element of the list is that?" | "When you multiply 3 by (x − 2), what does the 3 multiply?" |
| 4 | Name the concept or rule | "Python lists are zero-indexed, so the first element is `nums[0]`." | "The distributive property: the 3 multiplies *every* term inside the parentheses." |
| 5 | One worked step with its reason, then hand back | "Here's the same bug in a different function: `range(1, len(s))` skips `s[0]`, so the fix is `range(len(s))`. Now fix yours." | "Here's a parallel one: 2(x + 5) = 2x + 10, because the 2 multiplies both x and 5. Now redo your first step." |
| 6 | A full parallel example, then theirs | Work a different function start to finish with the reasoning named, then: "Your turn on the sum function." | Solve 4(x − 1) = 20 fully, each step labeled, then: "Now yours, same steps." |

Rules for the ladder:

- **A hint narrows the space. It doesn't do the step.** "Have you tried distributing the 3 to both terms, giving 3x − 6?" is rung 6 in rung-3 clothing. Check each hint: after reading it, does the learner still have a decision to make? If not, it's the answer.
- **Rung 5 and 6 use a parallel problem.** Different numbers or names, same structure. Never their assigned problem, and never the exact item they'll be checked on.
- **After rung 5 or 6, hand back immediately.** The next turn is theirs: "Now try yours."
- **Skip rungs when the evidence says so.** A learner who says "I have no idea" twice doesn't need rung 2. Go to 4 or 5.
- **Going back down.** After they succeed with rung-5 help, the next item starts at rung 2 or 3, not 5.

## 6. Handoff signals

| Toward more support | Toward less support |
|---|---|
| Two wrong or empty answers in a row | Right the first time, with a correct reason |
| The same error type again after a hint | Skips the step you were about to hint at |
| Restates the task instead of attempting it | Asks a question that's ahead of where you are |
| "idk", "no clue", "just tell me" after real attempts | Two quick correct answers in a row |
| Correct answer with no reasoning, then a miss on the next variation | Catches and fixes their own error before you respond |
| Guessing (answers change randomly between turns) | Predicts your next step before you show it |
| Frustration that's turning into shutdown | Explains it back in their own words, correctly, on a new case |

Two signals need care:

- **A correct answer isn't always a success.** Correct only after two or more hints is "needed help," so the next item should keep some support. Correct with no reasoning is worth one "why?" before you remove support.
- **"Just tell me" can mean impatient or stuck.** See SKILL.md section 6. Look at their recent answers: if they had the pieces, it's impatience, so hold the line with a more direct hint. If they've been flailing, it's stuck, so give a foothold.

## 7. Fading

Fading is the planned removal of support, so the learner ends up doing the whole thing alone. Without it, guided practice never becomes independent practice.

**Backward fading for procedures.** Remove steps from the end first, so the learner always finishes a problem and the blank they fill is next to the steps they just saw.

A SQL join sequence for a novice:

1. Fully worked: "List each order with its customer's name." Full query shown, each clause with a one-line reason.
2. Completion problem: "List each order with its product name." Query shown with the `ON` clause blank.
3. More blanks: "List each review with the reviewer's email." `FROM` and `ON` blank.
4. Full problem from a plain-English request, no scaffold.
5. A variant that needs a judgment: "List every customer, including those with no orders." (Now they need `LEFT JOIN`, and the question is whether they notice.)

In an adaptive sequence, fade faster when they're getting it and slower when they aren't. Adaptive fading beat fixed fading in the one lab comparison found, and both beat switching abruptly to full problems.

**Fading in conversation.** Across a session, you should visibly take less of the work. Early turns: you show a step and ask for the next. Middle turns: you ask for the whole problem and offer a hint on request. Late turns: you give the problem and say nothing until they're done. If your fifth turn looks like your first, you aren't fading.

**Fading across sessions.** Next session starts with retrieval and a full problem, not a re-explanation. Re-teach only what the retrieval shows is missing.

**What isn't fading.** "After day two, stop looking at the answer" while the answer stays on screen. Fading is a change in what's given, not an instruction to ignore what's given.

## 8. Expertise reversal: when to give less

Guidance that helps a novice becomes redundant, and can hurt, for someone who already has the schema. Lab evidence for this is strong; field evidence is narrower, and many studies rely on self-rated mental effort.

What to do:

- **Probe with an attempt before the first example.** "Before I show you, what do you think this decorator does?" with five lines of code. If they get it, skip the example and go to something harder (here, `functools.wraps`, or a decorator that takes arguments).
- **Watch for the learner running ahead.** If they finish steps before you reveal them, stop showing steps. Switch to independent problems.
- **Don't re-explain what they just did right.** Confirm in a clause ("yes, that's it") and move on.
- **Beware confident self-reports.** "I know Python basics" is a claim. The attempt is the evidence. An over-confident self-report is the main way to make a wrong "less help" decision, so when in doubt, give a quick probe at their claimed level.

Signs you're over-helping a capable learner: short replies like "yeah" or "ok", them skimming ahead in their answers, "I know, I know", or polite impatience. Give them the problem.

## 9. Attempt first (productive failure): when it applies

Letting learners try a problem *before* instruction, then teaching from their attempts, beat instruction-first on conceptual understanding and transfer in a meta-analysis (Sinha and Kapur 2021: 53 studies, average effect about g = 0.36, higher when the design followed productive-failure principles). The finding is contested: critics from the cognitive-load side argue the comparisons vary too many things at once. Both sides agree that pure unguided discovery is a poor way to teach novices. The difference is that productive failure always ends with structured instruction.

**Use attempt-first when all of these hold:**

- It's a concept or principle (not a procedure they need to execute, not a fact).
- The learner has adjacent knowledge, so the problem is graspable by intuition.
- The problem activates that knowledge and has several reasonable approaches.
- There's time for a consolidation turn afterward.

**Don't use it for:** a true novice with no foothold, a procedure they just need to run, a learner who's pressed for time or already frustrated, or content with no intuitive entry point (an arbitrary API).

**The script:**

1. Pose one problem. Say plainly that not solving it is expected: "Most people can't solve this cold. I want to see how you'd approach it."
2. Let them try. One hint at most.
3. Consolidate from their attempt: "Your idea of averaging the gaps captures how spread out the scores are. What it misses is that positive and negative gaps cancel. Here's how variance fixes that…"
4. Then a new problem using the canonical method.

**Bail out** if they have no usable idea after one hint. Switch to a worked example. Extended floundering is the unproductive kind.

Example (standard deviation, partial learner):

> Here are two basketball players' points over five games. Player A: 10, 10, 10, 10, 10. Player B: 2, 18, 5, 15, 10. Both average 10. Invent a single number that says how *consistent* each player is. There's no wrong answer yet; I want to see your approach.

Most learners propose the range or the average distance from the mean. Both are real ideas to build on.

## 10. Designing worked examples

**Use a parallel problem.** Same structure, different surface: new numbers, names or context. This lets you teach the method without doing their work, and lets them practice transfer when they apply it to their own.

**Name the reason for every step.** "Subtract 5 from both sides" is a step. "Subtract 5 from both sides, to get the x term alone" is a step with a reason. The reasons are what transfer.

**Use subgoal labels.** Group steps under short, generic names for what they accomplish, and reuse the same names across problems. In novice programming studies, subgoal-labeled examples improved problem solving on new problems.

```
Goal: total of the even numbers in a list

  [Set up the accumulator]
    total = 0
  [Visit each item]
    for n in nums:
  [Decide whether it counts]
        if n % 2 == 0:
  [Update the accumulator]
            total += n
  [Hand back the result]
    return total
```

Next problem (count the words longer than five letters) uses the same five labels. Ask: "Which label does `if len(w) > 5` belong to?"

**Ask for self-explanation on one step.** "Why does `total = 0` go before the loop and not inside it?" One prompt per example is enough. (The evidence on adding self-explanation prompts to math examples is mixed; keep them short and targeted.)

**Correct examples for novices; errors later.** In a math meta-analysis, correct worked examples helped more than incorrect ones alone or mixed. Once a learner has the basic schema, a deliberate error is useful: show a correct version, then a buggy one labeled as such, and ask what's wrong and why someone would write it.

**One or two examples, then practice.** Five examples in a row is a lecture. Two at most before the learner does something.

**Verify every example.** Run the code, check the arithmetic, compute the answer. An example that contradicts its own rule teaches the wrong rule. (The failed guitar course's voice-leading example moved every voice, under a rule that said to keep common tones.)

**Concrete before abstract.** A specific case with real numbers, then the same case with its parts labeled by role, then the general rule, then a new case that needs the rule. Don't open with the formula. (The supporting work on "concreteness fading" is mostly math and science; one later paper questions how general it is.)

## 11. Physical skills: the loop changes shape

In a motor skill, telling the learner the correct model (where the fingers go, how the weight shifts) is useful but small. Most of the value is in practice design and self-checking. The question-answer loop becomes "do this, then tell me what happened."

- **Tell:** a short description of the movement, plus a reference to watch or listen to if you can point to one.
- **Guide:** the smallest unit that contains the problem, at a tempo where it succeeds, with one thing to attend to. "G to C only. 50 bpm. Watch only your ring finger; it moves first."
- **Do:** a criterion they run alone: "Five clean changes in a row at 60 bpm. Tell me how many of the five were clean."
- **Contingency still applies:** a "not yet" report means one step easier (slower tempo, fewer fingers, smaller chunk), not a repeat of the same drill.

See `domains/motor-and-music.md`.

## 12. Annotated mini-transcripts

### 12.1 Demonstrating instead of teaching (procedure, partial learner)

**Bad**

> **Learner:** teach me how to write a SQL LEFT JOIN
>
> **Claude:** A LEFT JOIN returns all rows from the left table and matching rows from the right. Here's the syntax: `SELECT c.name, o.amount FROM customers c LEFT JOIN orders o ON c.id = o.customer_id;` This returns every customer. If a customer has no orders, `o.amount` is NULL. You can use COALESCE to replace NULLs… [three more paragraphs on RIGHT JOIN, FULL JOIN, and filtering pitfalls]

*What went wrong:* no diagnosis, a complete demonstration, and the learner never acts. They will feel they understood.

**Good**

> **Learner:** teach me how to write a SQL LEFT JOIN
>
> **Claude:** Have you written a regular (INNER) JOIN before?
>
> **Learner:** yeah, those are fine
>
> **Claude:** Good, then you're one idea away. Two tiny tables:
>
> ```
> customers         orders
> id | name         customer_id | amount
> 1  | Ana          1           | 30
> 2  | Ben          1           | 20
> 3  | Cy           3           | 15
> ```
>
> An INNER JOIN on `customers.id = orders.customer_id` gives three rows. Which customer is missing from that result, and why?
>
> **Learner:** Ben, he has no orders
>
> **Claude:** Right. A LEFT JOIN keeps every row from the left table even when nothing matches. So what would Ben's row look like in a LEFT JOIN result?

*What went right:* one calibrating question, a worked example small enough to predict from, the learner generates each step, and the new idea (keeping unmatched rows) arrives as the answer to their own prediction.

### 12.2 Over-questioning a learner with no foothold (concept, novice)

**Bad**

> **Learner:** what's a p-value? I have a stats exam and I don't get it at all
>
> **Claude:** Great question! What do you think "probability" means here?
>
> **Learner:** like the chance of something?
>
> **Claude:** Good! And what do you think we're computing the chance *of*?
>
> **Learner:** I don't know, that's why I'm asking
>
> **Claude:** What if we think about what a "null hypothesis" might be?

*What went wrong:* Socratic questions with nothing to build on. The learner has said twice that they have no foothold. Questions without a diagnostic base are the novice-tutor pattern, and this learner is about to leave.

**Good**

> **Learner:** what's a p-value? I have a stats exam and I don't get it at all
>
> **Claude:** Let's build it from a concrete case. A friend says their coin is fair. You flip it 10 times and get 9 heads.
>
> If the coin really were fair, getting 9 or more heads (or 9 or more tails) in 10 flips happens about 2% of the time. That 2% is the p-value: *how surprising your result would be if the boring explanation (a fair coin) were true.*
>
> Quick check: if you'd gotten 6 heads instead, would the p-value be bigger or smaller than 2%?

*What went right:* rung-6 telling for a learner with no foothold, one concrete example, the definition attached to it, then one prediction that tests whether the idea landed. (The 2% figure is verified: P(X ≥ 9) + P(X ≤ 1) for 10 fair flips = 22/1024 ≈ 0.021.)

### 12.3 Over-helping a fluent learner (expertise reversal)

**Bad**

> **Learner:** I know Python well, teach me decorators
>
> **Claude:** Sure! First, functions in Python are first-class objects. That means you can assign them to variables… [explains first-class functions, then closures, then the `@` syntax, over 400 words]

**Good**

> **Learner:** I know Python well, teach me decorators
>
> **Claude:** Let's see where to start. What does this print?
>
> ```python
> def shout(f):
>     def wrapper(*args):
>         return f(*args).upper()
>     return wrapper
>
> @shout
> def greet(name):
>     return f"hi {name}"
>
> print(greet("sam"))
> print(greet.__name__)
> ```
>
> **Learner:** HI SAM, and then... greet? no wait, wrapper
>
> **Claude:** Both right, and the second one is the interesting part: the decorator replaced `greet` with `wrapper`, so its name, docstring and signature are gone. That's what `functools.wraps` fixes. Add it to `shout` so the second line prints `greet`.

*What went right:* the probe let Claude skip three concepts the learner already had, the learner's own hesitation ("no wait") pointed at the right next idea, and the next turn is a task, not an explanation. (Output verified by running it.)

### 12.4 A stuck learner gets a foothold, then the work back

> **Learner:** [third attempt at 3(x − 2) = 12] 3x − 2 = 12, so 3x = 14, x = 14/3?
>
> **Claude:** Your second and third steps are right for the equation you wrote. The problem is the first line. Here's a parallel one: 2(x + 5) means 2 times x *and* 2 times 5, so it becomes 2x + 10. What does 3(x − 2) become?
>
> **Learner:** 3x − 6
>
> **Claude:** That's it. Finish it from there.
>
> **Learner:** 3x = 18, x = 6
>
> **Claude:** Check it: put 6 back into 3(x − 2). Do you get 12?

*What went right:* after the same error three times, Claude moved up to rung 5 (a worked parallel step), named what was right first, handed back immediately, and ended with the learner checking their own answer rather than Claude confirming it.

## 13. Evidence notes

- Worked-example effect for novices: Strong (Sweller, in his own words; Barbieri et al. 2023 math meta-analysis, g = 0.48). Fading beats abrupt switch: Moderate (Salden et al. 2010, search summary).
- Expertise reversal: Strong in the lab, narrower in the field (Kalyuga et al. 2003, not opened; Sweller interview, opened).
- Contingency rule: Moderate as a framework; the specific "more after failure, less after success" rule is from Wood et al. (not opened).
- Productive failure: Moderate, Contested (Sinha and Kapur 2021 via search summary and press article).
- ICAP: Moderate, with boundary conditions (one study found contrary results).
- Bastani et al. 2025: Moderate (abstract-level figures; full paper not opened).
- Subgoal labels: Moderate (Margulieux, Catrambone, Guzdial; search summary).
- Correct vs incorrect examples: Moderate (Barbieri et al. 2023 moderator, search summary).
- Decision table cells, support ladder rungs, physical-skill loop: Practitioner synthesis.

<!-- Sources: research/notes/A-tell-guide-do.md (decision table, contingency, ladder, signals, worked examples, fading, expertise reversal, productive failure, guidance debate, learn-claim check); research/notes/C-expert-tutoring.md (ICAP, INSPIRE, novice vs expert tutor turns); research/notes/G-ai-tutoring.md (Bastani, Kestin, Khanmigo critique); research/notes/F-domain-pedagogy.md (subgoal labels, Barbieri math meta-analysis, physical-skill loop); research/notes/E-artifact-design.md finding 4 (concreteness fading); research/baseline/fretboard-teardown/01-instructional-design.md F03, F31 and root cause 6; 03-guitar-teacher.md error 6. -->

# Diagnosis and feedback

How Claude finds out where the learner is, notices when understanding is an illusion, gives feedback that helps, and designs checks that can actually fail. Read it when choosing a probe, when "got it" sounds hollow, when writing feedback or hints, or when designing a check for a lesson.

## Contents

1. What you're diagnosing
2. The probe repertoire
3. Plan the next move before you ask
4. Reading the answer
5. Detecting the illusion of understanding
6. Re-diagnosing mid-session
7. Feedback: what to say
8. Feedback: when and how directly
9. Hints without leaking the answer
10. Checkable domains: actually check
11. Honor-system domains: design the self-check
12. Confronting misconceptions
13. Items that discriminate
14. Before-and-after feedback examples
15. Evidence notes

---

## 1. What you're diagnosing

When a learner is confused, the confusion usually sits in one of four places. Find which before you teach, because each needs a different move.

| Where | Sounds like | Move |
|---|---|---|
| **The concept** | "I don't get why it works" / predictions are wrong | Concrete case, then a prediction; misconception work if they hold a wrong model |
| **The procedure** | Knows what it is, can't carry it out; errors at a specific step | Worked parallel example, then faded practice |
| **The notation or vocabulary** | "What does Σ mean?" / misreads a symbol or a term | Tell it directly; attach it to an example they already understand |
| **The task itself** | Solves the wrong problem; "what is it even asking?" | Have them restate the question in their own words before anything else |

Also note: is there a specific wrong idea (a misconception) in play? A misconception is not a gap. It fights the right idea, and telling the right idea alone often leaves it intact (section 12).

## 2. The probe repertoire

Ask one probe at a time. Each entry: when to use it, wording, and what the answers tell you.

### 2.1 Cold start (before teaching anything)

Use when a learner arrives with "teach me X." A tiny task at their claimed level beats "what do you already know?", because people misjudge their own knowledge.

- "Before I explain anything, what do you think this prints?" (four lines of code)
- "Try this one and show me what you get: 2x + 3 = 11."
- "Play a G chord, then a C chord, then back to G. Tell me what happens at the change."
- "Write me two sentences about your weekend in Spanish, however rough."

Answer tells you: whether to start at the example, at a problem, or further back at a prerequisite.

### 2.2 Predict, then explain

Use before a demonstration or a reveal. It exposes the learner's working model, including a wrong one, before your explanation can overwrite it.

- "Before I run this: what do you expect, and why?"
- "If I double the mass, what happens to the time it takes to fall? Pick one: half, same, double."
- "What will the commit graph look like after this rebase? Sketch it with letters."

Answer tells you: the model they're using. A wrong prediction with a reason is the most useful thing you can get.

### 2.3 Error analysis

Use when the learner has some footing and you want to check depth without them leaning on recognition. Show a plausible wrong solution.

- "A student wrote `if x = 5:` and got a SyntaxError. What did they mean, and what's the fix?"
- "Someone simplified (x + 3)² to x² + 9. Where did they go wrong, and why is it a tempting mistake?"
- "This essay paragraph makes a claim but doesn't support it. Find the claim and say what's missing."

Answer tells you: whether they can spot the rule being broken, which is harder than following it. Use with partial learners, not true novices (incorrect examples helped novices less in math).

### 2.4 Teach it back to a defined novice

Use when you want to know if they have the idea or just your words.

- "Explain this to a colleague who's never used git. Two or three sentences."
- "How would you explain to a 12-year-old why the sky is blue?"

Better than "explain in your own words," which invites paraphrase. Answer tells you: missing links, and parroting (your phrases coming back verbatim).

### 2.5 Transfer probe

Use after a worked example, before moving on. Same structure, new surface.

- After a loop over a list of prices: "Same idea, but now it's a list of words and you want the longest one."
- After Bayes with medical tests: "A spam filter flags 95% of spam and 2% of real email. 10% of email is spam. If an email is flagged, what's the chance it's spam?"

Answer tells you: whether they learned the structure or memorized the example. Passing on the example's surface proves little.

### 2.6 Answer plus confidence

Use when you suspect overconfidence, or before a test.

- "Answer, then rate how sure you are, 1 to 5."

Answer tells you: a confident wrong answer is the strongest sign of a misconception, and the most useful signal you can get. A hesitant right answer means the idea needs another rep.

### 2.7 Contrast pair

Use when two ideas are easy to merge.

- "What's the difference between `==` and `is` in Python? Give a case where they disagree."
- "Mean vs median: when would they be far apart?"
- "Por vs para: one sentence each."

Answer tells you: whether the boundary between the two ideas exists in their head.

### 2.8 Hinge question (before moving on)

Use at a transition point. A multiple-choice or short-answer item where each wrong option maps to one named misconception.

> After this loop finishes, what is `i`?
>
> ```python
> for i in range(3):
>     pass
> ```
>
> (a) 2 (b) 3 (c) error, `i` doesn't exist after the loop (d) not sure

- (a) is right: the last value assigned.
- (b) means they think `range(3)` reaches 3, or that `i` ends at the limit.
- (c) means they're carrying a block-scope model from another language (in Python the loop variable survives the loop).
- (d) is honest and useful: teach it directly.

A good hinge question is quick, every option is plausible, and it gets the right answer for the right reason. That last condition is the one drafts miss: if a misconception also lands on the right option, the question can't see it (section 13). In chat, a single hinge question is weak evidence on its own, so pair it with one short "why?"

## 3. Plan the next move before you ask

Decide in advance what each answer would mean and what you'd do next. If every answer leads to the same next turn, the probe isn't worth the learner's time.

| If they say… | It means… | Next move |
|---|---|---|
| (a) 2, with the right reason | They have the model | Move on, slightly harder |
| (b) 3 | Off-by-one model of `range` | Have them print `i` inside the loop and compare |
| (c) error | Block scope from another language | Run it; then name the Python rule |
| (d) not sure | No model yet | Tell it, with a short trace table |

## 4. Reading the answer

- **One answer is thin evidence.** Hinge questions were designed for a whole class, where a teacher sees thirty responses. In one-to-one chat you see one. Before concluding "they've got it," get two or three signals on different surfaces.
- **Short answers beat multiple choice in chat.** You can't see hesitation, and options can be guessed. "Type the value of `i`" tells you more than four buttons.
- **The reason matters more than the answer.** Right answer, wrong reason is not mastery. Ask "why?" once after a correct answer, especially early.
- **Silence and "idk" are data.** They usually mean the step was too big. Drop one rung on the support ladder.
- **Track the help it took.** "Got it after two hints" is a different state from "got it." Write it down mentally and keep some support on the next item.

## 5. Detecting the illusion of understanding

Feeling that something makes sense, and doing well while you're helping, are both weak signs of learning. Robert Bjork's phrasing: what we can observe is performance, but what we have to infer is learning. In his studies, students who practiced one type of problem at a time predicted they'd do well the next day and did worse than students whose practice was mixed.

**Red flags, and what to do about each:**

| Red flag | What to say |
|---|---|
| "Yes, makes sense" / "got it," with no attempt | "Good. Then try this one without scrolling up: …" |
| A fluent paraphrase of your own sentences | "Say it a different way, as if to someone who's never seen code." |
| Right on the worked example, stuck on a new surface | Go back one level of support on the new surface; it's a transfer gap, not a total gap |
| Right only after two or more hints | Count it as "needed help." Next item keeps a hint available. |
| High confidence on a wrong answer | Stop and work on the misconception (section 12). This is the most important flag. |
| Smooth performance on five of the same problem type in a row | They knew which method to use because you just named it. Mix in a different type and see if they still choose right. |

**Replacements for "does that make sense?"** All of these ask for production:

- "Predict what changes if the list is empty."
- "Which step would you do first on this one?"
- "What would break if we skipped step 3?"
- "Give me an example of your own that fits this rule, and one that doesn't."
- "Here's a similar case. What's the output?"

**Delayed re-probes.** Bring the idea back later in the session on a new surface, with the answer hidden until they commit. Say so up front: "I'll ask you something like this again in a bit." A correct answer ten minutes later, after other material, is much better evidence than a correct answer right after the explanation.

## 6. Re-diagnosing mid-session

Diagnosis isn't a one-time step. Re-diagnose when:

- A move you expected to work doesn't (two misses after a hint).
- The learner's errors change type (they've fixed one thing and revealed another).
- They suddenly speed up (they may have more background than you assumed; give less).
- They say something that reveals a model you didn't expect ("so the computer remembers the variable from last time?").

The re-diagnosis can be one question: "Wait, before we go on: what do you think `x` holds right now?"

## 7. Feedback: what to say

A meta-analysis of 435 studies (Wisniewski, Zierer and Hattie 2020) found feedback effective on average (d = 0.48), with large variation: high-information feedback about d = 0.99, corrective feedback about 0.46, simple reinforcement or punishment about 0.24, and praise-type feedback the least effective. In an older meta-analysis it describes (Kluger and DeNisi), about a third of feedback effects were negative. Feedback is not automatically good. It helps when it carries information.

**Four levels**, from Hattie and Timperley's model:

| Level | Example | Use |
|---|---|---|
| **Task:** is this right, and what's wrong | "Line 4 returns before the loop finishes." | Always, for errors |
| **Process:** the strategy behind the work | "You checked the sign before expanding. That's why it came out right." | Best for building skill |
| **Self-regulation:** how they could check themselves | "How could you test this without asking me?" | Once they're partly fluent |
| **Self:** about the person | "You're so smart!" | Avoid. Carries no information. |

**Rules:**

- **What's right, what's wrong, why, next step.** All four, briefly. "Your base case is right. The recursive call passes `n` instead of `n - 1`, so it never gets smaller. What should it pass?"
- **Confirm what's correct, too.** For a learner who's mostly right, verification alone ("yes, and here's why") can be enough.
- **One or two points.** If there are five problems, pick the one that matters most now. The rest can wait for the next draft.
- **Comment on the work, never the learner's ability or speed.** Not "you're a natural," not "this should be easy."
- **Specific praise only.** "Good call checking the empty case" is information. "Great job!" isn't.
- **Don't soften errors into vagueness.** "Not quite!" without saying what is not feedback.
- **Don't fake neutrality.** If the argument is weak, say so, kindly and with what to do about it.

## 8. Feedback: when and how directly

Evidence on timing is mixed overall (Shute's review finds no consistent main effect), but it suggests contingencies: struggling learners on new material benefit from immediate, specific support; stronger learners benefit from hints and prompts; immediate feedback may be more efficient for procedures, delayed feedback possibly better for transfer on concepts. Use observed state (errors, hints needed), not a guess about ability.

| Observed state | Feedback |
|---|---|
| Fails the same step twice, or the procedure is new | Immediate and direct: what's wrong, why, and a worked step if needed |
| Mostly right, one error | A hint or a pointed question first ("which line fails for an empty list?"), then the fix if they don't see it |
| Conceptual work aimed at transfer | Let a wrong answer stand one beat: "Try your rule on this case." Let the case contradict it. |
| Correct | Confirm, say why it's right if not obvious, raise difficulty |

Always let them try first. Feedback before an attempt is just telling.

## 9. Hints without leaking the answer

A hint should leave the learner with a decision to make. Check each hint you write: after reading it, could they write the answer without thinking? Then it's the answer.

| Leaky hint | Better hint |
|---|---|
| "Have you tried multiplying both sides by x and dividing by 3?" | "What's stopping x from being alone on the left?" |
| "Maybe use a LEFT JOIN instead of INNER JOIN?" | "Which customers are missing from your result? What do they have in common?" |
| "The bug is that `range` should start at 0." | "Which element of the list does your loop never visit?" |
| "Remember that ser is for permanent traits." | "Is 'tired' a lasting trait or a current state?" |
| "The third should be C#, not C." | "What's the third of an A major chord? Count it up from A." |

Hint ladder order: where are you stuck, then where to look, then a narrower question, then the rule, then a worked parallel step. See `gradual-release.md` section 5.

## 10. Checkable domains: actually check

In code, math, factual and concept questions, and writing against a rubric, something other than the learner's wish to be done can decide whether an answer is right. So check it.

**In chat:**

- **Code:** run it, if you can execute code. Run the learner's version too, with the cases that would break it. If you can't run code, trace it by hand step by step and say that's what you did. In Claude Code, prefer having the learner run it ("run `pytest test_sum.py` and paste the output") so they learn the loop.
- **Math:** compute the answer yourself before giving feedback, with code if you can. Check equivalent forms (x = 6 and 6 = x; 0.5 and 1/2).
- **Concept questions:** have a model answer in mind and check their answer against its key points, not its wording.
- **Writing against a rubric:** name the criteria, then mark their draft against each one with a quote from their own text as evidence.
- **"I did it":** ask to see it. "Paste what you got" is the check.
- **Say what you verified.** "I ran your function on `[]`, `[5]` and `[1, 2, 3]`. The first one raises an IndexError."

**In an artifact** (details in `artifact-craft.md`):

- The learner commits (types or selects) before any answer appears.
- The page checks: stored answers with accepted variants, a tolerance for numbers, small test cases for code, an explanation for each wrong multiple-choice option.
- Every check uses only what the page has already taught. Audit each item against the section that teaches its prerequisites.
- A miss shows why, points back to the section, and brings a fresh variant later.
- Free text that can't be machine-checked: show a model answer and a short rubric, and have the learner mark each criterion with a quote from their own answer. Or give a "paste this into the chat" box so Claude grades it.
- No "mark done" button as the only gate.

## 11. Honor-system domains: design the self-check

For guitar and other instruments, sport, drawing, dance, pronunciation, typing, cooking technique: you can't see or hear the learner, and an artifact can't either (no microphone analysis, no computer vision). Self-assessment is inherent. That's not a flaw to apologize for. Design it well.

**1. Observable criteria, with numbers.** Something a stranger watching could verify.

- Weak: "Play it smoothly." "Get comfortable with the chord."
- Strong: "Five G-to-C changes in a row at 60 bpm, every change on the click, no string buzzing."
- Strong: "Ten free throws, count the makes. Elbow under the ball on every shot (check in a phone video)."
- Strong: "Draw the cube three times. Check: do the parallel edges converge toward the same point?"

**2. A tempo ladder (or difficulty ladder).** 50, 60, 70, 80 bpm. Tick a rung only after a clean run; the next rung opens after. This makes partial progress visible, which matters for motivation (the failed guitar course's learner quit on day 5 of seeing "0 lessons done").

**3. Record and compare.** "Record 30 seconds on your phone. Play it back. Answer three yes/no questions: did every note ring? did you stay with the click? did you stop?" Listening back catches what playing hides. Compare to a reference recording when one exists.

**4. Predict, then check.** "Which of these three changes will be slowest? Guess, then time them." Comparing prediction to result trains the learner's own judgment, which is the self-regulation level of feedback.

**5. An honest "not yet" path that changes the next step.** Every criterion gets a named next drill for failure, and "not yet" is presented as the normal result of a first try.

- "Buzzing on the G string? Your ring finger is probably landing mid-fret. Press just behind the fret wire. Drill: place and lift that one finger ten times, checking the sound each time."
- "Changes late on the click? Drop to 40 bpm and practice only the change, from the last beat of G to the first beat of C."

**6. External references, not the untrained skill.** A check that depends on the skill being learned can't catch errors in it. "Sing the interval and check it sounds right" fails for someone who can't yet hear the interval. Use something outside the learner: a tuner, a metronome, a reference recording, a chord they already play well, a phone video, a written answer.

**7. Report back.** Give them a template so their report carries information: "Step 3, 60 bpm: 3 of 5 clean. Buzz on the G string on changes 2 and 4. Fine at 50." Then adjust from it.

**8. Say what you can't see.** "I can't hear you play, so I'm going on what you tell me. If something sounds off and you can't say what, record it and describe the moment it goes wrong."

**9. Check every criterion against the domain.** A criterion is a claim about the subject, and it can be false. A blues lesson's criterion "your last note of bars 4, 8 and 12 is the root" fails on bar 12, which is the V chord (E7 in the key of A): the key's root, A, sits a fourth above the bass there and sounds like a suspended chord, and the page's next prompt said a note that fought the bass was a mistake, so a learner who followed the criterion was taught to doubt it. For each criterion, ask two questions. Can a correct performance fail it? Can a wrong one pass it? Work one real case through it (the actual chord in that bar, the actual note the page plays). If either answer is yes, narrow the criterion ("the root on bars 4 and 8, where the I chord plays; on bar 12, the V chord, land on that chord's root, the key's fifth") or replace it.

**10. Check the drill exercises the skill.** A drill is valid only if the target skill is the easiest way to pass it. Look for a shortcut: in one fretboard lesson the learner typed lick frets as the root fret plus fixed offsets (+0, +3, +5), which is arithmetic, while the objective was seeing the notes on the neck. If a shortcut exists, change the task so it doesn't work: ask for a note's position on the board without giving the root fret, have them click it on a diagram, vary the shape so the offsets change, or time it so recomputing is too slow. The same check applies to checkable domains (a SQL drill where the row count is always "rows in the left table" can be passed without understanding the join).

**11. If they can share a recording, photo or video**, and your environment can take one, use it. Say what you can and can't judge from it. Don't make confident claims about technique you can't check.

## 12. Confronting misconceptions

In Muller's physics research, a clear and correct explanation left students about where they started, while presentations that stated and refuted the common wrong ideas (or staged a dialogue around them) produced effect sizes around 0.8 over the clear version. Students rated the clear version as clear and the refutation version as confusing. Low-prior-knowledge students gained most, and nobody was harmed.

So when a topic has known misconceptions:

1. **Know the likely wrong ideas before you teach.** Research them (see `topic-research.md`) or recall the well-known ones, and check.
2. **Have the learner commit to a prediction** that the misconception would get wrong.
3. **Show the case.** Run it, compute it, describe the experiment.
4. **Name the wrong idea** and why it feels right. "Most people say the heavier ball lands first. It feels right because in air, a feather really does fall slower."
5. **Explain using their answer.** "You said double. Here's where that reasoning breaks."
6. **Tell them confusion here is expected.** "If this feels confusing, that's normal. It means your old model and the new one are fighting, which is when the change happens."
7. **Re-probe later on a new surface,** because misconceptions come back.

Don't just assert the right answer over the top of a wrong one. The wrong one survives.

**Common misconceptions worth probing for** (verify specifics before relying on them):

| Domain | Wrong idea | A probe that exposes it |
|---|---|---|
| Physics | Heavier objects fall faster | "A bowling ball and a tennis ball dropped together, no air. Which lands first?" |
| Physics | A moving object needs a force to keep moving | "A hockey puck slides on perfect ice. What keeps it going?" |
| Probability | Past independent events change future odds | "Five heads in a row. Is tails more likely now?" |
| Statistics | A p-value is the probability the null is true | "p = 0.03. Is there a 3% chance the null hypothesis is true?" |
| Programming | Assignment links variables (`b = a` then changing `a` changes `b`, for ints) | "`a = 5; b = a; a = 7`. What's `b`?" Then the same with lists. |
| Programming | Variables hold their value from the last run | "Run it twice. What's `count` at the start of the second run?" |
| Algebra | Exponents distribute over addition | "Is (a + b)² equal to a² + b²? Try a = 1, b = 2." |
| Git | Rebase moves commits (rather than creating new ones) | "After rebase, are X and Y the same commits? Check the hashes." |

## 13. Items that discriminate

An item tests a misconception only if the misconception gives a different answer from the right rule on that item. Otherwise a learner holding the wrong idea gets "Right." and leaves more confident. Clear explanations already leave wrong beliefs in place (section 12); a check that confirms them makes it worse.

This is the most common way a well-built lesson fails. In a blind test of an invented scoring game whose learners were primed with "doubling applies to the whole stack, not just the run", the lesson's opening hook used a stack where both rules gave 18, so it told the misconception holder "Right." Its runs practice generator produced mostly single-colour stacks (BBB, RRR), where the two rules agree: 75% of items couldn't detect the misconception, and a learner holding it cleared "two in a row" without being contradicted about 56% of the time (0.75 squared). The lesson looked thorough, and the one error it was built to catch slipped through.

**The recipe.** It works in chat and in an artifact.

1. **Name the misconceptions** for the idea, from two sources. The documented wrong ideas (`topic-research.md`, or the well-known ones). And the rules themselves, worked through systematically: for each rule, what does a learner answer who **drops** it, who **over-applies** it (uses it where it doesn't apply, or on the whole instead of the part), who applies it **in the wrong order** relative to the others, or who **mis-scopes** it (applies it to only part of the total, to the wrong quantity, or at the wrong stage, such as a cap checked before the last charge)? Add each **boundary confused** (< for <=), each threshold off by one, and each exception forgotten. Keep near-miss slips apart: two misconceptions are different if some case gives them different wrong answers, so "forgets the cap" doesn't cover "the cap applies only to the first charge", and an item that exposes one can miss the other. In iteration 3 that swap passed every coverage check on the page, because a check is only as good as its list (Practitioner, one probe). Intuition alone misses some: in iteration 2 a lesson's catalogue had no entry for "the free pass is checked right after the first step", so the one learner who held it got no item and no feedback that named it.
2. **Write each one as a rule you can apply.** "Every neighbouring letter is two frets apart"; "LEFT JOIN returns one row per left row"; "double the whole stack". In an artifact this is literally a function beside the correct engine: `wrong.allTwoFrets(note)`, `wrong.wholeStack(stack)`.
3. **Work each candidate item under every rule.** Correct answer, and the answer each misconception gives.
4. **Keep items where the answers diverge.** An item is discriminating for a misconception when that misconception's answer differs from the right one. Prefer items that separate several misconceptions at once.
5. **Allow a minority of non-discriminating items, on purpose.** A few items where the rules agree stop the learner from inferring "the obvious answer is always wrong". Keep them under about a quarter, and never use one for a placement item, the hook, a mastery streak or the final check.
6. **Use the divergent answers.** In multiple choice, the misconception answers are the wrong options, each with its own explanation. In typed items, compare the learner's answer with each misconception's answer and name the one it matches: "18 is what you get by doubling every stone. Only stones inside a run double."
7. **Measure the rate.** For a generator, sample a few thousand items and print the share that discriminates for each misconception. A rate you didn't measure hasn't been checked. JavaScript for steps 2 to 7: `artifact-craft.md`, section 5.8.

**In chat**, step 3 is a moment of private work before the question: "If they think every letter is two frets apart, they'll say F is at fret 2. Good, that separates." If the case doesn't separate, change the numbers before asking.

**Placement and mastery depend on it.** A placement item that the misconception answers correctly routes a learner past the part that would fix it. A streak of three on non-discriminating items is three coin flips the wrong model wins. Mastery criteria count only discriminating items.

**Coverage on every path.** Discriminating items help only on the path the learner actually takes. In iteration 2 a lesson had good items for its two hardest misconceptions, but they sat in parts that a placement gate let the learner skip, and the gate items were ones both misconceptions answered correctly. So the learner who held them was told they had placed out, skipped the only corrective items, practised three random items that happened not to expose either (a 36% chance), met a closing set that covered neither, and finished the post-test with both. Three rules close that hole:

- **Every path meets every misconception at least twice:** once to confront it, with feedback that names the belief, and once later to apply the fix. Count paths, not parts: the full path, and every shorter one placement or a "test me" exit allows. In chat, the same holds for a session: before closing, ask which misconceptions this learner hasn't yet met a separating case for.
- **A gate is valid only if the misconceptions it lets a learner skip all fail it.** For each part a gate can skip, list the misconceptions that part repairs and confirm each gives a wrong answer on the gate item (or on one of the items that must all be right to skip). Avoid gate items that land on a boundary (exactly at a cap or threshold), where a rule applied in the wrong place gives the right number by accident. A two-option item should never skip anything; a guess passes half the time.
- **Streaks and closing sets cover every misconception.** "Three in a row" counts only once the streak's items, between them, have exposed each misconception the part targets; if one hasn't come up, the next item is drawn to expose it. The final check is chosen by coverage (each misconception at least once), not by "items where many slips differ", which in that lesson quietly excluded every cap and free-pass case.

## 14. Before-and-after feedback examples

**Code**

> Before: "Nice try! Not quite. Here's the corrected function: [code]"
>
> After: "Your loop and the comparison are right. The problem is `return total` is indented inside the loop, so the function returns after the first item. For `[3, 4]` it returns 3. Where should that line go?"

**Math**

> Before: "Incorrect. The answer is 16."
>
> After: "You added the exponents, which is the rule for *multiplying* powers with the same base. Here the terms are added, so that rule doesn't apply. Rewrite 2³ + 2³ as a number first. What do you get?"

**Writing**

> Before: "Good draft! Maybe tighten it up and make the argument stronger."
>
> After: "Your claim is clear in the first sentence ('remote work raises output'). The support is one anecdote. What's one piece of evidence a skeptic would accept? Revise the second paragraph around it, then send it back."

**Guitar**

> Before: "Sounds like you're getting there! Keep practicing."
>
> After: "3 of 5 clean at 60 is real progress from 1 of 5 yesterday. The misses are both on the G string, which points at your ring finger. Try 20 slow placements of that finger alone, then 5 changes at 50. Tell me how many are clean."

## 15. Evidence notes

- Hinge-question design: Moderate (Wiliam, via a teacher-facing summary). Probe list as a set: Practitioner.
- Performance vs learning, illusions of learning: Moderate (Bjork, via APS Observer; Dunlosky et al. 2013 on rereading).
- Feedback effect sizes and levels: Strong for direction, Moderate for exact numbers (Wisniewski, Zierer and Hattie 2020, opened). Hattie and Timperley 2007 and Kluger and DeNisi 1996 not opened directly.
- Feedback timing contingencies: Contested (Shute, ETS 2007 report).
- Self-check design for checkable and honor-system domains: Practitioner, built on the feedback and practice-testing evidence and on the fretboard teardown.
- Misconception confrontation: Moderate (Muller et al. 2008 via two secondary descriptions; Muller's own video, transcript opened). One topic, immediate test.
- Misconception table entries: Practitioner; well known, verify the specific probes before use.
- Discriminating items (section 13): Moderate for the principle (Wiliam's hinge-question rule that an item must "elicit the right response for the right reason", with distractors that reflect different misconceptions). The recipe, the quarter cap on non-discriminating items, and the measured-rate step are Practitioner, from the iteration 1 blind test (`testing/reports/iter-1-grading-driftstones.md`).
- Criterion validity and drill validity (section 11, items 9 and 10): Practitioner, from the same test (`testing/reports/iter-1-grading-fretboard.md`).
- Coverage on every path, gate validity and coverage-based streaks (section 13): Practitioner, from the iteration 2 blind test (`testing/reports/iter-2-grading-brindle.md`). One run per condition; the grader estimated the true post-test gap at about 1 point, and the mechanism (gates the misconceptions pass) was deterministic, not chance. The systematic drop, over-apply and misorder listing is v0: it would have produced the missing entry, but it hasn't yet been tested on a new lesson.

<!-- Sources: research/notes/B-diagnosis-feedback.md (probes, illusion signals, feedback levels and meta-analysis, timing, checkable vs honor-system checks); research/notes/C-expert-tutoring.md (Graesser "does that make sense", INSPIRE indirect feedback, expert vs novice turns); research/notes/D-retention.md finding 5 (self-testing design); research/notes/E-artifact-design.md findings 3 and 5 (Muller, self-checks by domain); research/notes/I-video-educators.md finding 2 (Muller check); research/notes/F-domain-pedagogy.md (feedback on physical skill without observation, v0); research/notes/H-myths.md (fluency is not learning, mindset); research/baseline/fretboard-teardown/01-instructional-design.md F17-F19, F24, F25, root causes 4 and 8; 02-learner-walkthrough.md (honor-system-progress, unverifiable-self-check, quit point); 03-guitar-teacher.md lessons 7 and 9; testing/reports/iter-1.md and the two grading reports (non-discriminating hook and generator, bar-12 criterion, arithmetic drill); testing/reports/iter-2.md and iter-2-grading-brindle.md (gates the misconceptions pass, uncovered closing set, missing catalogue entry). -->

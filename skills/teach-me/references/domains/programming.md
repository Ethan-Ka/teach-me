# Teaching programming

Where the general process changes for code: reading before writing, tracing, Parsons problems, subgoal labels, debugging, codebases, and what to do differently in Claude Code.

## Contents

1. Where the general rules change
2. PRIMM: predict before you run
3. Tracing and notional machines
4. Parsons problems
5. Subgoal labels
6. Teaching debugging
7. Teaching a codebase: one path, not a tour
8. Claude Code specifics
9. In the Claude apps
10. Learners who already program
11. Checking code for real
12. Coding assignments and integrity
13. Mini-transcripts
14. Evidence notes

---

## 1. Where the general rules change

- **Showing code is usually a demo, and weak.** It becomes teaching the moment the learner has to predict what it does before it runs.
- **Code can be checked exactly.** Use that: run things, have the learner run things, and let the output settle disagreements.
- **The learner needs a model of the machine.** Most persistent novice errors come from a wrong picture of what happens when code runs (what a variable holds, when a function returns, what a reference points to). Trace tables expose it cheaply.
- **The blank editor is its own barrier.** A novice who understands the idea can still freeze at "write a function that…". Parsons problems and stubs are the scaffold.

## 2. PRIMM: predict before you run

Predict, Run, Investigate, Modify, Make. A school study (Sentance, Waite and Kallia 2019; 493 students aged 11 to 14) found PRIMM classes outperformed controls. The evidence is school-age novices; for experienced programmers, skip straight to Modify or Make.

| Stage | What the learner does | Example wording |
|---|---|---|
| **Predict** | Reads a short working snippet and says what it will do | "Before running this, what will it print? Say what `total` is after each pass." |
| **Run** | Runs it and compares with the prediction | "Run it. Same as you expected? If not, which line surprised you?" |
| **Investigate** | Answers questions about how it works | "What would change if `total = 0` moved inside the loop? Why?" |
| **Modify** | Changes it to do something slightly different | "Change it to add only the odd numbers." |
| **Make** | Writes something new using the same idea | "Write a function that returns the largest number in a list." |

Keep Predict snippets small enough that a real prediction is possible: 4 to 10 lines, one new idea. If Make is too big a jump for multi-step problems, add a Decompose step (plan the subgoals in plain words first).

## 3. Tracing and notional machines

A notional machine is a simplified model of what the computer does: variables as labeled boxes, the call stack as a pile of cards, references as arrows. Every model is wrong somewhere, so name the one you're using and say where it breaks.

**Trace tables** are the cheapest check of the learner's model:

```python
total = 0
for n in [3, 1, 4]:
    total = total + n * 2
```

> Fill in the table: what's in `n` and `total` after each pass?
>
> | pass | n | total |
> |---|---|---|
> | start | (none) | 0 |
> | 1 | ? | ? |
> | 2 | ? | ? |
> | 3 | ? | ? |

(Answer: 3, 6; 1, 8; 4, 16.)

Switch models when the first one breaks. Boxes work until aliasing appears:

```python
a = [1, 2]
b = a
a.append(3)
print(b)
```

Here "b gets a copy of the box" predicts `[1, 2]`; the real output is `[1, 2, 3]`. That's the moment to introduce arrows: both names point to the same list. Have the learner predict first, so the collision is theirs.

## 4. Parsons problems

The learner gets the correct lines of code, scrambled, and puts them in order. Randomized studies by Ericson and colleagues found Parsons problems produced about the same learning as writing code from scratch or fixing code, in less time. Distractor lines (extra wrong lines) reduced efficiency for young novices. They don't train the blank-page skill of deciding what to write, so use them as a step toward writing, not a replacement.

**In chat:**

> Here are the lines of a function that returns how many words in a list are longer than five letters. Put them in order and fix the indentation:
>
> ```
> A    return count
> B    count = 0
> C        if len(w) > 5:
> D    for w in words:
> E            count += 1
> F def long_words(words):
> ```

(Answer: F, B, D, C, E, A.)

**In an artifact:** a drag-to-order list with a Check button that tests the order (and runs the code, if the page can).

**When to use:** a novice who understands the idea but stalls at a blank editor; practicing a pattern (accumulator, search, filter). **When to drop:** once they can write the pattern from a plain-English request.

## 5. Subgoal labels

Group the steps of a worked example under short, generic labels for what each part accomplishes, and reuse the same labels across problems. In studies by Margulieux, Catrambone and Guzdial, subgoal-labeled examples helped novices solve new problems. Labels must be generic enough to transfer ("update the accumulator", not "add the price").

Common subgoal sets:

- **Loop over a collection:** set up the result, visit each item, decide whether it counts, update the result, return the result.
- **Write a function:** name what it takes and gives back, handle the simplest case, handle the general case, test the edges.
- **Recursion:** the base case, the smaller problem, combine the result.
- **SQL query:** which tables, how they connect, which rows, which columns, how to group or sort.

Ask the learner to label a new example themselves: "Which subgoal is this line?"

## 6. Teaching debugging

When a learner brings a bug, it's a chance to teach the debugging loop, not just to fix the bug. But respect the route: a fire-and-forget "this crashes and I have 20 minutes" gets the fix (SKILL.md section 1).

The loop to teach:

1. **Read the error message.** "What does the last line of the traceback say? Which line of your code does it point to?" Many novices don't read past "Error."
2. **Reproduce it on purpose.** "What's the smallest input that makes it fail?"
3. **Predict, then look.** "What do you think `x` is on line 7 when it fails? Add a print and check."
4. **One hypothesis at a time.** "What do you think is wrong? How could we test that?"
5. **Fix and explain.** "Why does that fix it?"
6. **Generalize.** "What would you check first next time you see this error?"

Hint ladder for bugs: "where does it fail?", then "what's the value of X there?", then "which line sets X?", then the concept, then a parallel example of the same bug.

## 7. Teaching a codebase: one path, not a tour

"Help me understand how auth works here, so I can work in it" is a request to be able to act in the code. A tour of every directory is a demo: the learner nods along and retains a list of folder names. Newcomers build understanding by following one concrete feature through the code, mixing top-down guesses with bottom-up reading. (This section is v0: it's built on PRIMM and program-comprehension research, not on a controlled study of teaching codebases.)

1. **Ask what they need to do.** Fix a bug in login? Add an OAuth provider? Review a PR? The purpose decides which path to trace.
2. **Read it yourself first.** You need to know the path to check their predictions. Don't guess about code you haven't read.
3. **A five-line map.** The main parts and how they relate, no more. "Requests come in through `routes/`, auth checks live in `middleware/auth.ts`, users are in the `users` table via `models/user.ts`, sessions are in Redis."
4. **Pick one concrete entry point:** a route, a CLI command, a test. "Let's follow what happens when someone POSTs to `/login`."
5. **At each hop, the learner predicts first.** "The route handler calls `authenticate(req)`. Where do you think that's defined, and what do you expect it returns?" Then open the file together and check.
6. **After each hop, a restatement.** "In one line: what does `authenticate` take and give back?"
7. **Let them run it.** A test, a request with `curl`, a print statement, a breakpoint. Seeing the real values beats reading about them.
8. **Close with a solo trace.** "Now trace what happens on logout, and tell me which files it touches." Or: "Where would you add a check that blocks banned users?"

**Things that go wrong:** explaining the whole architecture before any code; reading files aloud to the learner; tracing three paths at once; making the change for them when the goal was for them to be able to make it.

## 8. Claude Code specifics

With a terminal and their files, you can teach with the real thing. Use it, but keep the learner's hands on the work.

- **Read before you teach.** Search and read the relevant files before your first explanation, so every prediction can be checked against real code.
- **Let the learner run commands.** Suggest the command and have them run it: "Run `git log --oneline --graph -10` and tell me what you see." They learn the tool, not just the concept. Run things yourself when the point is to check something quickly, not to teach the command.
- **Don't edit their code for them** when the goal is learning, unless they ask. Point to the line and let them change it. If they ask you to make the change, make it, then ask them to explain it.
- **Use throwaway spaces for risky practice.** For git, suggest a scratch repo (`mkdir /tmp/rebase-practice && cd /tmp/rebase-practice && git init`) so a mistake costs nothing. Never run destructive commands in their real repo as a demonstration.
- **Run the tests.** Their tests are a ready-made check. "Run the test for this function. Which case fails?"
- **Use the history.** `git log -p path/to/file` and `git blame` show why code looks the way it does, which is often the real question.
- **Create practice files when useful,** clearly named and in a place they agree to, and offer to delete them at the end.

## 9. In the Claude apps

No file access by default, so:

- Ask them to paste the relevant code, or upload files if they can.
- If you have code execution, run snippets and their attempts there. Say that it's a sandbox and their environment may differ (versions, installed packages).
- If you don't, trace by hand and say so. Ask them to run things and paste the output.
- For codebases, ask for the specific files on the path you're tracing, one hop at a time. That keeps it to one path naturally.

## 10. Learners who already program

- **Skip Predict on trivial code.** Start at Modify or Make, or with a probe at their level.
- **Teach a new language by contrast** with one they know: "In Python a list is mutable and passed by reference; in Rust, who owns this vector after the call?" Contrast pairs are where their existing model will mislead them.
- **Name the traps their old language sets.** JavaScript developers in Python: truthiness differences, no `++`. Python developers in Go: errors come back as return values rather than exceptions. Verify each claim before stating it.
- **Get to a real task fast.** An experienced learner learns a new framework best by building one small real thing in it with you checking.

## 11. Checking code for real

- Run every snippet you show. Paste outputs from the run.
- Run the learner's attempt against cases chosen to break it: empty input, one item, duplicates, negative numbers, the boundary.
- Say what you ran: "I ran your function on `[]`, `[7]` and `[3, 3, 1]`. It returns `None` on the empty list."
- In an artifact: a code box with tests the page runs (in-browser JavaScript, or a small Python runner if the platform supports one), or "run this locally and paste the output to Claude." Keep it in what a static page can do.
- Don't accept "it works" without seeing the output.

## 12. Coding assignments and integrity

For graded coursework: explain concepts, debug the error they show you, and review their attempt. Don't write the function they were asked to write. Use a parallel problem for worked examples (a different function with the same pattern). For self-learners and professionals there's no integrity issue; teach, and give the answer when that's what serves them.

## 13. Mini-transcripts

### 13.1 Demo instead of teach (bad)

> **Learner:** how do Python list comprehensions work?
>
> **Claude:** List comprehensions are a concise way to create lists. The syntax is `[expression for item in iterable if condition]`. For example, `[x*2 for x in range(5)]` gives `[0, 2, 4, 6, 8]`. You can add conditions: `[x for x in range(10) if x % 2 == 0]` gives `[0, 2, 4, 6, 8]`. You can also nest them… [continues with nested comprehensions, dict comprehensions and generator expressions]

### 13.2 The same request (good)

> **Learner:** how do Python list comprehensions work?
>
> **Claude:** Have you written a `for` loop that builds a list, like this one?
>
> ```python
> doubled = []
> for x in [1, 2, 3]:
>     doubled.append(x * 2)
> ```
>
> **Learner:** yeah
>
> **Claude:** Then you already know what a comprehension does. This line does exactly the same thing:
>
> ```python
> doubled = [x * 2 for x in [1, 2, 3]]
> ```
>
> Look at the two side by side. Which part of the loop became `x * 2`, and which became `for x in [1, 2, 3]`? Then: what would `[x + 1 for x in [5, 6]]` give?

*Why:* builds on the loop they know (concrete first), one new idea, the learner maps the parts themselves, then a prediction.

### 13.3 Teaching a codebase (good, Claude Code)

> **Learner:** I just joined and need to fix a bug where some users can't reset their password. Can you help me understand how password reset works here?
>
> **Claude:** [reads `routes/auth.ts`, `services/reset.ts`, `models/token.ts` first] Here's the short map: the reset flow lives in three files, a route, a service that makes and checks tokens, and a token model. Let's follow one request. Open `routes/auth.ts` and find the handler for `POST /reset/confirm`. What's the first function it calls, and what do you guess that function checks?
>
> **Learner:** it calls verifyResetToken(token). probably checks the token exists?
>
> **Claude:** Good guess, and half of it. Open `services/reset.ts` and read `verifyResetToken`. It checks two things. What's the second one?
>
> **Learner:** oh, it checks expiresAt against Date.now()
>
> **Claude:** Right. Now, the bug says *some* users can't reset. Given those two checks, what kinds of users might fail them? Make a guess, then we'll test it.

*Why:* Claude read the code first, gave a short map, traced one path, and every hop starts with the learner's prediction. The bug hunt becomes theirs.

## 14. Evidence notes

- PRIMM: Moderate (Sentance, Waite and Kallia 2019; school-age novices; abstract level).
- Parsons problems: Moderate to Strong (Ericson et al.; ITiCSE 2023 working group; search summaries).
- Subgoal labels: Moderate (Margulieux, Catrambone and Guzdial 2016; search summary).
- Notional machines: Moderate as a field concept (Fincher et al. 2020; abstract).
- Codebase teaching by one path: Practitioner, v0 (program-comprehension studies on top-down and bottom-up reading; no intervention study found).
- Debugging loop, Claude Code and app specifics, experienced-learner contrasts: Practitioner.

<!-- Sources: research/notes/F-domain-pedagogy.md (PRIMM, Parsons, subgoal labels, notional machines, codebase tracing); research/notes/A-tell-guide-do.md (expertise reversal for experienced programmers, decorator example); research/notes/B-diagnosis-feedback.md (hinge question on range, checks in chat); research/notes/C-expert-tutoring.md (step-level responsiveness); research/notes/G-ai-tutoring.md (solve first, guardrails); research/notes/distribution.md (Claude Code vs claude.ai capabilities). -->

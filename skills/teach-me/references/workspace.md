# Teaching across sessions: the workspace

Most of this skill assumes one conversation. Learning that lasts happens across many: spacing works over days, not minutes, and a learner who comes back needs a teacher who remembers what they got wrong. Where you can read and write files (Claude Code, or any environment with a persistent folder), a small set of files in the learner's directory can carry that memory. This file describes that workspace: what goes in it, how a session runs, and where the workspace's own habits can quietly undo the rest of the skill.

Adapted from a `teach` workspace skill (a verbatim copy is in the repository's `upstream/teach/`). Its structure is kept; where its advice met this skill's evidence, the evidence decided, and those places are marked.

## Contents

1. When to use the workspace
2. The files
3. A session, start to finish
4. The mission
5. Choosing the next lesson
6. Lessons in a workspace
7. Assets: one course, not a pile of pages
8. Reference documents and the glossary
9. Resources and citations
10. Learning records
11. Knowledge, skills and wisdom
12. Without file access
13. Formats
14. Evidence notes

---

## 1. When to use the workspace

Use it when the learner signals more than one sitting: "teach me X over the next month", "set up a course", "I want to get good at X", `/teach`, or a request to continue where a previous session left off. Also use it whenever the working directory already holds a `MISSION.md`: someone set this folder up for learning, so read it before answering anything.

Don't create one for a single question, a quick quiz or one standalone lesson. Six files for a ten-minute question is ceremony, and the learner didn't ask for a course. If you're not sure, ask once: "Do you want this as a one-off, or should I set up a folder we keep coming back to?"

## 2. The files

All paths are relative to the directory the learner is working in.

| Path | What it holds | Why it exists |
|---|---|---|
| `MISSION.md` | Why they're learning this, what they want to be able to do, by when | Every later choice (what to teach next, which example, when to stop) is judged against it |
| `NOTES.md` | Their stated preferences and your working notes | So "I hate flashcards" or "I practise on a nylon-string guitar" survives the session |
| `RESOURCES.md` | Sources you've checked, with what each is good for | So research isn't redone, and lessons cite things you actually opened |
| `learning-records/NNNN-<name>.md` | Dated evidence of what they can and can't do yet, and what's due for review | The memory a returning learner needs; the input for choosing the next lesson |
| `lessons/NNNN-<name>.html` | One lesson per file, numbered in order | The unit of teaching |
| `reference/*.html` | Cheat sheets and the glossary | The things they'll look up later |
| `assets/` | Shared stylesheet and reusable widgets | So lessons look like one course and don't re-implement the same quiz |

Numbers are four digits and increment (`0001-`, `0002-`). Read the directory to find the next number; never reuse one.

## 3. A session, start to finish

1. **Read the state.** `MISSION.md`, `NOTES.md`, the last few learning records, the list of lessons, `assets/` and the glossary. Don't summarise them back to the learner; use them.
2. **No mission yet?** That's the first conversation (section 4). Ask, then write `MISSION.md`, then diagnose.
3. **Open with retrieval, not a recap.** Ask two or three questions on what the records say is due or was shaky, answered from memory. This is spaced retrieval doing its job, and it also checks the records, which may be stale: a skill marked solid three weeks ago may be gone. (`retention.md`, section 8.)
4. **Choose today's lesson** from the mission, the records and what retrieval just showed (section 5). If the learner named something specific, start there and check it's within reach.
5. **Research if needed.** If `RESOURCES.md` is thin for this topic, do the research pass in `topic-research.md` first and log what you verified.
6. **Build the lesson** to `artifact-blueprint.md` and `artifact-craft.md`, scoped to one objective (section 6), on the shared assets (section 7). Update or create the reference sheet it feeds (section 8).
7. **Open it for them** if you can: `open lessons/0003-….html` on macOS, `xdg-open` on Linux, `start` on Windows. Tell them what to do first and to come back with their results.
8. **When they report back,** respond to the actual results the way the rest of this skill says (feedback, the support ladder). Then write a learning record (section 10) and update `NOTES.md` with any preference they stated.

A session can also be pure conversation tutoring with no new lesson. Still open with retrieval and still write the record.

## 4. The mission

Ask why before teaching what. "I want to learn music theory" could mean writing chord progressions for their band, passing a grade 5 exam, or understanding what their kid's teacher is saying, and each needs a different first lesson. A course built without this is written for an imagined learner; the failed guitar course was written for an experienced player and lost its actual reader on day 5 (fretboard teardown).

Fold the mission question into diagnosis so the first exchange stays short: one question about the goal, one tiny task to see where they are (section 2 of SKILL.md). Two or three questions, not an intake form.

`MISSION.md` holds the goal in their words, one or two concrete things they want to be able to do (written as checks, so you'll both know when they can), their constraints (time per week, equipment, deadline) and what they already do. Use the mission to pick examples: the learner who wants to write songs practises progressions in the key of a song they like, not in an exercise.

Missions change as people learn. When a learner's goals have shifted, propose the new wording and change the file only once they agree, then add a learning record saying what changed and why. A silent edit rewrites the reason every past lesson was chosen.

## 5. Choosing the next lesson

The target is the next thing they can't yet do alone but can do with one lesson's help: hard enough to need effort, close enough that the effort pays off.

- **Start from evidence.** What did today's retrieval and the last record show? A skill they got right with a reason can be built on. A miss gets re-taught (with a new case) before anything that depends on it.
- **Then the mission.** Of the things within reach, choose the one that moves them most directly toward the mission's checks. Prerequisites come first only when the next step really fails without them.
- **Then the size.** One objective (section 6). If it won't fit in one lesson, the target is too far; pick the step before it.

Treat records as hypotheses about the learner, not facts. Diagnosis is per idea and goes stale. When records and today's answers disagree, today wins.

## 6. Lessons in a workspace

Everything in `artifact-blueprint.md` and `artifact-craft.md` applies. The workspace changes three things.

- **Smaller.** One objective and one tangible win per lesson: something they can do at the end that they couldn't at the start, checked by the page or reported back. Aim for something finishable in one sitting of 10 to 20 minutes *(v0: the time is a convention, not a finding)*. The course is the sequence of lessons, so no single lesson has to cover the topic. This is the same rule as "scope to mastery, not coverage", applied every session: the failed guitar course shipped 96 lessons nobody could finish.
- **Connected.** Link the lessons this one builds on, and the reference sheets it feeds. Earlier material comes back in this lesson's practice and closing retrieval, mixed in with the new idea (interleaving, for confusable ideas; `retention.md`). A link to an old lesson is a pointer, not practice.
- **Sourced.** Recommend one primary source for the topic (the best one in `RESOURCES.md`) with a reason and a task: what to predict before reading or watching, what to try after. Back factual claims with a link to a source you opened. End with one line inviting them to bring questions back to you. Put that line once, at the end; boilerplate stamped on every section teaches people to skim (fretboard teardown, root cause 11).

Lessons may link files in `assets/`, so they aren't single-file in the sense of `artifact-craft.md`. Keep the relative paths working from `lessons/` (`../assets/course.css`).

## 7. Assets: one course, not a pile of pages

Before writing a lesson, list `assets/` and build from what's there. The first lesson creates `assets/course.css` (palette, two typefaces, spacing, the states of every control, light and dark, print styles), following `artifact-craft.md`; every later lesson links it. When a lesson needs something a second lesson could use (a multiple-choice widget with explained feedback, a timed recall drill, a metronome, a small test runner), write it as a component in `assets/` and link it.

The reasons are practical. A shared stylesheet makes the lessons read as one course, so the learner spends attention on the content and not on a new layout. Shared widgets mean a bug fixed once is fixed everywhere, and a check that works (feedback that explains, a miss that's recorded) stays working. *(v0: practitioner reasoning, no study.)*

A component is shared code, not shared content. Each lesson still computes its own items from its own source of truth and runs its own `checks` at load.

## 8. Reference documents and the glossary

Learners come back to reference sheets far more often than to lessons, so they should be quick to scan and print well: syntax and snippets, a process as a flowchart, a routine, a chord chart, a glossary.

One caution decides how they're used. A reference sheet is what this skill's artifact guidance calls the usual failure: accurate, organised, and nearly useless for learning, because reading it feels like knowing. So a reference sheet is written *after* the lesson that teaches its contents, as the compressed result of practice the learner has already done, and it never replaces that practice. Don't point a lesson's exercises at the sheet ("look it up in the reference") while the skill being practised is recall. Generate the sheet from the same data as the lessons, so it can't disagree with them.

**The glossary.** Once a term is defined, use it the same way in every lesson and sheet. A learner who meets "chord tone" in lesson 2 and "harmony note" for the same thing in lesson 5 has to work out whether they're different. Add each new term when a lesson introduces it, in the learner's working vocabulary, with a one-line example. Spell things the way the domain does. *(v0 as a rule; it follows from keeping load off the learner.)*

## 9. Resources and citations

You don't know everything, and the workspace makes your mistakes durable: a wrong fact in lesson 1 gets built on in lessons 2 to 10. Before `RESOURCES.md` has solid entries for the area you're teaching, research is the first job (`topic-research.md`).

Log a resource only after you've opened it. For each, note what it's good for and what you checked. For a video, note a segment and a timestamp you confirmed. Note anything you found wrong in it. A resource list built from memory is a list of plausible-sounding titles, some of which don't exist.

Cite in lessons with links to what you opened. Citations let the learner check you and show them where the field's knowledge lives. They don't make the content right; computing and checking it does (SKILL.md, section 3).

## 10. Learning records

A record is evidence about the learner, written so the next session can act on it. The trap is writing a record of what was *covered*. "Learned the three-way handshake" after a lesson they read is exactly the fluency illusion: performance during learning is an unreliable guide to what will last.

So each record says:

- **What they showed,** with the evidence: the item, their answer, right or wrong, and the reasoning they gave. "Traced seq/ack numbers on a fresh handshake, 4 of 4, explained why ack = seq + 1." For motor skills it's their self-report against the observable criteria, labelled as self-report: "Reports 7 of 10 clean changes at 60 bpm."
- **What's shaky or wrong,** including any misconception you saw, in the form they hold it.
- **What's due:** the next review dates, by expanding intervals (`retention.md`, section 7), shorter after a miss.
- **Insights worth keeping:** a non-obvious thing that clicked for them, a case that worked, an approach that didn't. These are the closest thing to a teacher's memory of the student.

Records are append-only, like decision records: when something changes (a skill they lost, a mission revised), write a new record that says so and points to the old one. Don't edit history.

## 11. Knowledge, skills and wisdom

The workspace skill this is adapted from splits what a learner needs into three kinds, and the split is useful for choosing the move.

- **Knowledge** (facts, concepts, how something works): during first acquisition, difficulty is the enemy. Extra load from an unfamiliar format, a puzzle before the basics, or three ideas at once eats the working memory understanding needs. Teach it clearly, with a concrete case and a worked example for novices, and keep only what the lesson's skill needs.
- **Skills** (doing it, durably): here difficulty is the tool. Retrieval from memory, spacing over days and mixing confusable cases feel harder and produce slower-looking progress during practice, and they're what makes it last. Fluency in the moment (getting it right right after the explanation) can look like mastery and isn't. Build the lesson's practice for storage: recall, not recognition; mixed, not blocked, where the ideas are confusable; and come back to it on later days.
- **Wisdom** (judgment from practice among other people): no lesson provides it. When a learner asks something that needs it ("is this voicing too muddy for a live mix?", "how do teams really handle this in code review?"), answer what you can, say where practitioners disagree, and point them to a community where people who do this will look at their work. Search for active, well-regarded ones that fit the mission and budget (a forum, a subreddit, a local class or group), check they're live, and add them to `RESOURCES.md`. Offer once; if they'd rather not, note it in `NOTES.md` and don't raise it again. *(v0: no evidence gathered on communities for self-learners.)*

Two refinements from this skill's evidence. Interleaving helps when the things mixed are easy to confuse (types of problem, similar categories) and can hurt for plain vocabulary, where blocking did better; "skills only" is a rough proxy for that. And the knowledge/skill split isn't a sequence to run once: most lessons teach a little knowledge, then practise it, then retrieve older material, all in one sitting.

**Multiple-choice options:** make them the same number of words, and the same length in characters where you can, and vary where the right one sits. Learners pick the longest option and it works more often than it should. This is stricter than `artifact-craft.md`'s "similar length", and it's worth the effort when a course will have dozens of quizzes.

## 12. Without file access

In the Claude apps without code execution or file creation, there's no folder to keep. Do the same things in the forms available:

- Ask the mission question and keep it in view in the conversation.
- If you have memory across conversations, store the mission and the record contents there.
- Otherwise, close each session by giving the learner a short progress note to keep and paste back next time: the mission in a line, what they showed, what's shaky, what's due when. Say plainly that you won't remember without it.

## 13. Formats

Keep every file short. The learner may read them, and you read them every session.

### `MISSION.md`

```markdown
# Mission: <topic>

## Why
<In their words: what they want this for.>

## I'll know I can do it when
- <A check they could run: "write a I–vi–IV–V progression in any key in under a minute">
- <...>

## Constraints
<Time per week, equipment, deadline, budget.>

## Starting point
<What they already do, from the diagnostic task, not only self-report.>

## History
- <date>: mission set.
- <date>: revised to <...>, see learning-records/NNNN.
```

### `RESOURCES.md`

```markdown
# Resources

## Primary
- [Title](link): <author or channel>. Good for: <...>. Checked: <what you verified, date>. Use: <which lessons, which segment or timestamp>.

## Further
- [Title](link): <one line>. Checked: <...>.

## Communities
- [Name](link): <what it's for, how active, how to ask for feedback>. Checked: <date>.

## Found wrong or weak
- [Title](link): <what was wrong>. Don't use for <...>.
```

### `learning-records/NNNN-<name>.md`

```markdown
# NNNN: <short title>

Date: <YYYY-MM-DD>
Lesson: lessons/NNNN-<name>.html (or "conversation")

## Showed
- <item, their answer, right or wrong, their reason>

## Shaky or wrong
- <the error in the form they hold it; misconception if one>

## Due
- <date>: <what to retrieve>

## Worth remembering
- <what clicked, what didn't, any change to the mission or approach>

Supersedes: <NNNN, if this revises an earlier record>
```

### `NOTES.md`

```markdown
# Notes

## Preferences (from the learner)
- <date>: <what they said>

## Working notes
- <anything you want next session to know>
```

## 14. Evidence notes

- Spacing, retrieval practice and the gap between performance during learning and what lasts (fluency vs storage strength, desirable difficulties): Strong for retrieval and spacing, Moderate for desirable difficulties as a framework (`research/notes/D-retention.md`, findings 1 and 2; `B-diagnosis-feedback.md`, finding 2).
- Interleaving helps confusable categories and not vocabulary: Moderate (`D-retention.md`, Brunmair and Richter 2019).
- Clear, low-load instruction and worked examples for novices, and less of it for those who already have the idea: Moderate, with expertise reversal a lead (`A-tell-guide-do.md`; `E-artifact-design.md`, finding 1).
- Ask goal, time and current level before building; check level by a task, not self-report: Practitioner (`E-artifact-design.md`; fretboard teardown).
- Longest-option cueing: Practitioner, one run (the iteration 1 simulated learner spotted that the longest option was right; `testing/reports/iter-1.md`). Equal word counts is the upstream `teach` skill's stricter version of the fix.
- The workspace layout, numbered lessons and records, shared assets, the glossary rule, lesson length, the primary-source and citation habits, and the community step: v0, adapted from the upstream `teach` skill and not yet tested here.

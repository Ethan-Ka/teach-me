# Researching and verifying the topic before you teach

You don't know everything, and what you half-know you can state with full confidence. A learner can't catch that. They trust the tab, the code sample and the worked equation over their own developing judgment, so every wrong example teaches them to distrust themselves. This file covers how to find out how strong educators teach a specific topic, how to verify every example you give, and what to do when you can't search.

## Contents

1. Why this step exists
2. How much research is proportionate
3. What you're looking for
4. Where to look
5. Finding well-regarded videos
6. Getting transcripts
7. Extracting what you need
8. Borrow the moves, not the medium
9. Verifying facts and examples
10. One source of truth
11. Pointing the learner to a video
12. When you have no web access
13. Honesty rules
14. A worked research pass
15. Evidence notes

---

## 1. Why this step exists

Three findings, from three directions:

- **A Claude-built guitar course shipped about 30 wrong tabs and note labels,** written from memory, in the diagrams a self-taught learner uses to check their work. Its designated self-check was "compare your work to the tab," so correct work got "fixed" into errors. The agent's doubt surfaced as hedges ("check each note against the scale before you trust this") instead of checks. A guitar teacher's verdict: a teacher fixes a wrong diagram in five seconds; a student alone concludes that they're the problem.
- **A well-designed AI tutor beat an active-learning class in a Harvard physics RCT (Kestin et al. 2025),** and part of the design was that every problem came with a step-by-step solution written by instructors, so the model never had to solve problems on the fly and risk errors. Have the right answer in hand before you guide.
- **Clear explanations of correct content don't remove wrong prior ideas (Muller).** To confront misconceptions, you need to know which ones learners of this topic bring, which is exactly what experienced teachers of the topic know and you may not.

## 2. How much research is proportionate

| Situation | Research | Verification |
|---|---|---|
| Quick factual or conceptual question in passing | None | Check any number, output or claim you're unsure of, by computing it if you can |
| Fire-and-forget fix under time pressure | None | Run or check the fix if you can |
| Tutoring one problem | Solve it yourself first, privately | Check your solution (run it, compute it); know the common wrong turns |
| Teaching a concept in a session | A short pass if you can search: the standard explanation order, the two to four common misconceptions, one strong example | Run or compute every example before showing it |
| A lesson, study guide or interactive artifact | A real pass: several sources, including at least one strong educator's treatment; a misconception list; prerequisites | Generate every example and answer key from a single source of truth; verify the whole artifact before publishing |
| A multi-week course | A real pass, plus how established courses sequence the skill and what they leave out early | As above, plus a check that the sequence starts from what this learner can already do |

Don't make the learner wait through research for a quick question. For a course, research is the job, so do it. A sentence of status is enough ("Let me look at how this is usually taught first"), and don't narrate every search.

## 3. What you're looking for

Five things, in order of value:

1. **The common misconceptions.** What do learners of this topic reliably get wrong, and what probe exposes it? This is the highest-value find, because it's what you're least likely to know and it changes the teaching most.
2. **The standard explanation path.** In what order do good teachers introduce the ideas? What do they treat as the prerequisite? What do they deliberately leave out at first?
3. **The best examples and analogies.** Which concrete case makes it click? Which analogy do several strong sources use, and where does it break?
4. **Where learners get stuck.** Forum questions, "I finally get it" comments, the points where an educator slows down or says "this is the part that trips people up."
5. **What practice looks like.** The standard exercises, drills, or problem types, and how practitioners check them.

You're not looking for a summary of the topic. You can usually produce that. You're looking for teaching knowledge: the specific path, pitfalls and examples that come from having taught it many times.

## 4. Where to look

| Source | Good for | Watch out for |
|---|---|---|
| University course pages and open courseware (lecture notes, problem sets) | Sequence, prerequisites, standard exercises | Pitched at their students, not yours |
| Well-regarded textbooks' tables of contents and worked examples | Sequence, canonical examples | Paywalls; only use what you can actually read |
| Educator videos (section 5) | Examples, analogies, where to slow down, misconceptions named on screen | Popularity isn't quality; check accuracy |
| Research on misconceptions in the field (concept inventories in physics, common novice errors in programming) | Misconception lists with evidence | Can be academic and narrow |
| Q&A sites and learner forums (Stack Overflow, subject subreddits and their FAQs) | Where learners get stuck, in their own words | Answers vary in quality; use questions more than answers |
| Official documentation | Ground truth for software behavior and versions | Reference, not teaching; don't copy its order |
| Teacher-facing sites (teaching guides for a subject) | Known pitfalls and sequences | Quality varies |

For a motor skill, add: established method books or course outlines (how they sequence the first weeks), and teachers who talk about common physical mistakes and injury risks.

## 5. Finding well-regarded videos

View count measures reach, not teaching. Muller's research shows the trap: viewers rated a clear, correct video as clear and learned almost nothing. Signals worth more than views:

- **The creator teaches this professionally or has a track record in the field** (university instructor, practitioner, a channel known for this subject).
- **Other educators and courses point to it.** Syllabi, course pages, subject wikis and FAQs that link it; repeated recommendations across independent sources.
- **It uses teaching moves.** The creator asks the viewer to pause and predict, works a concrete example before the general rule, shows a mistake happening, names the common misconception, and is honest about simplifications. Karpathy's "pause the video here and see if you can figure it out yourself" and his on-screen bug ("you forgot to zero grad") are the pattern.
- **Comments show it landed for people at the learner's level,** and the questions in the comments point at specific moments of confusion (useful for you).
- **It's accurate.** Spot-check two or three claims against another source. One wrong fact is a reason to look elsewhere.
- **It's current,** for anything with versions (software, tools, rules of a sport).
- **It matches the learner's level and goal.** A great video for experts is a bad video for this beginner.
- **It has chapters or timestamps,** so you can point to the exact segment.

Search with the topic plus words that find teaching rather than content: "explained", "intuition", "for beginners", "common mistakes", "lecture", "tutorial", the name of a well-known course.

## 6. Getting transcripts

A transcript lets you extract the explanation path and quote timestamps accurately. Tools vary, and transcript access often fails (watch pages may return only navigation text; transcript sites often block automated requests). Try in this order, using whatever your environment allows:

1. **If you have a terminal and `yt-dlp`** (Claude Code, or a code-execution sandbox with network access):

   ```
   yt-dlp --skip-download --write-subs --write-auto-subs --sub-langs en --sub-format vtt -o "%(id)s" "VIDEO_URL"
   ```

   `yt-dlp --dump-json "VIDEO_URL"` gives the title, description and chapter list. The `youtube-transcript-api` Python package is another route.
2. **If you can fetch web pages,** try the video page (descriptions often have chapters), the creator's own written version (some educators publish text adaptations of their videos), or the course page that hosts it.
3. **Ask the learner.** On YouTube, the description's "Show transcript" button opens the transcript panel, which they can copy and paste. This is often the most reliable route in the apps.
4. **Fall back to chapters and description,** and say that's what you're working from.

Auto-generated captions mangle technical terms and names. Read them for structure and timing, and check any term or number against another source.

## 7. Extracting what you need

Keep a short research note as you go, private or in your working files. For each useful source:

```
Source: [title, creator, URL]   Level: [who it's for]   Checked: [what you verified]
Path:       1. hook ... 2. concrete case ... 3. rule ... 4. ...
Misconceptions named:   "most people think X" (at 4:10)
Examples / analogies:   [the one that works, and where it breaks]
Teaching moves:          pause-and-predict at 6:30; deliberate bug at 12:05
Stuck points:           [from comments or the creator slowing down]
Timestamps worth sending: 3:40-7:15 (the core idea), 12:05 (the common mistake)
```

Then synthesize across sources:

- **Where do strong sources agree on order?** That's your default path.
- **Which misconceptions come up repeatedly?** Those go into your probes and your hook.
- **Which example appears in more than one strong source?** It's probably the one that works.
- **What do they all leave out at first?** Leave it out too.
- **Where do they disagree?** Decide, and be ready to say why.

## 8. Borrow the moves, not the medium

Video educators can't check the viewer. You can. Take what they do, and add the part a video can't:

| Video move | In chat | In an artifact |
|---|---|---|
| "Pause and try it" | Ask, then wait for the answer before continuing | A prediction item that gates the reveal |
| Concrete case before rule | Same | Same; one specific instance first |
| Shows the mistake on screen | Show a labeled wrong version after the right one, and ask what's wrong | A "find the bug" item with feedback |
| Names the misconception | Ask which one they hold, then contrast | Wrong-option feedback that names it |
| "Let's quickly recap" (restating) | Replace with "before I recap, what are the three steps?" | End-of-page retrieval, not a restated summary |
| Production polish, animation | Doesn't carry over; skip | A static diagram or a stepper, not an animation of the whole mechanism |

## 9. Verifying facts and examples

Every worked example, output, number, fact and answer key gets checked before the learner sees it. Reading it over isn't checking it. The guitar course's errors were all of one kind: a fret number that didn't match the note name beside it. Any read-through misses those; computing catches every one.

**By domain:**

- **Code:** run it. Every snippet, every claimed output, every "this raises an error." Run the edge cases too. If you can't run code, trace it by hand line by line, and say you traced it rather than ran it.
- **Math:** compute it, with code if you can (a few lines of Python or a symbolic library). Check every step of a worked example, not just the final answer. Plug answers back in.
- **SQL:** create the tiny tables and run the query (SQLite works anywhere Python does). Check the actual rows returned.
- **Music:** compute every note from the fret and string (section 10). Check every interval, chord spelling and scale membership. Do the rhythm arithmetic (four groups of three sixteenths is twelve sixteenths, which ends on beat four, not beat one).
- **Facts (dates, names, definitions, claims):** check against at least one reliable source if you can search, two if it matters or sources disagree. If you can't check, flag it.
- **Language:** check conjugations, genders and idioms against a reference if you can. Note regional variation.
- **Physical technique and safety:** check against an established teaching source; don't invent drills that strain the body.

**Rules:**

- **A hedge is not a check.** "Verify this before trusting it" passes your job to the learner, who is least able to do it. Do the check, or say plainly that you couldn't.
- **If you can't verify something, say so where the learner will see it,** and prefer leaving it out over shipping it unverified as an answer key.
- **Re-verify after edits.** Changing one example can break another that referenced it.
- **Check internal consistency.** Does each worked example obey the rule it illustrates? Do two lessons give the same answer to the same question? Do counts and cross-references match?

## 10. One source of truth

When the same facts appear in many places (a fretboard diagram, a tab, a quiz answer key, a practice drill), generate all of them from one function or dataset. Then they can't disagree, and fixing one fixes all.

A fretboard example (verified by running it):

```python
NOTES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
OPEN = {"E": 40, "A": 45, "D": 50, "G": 55, "B": 59, "e": 64}  # MIDI numbers, standard tuning

def note(string, fret):
    return NOTES[(OPEN[string] + fret) % 12]

def check_tab(figure, expected):
    """figure: list of (string, fret); expected: list of note names."""
    for (s, f), want in zip(figure, expected):
        got = note(s, f)
        if got != want:
            print(f"{s}{f}: labeled {want}, actually {got}")

check_tab([("A", 5), ("G", 7)], ["A", "E"])
# A5: labeled A, actually D
# G7: labeled E, actually D
```

That check catches the guitar course's B-string figure, one of its worst errors, in two lines.

Other cases:

- **Programming lesson:** keep each example as a real file, run the tests, and paste outputs from the run, not from memory.
- **Math quiz:** write the generator and the answer key in the same code, so the key is computed.
- **In an artifact:** have the page compute its own diagrams and answer checks from one data structure (the same `note()` function draws the fretboard, labels the tab and checks the quiz answer).
- **A study guide of facts:** one table of facts, and every question generated from it.

## 11. Pointing the learner to a video

A good video is a supplement to the teaching. It doesn't replace the learner doing the thinking, and Muller's results warn that watching alone can leave people confident and unchanged.

When you recommend one:

- **Point to a specific segment** with a timestamp you've confirmed (from the transcript or chapters), and a link that starts there: `https://www.youtube.com/watch?v=VIDEO_ID&t=220s`.
- **Give one thing to predict before watching:** "Before you watch 3:40 to 7:15, guess: why does the handshake need a third message?"
- **Give one thing to do after:** "Then come back and explain it to me in two sentences, or trace the sequence numbers for this new case."
- **Say why this one:** "It's the clearest version of the sliding-window idea I found, and he shows the common mistake at 12:05."
- **Keep it to one or two.** A list of ten videos is homework nobody does.
- **Never invent a URL, title or timestamp.** If you're not sure of the exact segment, say "the section on X, about a third of the way in" and let them find it.

## 12. When you have no web access

Say so, once and briefly: "I can't search right now, so this comes from what I know. I'll compute and check everything I can." Then:

- **Be extra careful with anything you can't compute:** dates, names, version-specific behavior, recent changes, and the specifics of a niche topic.
- **Compute everything you can.** Code execution doesn't need the web. Run examples, check arithmetic, generate answer keys.
- **Flag uncertainty specifically.** "I'm confident about the concept; I'm less sure this flag exists in older versions of git. Check `git rebase --help` on your machine."
- **Give the learner the search, not a fake result.** "Search 'Khan Academy p-value' for a good worked video; I can't link one from here."
- **Use well-established knowledge for misconceptions,** and verify each probe by working it yourself.
- **Prefer a smaller, verified lesson** over a larger one with unchecked content.

## 13. Honesty rules

- Never claim to have watched, read, searched or run something you didn't.
- Never invent a source, URL, timestamp, quote or statistic.
- Say what you verified and how ("ran it", "computed it", "checked against the docs").
- If a source you found disagrees with what you believed, say so and say which you're going with.
- When your research changes the plan ("most courses teach X before Y, so let's do that"), tell the learner in one line.

## 14. A worked research pass

The learner asks for an interactive lesson on the TCP three-way handshake for an interview on Thursday.

1. **Proportion:** artifact plus interview stakes, so a real pass.
2. **Search:** "TCP three-way handshake explained", "why three way handshake not two", a well-known networking course's lecture notes, a networking textbook's treatment, interview-prep forum threads.
3. **Extract:**
   - Path: what the connection needs to agree on (both sides' starting sequence numbers), then SYN, SYN-ACK, ACK, then why two messages isn't enough, then loss and retransmission.
   - Misconceptions: "the handshake is about checking the server is alive" (it's about synchronizing sequence numbers in both directions); "two messages would be enough"; "sequence numbers start at 0."
   - Example: a concrete trace with made-up initial sequence numbers, each ACK being the other side's number plus one.
   - Stuck point (from forum questions): why the ACK number is "plus one" when the SYN carries no data.
4. **Verify:** trace the sequence and ACK numbers in a small script or by hand, check the plus-one rule against an RFC summary or the textbook, and check the lost-packet behavior claims against a reliable source.
5. **Use:** the hook asks the learner to predict whether two messages would do; the first chunk's check asks for the ACK number given a SYN's sequence number; wrong-option feedback names the "checking it's alive" misconception; one video segment, if a strong one turned up, goes in the "go further" section with a prediction question.

## 15. Evidence notes

- Wrong worked examples and the hedge-instead-of-check pattern: direct evidence from the fretboard teardown (all three reviews).
- Solutions in hand before tutoring: Moderate (Kestin et al. 2025, PMC full text read).
- Clear exposition doesn't remove misconceptions; clarity ratings aren't learning: Moderate (Muller et al. 2008 via secondary descriptions; Muller's video transcript).
- Video teaching moves (pause-and-predict, concrete first, shown mistake): Practitioner (three sources coded in note I, one as text only).
- Signals for video quality, research sources, extraction template, proportionality table: Practitioner.
- Transcript tooling: practical; tool flags are current as of writing and access is unreliable (note I recorded 403s and blocked transcript sites).

<!-- Sources: research/notes/I-video-educators.md (coded teaching moves, Muller check, transcript-access failures, video-recommendation guidance); research/notes/G-ai-tutoring.md finding 2 (Kestin expert solutions); research/notes/E-artifact-design.md finding 3 (misconceptions from research step) and finding 7 (recompute every example); research/notes/distribution.md (network access in claude.ai may be full, partial or none); research/baseline/fretboard-teardown/01-instructional-design.md F01-F17, structural failure 1, root cause 2; 02-learner-walkthrough.md (self-contradiction tag, L03 wall); 03-guitar-teacher.md factual-error table and lesson 1. -->

# Before-and-after tutoring exchanges

Six short exchanges, one per common failure. Each shows the failing version, a better version, and what changed. Use them to calibrate, not as scripts: the right move depends on the learner in front of you.

## Contents

1. Demonstrating instead of teaching
2. Over-questioning a stuck learner
3. The answer hidden in the hint
4. Caving under pressure
5. The wall of text
6. Ending without retrieval

Every worked fact below was checked (computed or run) before it was written.

---

## 1. Demonstrating instead of teaching

**Learner:** how does binary search work?

**Before**

> **Claude:** Binary search finds an item in a sorted list by repeatedly halving the search space. You compare the target to the middle element. If it's equal, you're done. If the target is smaller, you search the left half; if larger, the right half. Here's the code:
>
> ```python
> def binary_search(a, target):
>     lo, hi = 0, len(a) - 1
>     while lo <= hi:
>         mid = (lo + hi) // 2
>         if a[mid] == target:
>             return mid
>         elif a[mid] < target:
>             lo = mid + 1
>         else:
>             hi = mid - 1
>     return -1
> ```
>
> Its time complexity is O(log n), which makes it much faster than linear search for large lists.

**After**

> **Claude:** Let's start with a game. I'm thinking of a number from 1 to 100. You guess, and I'll say "higher" or "lower." What's your first guess, and why that number?
>
> **Learner:** 50, because then either way I cut it in half
>
> **Claude:** That's binary search. "Lower." What's your next guess?
>
> **Learner:** 25
>
> **Claude:** Same move again. Here's the question that turns it into an algorithm: what's the most guesses you'd ever need for 1 to 100 if you always cut in half? Rough reasoning is fine.

**What changed:** the learner invented the method from a concrete game before seeing any code. The demonstration (code plus complexity) is still coming, but now it answers a question the learner is holding. Next step: have them predict how many guesses for 1 to 1,000, then trace the code on a short list. (At most 7 guesses for 100, since 2⁷ = 128; at most 10 for 1,000.)

*Tags: demo-not-teach, no-practice.*

---

## 2. Over-questioning a stuck learner

**Learner:** I don't understand recursion at all. my class just started it and I'm lost

**Before**

> **Claude:** What do you think it means for a function to call itself?
>
> **Learner:** I don't know, it would just loop forever?
>
> **Claude:** Interesting! What might stop it from looping forever?
>
> **Learner:** I really don't know
>
> **Claude:** Think about it: what if the problem got smaller each time?

**After**

> **Claude:** Let's look at one tiny example and trace it together. This counts down:
>
> ```python
> def countdown(n):
>     if n == 0:
>         print("liftoff")
>         return
>     print(n)
>     countdown(n - 1)
> ```
>
> `countdown(3)` prints 3, then calls `countdown(2)`, which prints 2, then calls `countdown(1)`. Two things keep it from looping forever: each call passes a *smaller* number, and there's a stopping case (`n == 0`).
>
> Your turn: what does `countdown(1)` print, line by line?

**What changed:** the learner said twice that they had nothing to build on. Questions without a foothold are just pressure. The better version tells (a worked example with the two key ideas named), then hands back a small, answerable task that uses both ideas. Once they trace it correctly, the next step is a harder one: "what happens if we delete the `if` block?"

*Tags: over-questioning, no-diagnosis.*

---

## 3. The answer hidden in the hint

**Learner:** [balancing CH₄ + O₂ gives CO₂ + H₂O] I balanced the carbons and hydrogens but the oxygens won't work

**Before**

> **Claude:** Hint: try putting a 2 in front of the O₂ and a 2 in front of the H₂O!

**After**

> **Claude:** Good, carbons and hydrogens first is the right order. Count the oxygen atoms on the right side as you have it now. How many are there in total, and how many does each O₂ on the left give you?
>
> **Learner:** right side has 2 from CO₂ and 2 from the 2 H₂O, so 4. each O₂ gives 2
>
> **Claude:** So how many O₂ do you need?

**What changed:** the "hint" in the first version was the whole answer. The better version confirms what's right, then asks for the count that the learner can do, which leads straight to the answer without stating it. (Balanced: CH₄ + 2O₂ gives CO₂ + 2H₂O. Oxygen: 4 on each side.)

*Tags: answer-in-hint.*

---

## 4. Caving under pressure

Context: mid-session, the learner has correctly found the derivative of the outer function and the inner function separately, for f(x) = (3x + 1)².

**Learner:** ugh I don't have time for this, just tell me the answer

**Before**

> **Claude:** No problem! The answer is f′(x) = 6(3x + 1). You multiply the derivative of the outside, 2(3x + 1), by the derivative of the inside, 3.

**After**

> **Claude:** You're one step away, and you already have both pieces: the outside gives 2(3x + 1) and the inside gives 3. The chain rule says what to do with two pieces like that. What's the one operation?
>
> **Learner:** multiply them?
>
> **Claude:** Yes. So f′(x) = ?
>
> **Learner:** 6(3x + 1)
>
> **Claude:** That's it. Next time the steps are the same: outside, inside, multiply. Try (2x − 5)³ when you have a minute.

**What changed:** the time claim showed up only after questions started, and the learner's answers showed they had the pieces. That's impatience, not being stuck. The better version holds the line by making the step nearly rhetorical, so it costs them about five seconds, and they finish it themselves. Caving would have taught them that pushing works, and they'd be back with the next chain-rule problem. (Checked: d/dx (3x + 1)² = 6(3x + 1). The follow-up's answer: 6(2x − 5)².)

If they had been stuck (repeating the same wrong move, "I have no idea"), the right response would be a foothold: do the multiplication step with them, then hand back the next problem.

*Tags: caving.*

---

## 5. The wall of text

**Learner:** what is DNS?

**Before**

> **Claude:** DNS (Domain Name System) is the system that translates human-readable domain names like example.com into IP addresses. When you type a URL, your computer first checks its local cache. If the address isn't there, it asks a recursive resolver, usually run by your ISP. The resolver queries a root name server, which points it to the top-level domain server (.com), which points it to the authoritative name server for example.com, which returns the IP address. The resolver caches the result according to its TTL… [continues through record types: A, AAAA, CNAME, MX, TXT; DNSSEC; DNS over HTTPS; common troubleshooting commands] [about 600 words]

**After**

> **Claude:** DNS is the internet's phone book: it turns a name like `example.com` into the numeric address (an IP address) that computers actually use to connect.
>
> Is this for something specific, like debugging a site that won't load, or setting up a domain, or are you curious how it works under the hood?
>
> **Learner:** curious how it works. I'm learning networking
>
> **Claude:** Then here's the puzzle at the center of it. There are hundreds of millions of domain names. No single computer could hold the whole list and answer everyone's questions. If you were designing it, how would you split up the job?

**What changed:** the first version answered a one-line question with a textbook chapter. It's accurate, and the learner did nothing. The better version gives the one-sentence answer (so a lookup gets a lookup), routes with one question, then turns the core design problem (why DNS is hierarchical) into something the learner reasons about. Their answer ("split by .com, .org…") becomes the starting point for explaining root and top-level servers.

*Tags: wall-of-text, no-diagnosis.*

---

## 6. Ending without retrieval

Context: the end of a session where the learner worked through three GROUP BY problems, the last one with no help.

**Before**

> **Learner:** ok I think I get it now, thanks!
>
> **Claude:** Great work today! To recap: GROUP BY collapses rows that share a value into one row per group, aggregate functions like COUNT and SUM compute a value for each group, and HAVING filters groups after aggregation, while WHERE filters rows before. Let me know if you have any other questions!

**After**

> **Learner:** ok I think I get it now, thanks!
>
> **Claude:** You did the last one with no help, which is the real sign. Before you go, one quick check, no scrolling up: what's the difference between WHERE and HAVING, and when does each one run?
>
> **Learner:** WHERE filters rows first, HAVING filters the groups after
>
> **Claude:** Exactly right. Two questions to try on Friday without looking, and again next week:
> 1. Write a query for the number of orders per customer, only for customers with more than 3 orders.
> 2. Why can't you write `WHERE COUNT(*) > 3`?
>
> If either one stumps you, paste it back here and we'll go through just that part.

**What changed:** the first version ended on Claude's summary and an open "any questions?", which feels complete and does little. The better version notes the real evidence (an unassisted solve), has the learner retrieve the key distinction from memory, and leaves a spaced return plan in their hands, with a path back if they miss.

*Tags: no-closing-retrieval, no-feedback-loop.*

<!-- Sources: research/notes/A-tell-guide-do.md (handoff, ladder, claim check); research/notes/C-expert-tutoring.md (novice vs expert tutor turns, "does that make sense" replaced by a task); research/notes/B-diagnosis-feedback.md (hints, feedback, illusion signals); research/notes/D-retention.md (closing recall, return plan); research/notes/G-ai-tutoring.md (Bastani: answers raise practice and lower later learning; Khanmigo critique on questioning stuck learners); research/notes/I-video-educators.md (convert recap to retrieval); upstream/learn/SKILL.md (impatient vs stuck, time pressure after questioning). -->

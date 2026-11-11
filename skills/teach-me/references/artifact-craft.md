# Artifact craft

How to make a learning artifact look good and be properly interactive. `artifact-blueprint.md` decides what goes in and in what order; this file decides how it looks, how each interaction behaves, and how to check the built page. The two files in `artifact-examples/` apply both, and every code sketch below was extracted and run in a headless browser before it went in this file.

**Load the environment's own design guidance first.** If the environment provides artifact-design guidance (an artifact-design skill on claude.ai or in Claude Code, a design system, a house style), load it and follow it: it knows the platform's page contract, sizes, libraries and theming hooks. If the no-slop-design skill is installed, follow it too. This file is the learning-specific layer on top of those, and where they disagree on a platform rule (allowed libraries, size limits, required metadata), the platform wins.

## Contents

1. [Reality limits](#1-reality-limits)
2. [Visual design for a page someone learns from](#2-visual-design-for-a-page-someone-learns-from)
3. [Interactions that make the learner think, and decoration](#3-interactions-that-make-the-learner-think-and-decoration)
4. [Shared plumbing: helpers, storage, feedback](#4-shared-plumbing-helpers-storage-feedback)
5. [Think patterns, with states and sketches](#5-think-patterns-with-states-and-sketches)
6. [Honor-system patterns for physical skills](#6-honor-system-patterns-for-physical-skills)
7. [Media: sound with Web Audio](#7-media-sound-with-web-audio)
8. [Media: diagrams generated from data](#8-media-diagrams-generated-from-data)
9. [Progress map and current step](#9-progress-map-and-current-step)
10. [Checking the built page](#10-checking-the-built-page) (fact checks at load, tracing the prose, phone widths, longest strings)
11. [Craft checklist](#11-craft-checklist)

---

## 1. Reality limits

The target is **a single static HTML file**: inline CSS and JavaScript, optional web fonts, no build step. That rules out a lot, and the artifact should be designed inside the limits rather than pretending past them.

| Possible | Not possible |
|---|---|
| Checking answers against data in the page | A backend, accounts, server-side grading |
| Running small engines in JS (a join, a fret calculator, a test runner for a pure function) | Running arbitrary learner SQL, Python or shell |
| `localStorage` for one learner on one device | Sync across devices; reminders; anything after the tab closes |
| Web Audio to **play** target sounds (a note, a chord, a click, a cadence) | Listening to the learner: no microphone pitch or timing analysis |
| SVG diagrams computed from data | Camera, posture or hand-position checking |
| A "copy this to Claude" message | The page messaging Claude by itself |

Anything past the limit routes through the chat ("paste your attempt back to Claude") or through observable self-report (section 6). Say on the page what it can't see: "The page plays notes; it never listens."

Platforms differ: some artifact runtimes offer storage or capabilities beyond a static file. Use them when the environment's guidance says they exist, and keep the page working without them.

## 2. Visual design for a page someone learns from

No-slop-design's four decisions apply unchanged: a palette from something real, two deliberate typefaces, structure set by the content, one specific claim. Below is how each lands on a learning page, plus the things only a learning page needs.

### Palette from the subject matter

Take the palette from the thing being learned, and write the source in a CSS comment so the decision is visible.

- SQL joins: green-bar printout paper. A pale green band on alternating result rows (which also helps the eye track a row across columns), near-black ribbon ink, one blue for actions.
- Guitar: the instrument. Bone off-white for the page, rosewood brown for ink and the fretboard diagram, nickel-steel blue for the one action color.
- Anatomy might take bone and a muted arterial red; a cooking lesson the colors of the dish.

Then hold the rules: no indigo or violet accent, and no amber-cream or emerald as an escape hatch.
No two-hue gradient anywhere, no glow. One accent carries action. Right and wrong states grow out of the palette (a dark moss and a brick red that sit with the rest), and **state is carried by the word and its weight first** ("Right." / "Not yet." in bold), color second, because color alone fails for color-blind learners and in print.

**Measure every pair** and record the ratios: 4.5:1 for body text, 3:1 for large text and for non-text UI (input borders, focus rings, the beat indicator, diagram strokes that carry meaning). Measure both themes. The two examples measured 6.1:1 to 15.5:1 for text pairs. A pair you didn't measure hasn't been checked.

### Two typefaces, each with a job

Two families maximum, none of the six no-slop-design bans. On a learning page the jobs are usually reading and labelling (or reading and code):

- SQL: Source Sans 3 for prose; IBM Plex Mono for code and result tables, because its 0/O and 1/l are distinct and columns of IDs line up.
- Guitar: Source Serif 4 for prose (a method-book feel at reading length); Atkinson Hyperlegible for labels, buttons and fret numbers, because it was drawn so similar characters stay distinct at small sizes.

Load from Google Fonts with a fallback stack that still reads well offline. Write the reason in a comment.

### Reading and focus

- **Measure of 60 to 75 characters** (`max-width: 66ch` on paragraphs). Long lines lose the reader on the return sweep, and a learner reads every line, unlike a scanner.
- **Generous spacing between parts, tight within them.** The gap between two chunks must be visibly larger than the gap between a chunk's explanation and its check, by a full step or more. Uniform spacing hides the structure the learner is trying to follow.
- **One idea per screen region.** An explanation, its worked example and its check sit together; the next idea starts after a clear break (a rule plus space). Don't put two unrelated widgets side by side.
- **Hierarchy from position, weight and space,** not size alone. A heading in full ink with space above it; body a step quieter.
- **Asymmetry.** A narrow progress rail on the left and a reading column, with the remaining space on the right, reads as composed; a centered column with identical cards does not.
- **No decoration on the path.** No small labels stacked above headings, no icon tiles, no emoji, no badge on every section. Part numbers ("Part 3") are legitimate because the learner really is moving through a sequence.
- **No colored left border on callouts, feedback or route boxes.** It's the stock template move and the audit flags it. Set a route or plan apart with space, a full hairline border, a surface tint, or a bold lead word ("Your route."). A progress rail whose rule marks the current step carries information and is the one defensible case.
- **Long text wraps inside its container.** Every text slot gets the longest string it can hold, and it must wrap rather than overflow or cross a border. Two traps recur. A `legend` with long text sits across its fieldset's top border in most browsers; fix it with `legend { float: left; width: 100%; padding: 0; margin-bottom: .5rem }` and `legend + * { clear: both }`. Long unbroken tokens (code, URLs, IDs) push a box wider than the phone; give text containers `overflow-wrap: anywhere` and flex children `min-width: 0`.

### Themes, phones, print

- **Light and dark themes,** both designed and both measured. Follow `prefers-color-scheme` by default, with a toggle that stores the choice. Redefine tokens under `@media (prefers-color-scheme: dark)` guarded by `:root:not([data-theme=light])`, and again under `:root[data-theme=dark]`.
- **Phones at 390 px and 320 px.** No horizontal page scroll, and **the core task needs no sideways scrolling either.** A learner who has to scroll inside a diagram while clicking on it loses the part they just did; in iteration 1 the main construction task (click all twelve notes) and even a one-string diagram sat mostly off screen at 400 px behind a `min-width: 820px`. Inner scrolling is acceptable only for a reference figure nobody interacts with. Rails become a wrapped row of links at the top. Hit targets at least 44 by 44 CSS px.

### Wide diagrams on a phone

Pick the strategy by what the task needs to see, and switch on the container's width (`matchMedia` or a `ResizeObserver`), redrawing from the same data:

| Strategy | When it fits | How |
|---|---|---|
| **Rotate** | The diagram is long in one direction and the task uses its full length (a neck, a timeline, a number line) | Draw the long axis vertically below about 600 px: one coordinate function `P(along, across)` that returns `[x, y]` or `[y, x]`, and arrow keys remapped so Down moves along the long axis. Page scroll is vertical, which phones do well |
| **Crop to the relevant region** | The task uses only part of the diagram (one box of frets, three rows of a table, one subtree) | Compute the range the task needs from the data, pad it by one unit each side, and draw only that, with a label saying what's shown ("frets 4 to 10") |
| **Zoom to the active range** | The learner moves through the diagram step by step | Draw the full diagram, set the `viewBox` to the active window, and move it as the task advances; show a small overview strip if position matters |
| **Vertical layout** | Side-by-side parts (two tables, before and after) | Stack them, with the shared key aligned and labelled in each |

Then test it: at 390 and 320 px, play the core task through by script and assert that its container's `scrollWidth <= clientWidth` and that every target is at least 44 px (section 10).
- **Print styles for study guides.** Hide buttons, the theme toggle and the progress rail; force a white background; open `<details>`; avoid breaking a worked example across pages (`break-inside: avoid-page`).
- **Motion only for state changes,** under 220 ms, and none under `prefers-reduced-motion`. A beat light changing is a state change; content fading in on scroll is not.

## 3. Interactions that make the learner think, and decoration

An interaction earns its place only if the learner **commits to something** (a prediction, a choice, a construction) before seeing the result, and the feedback explains the difference. Bret Victor's warning applies: a widget that drops the reader into a sandbox leaves the author's job undone. And every widget must be referenced by a step that asks a question before it's used; a tool no step points to won't be used (the baseline book's fretboard, metronome and ear trainer sat in a "Tools" box that no lesson mentioned).

| Think (use) | Why it works | Decoration (avoid) | Why it fails |
|---|---|---|---|
| Predict, then reveal | Commitment gives the learner something to compare | Click-to-reveal walls | Nothing to compare against; reads as passive |
| Choose with explained feedback | Each wrong option diagnoses a misconception | Toggles and tabs showing alternate content | Looking, not deciding |
| Faded fill-in | The worked example becomes the learner's work, step by step | Accordions hiding the text the learner needs | Hides, doesn't teach |
| Construct or order (Parsons) | Building the answer, checked by running it | Free sandbox with no task | Mindless clicking |
| Parameter slider tied to a prediction | An explorable explanation with a goal | Slider with no question | Watching, not predicting |
| Flashcards with self-grading that records misses | Retrieval plus a schedule driven by failure | Flip cards with no grade | Recognition, no memory model |
| Timed retrieval | Measures fluency the objective names ("in about a second") | Score counters that vanish on reload | No loop; feeds nothing |

Every think pattern has the same five states. Design each one; a pattern missing its wrong state or its retry is decoration with extra steps.

| State | What the learner sees |
|---|---|
| Idle | The question and the controls. No answer anywhere on screen |
| Attempted | Their selection or input, and an enabled Check button. Checking with nothing chosen says "Pick one first" instead of failing silently |
| Wrong, explained | "Not yet." in bold, then what their answer actually means and why it's wrong, specific to their answer |
| Right | "Right." plus why, since a right guess with the wrong reason is still a gap |
| Retry | A fresh variant, or the same item with their wrong pick disabled and marked. The miss is recorded either way |

## 4. Shared plumbing: helpers, storage, feedback

Every sketch below uses these. They assume a page that defines a `paintMap()` (section 9) if it has a progress map.

```js
const $ = (sel, root = document) => root.querySelector(sel);

// Build elements without string-concatenating learner input into HTML.
// "html" is only for strings you wrote; anything the learner typed goes in "text".
function h(tag, attrs = {}, ...kids) {
  const el = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (k === "text") el.textContent = v;
    else if (k === "html") el.innerHTML = v;
    else if (k.startsWith("on")) el[k] = v;
    else el.setAttribute(k, v);
  }
  el.append(...kids);
  return el;
}

// Per-learner progress. Storage can be missing, full, or blocked (private windows,
// previews), so every access is wrapped and the page must work from empty.
const STORE = "teachme-topic-v1";
let S = {};
try { S = JSON.parse(localStorage.getItem(STORE)) || {}; } catch (e) { S = {}; }
function save() { try { localStorage.setItem(STORE, JSON.stringify(S)); } catch (e) {} }

// Record every attempt, misses included. Progress is evidence, not a claim.
function record(id, ok, detail = "") {
  const r = (S[id] ||= { tries: 0, miss: 0, done: false, log: [] });
  r.tries++;
  if (!ok) r.miss++;
  r.log = [...r.log, { ok, detail, at: Date.now() }].slice(-30);
  save();
  if (typeof paintMap === "function") paintMap();
}
function markDone(id) {
  (S[id] ||= { tries: 0, miss: 0, log: [] }).done = true;
  save();
  if (typeof paintMap === "function") paintMap();
}

// Feedback: the verdict word carries the state, color only reinforces it.
// The element has role="status" and aria-live="polite" so screen readers hear it.
function say(fb, ok, html) {
  fb.className = "fb " + (ok ? "ok" : "no");
  fb.innerHTML = `<p class="verdict">${ok ? "Right." : "Not yet."}</p><p>${html}</p>`;
}
const feedbackBox = () => h("div", { class: "fb", role: "status", "aria-live": "polite" });

function shuffle(a) {
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}
```

Minimum CSS the sketches expect (adapt the tokens to your palette):

```css
.q { border: 1px solid var(--rule); border-radius: 6px; padding: 1rem; margin: 1.25rem 0; min-width: 0; overflow-wrap: anywhere; }
.q legend { float: left; width: 100%; padding: 0; margin-bottom: .5rem; font-weight: 700; }
.q legend + * { clear: both; }
.opt { display: flex; gap: .6rem; padding: .45rem .5rem; cursor: pointer; }
.opt.was-wrong { color: var(--muted); }
.btn { min-height: 44px; padding: .5rem 1rem; font-weight: 700; cursor: pointer; }
.btn:disabled { opacity: .5; cursor: not-allowed; }
:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }
.fb:empty { display: none; }
.fb .verdict { font-weight: 700; }
.fb.ok .verdict { color: var(--ok); }
.fb.no .verdict { color: var(--bad); }
[aria-invalid="true"] { border-color: var(--bad); border-width: 2px; }
```

## 5. Think patterns, with states and sketches

### 5.1 Predict, then reveal; choose with explained feedback

**Use when** introducing an idea learners hold wrong beliefs about (the hook), or checking a concept at the end of a chunk. Prediction mode (`reveal: true`) takes one commitment and then shows everything, because the point is the contrast. Check mode lets them try again with the wrong option disabled.

**States.** Idle: options, nothing selected. Attempted: one radio checked. Wrong: the option's own `why`, the pick disabled and marked "your earlier pick" (check mode), or the answer and its reason shown (prediction mode). Right: the `why`. Retry: "Check again".

**Keyboard and accessibility.** A real `fieldset` with a `legend` and native radios gives arrow-key selection and a group name for free. Feedback in an `aria-live="polite"` region. Write each option's text so it makes sense out of context, since screen readers read it alone.

**Option hygiene.** A test-wise learner can beat a badly written item without the knowledge, and in iteration 1 one did: "it was the longest option". So:

- **Similar length and grammar.** Every option fits the stem the same way and runs within about a fifth of the others' length. If the right answer needs a qualifier, give the wrong ones qualifiers too.
- **Wrong options are named misconceptions**, each the answer a specific wrong rule produces (section 5.8), with its own explanation. A filler distractor nobody would pick makes the item easier, not fairer.
- **Shuffle the order at render.** `choice()` below shuffles a copy of the options unless the item sets `keepOrder` (for ordered scales like "1 / 2 / 3 / Not sure"), so the right answer isn't always second.
- **Lint it.** Add `mcLint` to the page's `checks` (section 10) for every fixed item, and run it over a few hundred generated ones.

```js
// Flags the two tells that let a learner pass without the knowledge.
function mcLint(item) {
  const len = o => o.t.replace(/<[^>]+>/g, "").length;
  const right = item.opts.find(o => o.ok), wrongs = item.opts.filter(o => !o.ok);
  const longestWrong = Math.max(...wrongs.map(len));
  const problems = [];
  if (len(right) > 1.2 * longestWrong && len(right) - longestWrong > 6) problems.push("right option is clearly the longest");
  if (wrongs.some(o => !o.why)) problems.push("a wrong option has no explanation");
  return problems;
}
```

```js
// item = { id, q, reveal, keepOrder, opts: [{ t, ok, why }] }. Compute t and why from your data.
function choice(el, item, onDone) {
  const name = "c" + Math.random().toString(36).slice(2);
  const opts = item.keepOrder ? item.opts : shuffle([...item.opts]);
  const fs = h("fieldset", { class: "q" }, h("legend", { html: item.q }));
  opts.forEach((o, i) => fs.append(
    h("label", { class: "opt" },
      h("input", { type: "radio", name, value: i }),
      h("span", { html: o.t }))));
  const btn = h("button", { type: "button", class: "btn", text: item.reveal ? "Lock in my guess" : "Check" });
  const fb = feedbackBox();
  fs.append(btn, fb);
  el.replaceChildren(fs);
  btn.onclick = () => {
    const sel = fs.querySelector("input:checked");
    if (!sel) { fb.className = "fb"; fb.textContent = "Pick one first. A guess counts."; return; }
    const o = opts[+sel.value];
    record(item.id, o.ok, o.t);
    say(fb, o.ok, o.why);
    if (o.ok || item.reveal) {
      fs.querySelectorAll("input").forEach(x => (x.disabled = true));
      btn.disabled = true;
      if (!o.ok) {
        const right = opts.find(x => x.ok);
        fb.append(h("p", { html: `<strong>Answer:</strong> ${right.t}. ${right.why}` }));
      }
      if (onDone) onDone(o.ok);
    } else {
      sel.disabled = true;
      sel.checked = false;
      sel.closest(".opt").classList.add("was-wrong");
      btn.textContent = "Check again";
    }
  };
}

// Usage: a hook whose wrong options are the misconceptions, counts computed from data.
choice($("#hook"), {
  id: "hook", reveal: true,
  q: "Binary search on a sorted list of 1,000 names. At most how many guesses?",
  opts: [
    { t: "500", ok: false, why: "That's checking half the list one by one. Each guess halves what's left, so the count grows with the number of halvings, not the size." },
    { t: String(Math.ceil(Math.log2(1000 + 1))), ok: true, why: "1,000 halves to 1 in about ten steps, because 2 to the 10th is 1,024." },
    { t: "100", ok: false, why: "That would be a tenth of the list. Halving is much faster than that." },
  ],
});
```

**Variant retry, ending on mastery.** For practice, wrap the same component in a generator so a miss produces a fresh item. The part ends on a mastery criterion, not after a set number of items: here, `need` right in a row, where the streak also has to have exposed every misconception the part targets. A random streak can miss one; in iteration 2, three random items left both of a lesson's key misconceptions untouched 36% of the time. So the generator takes a target and the next draw aims at whatever the streak hasn't met. "I've got this, test me" draws two or three fresh items that together cover every misconception and all have to be right, because a single fixed item can be remembered or guessed:

```js
// make(target) returns a fresh { q, opts, exposes } from data. exposes lists the
// misconceptions this item separates (section 5.8); [] marks a deliberately
// non-discriminating item, which never advances the streak. target, when given,
// asks for an item that exposes that misconception.
function practice(el, { id, make, targets, need = 3, testN = 3 }) {
  let streak = 0, seen = new Set();          // misconceptions exposed inside this streak
  const reset = () => { streak = 0; seen = new Set(); };
  const finish = msg => { markDone(id); el.replaceChildren(h("p", { text: msg })); };
  const btn = (text, onclick, cls = "btn") => h("button", { type: "button", class: cls, text, onclick });
  const ask = (item, then) => { const holder = h("div"); el.replaceChildren(holder); choice(holder, { ...item, id, reveal: true }, then); };
  // Aim the next draw at a misconception the streak hasn't met, so "N in a row"
  // can't be reached on items the wrong model also gets right.
  const drill = () => {
    const item = make(targets.find(t => !seen.has(t)));
    ask(item, ok => {
      if (!ok) reset();
      else if (item.exposes.length) { streak++; item.exposes.forEach(m => seen.add(m)); }
      const left = targets.filter(t => !seen.has(t)).length;
      if (streak >= need && !left) return finish(`${streak} in a row, covering every mistake this part fixes. This part is done.`);
      el.append(h("p", { class: "note", text: !ok ? "Streak reset." : streak >= need ? "One more, on a case you haven't met yet." : `${streak} of ${need} in a row.` }),
        btn(ok ? "Next one" : "Try a fresh one", drill));
    });
    el.append(btn("I've got this, test me", test, "btn quiet"));
  };
  // testN fresh random items that together expose every target; all must be right.
  const test = () => {
    const order = shuffle([...targets]);
    const items = Array.from({ length: Math.max(testN, targets.length) }, (_, i) => make(order[i % order.length], true));
    let i = 0;
    const one = () => ask(items[i], ok => {
      if (!ok) { reset(); return el.append(h("p", { class: "note", text: "Not this time, so back to practice." }), btn("Back to practice", drill)); }
      if (++i === items.length) return finish(`${i} of ${i} on fresh items. This part is done.`);
      el.append(h("p", { class: "note", text: `${i} of ${items.length}.` }), btn("Next", one));
    });
    one();
  };
  drill();
}

// Binary search worst case. Two misconceptions: "it's log2(n)" (wrong only when n is a
// power of two) and "it checks half the list" (n / 2).
const RIGHT = n => Math.ceil(Math.log2(n + 1));
const WRONG = { log2: n => Math.ceil(Math.log2(n)), half: n => Math.ceil(n / 2) };
const WHY = { log2: "is log2 of the count, but that many guesses cover one item fewer", half: "is half the list: that's one halving, not a halving every guess" };
practice($("#halving"), {
  id: "halving", need: 3, targets: Object.keys(WRONG),
  make(target, hard = false) {
    const pool = target === "log2" ? [64, 128, 1024, 4096] : hard ? [3000, 64000, 500000] : [50, 120, 700, 3000];
    const n = pick(pool), k = RIGHT(n), seen = new Set([k]);
    const opts = [{ t: String(k), ok: true, why: `${k} guesses cover up to 2 to the ${k} minus 1 = ${2 ** k - 1} items, the first count to reach ${n.toLocaleString()}.` }];
    for (const m in WRONG) { const v = WRONG[m](n); if (!seen.has(v)) { seen.add(v); opts.push({ t: String(v), ok: false, why: `${v} ${WHY[m]}.` }); } }
    if (!seen.has(k - 1)) opts.push({ t: String(k - 1), ok: false, why: `${k - 1} guesses cover only ${2 ** (k - 1) - 1} items.` });
    return { q: `Worst case for binary search over ${n.toLocaleString()} sorted items?`, opts: shuffle(opts),
             exposes: Object.keys(WRONG).filter(m => WRONG[m](n) !== k) };
  },
});
```

### 5.2 Faded fill-in

**Use when** moving from a worked example to independent work. Show the worked version first, then the same procedure with blanks, last step first.

**States.** Idle: givens and empty inputs. Attempted: some filled. Wrong: each wrong blank flagged with `aria-invalid` and explained by what the typed value actually means; focus moves to the first wrong blank. Right: confirmation plus what to notice. Retry: fix and check again (blanks keep their values, so the learner sees what they had).

**Keyboard and accessibility.** Each input has an `aria-label` naming its role ("fret for D"). Normalise before comparing (trim, case, spacing) and accept listed variants, so a correct answer in a different spelling isn't marked wrong.

```js
const norm = s => String(s).trim().toLowerCase().replace(/\s+/g, " ");

// parts: strings are given text; objects are blanks { label, answer, accept }.
// explain(blank, value) says what the learner's value actually means.
function fillIn(el, { id, parts, explain }) {
  const box = h("div", { class: "q fill" });
  const blanks = [];
  parts.forEach((p, i) => {
    if (typeof p === "string") { box.append(h("span", { text: p })); return; }
    const inp = h("input", { type: "text", id: `${id}-${i}`, "aria-label": p.label, size: p.size || 5, autocomplete: "off" });
    blanks.push({ p, inp });
    box.append(inp);
  });
  const btn = h("button", { type: "button", class: "btn", text: "Check" });
  const fb = feedbackBox();
  box.append(h("div", {}, btn), fb);
  el.replaceChildren(box);
  btn.onclick = () => {
    const ok = ({ p, inp }) => [p.answer, ...(p.accept || [])].map(norm).includes(norm(inp.value));
    const wrong = blanks.filter(b => !ok(b));
    blanks.forEach(b => b.inp.setAttribute("aria-invalid", String(!ok(b))));
    record(id, wrong.length === 0);
    if (wrong.length === 0) { say(fb, true, "Every blank is right."); markDone(id); return; }
    say(fb, false, wrong.map(({ p, inp }) =>
      `${p.label}: ${inp.value.trim() ? explain(p, inp.value) : "still empty"}.`).join(" "));
    wrong[0].inp.focus();
  };
}

// Usage: the last two steps of a worked binary search are blank.
const list = [3, 8, 15, 21, 30, 42, 57];
fillIn($("#fill"), {
  id: "fill",
  parts: ["Find 42 in [3, 8, 15, 21, 30, 42, 57]. Middle index 3 holds 21; 42 is larger, so search indexes 4 to 6. Middle index is ",
    { label: "next middle index", answer: "5" }, ", which holds ", { label: "value there", answer: String(list[5]) }, "."],
  explain: (p, v) => p.label === "next middle index"
    ? `the middle of 4 to 6 is (4 + 6) / 2 = 5, not ${v}`
    : `index 5 holds ${list[5]}; ${v} is ${list.includes(+v) ? "at index " + list.indexOf(+v) : "not in the list"}`,
});
```

### 5.3 Construct or order (Parsons problems)

**Use when** the learner knows the pieces but not the arrangement: lines of code, steps of a proof, stages of a process. Ordering given lines teaches about as much as writing from scratch in less time for novices (Ericson and colleagues; Moderate to Strong). Leave out distractor lines for beginners; they cut efficiency for young novices. When the result can be computed (the SQL builder in the example runs the learner's query), check by running it, not by comparing strings.

**States.** Idle: shuffled lines (never already solved). Attempted: some moved. Wrong: how many are in place, and the reason the first misplaced line can't go where it is. Right: why this order is forced. Retry: keep the arrangement and adjust.

**Keyboard and accessibility.** Drag-and-drop alone fails keyboard and many touch users, so the primary controls are **Move up / Move down buttons** with accessible names that include the line, plus Alt+Arrow on a focused line. Announce each move in a live region. Native HTML drag can be added on top, never instead.

```js
// lines: the correct order. why[i]: why line i must sit where it does.
function order(el, { id, lines, why }) {
  let items = lines.map((t, i) => ({ t, i }));
  do { shuffle(items); } while (items.every((x, k) => x.i === k));
  const ol = h("ol", { class: "q order" });
  const live = h("p", { class: "sr", "aria-live": "polite" });
  const btn = h("button", { type: "button", class: "btn", text: "Check order" });
  const fb = feedbackBox();
  const move = (k, d) => {
    const j = k + d;
    if (j < 0 || j >= items.length) return;
    [items[k], items[j]] = [items[j], items[k]];
    live.textContent = `Moved "${items[j].t}" to position ${j + 1}.`;
    paint(j);
  };
  function paint(focusAt) {
    ol.replaceChildren(...items.map((x, k) => {
      const li = h("li", { tabindex: "0" }, h("code", { text: x.t }),
        h("button", { type: "button", class: "btn quiet", "aria-label": `Move up: ${x.t}`, text: "Up", onclick: () => move(k, -1) }),
        h("button", { type: "button", class: "btn quiet", "aria-label": `Move down: ${x.t}`, text: "Down", onclick: () => move(k, 1) }));
      li.onkeydown = e => {
        if (e.altKey && e.key === "ArrowUp") { e.preventDefault(); move(k, -1); }
        if (e.altKey && e.key === "ArrowDown") { e.preventDefault(); move(k, 1); }
      };
      return li;
    }));
    if (focusAt != null) ol.children[focusAt].focus();
  }
  paint();
  el.replaceChildren(ol, live, btn, fb);
  btn.onclick = () => {
    const placed = items.filter((x, k) => x.i === k).length;
    const first = items.find((x, k) => x.i !== k);
    record(id, !first);
    if (!first) { say(fb, true, "That's the only order that works: " + why.join(" ")); markDone(id); return; }
    say(fb, false, `${placed} of ${items.length} in place. "${first.t}" is out of place: ${why[first.i]}`);
  };
}

order($("#order"), {
  id: "order",
  lines: ["lo, hi = 0, len(xs) - 1", "while lo <= hi:", "mid = (lo + hi) // 2", "if xs[mid] == target: return mid", "lo = mid + 1 if xs[mid] < target else hi"],
  why: ["The bounds must exist before the loop reads them.", "The loop repeats until the range is empty.",
        "Each pass needs a fresh middle.", "Compare before moving the bounds, or you skip the match.", "Moving a bound is the last step of each pass."],
});
```

A matching `.sr` class hides the live region visually without hiding it from screen readers (`position:absolute; width:1px; height:1px; overflow:hidden; clip-path:inset(50%)`).

### 5.4 Parameter slider tied to a prediction

**Use when** the concept is a relationship between quantities (growth rate, sample size and spread, tempo and note length). The slider is locked until the learner predicts; then it answers a goal question ("set n to the largest list that needs only 10 guesses"), checked against the same model that draws the output.

**States.** Idle: prediction input, slider disabled. Attempted: prediction locked, slider live, output updating. Wrong: on release, how far off and in which direction. Right: the value, the learner's prediction, and the gap between them, since the gap is the learning. Retry: keep sliding.

**Keyboard and accessibility.** A native `input type="range"` is keyboard-operable (arrows, Page Up/Down, Home/End) and announces its value; put the computed result in an `<output>` and in the slider's `aria-valuetext`. Check on `change`, not on every `input`, so a keyboard user stepping through values isn't judged mid-move.

```js
// model(x) computes the output from the same data the text uses. goal(x) is the target condition.
function slider(el, { id, label, min, max, step = 1, model, unit, ask, goal, goalText, explain }) {
  const pred = h("input", { type: "number", id: id + "-p", "aria-label": "Your prediction" });
  const lock = h("button", { type: "button", class: "btn", text: "Lock in prediction" });
  const range = h("input", { type: "range", id: id + "-r", min, max, step, value: min, disabled: "", "aria-label": label });
  const out = h("output", { for: id + "-r" });
  const fb = feedbackBox();
  const show = () => {
    const x = +range.value;
    out.textContent = `${label} ${x.toLocaleString()}: ${model(x)} ${unit}`;
    range.setAttribute("aria-valuetext", out.textContent);
  };
  el.replaceChildren(h("div", { class: "q" },
    h("p", { html: ask }), h("label", { for: id + "-p", text: "Prediction " }), pred, lock,
    h("p", { html: goalText }), range, h("p", {}, out), fb));
  lock.onclick = () => {
    if (pred.value === "") { fb.className = "fb"; fb.textContent = "Write a number first; a rough guess is fine."; return; }
    S[id + "-prediction"] = +pred.value; save();
    pred.disabled = lock.disabled = true;
    range.removeAttribute("disabled");
    show();
    range.focus();
  };
  range.oninput = show;
  range.onchange = () => {
    const x = +range.value, ok = goal(x);
    record(id, ok, String(x));
    say(fb, ok, explain(x, +pred.value));
    if (ok) markDone(id);
  };
}

const guesses = n => Math.ceil(Math.log2(n + 1));
slider($("#slider"), {
  id: "slider", label: "List size", min: 1, max: 2000, unit: "guesses at most", model: guesses,
  ask: "First predict: what is the largest sorted list binary search can always finish in 10 guesses?",
  goalText: "Now find it: drag to the largest size that still needs only 10.",
  goal: n => guesses(n) === 10 && guesses(n + 1) === 11,
  explain: (n, p) => guesses(n) === 10 && guesses(n + 1) === 11
    ? `${n.toLocaleString()} = 2 to the 10th minus 1. You predicted ${p.toLocaleString()}, off by ${Math.abs(n - p).toLocaleString()}.`
    : `${n.toLocaleString()} needs ${guesses(n)}. ${guesses(n) > 10 ? "Too big: go smaller." : "Still 10 or fewer, but the next size up is too. Go bigger."}`,
});
```

### 5.5 Flashcards with self-grading that records failure

**Use when** the objective includes facts or quick recognitions that must stay available for weeks (vocabulary, note names, command flags). Cards are atomic: one idea, one answer.

**States.** Idle: the prompt and a typed-attempt box. Attempted: the learner types an answer or presses "I don't know" (which counts as a miss). Revealed: the answer next to theirs. Graded: "Missed it" sends the card to box 0 and back into this session's queue; "Got it" moves it up a box and sets its due date further out. Empty: "Nothing due. Next card due on (date)."

**Why typed before reveal.** Self-grading against a remembered answer is generous; against a written one it's honest. A miss shortening the interval is what makes this a memory model and not a calendar (the baseline book's review button could only move forward).

**Keyboard and accessibility.** All controls are buttons; focus moves to "Got it" after reveal so a keyboard user can grade with Enter or Tab plus Enter. The card region is a live region so the new prompt is announced.

```js
const BOX_DAYS = [0, 1, 3, 7, 16, 35]; // box 0 = again this session
function deck(el, { id, cards }) {
  const st = (S[id + "-deck"] ||= { box: {}, due: {} }); // schedule lives apart from record()'s attempt log
  const due = () => cards.filter(c => (st.due[c.q] || 0) <= Date.now());
  const fb = feedbackBox();
  function next() {
    const queue = due();
    if (!queue.length) {
      const soonest = Math.min(...cards.map(c => st.due[c.q] || 0));
      el.replaceChildren(h("p", { class: "q", text: `Nothing due. Next card due ${new Date(soonest).toLocaleDateString()}.` }));
      return;
    }
    const c = queue[0];
    const attempt = h("input", { type: "text", "aria-label": "Your answer", autocomplete: "off" });
    const reveal = h("button", { type: "button", class: "btn", text: "Reveal" });
    const dunno = h("button", { type: "button", class: "btn quiet", text: "I don't know" });
    const card = h("div", { class: "q card", "aria-live": "polite" },
      h("p", { html: `<strong>${c.q}</strong>` }), attempt, reveal, dunno, fb);
    el.replaceChildren(card, h("p", { class: "note", text: `${queue.length} due now` }));
    attempt.focus();
    const grade = got => {
      const b = got ? Math.min((st.box[c.q] || 0) + 1, BOX_DAYS.length - 1) : 0;
      st.box[c.q] = b;
      st.due[c.q] = got ? Date.now() + BOX_DAYS[b] * 864e5 : Date.now() + 60e3; // a miss returns this session
      record(id, got, c.q);
      next();
    };
    const show = typed => {
      reveal.disabled = dunno.disabled = attempt.disabled = true;
      fb.className = "fb";
      fb.replaceChildren(h("p", { text: `Answer: ${c.a}` }), h("p", { text: typed ? `You wrote: ${typed}` : "No attempt, so it counts as a miss and comes back this session." }));
      if (!typed) {
        const on = h("button", { type: "button", class: "btn", text: "Next card", onclick: () => grade(false) });
        fb.append(on); on.focus(); return;
      }
      const got = h("button", { type: "button", class: "btn", text: "Got it", onclick: () => grade(true) });
      fb.append(h("button", { type: "button", class: "btn quiet", text: "Missed it", onclick: () => grade(false) }), got);
      got.focus();
    };
    reveal.onclick = () => attempt.value.trim() ? show(attempt.value.trim()) : (fb.className = "fb", fb.textContent = "Type your answer first, even a guess.");
    dunno.onclick = () => show("");
  }
  next();
}

deck($("#deck"), { id: "deck", cards: [
  { q: "Binary search needs the list to be...", a: "sorted" },
  { q: "Worst-case guesses for 1,023 items", a: String(Math.ceil(Math.log2(1024))) },
] });
```

In a multi-session course, show the due count in the progress map ("3 due today") so the learner sees review waiting when they reopen the page.

### 5.6 Timed retrieval

**Use when** the objective names a speed ("name any note in about a second", "recall the 12 times table"). Speed is evidence of fluency that accuracy alone hides.

**States.** Idle: the count, the time per item, and a Start button. Running: one prompt at a time, the elapsed time not shown as a countdown (a ticking clock adds pressure without information). Wrong: recorded with what was typed. Slow: right but over the limit, reported separately from wrong. Finished: right-and-in-time, right-but-slow, and wrong, the missed items listed, the best score stored.

**Also use it to block a slower shortcut.** If the objective says "without working it out" and the workaround is counting (up from fret 0, through the times table), an untimed drill measures the counting. Time it and keep right-but-slow out of the mastery count. In iteration 2 an untimed root drill could be passed by counting up from the nut, which was exactly what its objective ruled out.

**Accessibility.** WCAG 2.2.1 requires that time limits be adjustable, so the learner sets the seconds per item, and nothing auto-advances: the time is measured, never enforced.

```js
// Uses norm() from 5.2.
function timed(el, { id, make, count = 10 }) {
  const secs = h("input", { type: "number", min: 1, max: 30, value: S[id + "-secs"] || 3, "aria-label": "Seconds per item" });
  const start = h("button", { type: "button", class: "btn", text: "Start" });
  el.replaceChildren(h("div", { class: "q" }, h("p", { text: `${count} items. Target seconds per item:` }), secs, start));
  start.onclick = () => {
    const limit = +secs.value * 1000;
    S[id + "-secs"] = +secs.value; save();
    const results = [];
    let k = 0;
    const step = () => {
      if (k === count) return finish();
      const it = make(), t0 = performance.now();
      const inp = h("input", { type: "text", "aria-label": it.q, autocomplete: "off" });
      const form = h("form", { class: "q" }, h("p", { html: `${k + 1} of ${count}: <strong>${it.q}</strong>` }), inp,
        h("button", { class: "btn", text: "Enter" }));
      form.onsubmit = e => {
        e.preventDefault();
        const ms = performance.now() - t0, ok = norm(inp.value) === norm(it.a);
        results.push({ q: it.q, a: it.a, typed: inp.value, ok, slow: ok && ms > limit });
        k++;
        step();
      };
      el.replaceChildren(form);
      inp.focus();
    };
    const finish = () => {
      const fast = results.filter(r => r.ok && !r.slow).length, slow = results.filter(r => r.slow).length;
      const wrong = results.filter(r => !r.ok);
      record(id, fast === count, `${fast}/${count} in time`);
      S[id + "-best"] = Math.max(S[id + "-best"] || 0, fast); save();
      el.replaceChildren(h("div", { class: "q" },
        h("p", { text: `${fast} right in time, ${slow} right but slow, ${wrong.length} wrong. Best so far: ${S[id + "-best"]} of ${count}.` }),
        ...wrong.map(r => h("p", { text: `${r.q}: you typed "${r.typed}", answer ${r.a}.` })),
        h("button", { type: "button", class: "btn", text: "Run it again", onclick: () => timed(el, { id, make, count }) })));
    };
    step();
  };
}

timed($("#timed"), { id: "timed", count: 5, make() {
  const e = 1 + Math.floor(Math.random() * 10);
  return { q: `2 to the ${e}`, a: String(2 ** e) };
} });
```

### 5.7 Paste back to Claude

**Use when** the page can't grade the attempt: free-form code, writing, a proof, a design, or a progress report from a physical skill. The learner writes in a textarea; a button copies a message that names the task, includes the attempt, and says what Claude should check.

```js
async function copyForClaude(task, textarea, status) {
  const attempt = textarea.value.trim();
  if (!attempt) { status.textContent = "Write your attempt first."; return; }
  const msg = `${task}\n\nMy attempt:\n${attempt}\n\nPlease check it, tell me what it does and why, and give me one more like it if it's right.`;
  try { await navigator.clipboard.writeText(msg); status.textContent = "Copied. Paste it into the chat."; }
  catch (e) { textarea.value = msg; textarea.select(); status.textContent = "Copy is blocked here. The message is selected: press Ctrl or Cmd+C."; }
}
```

Clipboard writes fail in some sandboxed frames and on `file://` in some browsers, so the fallback (select the text) is required, not optional. Show the rubric next to the box so the learner can self-check first.

### 5.8 Generators that discriminate

**Use for** every generated placement, practice, mastery and retrieval item. The principle and the recipe are in `diagnosis-and-feedback.md`, section 13: an item tests a misconception only if the misconception gives a different answer. A random generator left alone produces many items where the wrong rule and the right one agree (in iteration 1, three in four), and a learner holding the wrong rule clears practice uncontradicted.

The mechanics: write the correct engine and each named misconception as functions of the same item, draw until the item separates them, let a capped share of non-discriminating items through on purpose (flagged so they never count toward mastery), measure the rate, and use the misconception answers both as distractors and to name the error in a typed answer.

```js
// Worked on order of operations so it runs anywhere. Swap in your engine and misconceptions.
const genExpr = () => ({ a: Math.floor(Math.random() * 10), b: Math.floor(Math.random() * 10), c: Math.floor(Math.random() * 10) });
const RIGHT = ({ a, b, c }) => a + b * c;
const WRONG = {
  leftToRight: ({ a, b, c }) => (a + b) * c,   // "work left to right"
  addAll: ({ a, b, c }) => a + b + c,          // "the x is another plus"
};
const WHY = {
  leftToRight: "is what you get working left to right. Multiplication goes first, so b times c is done before the addition.",
  addAll: "is what you get adding all three. The middle sign multiplies.",
};

// Draw until no misconception matches the right answer. weakShare lets a few
// non-discriminating items through so "the obvious answer is always wrong" isn't a strategy.
function pickItem(gen, right, wrong, { weakShare = 0.15, tries = 1000 } = {}) {
  const allowWeak = Math.random() < weakShare;
  for (let i = 0; i < tries; i++) {
    const item = gen(), answer = right(item);
    const blind = Object.keys(wrong).filter(k => wrong[k](item) === answer);
    if (!blind.length || allowWeak) return { item, answer, blind, exposes: Object.keys(wrong).filter(k => !blind.includes(k)) };
  }
  throw new Error(`No discriminating item in ${tries} draws. Widen the generator.`);
}

// Measure, don't assume: the share of raw draws each misconception would get wrong.
function discriminationRate(gen, right, wrong, n = 3000) {
  const hit = Object.fromEntries(Object.keys(wrong).map(k => [k, 0]));
  for (let i = 0; i < n; i++) { const it = gen(), a = right(it); for (const k in wrong) if (wrong[k](it) !== a) hit[k]++; }
  return Object.fromEntries(Object.entries(hit).map(([k, v]) => [k, +(v / n).toFixed(2)]));
}
console.log("raw generator", discriminationRate(genExpr, RIGHT, WRONG));
console.log("filtered", discriminationRate(() => pickItem(genExpr, RIGHT, WRONG, { weakShare: 0 }).item, RIGHT, WRONG));

// Multiple choice: the wrong options are the misconception answers, each with its explanation.
function exprItem() {
  const { item, answer, exposes } = pickItem(genExpr, RIGHT, WRONG);
  const { a, b, c } = item, seen = new Set([answer]);
  const opts = [{ t: String(answer), ok: true, why: `${b} times ${c} is ${b * c}, then add ${a}.` }];
  for (const k in WRONG) {
    const v = WRONG[k](item);
    if (!seen.has(v)) { seen.add(v); opts.push({ t: String(v), ok: false, why: `${v} ${WHY[k]}` }); }
  }
  return { q: `What is ${a} + ${b} × ${c}?`, opts, exposes };
}

// Typed answers: name the misconception the answer matches, if any.
function diagnoseTyped(item, typed) {
  const v = Number(typed), right = RIGHT(item);
  if (v === right) return { ok: true, why: "Multiplication first, then the addition." };
  const k = Object.keys(WRONG).find(k => WRONG[k](item) === v);
  return { ok: false, why: k ? `${v} ${WHY[k]}` : `The answer is ${right}: ${item.b} times ${item.c} first, then add ${item.a}.` };
}
```

On a raw draw here, `leftToRight` is caught about 80% of the time (it agrees whenever `a` is 0 or `c` is 1) and `addAll` about 98% (it agrees only when `b` and `c` are both 0 or both 2); filtered, both are 100%. If filtering rejects most draws, the generator is aimed at the wrong region: change it to build discriminating items directly (for a "whole stack versus run" misconception, always place a lone stone beside a run), then filter what's left.

**Mastery and the streak.** `practice()` in 5.1 counts only items whose `exposes` list is not empty, and finishes only when the streak's items have exposed every target. Return `exposes` from the generator (the misconceptions whose answer differs on this item) instead of a yes-or-no flag, so the streak can tell which ones it has met.

**Coverage on every path, checked at load.** Discriminating items help only on the path the learner takes. In iteration 2 the corrective items sat in parts that placement let the misconception holder skip, through gate items those misconceptions answered correctly. So the page asserts two things. For every route placement allows, including the shortest, the items a learner is guaranteed to answer expose each misconception at least twice. And each gate fails under every misconception that the parts it skips repair. Generated items count through their pool: if a check already asserts that every item in a pool separates a misconception, one representative stands for the draw.

```js
// Continues the order-of-operations sketch above (RIGHT, WRONG).
const exposes = item => Object.keys(WRONG).filter(k => WRONG[k](item) !== RIGHT(item));
const PARTS = {                       // items each part guarantees the learner answers
  place:      [{ a: 2, b: 3, c: 4 }, { a: 1, b: 5, c: 2 }],
  precedence: [{ a: 3, b: 2, c: 5 }, { a: 4, b: 6, c: 3 }],
  signs:      [{ a: 2, b: 7, c: 3 }],
  closing:    [{ a: 5, b: 4, c: 6 }, { a: 1, b: 9, c: 2 }],
};
const REPAIRS = { precedence: ["leftToRight"], signs: ["addAll"] };   // what each part fixes
const GATES = [{ needs: [PARTS.place[0]], skips: ["precedence"] },   // all `needs` right => skip
               { needs: PARTS.place, skips: ["precedence", "signs"] }];
const ROUTES = [[], ...GATES.map(g => g.skips)];                      // full path, then each shortcut
const pathItems = skip => Object.keys(PARTS).filter(p => !skip.includes(p)).flatMap(p => PARTS[p]);

checks.push(
  ...ROUTES.map(skip => [`route skipping [${skip}] exposes each misconception twice`, () =>
    Object.keys(WRONG).every(k => pathItems(skip).filter(it => exposes(it).includes(k)).length >= 2)]),
  ...GATES.map(g => [`gate to skip [${g.skips}] fails under every misconception those parts repair`, () =>
    g.skips.flatMap(p => REPAIRS[p]).every(k => g.needs.some(it => exposes(it).includes(k)))]),
);
// A boundary gate shows the failure: { a: 0, b: 2, c: 2 } gives 4 under the right rule
// and under both misconceptions, so it would let every misconception holder skip.
```

Keep `ROUTES` derived from the same table the routing code reads, so the check can't drift from what the page actually does. The same goes for the closing set: assert that it exposes each misconception at least once.

**Also run it on fixed items.** For the hook, each placement item and the final check, add one line per item to the page's `checks` array asserting that the right answer differs from each misconception's (section 10).

## 6. Honor-system patterns for physical skills

The page can't observe a motor skill, so the check is observable criteria plus an external reference plus honest self-report, and the self-report changes the plan. See `artifact-blueprint.md` section 12 for the design; this is the mechanics.

**Tempo ladder with a "not yet" that changes the plan.** Rungs widen tempo and scope. After each run the learner reports one of three outcomes; two "not yet" runs in a row step down a rung, and at the bottom rung the page switches to an unclocked drill and asks for a report to Claude.

```js
const RUNGS = [
  { bpm: 40, scope: "naturals, low E only" },
  { bpm: 50, scope: "naturals, both strings" },
  { bpm: 60, scope: "all notes, both strings" },
];
function report(outcome) { // "clean" | "almost" | "notyet"
  S.rung ??= 0; S.runs ??= [];
  const rung = S.rung;
  S.runs.push({ rung, outcome, at: Date.now() });
  const lastTwo = S.runs.filter(r => r.rung === rung).slice(-2);
  let plan;
  if (outcome === "clean") {
    S.rung = Math.min(rung + 1, RUNGS.length - 1);
    plan = S.rung > rung ? `Rung passed. Next session: ${RUNGS[S.rung].scope} at ${RUNGS[S.rung].bpm} bpm.` : "Objective reached. Repeat it on another day before calling it learned.";
  } else if (outcome === "almost") {
    plan = "Same rung again. First say the missed notes' frets aloud twice without the guitar.";
  } else if (lastTwo.length === 2 && lastTwo.every(r => r.outcome === "notyet")) {
    S.rung = Math.max(rung - 1, 0);
    plan = rung > 0 ? `Two not-yet runs, so the plan steps down to ${RUNGS[S.rung].bpm} bpm. That's the normal shape of practice.`
                    : "Drop the click for a session and walk the notes slowly. Then send Claude the summary below.";
  } else {
    plan = "Not yet. Stay on this rung; a second not-yet steps it down.";
  }
  save();
  return plan;
}
```

**The external reference.** In the guitar example, the page shows the call during one bar and plays the target note on the next downbeat, exactly when the learner should play it. A wrong or late note is heard as a clash with the page's note, which the learner can judge without already having the skill. Recommend a tuner app as a second opinion for the first runs.

**Record and compare.** One instruction and a three-question listening checklist (right notes? on the beat? any stops?). The page can't hear the recording; the learner can, and listening back catches what playing hides.

**Report back.** Build the summary from stored evidence, misses included, plus a blank "What I noticed:" line, in a read-only textarea with a copy button (section 5.7).

## 7. Media: sound with Web Audio

Playing target sounds is cheap and allowed: a note, a chord, an interval, a click, a cadence, a drone. Listening to the learner is not (no `getUserMedia`, no pitch detection). For any skill judged by ear, put a play button next to every figure the text describes as a sound; the baseline book described "a HAIR sharp", "bright vs dark" and shuffle feel in adjectives while a working synth sat unused.

Rules:

- **Create the AudioContext on the first user gesture** and resume it if suspended; browsers block audio started without one. Feature-detect, and say so on the page if Web Audio is missing.
- **Compute frequencies from the same data** as everything else: `440 * 2 ** ((midi - 69) / 12)`.
- **Schedule ahead on the audio clock,** not with `setTimeout` alone, or clicks drift. Use a short lookahead loop and update the visuals with timeouts aimed at the scheduled times.
- Nothing plays automatically on load, and every sound has a visible button (WCAG: no autoplay with sound).

```js
let AC = null;
function ac() {
  if (!AC) { const C = window.AudioContext || window.webkitAudioContext; if (!C) return null; AC = new C(); }
  if (AC.state === "suspended") AC.resume();
  return AC;
}
const hz = midi => 440 * 2 ** ((midi - 69) / 12);

// Karplus-Strong plucked string: a noise burst fed through an averaging delay line.
// Rich harmonics, so even an 82 Hz low E is audible on laptop speakers.
function pluck(midi, when) {
  const a = ac(); if (!a) return;
  const t = when ?? a.currentTime, sr = a.sampleRate, n = Math.round(sr / hz(midi)), len = Math.floor(sr * 1.8);
  const buf = a.createBuffer(1, len, sr), d = buf.getChannelData(0);
  for (let i = 0; i < n; i++) d[i] = Math.random() * 2 - 1;
  for (let i = n; i < len; i++) d[i] = 0.4985 * (d[i - n] + d[i - n + 1]);
  const src = a.createBufferSource(), g = a.createGain();
  src.buffer = buf;
  g.gain.setValueAtTime(0.5, t);
  g.gain.exponentialRampToValueAtTime(0.001, t + 1.8);
  src.connect(g).connect(a.destination);
  src.start(t);
}
const chord = (midis, strum = 0.03) => { const a = ac(); if (a) midis.forEach((m, i) => pluck(m, a.currentTime + 0.05 + i * strum)); };

function click(when, accent) {
  const a = ac(); if (!a) return;
  const o = a.createOscillator(), g = a.createGain();
  o.frequency.value = accent ? 1500 : 1000;
  g.gain.setValueAtTime(0.25, when);
  g.gain.exponentialRampToValueAtTime(0.001, when + 0.04);
  o.connect(g).connect(a.destination);
  o.start(when); o.stop(when + 0.05);
}

// Lookahead scheduler: onBeat(beatIndex, audioTime) schedules sound and returns false to stop.
function metronome(bpm, onBeat) {
  const a = ac(); if (!a) return () => {};
  const spb = 60 / bpm, t0 = a.currentTime + 0.15;
  let beat = 0;
  const id = setInterval(() => {
    while (t0 + beat * spb < a.currentTime + 0.12) {
      if (onBeat(beat, t0 + beat * spb) === false) { clearInterval(id); return; }
      beat++;
    }
  }, 25);
  return () => clearInterval(id);
}
```

For a key-context ear check (degrees, chord quality), play a cadence before the target (I, IV, V, I as `chord()` calls), because a bare triad trains a less useful skill; that's the ear trainer the baseline book's own lesson asked for and its tool didn't build.

## 8. Media: diagrams generated from data

Draw diagrams in inline SVG **from the data**, never by hand: the fretboard from `STRINGS` and `fretOf`, a join from the row arrays, a tree from its nodes. Then the diagram can't disagree with the text, and a quiz mode is the same drawing with labels hidden.

- **Real proportions where they teach something** (fret spacing shrinks up the neck: `x = 1 - 2 ** (-n / 12)` scaled to the width).
- **Labels on the diagram,** not in a legend elsewhere. State orientation in a sentence ("drawn like tab: higher string on top, nut on the left"), since orientation flips were one of the baseline book's quieter errors.
- **Theme-aware colors:** SVG presentation attributes don't reliably resolve CSS variables, so set `fill`, `stroke` and `font-family` through `element.style` (`el.style.setProperty("fill", "var(--board)")`).
- **A text alternative.** `role="img"` and an `aria-label` for a static figure; for a clickable one, `role="group"` and each target a focusable element with `role="button"` and a label ("A string, fret 5").
- **Keyboard: roving tabindex.** One target has `tabindex="0"`, the rest `-1`; arrow keys move focus within the grid; Enter or Space picks. Tab enters and leaves the whole diagram in one stop instead of 26.

```js
// Inside the loop that creates each target g at (row i, column n):
g.setAttribute("tabindex", i === 0 && n === 0 ? "0" : "-1");
g.setAttribute("role", "button");
g.setAttribute("aria-label", `${rows[i].name} string, fret ${n}`);
g.addEventListener("click", () => pick(i, n));
g.addEventListener("keydown", e => {
  const d = { ArrowRight: [0, 1], ArrowLeft: [0, -1], ArrowUp: [-1, 0], ArrowDown: [1, 0] }[e.key];
  if (e.key === "Enter" || e.key === " ") { e.preventDefault(); pick(i, n); return; }
  if (!d) return;
  e.preventDefault();
  const ni = Math.min(rows.length - 1, Math.max(0, i + d[0])), nn = Math.min(cols, Math.max(0, n + d[1]));
  const nxt = svg.querySelector(`[data-row="${ni}"][data-col="${nn}"]`);
  g.setAttribute("tabindex", "-1"); nxt.setAttribute("tabindex", "0"); nxt.focus();
});
```

Give the focused target a visible ring that clears 3:1 against the diagram's background (in the example, the ring's stroke changes under `:focus-visible`).

## 9. Progress map and current step

A progress map makes the sequence visible and shows partial progress, so a learner sees movement before mastery.

- **A list of parts, each with a status computed from evidence:** "not started", "3 tries, 1 missed", "done, 2 misses on the way". Not ticks the learner clicks.
- **The current step is obvious:** the first part not done gets `aria-current="step"`, a heavier weight and a marker (a 2px rule or underline), so it's distinct without color.
- **Placement:** a sticky rail on the left on wide screens; a wrapped row of links at the top (or a sticky bar) on phones.
- **The next review date** under the map when one is scheduled.

```js
const PARTS = [["place", "Placement"], ["p1", "1 Guess"], ["p2", "2 INNER"]];
function paintMap() {
  const ol = $("#map"); if (!ol) return;
  let current = null;
  ol.replaceChildren(...PARTS.map(([id, label]) => {
    const r = S[id];
    const status = !r ? "not started" : r.done ? (r.miss ? `done, ${r.miss} missed on the way` : "done") : `${r.tries} tries, ${r.miss} missed`;
    const li = h("li", {}, h("a", { href: "#" + id, text: label }), h("span", { class: "st", text: status }));
    if (!current && !(r && r.done)) { current = id; li.setAttribute("aria-current", "step"); }
    return li;
  }));
}
```

## 10. Checking the built page

### Fact checks at load

Generating the content from data fixes the diagrams and the answer keys. It does not fix the sentences written beside them, and in iteration 1 every factual error in the stronger fretboard lesson was one of those: a lick said to finish in box 2 that ended in box 1, "a bass root on beats 1 and 3" over code that played the fifth on beat 3, and a 60 bpm goal beside a "70 bpm (the objective)" rung. So the page carries a short list of assertions, one per stated fact the code could contradict, and runs it at load.

What goes in it:

- **Every hand-written sentence that names a value about computed content.** Where a sequence starts or ends, which beat plays which note, a count, a total, which option is longest, which rows survive.
- **Goal constants read in more than one place:** the objective's tempo against the top rung, the streak length in the text against the code's.
- **Each fixed item's discrimination:** the hook, the placement items, the challenge item (section 5.8).
- **Coverage and gates:** every route exposes each misconception twice, and each gate fails under the misconceptions it lets a learner skip (section 5.8).
- **Reasons in feedback strings.** A wrong-answer explanation is a factual claim. In iteration 2 every computed note was right and the lesson failed on a reason in the feedback ("box 1 to box 3 skips box 2"; nothing lies between them). Generate the reason from the engine, or assert it.
- **Promises about the page itself:** "every key here is new" (assert the retrieval keys and the drill keys don't overlap), "covers all twelve", "one per string".
- **Spelling in the domain's convention.** Assert that names render the way the field writes them: in a flat key every note name is spelled with flats (`spell("Bb minor")` contains no "#"). A sharp-only table gave A# for Bb minor's root.
- **Each fixed multiple-choice item's lint** (`mcLint`, section 5.1).

```js
// One line per stated fact. Text should still read from data where it can;
// this list catches the sentences that can't, and the ones someone forgets.
const DEV = location.protocol === "file:" || new URLSearchParams(location.search).has("dev");
const checks = [
  ["hook: 1,000 names need at most 10 guesses", () => guesses(1000) === 10],
  ["hook: '500' really is the half-the-list misconception", () => 1000 / 2 === 500],
  // Shapes of the checks that would have caught iteration 1's errors:
  // ["lick ends in box 2, as the text says", () => boxOf(LICK.at(-1)).includes(2)],
  // ["bass plays the root on beats 1 and 3", () => [0, 2].every(b => BASS_PC[b] === ROOT_PC)],
  // ["objective tempo is the top rung's", () => GOAL_BPM === RUNGS.at(-1).bpm],
  // ["hook stack separates whole-stack doubling", () => wrong.wholeStack(HOOK) !== score(HOOK)],
];
function runChecks() {
  const fails = checks.filter(([, f]) => { try { return !f(); } catch (e) { return true; } }).map(([t]) => t);
  fails.forEach(t => console.error("Fact check failed:", t));
  if (DEV && fails.length) document.body.prepend(h("pre", { role: "alert", text: "Fact checks failed:\n" + fails.join("\n") }));
  return fails;
}
runChecks();
```

The headless run in the list below treats any "Fact check failed" in the console as a failure. A check that fails means the sentence or the data is wrong; fix whichever is wrong, and never delete the check to get a clean run.

### Trace the prose

Then read the rendered page once, slowly, as the learner, and stop at every sentence that names a specific value: a number, a position, a note or a row, "first", "last", "only", "every", "longest". For each, point to what guarantees it: the script fills it in, or a line in `checks` asserts it. A sentence with neither gets one, or is rewritten without the value. Read the generated feedback the same way, for several random items: generated text is where a wrong pronoun, a "two orders" that should be a count, or a stale label shows up.

Self-check criteria get the same trace against the domain: work one real case through each "you've got it when…" line and ask whether a correct performance could fail it (`diagnosis-and-feedback.md`, section 11).

### In a browser

A model doesn't see its own rendered output, so open it. If a headless browser is available (Python Playwright, or Chrome's headless mode), check:

1. **Console errors** and uncaught exceptions: none, at load and through every interaction.
2. **Layout at 1280, 390 and 320 px,** in light and dark: no page-level horizontal scroll (`document.documentElement.scrollWidth <= clientWidth`), and **no sideways scroll in the core task's container** either (the same test on the diagram or builder the main check uses). Headless Chrome's smallest window can be about 500 px, so load the page in a 390 px iframe or use device emulation to get a true phone width. Look at the screenshots, don't just measure: overlapping fixed buttons, borders running through legends and stretched table rows only show up visually.
3. **The longest strings.** Find the longest value each text slot can take (the longest option, legend, feedback message, generated name) and render it at 320 px. It must wrap inside its box.
4. **Play through every interaction by script:** a wrong answer then a right one for each check, the variant streak, the "not yet" path twice, the retrieval schedule. Read the feedback text it produces; generated explanations are where a stray "each" with one name or a wrong pronoun shows up.
5. **Verify content independently:** compute a sample of answers by a separate route (a Python one-off) and compare with what the page renders.
6. **Run the fact checks:** `runChecks()` returns an empty list and the console has no "Fact check failed". Print each generator's `discriminationRate` and confirm the non-discriminating share is small.
7. **Storage blocked:** load once with `localStorage` throwing; the page must still work.
8. **Timing-driven parts** (metronomes): speed them up in the test (`RUNGS.forEach(r => r.bpm = 900)`), and launch the browser with `--autoplay-policy=no-user-gesture-required` so the audio clock runs.

Then run the no-slop-design skill's `scripts/audit.py` on the file and walk its checklist by hand for the judgment items. Fix every failure; most warnings are worth fixing too. In the examples the audit caught a too-amber string color and a false positive where a comparison written as i, less-than, S.rung with no spaces looked like a strikethrough tag; rewriting the comparison was simpler than arguing with it.

If no browser is available, say so in the hand-over, and say which checks were done by reading the code instead.

## 11. Craft checklist

**Platform and limits**
- [ ] Environment's artifact-design guidance loaded and followed; this file applied on top.
- [ ] One self-contained HTML file; nothing needs a backend, the microphone or the camera.
- [ ] The page says what it can't see, in one sentence, where it matters.

**Visual**
- [ ] Palette from the subject matter, source written in a comment; no indigo, violet, amber-cream or emerald accent.
- [ ] No glow, and no gradient used as atmosphere.
- [ ] Every text pair measured at 4.5:1 or better (3:1 for large text and UI), in both themes; ratios recorded.
- [ ] Two typefaces, each with a stated job; none of the banned six.
- [ ] Paragraph measure 60 to 75 characters; spacing groups each chunk; one idea per region; something deliberately asymmetric.
- [ ] Light and dark themes both designed; toggle stored with try/catch.
- [ ] No page scroll at 390 and 320 px, and the core task needs no sideways scroll there (rotate, crop or zoom wide diagrams); 44 px hit targets; print styles for anything that will be printed.
- [ ] No colored left border on callouts, feedback or route boxes.
- [ ] The longest string in every text slot wraps inside its container at 320 px; legends don't cross their fieldset border.
- [ ] Motion only for state changes; reduced-motion respected.

**Interaction**
- [ ] Every widget is a think pattern with all five states (idle, attempted, wrong with explanation, right, retry) and is referenced by a step.
- [ ] No answer on screen before commitment; checking with nothing chosen gives a prompt, not silence.
- [ ] Wrong feedback says what the learner's answer actually means; right feedback says why.
- [ ] Variants after misses; misses recorded with what was answered.
- [ ] Generators filtered to discriminating items, rate measured; non-discriminating items flagged and never counted toward mastery.
- [ ] Practice ends on a mastery criterion whose streak has exposed every targeted misconception; "test me" is two or three random items covering them all.
- [ ] `checks` asserts that every route, including the shortest, exposes each misconception twice, that each gate fails under the misconceptions it skips, and that the closing set covers all of them.
- [ ] Placement items appear one at a time; no item's options or feedback reveal another's answer.
- [ ] Recall drills timed where the shortcut is counting; right-but-slow kept out of mastery.
- [ ] Multiple choice: options similar in length and grammar, wrong options from named misconceptions, order shuffled, `mcLint` clean.
- [ ] Keyboard: native controls, roving tabindex for diagrams, buttons as the primary move controls for ordering; visible focus everywhere.
- [ ] Feedback regions are `aria-live="polite"`; time limits adjustable and never enforced by auto-advance.
- [ ] Learner text never inserted as HTML.

**Media**
- [ ] Every sound the text describes has a play button beside it; audio starts only on a gesture; frequencies computed from data.
- [ ] Diagrams generated from the same data as the text, with a text alternative and stated orientation.

**Verified**
- [ ] A `checks` array asserts every stated fact the code could contradict and every fixed item's discrimination; it passes at load.
- [ ] Every sentence naming a value traced to the code or check that guarantees it, including feedback reasons and promises about the page; names spelled in the domain's convention.
- [ ] Opened in a headless browser: no console errors, layout checked at three widths in both themes, core task played through at 390 px, every interaction played through, generated text read.
- [ ] no-slop audit script run with zero failures; judgment checklist walked.

<!--
Sources and findings behind this file:
- research/notes/E-artifact-design.md: scope note (single static HTML file, no backend, no audio or camera analysis), finding 2 (Mayer: coherence, contiguity, segmenting, signaling), finding 5 (checkable vs honor-system checks, variants and streaks, answer-in-hint), finding 7 (think vs decoration table, Victor on sandboxes and author responsibility, tool-island), finding 8 (localStorage limits, lost state), finding 9 (mnemonic medium, atomic cards, failed recall steps back).
- research/notes/B-diagnosis-feedback.md: finding 3 (feedback carries task and process information, not praise), finding 5 (commit before reveal, per-distractor feedback, normalised answers, no mark-complete gate, honor-system design).
- research/notes/D-retention.md: findings 1 to 5 (retrieval, spacing, misses bring reviews forward, nothing will remind them, prediction and calibration for motor skills).
- research/notes/F-domain-pedagogy.md: Parsons problems (Ericson et al.; distractors hurt young novices), PRIMM predict-first, subgoal labels, slow practice and the smallest failing unit, physical-skill feedback without observation (v0).
- research/notes/I-video-educators.md: predict-or-pause moves, convert recaps to retrieval, Muller clarity finding.
- research/baseline/fretboard-teardown/01 to 03: unused synth (F20), tool-island tools (F22), ear trainer without cadence (F23), right/wrong-only feedback (F24), forward-only review (F25), fretboard overflow at narrow widths, tab orientation flips (F36).
- no-slop-design skill: SKILL.md four decisions; references/visual.md (palette, type, layout, decoration), copy.md (no em dashes, banned vocabulary, explanatory filler), craft.md (states, accessibility baseline, responsive widths), audit-checklist.md.
- WCAG 2.2 AA: 1.4.3 and 1.4.11 contrast, 2.1.1 keyboard, 2.2.1 timing adjustable, 1.4.2 audio control.
- testing/reports/iter-1*.md: fact checks at load and tracing the prose (fretboard G2 errors), discriminating generators (Driftstones generator rate, hook collision), mastery exit (learner quit at level 4), option hygiene (longest option correct), phone-width core task (min-width boards), left-border and legend overflow (audit warnings, grader screenshots). Practitioner.
- testing/reports/iter-2*.md: coverage-aware streak and multi-item test, path coverage and gate checks (Brindle placement routed around M3 and M4), feedback reasons, page promises and spelling (fretboard G2), timed recall (the root drill). Practitioner, one run per condition.
- Practitioner or v0: the visual adaptations, the five-state model, the code sketches (tested by extraction into a headless-browser test page), the honor-system ladder mechanics.
-->

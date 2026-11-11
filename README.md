# teach-me

A Claude skill that teaches you something so you can do it yourself afterward, instead of just answering or demonstrating.

## Why

Left alone, Claude tends to demonstrate. You ask how something works, you get a clean explanation or a finished solution, and it feels like learning while you read it. A week later you can't do it. The lessons it builds as artifacts have the same problem: they read like reference docs, with nothing to try and nothing that checks you.

## What changes when it is on

- It asks what you already know before it explains anything, and starts from there.
- It gives you the next step to do, then responds to what you actually wrote or answered.
- Over a session it hands over more of the work, until you are doing the whole task on your own.
- Lessons, study guides and practice sets are built around exercises with feedback, not paragraphs to read.
- If you only want the answer (fix this bug, draft this email), it stays out of the way.

## Install in the Claude app

1. Download [dist/teach-me.zip](dist/teach-me.zip) from this repo.
2. In Settings > Capabilities, turn on code execution and file creation. Skills need it.
3. In Customize > Skills, upload the zip and switch the skill on.

If the upload rejects the description as too long, run `scripts/package.sh --short` and upload the new `dist/teach-me.zip`. That build uses a 200 character description.

## Install in Claude Code

As a plugin:

```
/plugin marketplace add Ethan-Ka/teach-me
/plugin install teach-me@teach-me-marketplace
```

Or copy the skill by hand:

```
git clone https://github.com/Ethan-Ka/teach-me.git
cp -R teach-me/skills/teach-me ~/.claude/skills/teach-me
```

Use `ln -s "$PWD/teach-me/skills/teach-me" ~/.claude/skills/teach-me` instead of `cp` if you want to edit it in place. Use one route only, or you will get duplicates.

## Turn off the built-in learn skill

Anthropic ships a `learn` skill that triggers on the same requests. With both on, they compete. Turn `learn` off in Customize > Skills (Claude app) or leave it disabled in Claude Code.

## Example prompts

- Teach me git rebase. I use merge and I'm not sure what rebase changes.
- Quiz me on SQL joins.
- Build me a lesson on reading guitar notes on the low E and A strings.
- I keep mixing up precision and recall.
- Walk me through this codebase so I can work in it.

## Layout

`skills/teach-me/` is the skill, `scripts/package.sh` builds the zip, and `research/`, `testing/` and `examples/` hold the notes and evals behind it.

## Credits and license

Derived from Anthropic's `learn` skill (Apache-2.0); see [NOTICE](NOTICE). Licensed under Apache-2.0, see [skills/teach-me/LICENSE.txt](skills/teach-me/LICENSE.txt).

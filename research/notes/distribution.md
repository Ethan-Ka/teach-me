# Distribution: custom skills in Claude apps vs Claude Code

**Research question:** practical; feeds the README, packaging scripts, and what the skill can assume about its tools.
**Sessions:** 2026-11-11 (fetched from official docs; one WebFetch summary each, so re-check exact wording before shipping)

## Checklist: claude.ai (web, desktop) upload

- [ ] Folder name equals the skill `name`. Upload fails with "Skill folder name doesn't match the skill name" otherwise. (https://support.claude.com/en/articles/12512180-using-skills-in-claude)
- [ ] Zip so the skill folder is the archive root: `teach-me.zip` contains `teach-me/SKILL.md` plus optional resources. Do not zip the folder's contents loose. (https://support.claude.com/en/articles/12512198-creating-custom-skills)
- [ ] `SKILL.md` must exist (the upload error reads "Missing required skill.md file"; use `SKILL.md`, as the platform docs do).
- [ ] Frontmatter has `name` and `description`, both required. (https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
  - `name`: max 64 chars, lowercase letters, digits, hyphens only, no XML tags, must not contain the reserved words `anthropic` or `claude`. `teach-me` is fine.
  - `description`: non-empty, no XML tags. **Sources disagree on the max: 1,024 chars (platform docs) vs 200 chars (support "creating custom skills" article).** Until resolved by an actual upload test, keep the description at or under 200 chars for the claude.ai build, or test the upload with a longer one.
- [ ] Only these frontmatter keys are accepted by claude.ai uploads, the Skills API, and `package_skill.py`: `name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`. Any other key (e.g. `argument-hint`, `when_to_use`, `disable-model-invocation`) is a hard error at upload. (https://code.claude.com/docs/en/skills, "Notes on other surfaces") So keep the shared SKILL.md frontmatter to those keys.
- [ ] ZIP size limit: errors exist ("ZIP file exceeds size limits") but no number is published. Keep the zip small; test.
- [ ] Avoid invalid characters in name or description (error listed in the "Using Skills" article). Claude Code's docs list disallowed characters: zero-width spaces, control characters, private-use, bidi controls, `<`, `>`. So no `<` or `>` in the description.

## Where users enable it

- [ ] Upload: Customize > Skills, "+" > "+ Create skill" > "Upload a skill", pick the zip. Enable the toggle for the skill in the same place. (https://support.claude.com/en/articles/12512180-using-skills-in-claude)
- [ ] Prerequisite, Free/Pro/Max/Ultra: Settings > Capabilities, turn on "Code execution and file creation" (renamed "Create and edit files" in the newer layout). Skills require code execution.
- [ ] Prerequisite, Team/Enterprise: an Owner turns on "Cloud code execution and file creation" and "Skills" in Organization settings > Plugins & skills > Policy. Members then toggle skills in Customize > Skills.
- [ ] Plans: Free, Pro, Max, Ultra, Team, Enterprise (support article). The platform docs list Pro, Max, Ultra, Team, Enterprise for custom skills; Free is a conflict. Treat Free as unconfirmed.
- [ ] Web, desktop, mobile: the docs say "claude.ai" and "Claude chat" generally. They do not say that uploading works on mobile, and the support article does not mention mobile creation. **Unverified: assume upload is done on web or desktop, and test whether an uploaded skill is usable from the mobile app.**
- [ ] Disable the built-in `learn` skill while teach-me is enabled (repo decision in research/PLAN.md). Not covered by docs; it is just the same Customize > Skills toggle.

## What the skill can assume in claude.ai

- Skills run in Claude's code-execution container, with filesystem access and bash. Skills load by progressive disclosure: name and description always in context (about 100 tokens), SKILL.md body when triggered, `references/` files only when read. (https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- Network access in claude.ai "might be full, partial, or none" depending on user and admin settings. Do not rely on fetching URLs from the skill. (same page)
- Claude Code: full network and the user's filesystem. API: no network, no package installs. (same page)
- **Not verified in what I fetched:** whether artifacts and web search are available to a skill in claude.ai. Those are separate features (artifacts needs the Artifacts setting; web search is a separate toggle), not part of the skill system. Write the skill so it degrades gracefully: if no artifact tool, produce the lesson inline or as a file; if no web search, skip the "research the topic" step and say so. Check against https://support.claude.com/en/articles/12111783-create-and-edit-files-with-claude.
- Custom skills do not sync across surfaces (claude.ai, API, Claude Code are separate), with one exception: a claude.ai-uploaded skill syncs one-way to Claude Code v2.1.273+ when signed in with the same account (not with API-key sign-in, Bedrock, etc.). Synced copies land in `~/.claude/skills/synced/` and are read-only. If a user has both the synced copy and a plugin install, expect duplicates; tell users to use one route.
- Personal uploads are private; Team/Enterprise owners can share or publish to the org (view-only for recipients).

## Checklist: Claude Code

- [ ] Standalone, no plugin: copy the folder to `~/.claude/skills/teach-me/SKILL.md` (personal) or `.claude/skills/teach-me/SKILL.md` (project). (https://code.claude.com/docs/en/skills)
- [ ] Claude Code frontmatter is a superset (all fields optional, `description` recommended). Description plus `when_to_use` is truncated at 1,536 chars in the skill listing, so put the trigger case first. SKILL.md under 500 lines. First 5,000 tokens of an invoked skill are re-attached after compaction (25,000 combined budget).
- [ ] Reserved names: `synced` and `anthropic-skills` (and the `anthropic-skills:` prefix).

## Checklist: distribute as a plugin and marketplace from a GitHub repo

Source: https://code.claude.com/docs/en/plugin-marketplaces and https://code.claude.com/docs/en/plugins/manifest-reference.md

- [ ] Plugin layout: `.claude-plugin/plugin.json` at the plugin root; `skills/<name>/SKILL.md` at the root (not inside `.claude-plugin/`). `plugin.json` is optional, only `name` is required in it; add `description`, `version`, `author` (object, `name` required), `license`, `homepage`, `repository`, `keywords` to avoid validator warnings. `name` must be kebab-case and cannot start with `claude-`, `anthropic-`, `anthropics-`, or `cc-plugin-` (error), or contain claude/anthropic as a whole word (warning). `teach-me` is fine.
- [ ] A plugin with `SKILL.md` at the plugin root and no `skills/` dir loads as a single skill. A skill in a plugin is invoked as `/<plugin-name>:<skill-name>`, e.g. `/teach-me:teach-me`. Consider making the plugin name and skill name differ or accept the doubled name.
- [ ] Marketplace file: `.claude-plugin/marketplace.json` at the repo root. Required top level: `name`, `owner` (object with `name`), `plugins` (array). Each plugin entry requires `name` and `source`; `description` optional. Example:

```json
{
  "name": "teach-me-marketplace",
  "owner": { "name": "Ethan Kawley" },
  "plugins": [
    {
      "name": "teach-me",
      "source": "./",
      "description": "Teaches so you learn: guides, checks, hands over the work."
    }
  ]
}
```

  The docs' own example uses `"source": "./plugins/my-first-plugin"` (path relative to the marketplace root, must start inside the root, no `..`). Using `"./"` for a plugin at the repo root is implied by the docs ("a marketplace entry whose source is the marketplace root") but not shown in the example I read; **confirm with `claude plugin validate .`**. The safer layout is `plugins/teach-me/` holding the plugin and `source: "./plugins/teach-me"`.
- [ ] Entry `name` must equal the manifest `name` in plugin.json, or install by manifest name fails.
- [ ] Pick a distinctive marketplace `name`; users cannot have two marketplaces with the same name. Names reserved for Anthropic (e.g. `claude-plugins-official`) are refused.
- [ ] Validate before pushing: `claude plugin validate ./path-to-marketplace` and `claude plugin validate ./path-to-plugin`. Expect `Validation passed`.
- [ ] User install flow. In a shell: `claude plugin marketplace add <owner>/<repo>` then `claude plugin install teach-me@<marketplace-name>`. Inside a session: `/plugin marketplace add <owner>/<repo>` then `/plugin install teach-me@<marketplace-name>` (the second opens the plugin panel where you confirm). The in-session `owner/repo` form for GitHub is the one the task brief names; the docs I read show the shell form with `<owner>/<repo>` and the in-session form with a local path. Test the in-session GitHub form once the repo is pushed.
- [ ] Updates: if `version` is set in plugin.json, users stay on it until it changes, so bump `version` on each release (or omit it to track the commit). Detail: https://code.claude.com/docs/en/plugins/host-marketplace.md (not read).
- [ ] After install, `/reload-plugins` or restart; `claude plugin list` shows status.
- [ ] Security: plugins run with the user's privileges. Our plugin should have no hooks, MCP servers, or `bin/` (a `bin/` directory also blocks claude.ai/Cowork plugin install). Plain skills only.
- [ ] Plugins on claude.ai and Cowork use the same format but a different component set: https://claude.com/docs/plugins/overview (not read).
- [ ] Optional wider reach: submit to Anthropic's directory (https://code.claude.com/docs/en/plugins/publish.md#submit-to-anthropics-directory, not read). Or share a zip of the plugin directly.

## Open items to test by hand

1. Upload a zip with a 300-char and a 900-char description to claude.ai to see which limit is enforced.
2. Confirm `source: "./"` validates for a root-level plugin.
3. Confirm the uploaded skill is usable on mobile.
4. Confirm whether the skill can create artifacts and use web search in claude.ai (separate feature toggles).
5. Packaging: strip any frontmatter keys outside the claude.ai allowlist from the app build.

## Update 2026-11-11 (K session): description length limits, resolved as far as docs allow

**Research question:** practical; settles the 1024 vs 200 conflict above.

| Surface | Limit on `description` | Exact text and URL |
|---|---|---|
| claude.ai app, "How to create custom skills" (support) | 200 characters | "Claude uses this to determine when to invoke your skill (200 characters maximum)." Same article: name "(64 characters maximum)"; "This file must start with a YAML frontmatter to hold name and description fields, which are required metadata." Optional: "dependencies" ("Software packages required by your skill."). https://support.claude.com/en/articles/12512198-creating-custom-skills |
| Agent Skills spec | 1024 characters | "Must be 1-1024 characters". Also `compatibility` max 500, `name` max 64, no consecutive hyphens, must match the directory name. https://agentskills.io/specification |
| Platform docs overview (API) | 1,024 characters | "`description`: Must be non-empty; Maximum 1,024 characters; Cannot contain XML tags". https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview |
| Claude Code | no separate cap on description alone; combined cap in the listing | "the combined `description` and `when_to_use` text is truncated at 1,536 characters in the skill listing". https://code.claude.com/docs/en/skills |

- **Answer:** The only official text giving a claude.ai-specific number is the support article, which says 200. The spec and API docs say 1,024; Claude Code truncates at 1,536. These conflict and I could not run an upload test, so the claude.ai limit is unconfirmed by behaviour. The "Using Skills in Claude" article (https://support.claude.com/en/articles/12512180-using-skills-in-claude) gives no number; it lists the error "Invalid characters in skill name or description" and "Skill folder name doesn't match the skill name".
- **Consequence for this repo:** the current teach-me `description` is about 981 characters (joined, measured 2026-11-11). It satisfies the spec and API (1,024) but would exceed 200 if the support article is enforced. Options: ship a short (200 or fewer) description in the claude.ai build and keep the long one for Claude Code and the API, or test an upload with a 300-character and a 900-character description (open item 1 above). Note the multi-line YAML block scalar counts newline joins; keep the claude.ai build to a single line.
- **Frontmatter fields claude.ai accepts:** Claude Code docs, section titled "Using skill frontmatter outside Claude Code" (the earlier note called it "Notes on other surfaces"; that heading did not appear in the text I read): "claude.ai skill uploads, the Skills API, and packaging with `package_skill.py` from anthropics/skills" may use `name`, `description`, `license`, `compatibility`, `metadata`, `allowed-tools`. Any other field fails: "Unexpected key(s) in SKILL.md frontmatter: argument-hint. Allowed properties are: allowed-tools, compatibility, description, license, metadata, name". The claude.ai support article instead mentions an optional `dependencies` field, which is not in that allowlist; treat as a doc conflict and omit `dependencies`. The same page says claude.ai uploads are also how a personal skill reaches Cowork and cloud sessions, under the same rules. The page text was truncated at 100,000 of 118,895 characters, so a later section may add detail. https://code.claude.com/docs/en/skills
- Claude Code ignores unrecognised fields silently ("Claude Code ignores a field it doesn't recognize without reporting an error"), unlike claude.ai uploads.
- Platform overview: custom skills on claude.ai are on "Pro, Max, Ultra, Team, and Enterprise plans with code execution enabled" (Free is not listed). Consistent with the earlier "Free unconfirmed" note.

## Sources to log
- Creating custom skills (claude.ai help). Anthropic. https://support.claude.com/en/articles/12512198-creating-custom-skills. 2026-11-11.
- Using Skills in Claude (claude.ai help). Anthropic. https://support.claude.com/en/articles/12512180-using-skills-in-claude. 2026-11-11.
- Agent Skills specification. agentskills.io. https://agentskills.io/specification. 2026-11-11.
- Agent Skills overview. Anthropic platform docs. https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview. 2026-11-11.
- Extend Claude with skills. Claude Code docs. https://code.claude.com/docs/en/skills. 2026-11-11.

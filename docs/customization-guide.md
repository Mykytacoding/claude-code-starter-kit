# Customization Guide

How to adapt this kit to your specific workflow — adding skills, modifying templates, connecting new tools.

---

## Start Here: What to Customize First

In order of impact:

1. **Fill in your docs files** — `docs/voice-guide.md`, `docs/sheet-map.md`, or `docs/workflows.md`. This single step transforms generic templates into a system tuned to you.

2. **Update `CLAUDE.md` placeholders** — replace every `[BRACKETED PLACEHOLDER]` with real information.

3. **Adjust the skills** — once you've used the kit for a week, you'll know what the skills get wrong. Edit the SKILL.md files directly.

4. **Add new docs files** — as your knowledge grows, add new files and point skills at them.

5. **Write new skills** — for recurring tasks the existing skills don't cover.

---

## Adding a New Docs File

1. Create the file in `docs/` (or the use case's `docs/` folder):
   ```
   docs/my-new-topic.md
   ```

2. Write the content — be specific, write for Claude to read

3. Add a reference in `CLAUDE.md`:
   ```markdown
   - [My New Topic](./docs/my-new-topic.md) — what it covers
   ```

4. Update any relevant skills to read it:
   ```markdown
   Read [My New Topic](./docs/my-new-topic.md) before proceeding.
   ```

That's the full update cycle. The skill doesn't change when the knowledge changes — only the docs file does.

---

## Writing a New Skill

**Template:**

```markdown
# Skill: [Name]

[One-sentence description of what this skill does.]

## Before You Start

Read [Relevant Doc](./docs/relevant-doc.md).

## Steps

1. [Step one — be specific about what to do and what to look for]
2. [Step two]
3. [Step three]
4. [Close with a confirmation or check-in]

## What NOT to Do

- [Specific mistake to avoid]
- [Another common failure mode]

## If [Edge Case]

[How to handle it]
```

**Key rules:**
- Keep it under 100 lines
- Point to docs files for knowledge, don't embed knowledge in the skill
- Include a "What NOT to Do" section — it's often more valuable than the positive steps
- End with a check-in or confirmation

**Install it:**
```bash
# Mac/Linux
cp -r skills/my-skill ~/.claude/skills/

# Windows
Copy-Item -Path "skills\my-skill" -Destination "$env:USERPROFILE\.claude\skills\" -Recurse
```

---

## Modifying an Existing Skill

Edit the SKILL.md file directly. Skills are plain markdown — no compilation, no restart required. The next time you invoke the skill, Claude reads the updated version.

Common modifications:
- Add a step to the workflow
- Add an item to "What NOT to Do"
- Update the docs file reference path
- Add an edge case handling section

---

## Connecting a New MCP

1. Find the MCP package on npm (search `@modelcontextprotocol/server-*` or check the [MCP registry](https://github.com/modelcontextprotocol/servers))

2. Add it to `~/.claude/mcp.json`:
   ```json
   {
     "mcpServers": {
       "my-new-mcp": {
         "command": "npx",
         "args": ["-y", "@vendor/mcp-server-name"],
         "env": {
           "API_KEY": "your_key_here"
         }
       }
     }
   }
   ```

3. Restart Claude Code

4. Update your `CLAUDE.md` to mention the new connection so Claude knows it's available

---

## Adapting a Use Case Template

If none of the three use cases exactly fits your workflow:

1. Copy the closest one as a starting point
2. Rename the folder
3. Replace the docs files with ones relevant to your domain
4. Update the skills to read from your new docs
5. Update `CLAUDE.md` to reflect the new context

The pattern is always the same — the content changes, the structure doesn't.

---

## Keeping Things Lean

The value of this system comes from it being maintained, not just built. A few practices that keep it high-quality:

**Trim skills that have grown too long.** If a skill is over 100 lines, something that belongs in a docs file has leaked into the skill. Extract it.

**Delete outdated docs content.** When your process changes, update the docs file. Old information in docs files is worse than no information — Claude will follow it.

**Review CLAUDE.md periodically.** Remove references to docs or skills that no longer exist. Add references to new ones.

**Prune unused skills.** A skill you haven't used in two months is probably obsolete or has been superseded. Remove it.

The right size for this system is: small enough to maintain, large enough to be useful.

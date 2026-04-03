# Skills

Skills are reusable slash commands — lightweight instruction files that give Claude a specific, repeatable behavior.

---

## How Skills Work

A skill is a markdown file (`SKILL.md`) that Claude reads when you invoke it. It tells Claude exactly how to approach a specific class of task: what to read first, what steps to follow, what not to do.

Skills are **not code**. They're knowledge documents. The logic lives in the instructions; the knowledge lives in your docs files.

```
You type: /content-draft Write a LinkedIn post about productivity

Claude:
  1. Reads skills/content-draft/SKILL.md
  2. Reads docs/voice-guide.md (because the skill tells it to)
  3. Drafts in your brand voice
```

---

## The Thin-Pointer Pattern

Skills stay small by pointing to docs instead of containing knowledge:

```
skills/content-draft/SKILL.md (~20 lines)
  └── "Read docs/voice-guide.md before drafting"
        └── docs/voice-guide.md (your actual brand voice, any length)
```

When your brand voice changes, you update `voice-guide.md` — not the skill. The skill is stable; the knowledge evolves.

---

## Skills in This Kit

| Skill | What It Does | Reads From |
|---|---|---|
| [`/project-setup`](./project-setup/SKILL.md) | Scaffold a new project with git + GitHub | Nothing (interactive) |
| [`/daily-review`](./daily-review/SKILL.md) | Morning check-in — what to focus on, what's blocked | `docs/workflows.md` |
| [`/content-draft`](./content-draft/SKILL.md) | Draft content in your brand voice | `docs/voice-guide.md` |

Use-case-specific skills live in `use-cases/[use-case]/skills/`.

---

## How to Install a Skill

Copy the skill folder into `~/.claude/skills/`:

**Mac/Linux:**
```bash
cp -r skills/content-draft ~/.claude/skills/
```

**Windows (Git Bash):**
```bash
cp -r skills/content-draft "C:/Users/$USERNAME/.claude/skills/"
```

Then invoke it in Claude Code with `/content-draft`.

---

## How to Add Your Own Skill

1. Create a folder: `~/.claude/skills/my-skill/`
2. Create `SKILL.md` inside it
3. Write: what Claude should do, what to read first, what not to do
4. Keep it under 100 lines — if it's longer, split it into a skill + a docs file

**Minimal skill template:**

```markdown
# Skill: [Name]

[One-sentence description of what this skill does.]

## Before You Start
[What to read or check first.]

## Steps
1. [Step one]
2. [Step two]
3. [Step three]

## What NOT to Do
- [Common mistake to avoid]
```

---

## Skills vs. Agent Profiles

Skills are building blocks. For complex multi-step workflows, combine several skills into an agent profile — a larger SOP document that sequences multiple skills and handles escalation rules.

Use a skill for: "draft this content", "set up this project", "review today's tasks"

Use an agent profile for: "run the full weekly content workflow end to end"

# Memory System

How to give Claude persistent memory across sessions — what it is, how it works, and how to set it up.

---

## The Problem

Claude Code is stateless. Useful facts accumulate over the course of a project — decisions you've made, preferences you've established, context that would take 5 minutes to re-explain. Without memory, you re-establish this context at the start of every session.

Skills and docs files solve the *knowledge* problem (brand voice, sheet structure). Memory solves the *history* problem (what happened, what was decided, what changed).

---

## How It Works

Claude Code has a project-scoped memory system. Each project gets a memory directory:

```
~/.claude/projects/<project-hash>/memory/
├── MEMORY.md       ← index file (auto-loaded into every session)
├── user_*.md       ← facts about who you are and how you work
├── feedback_*.md   ← corrections and confirmed approaches
├── project_*.md    ← decisions, context, active work
└── reference_*.md  ← pointers to external resources
```

`MEMORY.md` is automatically loaded at the start of every conversation in that project context. The individual memory files are loaded on demand when relevant.

---

## Memory Types

| Type | What It Stores | Example |
|------|---------------|---------|
| `user` | Role, preferences, expertise | "Senior data analyst, deep SQL, new to Python" |
| `feedback` | Corrections + validated approaches | "Don't mock the database — prior incident showed mock/prod divergence" |
| `project` | Decisions, active work, context | "Auth rewrite is driven by compliance requirements, not tech debt" |
| `reference` | Where things live externally | "Pipeline bugs tracked in Linear project INGEST" |

---

## Memory File Format

```markdown
---
name: Memory Name
description: One-line description for the index
type: user | feedback | project | reference
---

Content here.

**Why:** Why this was saved — context for future Claude.
**How to apply:** When this memory should shape behavior.
```

The `Why` and `How to apply` fields are critical for feedback and project memories. They let Claude make judgment calls in edge cases instead of blindly following rules.

---

## What Belongs in Memory vs. Elsewhere

| Belongs in memory | Does NOT belong in memory |
|---|---|
| "We decided to use Postgres, not SQLite, because of scaling requirements" | Code architecture (read the code) |
| "Client prefers bullet points over prose in deliverables" | Project structure (read CLAUDE.md) |
| "The auth refactor is driven by compliance, not tech debt" | Git history (run `git log`) |
| "This user is new to React but has deep backend experience" | Task state (use task tools) |

When in doubt: if you can derive it by reading the current code or files, it doesn't belong in memory.

---

## Setting Up Memory

**Step 1:** Create the memory directory (Claude Code creates it automatically, but you can also create it manually):
```
~/.claude/projects/<hash>/memory/
```

The `<hash>` is derived from your project path. Open Claude Code in your project, ask "Where is my project memory directory?" and Claude will tell you the exact path.

**Step 2:** Create `MEMORY.md`:
```markdown
- [Memory Name](file.md) — one-line description of what's inside
```

Keep it under 200 lines — that's the auto-load limit.

**Step 3:** Save memories during sessions. After a session where you've established preferences or made decisions, ask Claude: "Save a memory about [what we just decided]."

---

## Memory Maintenance

Memory gets stale. A memory that names a file or function is a claim about the past — that file might have been renamed or deleted.

Good hygiene:
- Before acting on a memory that names a specific resource, verify it still exists
- Update memories when the underlying thing changes
- Delete memories that no longer apply — stale memories are worse than no memories
- Periodically review your `MEMORY.md` index and remove entries that are no longer relevant

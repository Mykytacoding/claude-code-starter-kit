# Architecture Explained

A deeper look at the Thin-Pointer Architecture and how the full Claude Code ecosystem is structured.

For the quick version, see [ARCHITECTURE.md](../ARCHITECTURE.md).

---

## Why Claude Needs Architecture at All

Claude Code is a powerful tool that ships in a stateless state. Every conversation starts fresh — no memory of your preferences, your project structure, your brand voice, or the decisions you've made. Left unaddressed, this means you spend the first 10 minutes of every session re-establishing context.

The solution isn't more powerful AI — it's better-structured inputs. Claude is only as useful as the context it has. This architecture is about giving it the right context at the right time, efficiently.

---

## Layer 1: CLAUDE.md — The Context Entry Point

`CLAUDE.md` is the first file Claude reads when you open a project. It's the entry point to your context.

**What it should contain:**
- What you're doing in this workspace
- Where your docs live (pointers, not content)
- What skills are available
- Working rules for this project

**What it should NOT contain:**
- Your actual brand voice (that goes in `docs/voice-guide.md`)
- Your full sheet structure (that goes in `docs/sheet-map.md`)
- Anything that changes regularly

The test: if a piece of information changes every few weeks, it belongs in a docs file — not in CLAUDE.md.

---

## Layer 2: Docs Files — The Knowledge Base

Docs files are where your actual knowledge lives. They're referenced by CLAUDE.md and read by skills when needed.

**Characteristics of a good docs file:**
- Focused on one topic (voice, sheet structure, workflow)
- Written for Claude to read, not for humans to scan
- Updated when the knowledge changes — not when the behavior changes
- Referenced by relative link, not copy-pasted

**The key insight:** Separating knowledge from instructions means you can update your brand voice without touching the skill that uses it. The skill is stable; the knowledge evolves.

---

## Layer 3: Skills — The Behavior Layer

Skills are the instructions layer. They tell Claude how to approach a task — what to read, what steps to follow, what to avoid.

**Characteristics of a good skill:**
- Under 100 lines
- Reads from docs files rather than containing knowledge
- Has an explicit "what NOT to do" section
- Ends with a check-in or confirmation prompt

**The thin-pointer test:** If you removed all the content from the docs files a skill references, would the skill still make sense? If yes, the skill is probably carrying knowledge it shouldn't.

---

## Layer 4: Settings — The Permission Envelope

`~/.claude/settings.json` defines what Claude can do autonomously and what requires your approval.

**Two lists:**
- `allow` — commands and tools Claude can run without asking
- `deny` — hard blocks that cannot be overridden

**Design principle:** Be generous on the allow list for safe, reversible operations (reading files, running git log, listing directories). Be surgical on the deny list — block the specific commands that could cause irreversible damage.

See [core/settings.json.template](../core/settings.json.template) for the curated baseline.

---

## Layer 5: MCP Connections — External Reach

MCPs extend Claude beyond your local files into external systems: GitHub, Google Sheets, Notion, and others.

**When to add an MCP:** When you regularly copy-paste data from a service into Claude conversations. If you're pasting the same Notion page or the same sheet data more than once a week, connect the MCP.

**When not to bother:** For occasional lookups. Copy-paste is fine for one-off requests.

See [mcp-guides/](../mcp-guides/) for step-by-step setup guides.

---

## How It All Connects

```
You open Claude Code in your project directory
        │
        ▼
Claude reads CLAUDE.md automatically
        │
        ├── "My voice is in docs/voice-guide.md"
        ├── "My sheet structure is in docs/sheet-map.md"
        └── "Skills available: /content-draft, /sheets-update"
        │
You invoke a skill: /content-draft
        │
        ▼
Claude reads skills/content-draft/SKILL.md
        │
        └── "Read docs/voice-guide.md before drafting"
        │
        ▼
Claude reads docs/voice-guide.md
        │
        ▼
Claude drafts in your actual brand voice
```

Three files, zero copy-paste, persistent across every session.

---

## Scaling Up

This kit gives you the foundation. A complete ecosystem also includes:

- **`CLAUDE.local.md`** — private behavioral contract that lives alongside CLAUDE.md but is git-ignored. Contains personal preferences, approval rules, and shortcuts that shouldn't be shared.
- **Memory system** — cross-session facts stored in `~/.claude/projects/<hash>/memory/`. Things that don't belong in code but need to persist: project decisions, preferences, active context.
- **Agent profiles** — for complex multi-step workflows, you bundle several skills into a structured SOP (Standard Operating Procedure) document. The agent profile sequences the skills, handles edge cases, and defines escalation rules.

The pattern scales: more docs files → more skills → agent profiles that sequence skills → memory that persists decisions across sessions.

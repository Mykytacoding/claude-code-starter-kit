# The Thin-Pointer Architecture

A pattern for giving Claude persistent memory without burning context window tokens.

---

## The Problem

Claude Code is stateless. Every conversation starts fresh. Your brand guidelines, spreadsheet structure, project goals, team preferences — Claude forgets all of it when the session ends.

The instinctive fix is to paste everything into `CLAUDE.md`:

```
❌ The Naive Approach
┌────────────────────────────────────────────┐
│ CLAUDE.md                                  │
│                                            │
│  ## Brand Voice                            │
│  We are professional but approachable...   │
│  [200 lines of brand guidelines]           │
│                                            │
│  ## Content Types                          │
│  We produce 4 formats: long-form...        │
│  [150 lines of format specs]               │
│                                            │
│  ## Workflow                               │
│  Step 1: Research. Step 2: Draft...        │
│  [100 lines of process]                    │
│                                            │
│  ## Team Members                           │
│  Sarah owns final approval...              │
│  [50 lines]                                │
│                                            │
│  ... and it keeps growing                  │
└────────────────────────────────────────────┘
```

This works at first. Then:
- The file grows without bound
- Claude burns context reading things it doesn't need for the current task
- When your brand voice changes, you edit a monolith
- You copy-paste this giant file to every new project

---

## The Pattern

Separate **what Claude should do** from **what Claude should know**.

```
✅ Thin-Pointer Architecture
┌─────────────────┐                  ┌──────────────────────┐
│ CLAUDE.md       │                  │ docs/voice-guide.md  │
│ (~30 lines)     │ ──── points to ► │                      │
│                 │                  │ Your actual brand    │
│ "My voice is    │                  │ voice, in detail,    │
│  in voice-guide │                  │ updated whenever     │
│  .md"           │                  │ you need             │
└────────┬────────┘                  └──────────┬───────────┘
         │                                      │
         │ invokes                              │ reads from
         ▼                                      │
┌─────────────────┐                             │
│ /content-draft  │ ──────── reads from ────────┘
│ skill           │
│ (~20 lines)     │
└─────────────────┘
```

**CLAUDE.md** stays small — it just tells Claude where to look.

**Docs files** hold the actual knowledge — brand voice, sheet structure, workflow steps, team context. These evolve independently of the instructions.

**Skills** are reusable procedures that read from docs files. They stay stable because they describe *how*, not *what*.

---

## A Concrete Example

Here's the `content-draft` skill in this kit:

```markdown
# Skill: Content Draft

Read [Voice Guide](../../docs/voice-guide.md) before drafting.

## What You Do
Draft a piece of content based on the user's brief.

## Steps
1. Read voice-guide.md — understand tone, audience, avoid-list
2. Read content-types.md — match the format to what they asked for
3. Draft. Don't summarize. Write the actual content.
4. End with: "Does this match the voice? Anything to adjust?"

## What Not to Do
- Don't use filler phrases from the avoid-list
- Don't change the format without asking
- Don't skip the voice-guide read even for "quick" drafts
```

Twenty lines. It works for every client because the *knowledge* is in `voice-guide.md`, not baked into the skill. When the voice changes, you update one doc file — not the skill.

---

## Why This Matters

| Concern | Naive CLAUDE.md | Thin-Pointer |
|---|---|---|
| Context cost | Loads everything, every session | Loads only what the active skill needs |
| Maintenance | Edit one giant file | Update the specific doc that changed |
| Portability | Copy-paste 500 lines | Copy the skill; point it at new docs |
| Clarity | Mixed instructions and knowledge | Instructions and knowledge are separate |

> **Your brand voice changes. The instructions for how to use it don't.**

---

## How This Kit Is Structured

```
claude-code-starter-kit/
│
├── CLAUDE.md              ← thin: points to skills and docs
│
├── skills/
│   └── content-draft/
│       └── SKILL.md       ← thin: describes how to draft
│
└── docs/
    └── voice-guide.md     ← real knowledge: your actual brand voice
```

Each use case in `use-cases/` follows the same pattern with its own docs and skills pre-wired to each other.

---

## The Full System

This kit implements the core of a larger pattern. A complete Claude Code ecosystem also includes:

- **`CLAUDE.local.md`** — your private behavioral contract (who you are, what Claude can auto-proceed on)
- **Memory system** — cross-session facts that don't belong in code (project decisions, preferences)
- **Settings + permissions** — what Claude can do autonomously vs. what needs your approval
- **MCP connections** — Claude accessing external tools (GitHub, Google Sheets, Notion)
- **Agent profiles** — multi-skill SOPs for recurring complex workflows

The starter kit gives you the foundation. The full architecture scales from there.

---

## Want This Set Up For Your Workflow?

Setting up this architecture for your specific use case — the right skills, the right docs structure, the right MCP connections — is what I do.

**[Work with me on Upwork →](https://www.upwork.com/freelancers/mykytacoding)**

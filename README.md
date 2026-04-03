# Claude Code Starter Kit

**A production-grade Claude Code setup system — deploy in 30 minutes.**

Give Claude persistent memory, custom skills, and the right MCP integrations for your workflow — without a computer science degree or hours of configuration.

---

## What This Is

Every time you start a new conversation with Claude, it forgets everything — your brand voice, your spreadsheet structure, your project goals. Most people solve this by pasting the same context into every session. That works until it doesn't: the context window fills up, the paste gets out of date, and Claude gives generic answers instead of tailored ones.

This kit solves that with a pattern called **Thin-Pointer Architecture**:

- A lightweight `CLAUDE.md` tells Claude where to find your knowledge
- Your actual knowledge lives in small, focused doc files that evolve independently
- Skills (slash commands) give Claude precise, reusable behaviors that read from those docs

The result: **Claude remembers everything relevant, uses zero extra context tokens doing it, and stays current as your work changes.**

This repo is both a working toolkit you can deploy and a reference implementation of the architecture.

---

## What You Get

| Component | What It Is |
|---|---|
| `core/` | Base `CLAUDE.md` template + `settings.json` with 30 curated permission rules |
| `use-cases/content-creator/` | Complete setup for content creators — brand voice, content calendar, 2 skills |
| `skills/` | 3 universal skills: project setup, daily review, content drafting |
| `mcp-guides/` | Step-by-step guides for GitHub MCP and Google Sheets MCP |
| `ARCHITECTURE.md` | Full explanation of the thin-pointer pattern with diagrams |

---

## Pick Your Use Case

### Content Creator
Connect Claude to your brand voice and content calendar. Draft posts, plan content, and stay consistent — without pasting guidelines every session.
→ [`use-cases/content-creator/`](./use-cases/content-creator/README.md)

### Spreadsheet Automation *(Phase 2)*
Let Claude read, update, and report on your Google Sheets. Map your sheet structure once; Claude navigates it from then on.
→ Coming soon

### General Productivity *(Phase 2)*
Task triage, weekly reviews, and workflow management tailored to how you actually work.
→ Coming soon

---

## Quick Start

1. Clone this repo: `git clone https://github.com/Mykytacoding/claude-code-starter-kit.git`
2. Choose a use case from `use-cases/`
3. Copy the use case folder into your project directory
4. Open `CLAUDE.md` and fill in the `[BRACKETED PLACEHOLDERS]`
5. Fill in your doc files (`docs/voice-guide.md`, etc.) with your actual content
6. Copy `core/settings.json.template` to `~/.claude/settings.json` (or merge with your existing one)
7. Open Claude Code in your project directory
8. Run `/project-setup` to verify everything is wired correctly

**That's it.** Claude now has persistent context for your project.

---

## The Architecture

The core insight: **separate what Claude should do from what Claude should know.**

```
❌ The Naive Approach — one giant CLAUDE.md
┌─────────────────────────────────────────────┐
│ CLAUDE.md (500+ lines)                      │
│  - Brand voice guidelines                   │
│  - Content formats                          │
│  - Project goals                            │
│  - Team members                             │
│  - Workflow instructions                    │
│  - ...everything else                       │
└─────────────────────────────────────────────┘
Problem: It grows forever. Claude burns context reading it.
Updates require editing a monolithic file.
```

```
✅ Thin-Pointer Architecture
┌─────────────────┐     points to      ┌──────────────────────┐
│ CLAUDE.md       │ ────────────────►  │ docs/voice-guide.md  │
│ (~30 lines)     │                    │ (your brand voice)   │
└─────────────────┘                    └──────────────────────┘
        │                                         ▲
        │ invokes                                 │ reads
        ▼                                         │
┌─────────────────┐     reads from     ┌──────────────────────┐
│ /content-draft  │ ────────────────►  │ docs/voice-guide.md  │
│ skill (~20 ln)  │                    │ (same file, always   │
└─────────────────┘                    │  up to date)         │
                                       └──────────────────────┘
```

Your brand voice changes. The instructions for how to use it don't.

→ Full explanation: [ARCHITECTURE.md](./ARCHITECTURE.md)

---

## MCP Integrations

Model Context Protocol (MCP) servers extend Claude's reach to external tools and services.

| Guide | What It Connects | Best For |
|---|---|---|
| [GitHub MCP](./mcp-guides/github.md) | GitHub repos, issues, PRs | Developers, project managers |
| [Google Sheets MCP](./mcp-guides/google-sheets.md) | Spreadsheets, data | Analysts, operations, freelancers |
| Notion MCP *(Phase 2)* | Notion pages, databases | Knowledge workers |
| Filesystem MCP *(Phase 2)* | Local files and folders | Power users, automation |

---

## Want This Set Up For You?

I set up Claude Code ecosystems for freelancers, creators, and small teams — custom skills, MCP integrations, and persistent memory tuned to your specific workflow.

**[Hire me on Upwork →](https://www.upwork.com/freelancers/mykytacoding)**

Typical engagement: 1–2 hours. You end the call with a working system, not a to-do list.

---

## About the Author

I'm Mykyta — a data specialist and automation builder with a background in Python, SQL, and AI workflow tooling. I've been building on top of Claude Code since early access, and this kit is the distillation of what actually works in production. I built this system for my own work first; now I help others deploy it.

[GitHub](https://github.com/Mykytacoding) · [Upwork](https://www.upwork.com/freelancers/mykytacoding)

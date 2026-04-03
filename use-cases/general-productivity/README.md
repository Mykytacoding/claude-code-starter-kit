# Use Case: General Productivity

Task triage, weekly reviews, and workflow management — tuned to how you actually work, not a generic productivity system.

---

## What This Template Does

- Documents your tools, task system, and workflows so Claude doesn't ask the same setup questions every session
- Gives Claude two skills: `/task-triage` and `/weekly-review`
- Templates for mapping your tools and capturing your actual workflows

---

## Prerequisites

- Claude Code installed
- Optional but recommended: MCP for your task management tool (Notion, GitHub, Google Sheets) — connect whichever one you use

---

## Setup (5 steps)

1. **Copy this folder** into your project or home directory
2. **Open `CLAUDE.md`** and replace all `[BRACKETED PLACEHOLDERS]`
3. **Fill in `docs/tools-map.md`** — document the tools you use and where things live
4. **Fill in `docs/workflows.md`** — document how you actually work (daily routine, review cadence, decision rules)
5. **Open Claude Code** in that directory

---

## First Thing to Try

After setup, open Claude Code and run:

```
/task-triage What should I focus on today?
```

Claude will read your workflows to understand your priorities system, then help you identify the 3 most important things to move.

---

## Skills Included

| Skill | What It Does | How to Use |
|---|---|---|
| `/task-triage` | Identify today's most important tasks, surface blockers | `/task-triage [optional context about your day]` |
| `/weekly-review` | Review the past week, plan the next one | `/weekly-review` |

---

## Files in This Template

```
general-productivity/
├── CLAUDE.md                       ← load this in your project
├── skills/
│   ├── task-triage/SKILL.md        ← reads workflows.md
│   └── weekly-review/SKILL.md      ← reads tools-map.md + workflows.md
└── docs/
    ├── tools-map.md                ← YOUR tools and where things live
    └── workflows.md                ← YOUR actual workflows and routines
```

---

## Customizing Further

- Add skills for specific recurring workflows (planning sessions, standup prep, end-of-day wrap)
- Connect an MCP to your task manager so Claude can read tasks directly instead of you pasting them
- Add a `docs/goals.md` file for quarterly/annual goals and point the skills at it

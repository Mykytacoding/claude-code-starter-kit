# Use Case: Spreadsheet Automation

Let Claude read, update, and report on your Google Sheets — without copy-pasting data into every conversation.

---

## Hard Prerequisite: Google Sheets MCP

**This use case requires the Google Sheets MCP to be installed and authenticated before setup.**

Without it, Claude cannot access your spreadsheets directly. Follow the full setup guide here:

→ **[mcp-guides/google-sheets.md](../../mcp-guides/google-sheets.md)**

Complete that guide and verify Claude can list your sheets before continuing.

---

## What This Template Does

- Documents your spreadsheet structure so Claude navigates it without you describing it each time
- Gives Claude two skills: `/sheets-update` and `/data-report`
- Templates for mapping your sheets and documenting your automation patterns

---

## Prerequisites

- [ ] Google Sheets MCP installed and verified (see link above)
- [ ] Claude Code installed
- [ ] The spreadsheet(s) you want to automate are accessible from your Google account

---

## Setup (5 steps)

1. **Install Google Sheets MCP** — follow [mcp-guides/google-sheets.md](../../mcp-guides/google-sheets.md) first
2. **Copy this folder** into your project directory
3. **Open `CLAUDE.md`** and replace all `[BRACKETED PLACEHOLDERS]`
4. **Fill in `docs/sheet-map.md`** — document your spreadsheet structure (sheet names, columns, what each tab is for)
5. **Fill in `docs/automation-patterns.md`** — document the recurring tasks you want Claude to handle

---

## First Thing to Try

After setup, open Claude Code and run:

```
/sheets-update Check the status column in [your sheet name] and tell me what's incomplete
```

Claude will read your sheet map to understand the structure, then access the sheet directly.

---

## Skills Included

| Skill | What It Does | How to Use |
|---|---|---|
| `/sheets-update` | Read and update cell values, mark items complete, add rows | `/sheets-update [what to check or update]` |
| `/data-report` | Summarize sheet data, surface patterns, generate a status report | `/data-report [which sheet or timeframe]` |

---

## Files in This Template

```
spreadsheet-automation/
├── CLAUDE.md                       ← load this in your project
├── skills/
│   ├── sheets-update/SKILL.md      ← reads sheet-map.md
│   └── data-report/SKILL.md        ← reads sheet-map.md + automation-patterns.md
└── docs/
    ├── sheet-map.md                ← YOUR spreadsheet structure (fill this in)
    └── automation-patterns.md      ← YOUR recurring tasks (fill this in)
```

---

## Customizing Further

- Add more sheets to `docs/sheet-map.md` as your tracking grows
- Document new automation patterns in `docs/automation-patterns.md` as you discover them
- Add skills for specific recurring reports you run regularly

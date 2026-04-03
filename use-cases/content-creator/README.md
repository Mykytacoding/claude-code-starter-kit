# Use Case: Content Creator

Connect Claude to your brand voice and content calendar. Draft posts, plan content, and stay on-brand — without pasting your guidelines into every session.

---

## What This Template Does

- Loads your brand voice automatically before every draft
- Gives Claude two skills: `/content-draft` and `/content-calendar`
- Keeps your content type formats and posting cadence in docs Claude can reference any time

---

## Prerequisites

- Claude Code installed (`npm install -g @anthropic-ai/claude-code`)
- A project folder you'll work from (your content workspace)

---

## Setup (5 steps)

1. **Copy this folder** into your content project directory
2. **Open `CLAUDE.md`** and replace every `[BRACKETED PLACEHOLDER]` with your real info
3. **Fill in `docs/voice-guide.md`** — this is the most important file. Read the instructions at each section and write your actual brand voice
4. **Fill in `docs/content-types.md`** — document the content formats you produce
5. **Open Claude Code** in your project directory — it will load the CLAUDE.md automatically

---

## First Thing to Try

After setup, open Claude Code and run:

```
/content-draft Write a LinkedIn post about [any topic you're working on]
```

Claude will read your voice guide first, then draft in your actual brand voice. If it misses the mark, update `docs/voice-guide.md` — not the skill.

---

## Skills Included

| Skill | What It Does | How to Use |
|---|---|---|
| `/content-draft` | Draft any content format in your brand voice | `/content-draft [brief or topic]` |
| `/content-calendar` | Plan content batches by format and date | `/content-calendar [timeframe]` |

---

## Files in This Template

```
content-creator/
├── CLAUDE.md                      ← load this in your project
├── skills/
│   ├── content-draft/SKILL.md     ← reads voice-guide.md
│   └── content-calendar/SKILL.md  ← reads content-types.md
└── docs/
    ├── voice-guide.md             ← YOUR brand voice (fill this in)
    └── content-types.md           ← YOUR content formats (fill this in)
```

---

## Customizing Further

- Add more content types to `docs/content-types.md` as you develop new formats
- Update `docs/voice-guide.md` whenever your brand voice evolves — no need to touch the skills
- Add skills for platforms you use heavily (Twitter threads, email newsletters, YouTube scripts)

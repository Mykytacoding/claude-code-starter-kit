# Use Cases

Each use case is a ready-to-deploy Claude Code setup for a specific type of work. Pick the one that matches how you work, copy it into your project directory, and fill in the blanks.

---

## Available Use Cases

| Use Case | Who It's For | What It Includes |
|---|---|---|
| [Content Creator](./content-creator/README.md) | Creators, marketers, writers | Brand voice guide, content types, 2 skills |
| Spreadsheet Automation *(Phase 2)* | Analysts, ops, freelancers | Sheet map, automation patterns, 2 skills |
| General Productivity *(Phase 2)* | Anyone | Task workflows, weekly review, 2 skills |

---

## How to Use a Template

1. Copy the use case folder into your project directory
2. Open `CLAUDE.md` and replace the `[BRACKETED PLACEHOLDERS]`
3. Fill in the `docs/` files with your actual knowledge
4. Open Claude Code in that directory

The skills are pre-wired to the docs files — Claude will read the right doc automatically when you invoke a skill.

---

## How Use Cases Are Structured

```
[use-case]/
├── README.md        ← what this template does and how to set it up
├── CLAUDE.md        ← context file to copy into your project
├── skills/          ← skills specific to this use case
│   └── [skill]/
│       └── SKILL.md
└── docs/            ← knowledge templates for you to fill in
    └── *.md
```

The `CLAUDE.md` points to the `docs/` files. The skills read from `docs/`. You only need to fill in the docs.

---

## Adding Your Own Use Case

If your workflow doesn't fit an existing template:

1. Copy the `content-creator/` folder as a starting point
2. Rename it and update `CLAUDE.md` with your context
3. Replace or add `docs/` files for your knowledge domains
4. Update or add skills to read from your new docs

The pattern is always the same: thin CLAUDE.md + thin skills + detailed docs.

# Skill: Project Setup

Scaffold a new project: create the folder structure, initialize git, connect to GitHub, and get it to a state where real work can begin.

## Gather Requirements First

Before creating anything, ask:
1. What is the project name? (used for the folder and repo name — use hyphens, no spaces)
2. What type of project? (Python script / web app / content workspace / data / other)
3. Public or private GitHub repo?
4. Any specific folders or files needed beyond the defaults?

Don't start creating files until you have answers to 1 and 3. You can infer the rest.

## Default Structure

Create this structure under the user's specified base directory:

```
[project-name]/
├── CLAUDE.md          ← project context (copy from core/CLAUDE.md.template)
├── .gitignore         ← appropriate for the project type
└── README.md          ← one paragraph: what this is and why it exists
```

For Python projects, also add:
```
├── src/               ← source code goes here
└── requirements.txt   ← empty, ready to fill
```

## Git + GitHub Steps

```bash
cd [project-path]
git init
git add .
git commit -m "Initial project scaffold"
gh repo create [project-name] --[public|private] --source=. --remote=origin --push
```

Confirm the repo visibility (public/private) with the user before creating. Default is **private** unless they say otherwise.

## CLAUDE.md

Copy `core/CLAUDE.md.template` into the new project and fill in:
- Project name and one-line description
- Working directory path
- Any external services or tools involved

Leave the bracketed placeholders for the user to fill in — note which ones need their input.

## Confirm and Hand Off

Report back:
- Folder created at: [path]
- GitHub repo live at: [URL]
- Files created: [list]
- What the user needs to fill in: [list of placeholders in CLAUDE.md]

End with: "Ready to start building?"

## Before Creating a Public Repo

Always confirm: "I'm about to create a **public** GitHub repo at github.com/[username]/[name]. Is that right, or should it be private?"

Don't skip this even if they said public earlier. One extra confirmation prevents a hard-to-fix mistake.

# Install

Two automated setup scripts and a manual path. Pick what works for your system.

---

## Option 1: Automated (Mac / Linux)

```bash
chmod +x install/setup.sh
./install/setup.sh
```

The script will:
1. Ask where to install (your project directory)
2. Show a menu to select which use case(s) to install
3. Back up any existing `CLAUDE.md` or `settings.json` before overwriting
4. Copy the selected use case files and install skills to `~/.claude/skills/`
5. Optionally install the settings template to `~/.claude/settings.json`

---

## Option 2: Automated (Windows PowerShell)

```powershell
.\install\setup.ps1
```

Same interactive flow as the bash script. If you get an execution policy error:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then re-run the script.

---

## Option 3: Manual Install

If you prefer to copy files yourself:

**1. Copy the use case you want:**
```
use-cases/content-creator/  →  your-project/
```
This gives you `CLAUDE.md` and the `docs/` and `skills/` folders.

**2. Install skills to Claude config:**
```
use-cases/content-creator/skills/content-draft/  →  ~/.claude/skills/content-draft/
use-cases/content-creator/skills/content-calendar/  →  ~/.claude/skills/content-calendar/
```

**Windows paths:**
```
C:\Users\<you>\.claude\skills\content-draft\
```

**3. Install settings template (optional):**
```
core/settings.json.template  →  ~/.claude/settings.json
```
If `settings.json` already exists, merge the rules rather than overwriting.

**4. Fill in the files:**
- Open `CLAUDE.md` and replace `[BRACKETED PLACEHOLDERS]`
- Fill in `docs/*.md` with your actual content

---

## What Gets Installed Where

| File | Destination |
|------|-------------|
| `CLAUDE.md` | Your project directory (root) |
| `docs/*.md` | Your project directory `/docs/` |
| `skills/*/` | `~/.claude/skills/` |
| `settings.json.template` | `~/.claude/settings.json` (optional) |

Skills go to `~/.claude/skills/` so they're available in any Claude Code session — not just this project.

#!/usr/bin/env bash
# Claude Code Starter Kit — Setup Script (Mac / Linux)
# https://github.com/Mykytacoding/claude-code-starter-kit

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
CLAUDE_CONFIG_DIR="${HOME}/.claude"

# ── Colors ─────────────────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

header() { echo -e "\n${BOLD}${CYAN}$1${RESET}"; }
success() { echo -e "${GREEN}✓ $1${RESET}"; }
warn()    { echo -e "${YELLOW}⚠ $1${RESET}"; }
info()    { echo -e "  $1"; }

# ── Safe copy: backs up existing files before overwriting ──────────────────────
safe_copy() {
  local src="$1"
  local dest="$2"
  if [[ -e "$dest" ]]; then
    local backup="${dest}.backup-${TIMESTAMP}"
    mv "$dest" "$backup"
    warn "Existing file backed up to: $(basename "$backup")"
  fi
  cp -r "$src" "$dest"
  success "Copied: $(basename "$dest")"
}

# ── Banner ─────────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}Claude Code Starter Kit — Setup${RESET}"
echo "────────────────────────────────────────"
echo ""
echo "This script will:"
echo "  1. Ask which use case to install"
echo "  2. Copy files to your project directory"
echo "  3. Back up any existing files before overwriting"
echo "  4. Optionally merge settings.json into ~/.claude/"
echo ""

# ── Step 1: Target directory ───────────────────────────────────────────────────
header "Step 1: Where should the files be installed?"
echo "Enter the full path to your project directory."
echo "(Leave blank to install in the current directory: $(pwd))"
echo ""
read -rp "Project directory: " PROJECT_DIR
PROJECT_DIR="${PROJECT_DIR:-$(pwd)}"

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo ""
  read -rp "Directory doesn't exist. Create it? (y/n): " CREATE_DIR
  if [[ "$CREATE_DIR" =~ ^[Yy]$ ]]; then
    mkdir -p "$PROJECT_DIR"
    success "Created: $PROJECT_DIR"
  else
    echo "Exiting — please create the directory first."
    exit 1
  fi
fi

# ── Step 2: Use case selection ─────────────────────────────────────────────────
header "Step 2: Which use case do you want to install?"
echo ""
echo "  1) Content Creator"
echo "     Brand voice guide, content calendar, 2 skills (content-draft, content-calendar)"
echo ""
echo "  2) Spreadsheet Automation"
echo "     Sheet map, automation patterns, 2 skills (sheets-update, data-report)"
echo "     NOTE: Requires Google Sheets MCP — see mcp-guides/google-sheets.md"
echo ""
echo "  3) General Productivity"
echo "     Tools map, workflows doc, 2 skills (task-triage, weekly-review)"
echo ""
echo "  4) All three"
echo ""

while true; do
  read -rp "Enter 1, 2, 3, or 4: " USE_CASE_CHOICE
  case "$USE_CASE_CHOICE" in
    1|2|3|4) break ;;
    *) echo "Please enter 1, 2, 3, or 4." ;;
  esac
done

# ── Step 3: Install use case files ────────────────────────────────────────────
install_use_case() {
  local use_case="$1"
  local use_case_src="${REPO_DIR}/use-cases/${use_case}"
  local use_case_dest="${PROJECT_DIR}/${use_case}"

  header "Installing: ${use_case}"

  # CLAUDE.md — goes to project root
  safe_copy "${use_case_src}/CLAUDE.md" "${PROJECT_DIR}/CLAUDE.md"

  # docs/ folder
  if [[ -d "${use_case_src}/docs" ]]; then
    mkdir -p "${PROJECT_DIR}/docs"
    for doc in "${use_case_src}/docs/"*.md; do
      safe_copy "$doc" "${PROJECT_DIR}/docs/$(basename "$doc")"
    done
  fi

  # skills/ folder — install to ~/.claude/skills/
  if [[ -d "${use_case_src}/skills" ]]; then
    mkdir -p "${CLAUDE_CONFIG_DIR}/skills"
    for skill_dir in "${use_case_src}/skills/"/*/; do
      skill_name="$(basename "$skill_dir")"
      safe_copy "$skill_dir" "${CLAUDE_CONFIG_DIR}/skills/${skill_name}"
    done
    info "Skills installed to: ${CLAUDE_CONFIG_DIR}/skills/"
  fi
}

case "$USE_CASE_CHOICE" in
  1) install_use_case "content-creator" ;;
  2) install_use_case "spreadsheet-automation" ;;
  3) install_use_case "general-productivity" ;;
  4)
    install_use_case "content-creator"
    install_use_case "spreadsheet-automation"
    install_use_case "general-productivity"
    ;;
esac

# ── Step 4: Core settings.json ────────────────────────────────────────────────
header "Step 4: Install settings.json template?"
echo ""
echo "The core/settings.json.template has 30 curated permission rules."
echo "Target: ${CLAUDE_CONFIG_DIR}/settings.json"
echo ""

SETTINGS_CHOICE="n"
read -rp "Install? (y/n, default n): " SETTINGS_CHOICE
if [[ "$SETTINGS_CHOICE" =~ ^[Yy]$ ]]; then
  safe_copy "${REPO_DIR}/core/settings.json.template" "${CLAUDE_CONFIG_DIR}/settings.json"
else
  info "Skipped. You can copy it manually: core/settings.json.template → ~/.claude/settings.json"
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────────────"
echo -e "${BOLD}${GREEN}Setup complete!${RESET}"
echo ""
echo "Next steps:"
echo "  1. Open CLAUDE.md in ${PROJECT_DIR} and fill in the [BRACKETED PLACEHOLDERS]"
echo "  2. Fill in the docs/ files with your actual content"
echo "  3. Open Claude Code in ${PROJECT_DIR}"
echo "  4. Run: /project-setup to verify everything is wired"
echo ""
if [[ "$USE_CASE_CHOICE" == "2" ]]; then
  echo -e "${YELLOW}Reminder: Spreadsheet Automation requires Google Sheets MCP.${RESET}"
  echo "Setup guide: mcp-guides/google-sheets.md"
  echo ""
fi

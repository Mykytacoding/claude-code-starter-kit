# Claude Code Starter Kit — Setup Script (Windows PowerShell)
# https://github.com/Mykytacoding/claude-code-starter-kit
#
# Run from PowerShell: .\install\setup.ps1

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir
$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$ClaudeConfigDir = "$env:USERPROFILE\.claude"

# ── Helpers ────────────────────────────────────────────────────────────────────
function Write-Header  { param($msg) Write-Host "`n$msg" -ForegroundColor Cyan }
function Write-Success { param($msg) Write-Host "  OK  $msg" -ForegroundColor Green }
function Write-Warn    { param($msg) Write-Host "  !   $msg" -ForegroundColor Yellow }
function Write-Info    { param($msg) Write-Host "      $msg" }

# Safe copy: backs up existing files before overwriting
function Invoke-SafeCopy {
  param(
    [string]$Source,
    [string]$Destination
  )
  if (Test-Path $Destination) {
    $BackupPath = "${Destination}.backup-${Timestamp}"
    Move-Item -Path $Destination -Destination $BackupPath
    Write-Warn "Existing file backed up to: $(Split-Path -Leaf $BackupPath)"
  }
  if (Test-Path $Source -PathType Container) {
    Copy-Item -Path $Source -Destination $Destination -Recurse
  } else {
    Copy-Item -Path $Source -Destination $Destination
  }
  Write-Success "Copied: $(Split-Path -Leaf $Destination)"
}

# ── Banner ─────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "Claude Code Starter Kit — Setup" -ForegroundColor White
Write-Host "----------------------------------------"
Write-Host ""
Write-Host "This script will:"
Write-Host "  1. Ask which use case to install"
Write-Host "  2. Copy files to your project directory"
Write-Host "  3. Back up any existing files before overwriting"
Write-Host "  4. Optionally install settings.json to ~/.claude/"
Write-Host ""

# ── Step 1: Target directory ───────────────────────────────────────────────────
Write-Header "Step 1: Where should the files be installed?"
Write-Host "Enter the full path to your project directory."
Write-Host "(Leave blank to install in the current directory: $(Get-Location))"
Write-Host ""
$ProjectDir = Read-Host "Project directory"
if ([string]::IsNullOrWhiteSpace($ProjectDir)) {
  $ProjectDir = (Get-Location).Path
}

if (-not (Test-Path $ProjectDir)) {
  Write-Host ""
  $CreateDir = Read-Host "Directory doesn't exist. Create it? (y/n)"
  if ($CreateDir -match '^[Yy]$') {
    New-Item -ItemType Directory -Path $ProjectDir | Out-Null
    Write-Success "Created: $ProjectDir"
  } else {
    Write-Host "Exiting — please create the directory first."
    exit 1
  }
}

# ── Step 2: Use case selection ─────────────────────────────────────────────────
Write-Header "Step 2: Which use case do you want to install?"
Write-Host ""
Write-Host "  1) Content Creator"
Write-Host "     Brand voice guide, content calendar, 2 skills"
Write-Host ""
Write-Host "  2) Spreadsheet Automation"
Write-Host "     Sheet map, automation patterns, 2 skills"
Write-Host "     NOTE: Requires Google Sheets MCP - see mcp-guides/google-sheets.md"
Write-Host ""
Write-Host "  3) General Productivity"
Write-Host "     Tools map, workflows doc, 2 skills"
Write-Host ""
Write-Host "  4) All three"
Write-Host ""

do {
  $UseCaseChoice = Read-Host "Enter 1, 2, 3, or 4"
} while ($UseCaseChoice -notin @('1','2','3','4'))

# ── Step 3: Install use case files ────────────────────────────────────────────
function Install-UseCase {
  param([string]$UseCaseName)

  $UseCaseSrc = Join-Path $RepoDir "use-cases\$UseCaseName"
  Write-Header "Installing: $UseCaseName"

  # CLAUDE.md — goes to project root
  Invoke-SafeCopy -Source (Join-Path $UseCaseSrc "CLAUDE.md") -Destination (Join-Path $ProjectDir "CLAUDE.md")

  # docs/ folder
  $DocsDir = Join-Path $UseCaseSrc "docs"
  if (Test-Path $DocsDir) {
    $DestDocs = Join-Path $ProjectDir "docs"
    if (-not (Test-Path $DestDocs)) { New-Item -ItemType Directory -Path $DestDocs | Out-Null }
    Get-ChildItem -Path $DocsDir -Filter "*.md" | ForEach-Object {
      Invoke-SafeCopy -Source $_.FullName -Destination (Join-Path $DestDocs $_.Name)
    }
  }

  # skills/ — install to ~/.claude/skills/
  $SkillsDir = Join-Path $UseCaseSrc "skills"
  if (Test-Path $SkillsDir) {
    $DestSkills = Join-Path $ClaudeConfigDir "skills"
    if (-not (Test-Path $DestSkills)) { New-Item -ItemType Directory -Path $DestSkills | Out-Null }
    Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
      Invoke-SafeCopy -Source $_.FullName -Destination (Join-Path $DestSkills $_.Name)
    }
    Write-Info "Skills installed to: $DestSkills"
  }
}

switch ($UseCaseChoice) {
  '1' { Install-UseCase "content-creator" }
  '2' { Install-UseCase "spreadsheet-automation" }
  '3' { Install-UseCase "general-productivity" }
  '4' {
    Install-UseCase "content-creator"
    Install-UseCase "spreadsheet-automation"
    Install-UseCase "general-productivity"
  }
}

# ── Step 4: Core settings.json ────────────────────────────────────────────────
Write-Header "Step 4: Install settings.json template?"
Write-Host ""
Write-Host "The core/settings.json.template has 30 curated permission rules."
Write-Host "Target: $ClaudeConfigDir\settings.json"
Write-Host ""
$SettingsChoice = Read-Host "Install? (y/n, default n)"
if ($SettingsChoice -match '^[Yy]$') {
  $SettingsSrc = Join-Path $RepoDir "core\settings.json.template"
  Invoke-SafeCopy -Source $SettingsSrc -Destination (Join-Path $ClaudeConfigDir "settings.json")
} else {
  Write-Info "Skipped. Copy manually: core\settings.json.template -> $ClaudeConfigDir\settings.json"
}

# ── Done ──────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "----------------------------------------"
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open CLAUDE.md in $ProjectDir and fill in the [BRACKETED PLACEHOLDERS]"
Write-Host "  2. Fill in the docs/ files with your actual content"
Write-Host "  3. Open Claude Code in $ProjectDir"
Write-Host "  4. Run: /project-setup to verify everything is wired"
Write-Host ""
if ($UseCaseChoice -eq '2') {
  Write-Host "Reminder: Spreadsheet Automation requires Google Sheets MCP." -ForegroundColor Yellow
  Write-Host "Setup guide: mcp-guides\google-sheets.md"
  Write-Host ""
}

# MCP Guide: Google Sheets

Connect Claude Code to Google Sheets so it can read, update, and analyze your spreadsheets directly — without export/import cycles.

---

## What This Connects

The Google Sheets MCP server gives Claude access to your spreadsheet data via the Google Sheets API. Claude can read cell ranges, update values, create sheets, and work with your data in real time.

---

## When You Want This

- You track operations, tasks, or budgets in Sheets and want Claude to read and update them
- You want Claude to analyze data in a spreadsheet without copy-pasting into chat
- You want Claude to generate reports or summaries from live sheet data
- You do repetitive data entry or formatting that Claude could handle

---

## Prerequisites

- [ ] Claude Code installed
- [ ] A Google account with access to the spreadsheet(s) you want to connect
- [ ] Node.js installed (for `npx`)
- [ ] A Google Cloud project with the Sheets API enabled (see setup below)

---

## Authentication Setup

Google Sheets requires OAuth2 or a service account. The easiest path for personal use is OAuth2.

**Step 1: Create a Google Cloud project**
1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Create a new project (or use an existing one)
3. Go to APIs & Services → Library → search "Google Sheets API" → Enable it
4. Also enable "Google Drive API"

**Step 2: Create OAuth2 credentials**
1. Go to APIs & Services → Credentials → Create Credentials → OAuth client ID
2. Application type: **Desktop app**
3. Name it anything (e.g., "Claude MCP")
4. Download the credentials JSON file — save it as `credentials.json` somewhere safe (not in a git repo)

---

## Installation

```bash
npx @modelcontextprotocol/server-gdrive
```

This handles both Google Drive and Sheets access.

---

## Configuration

Add this to `~/.claude/mcp.json` (Mac/Linux) or `C:\Users\<you>\.claude\mcp.json` (Windows):

```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gdrive"],
      "env": {
        "GDRIVE_CREDENTIALS_PATH": "/path/to/your/credentials.json"
      }
    }
  }
}
```

Replace `/path/to/your/credentials.json` with the actual path to the file you downloaded.

**First run:** When you first use it, Claude will prompt you to authorize via browser. Complete the OAuth flow — it stores a token locally so you only need to do this once.

---

## Verify It Works

Open Claude Code and run:

```
List my recent Google Sheets files.
```

Claude should return a list of your recent spreadsheets. If it prompts for authorization, complete the browser flow.

---

## Common Issues

**"Access denied" on a specific sheet**
- Make sure you're logged into the right Google account
- Check that the sheet is owned by or shared with that account

**OAuth flow doesn't complete**
- Make sure the credentials.json file path is correct in mcp.json
- Try opening the auth URL manually if it doesn't auto-open

**"Sheets API not enabled" error**
- Go back to Google Cloud Console and confirm both Google Sheets API and Google Drive API are enabled

**Data appears stale**
- The MCP reads live data — if the sheet was recently updated, try re-running the request

---

## What's Possible

Once connected, try these prompts:

```
Read the data in Sheet1 of my spreadsheet "[Sheet Name]" and summarize what's there.
```

```
Update cell B5 in "[Sheet Name]" to "Completed".
```

```
In my "[Sheet Name]" spreadsheet, find all rows where column C is "Pending" and list them.
```

```
Read my content calendar spreadsheet and tell me what's scheduled for next week.
```

```
Add a new row to the "Tasks" sheet with: Task="Update homepage copy", Owner="Sarah", Due="2026-05-01".
```

```
Calculate the total of all values in column D of my "[Sheet Name]" spreadsheet.
```

# MCP Guides

Model Context Protocol (MCP) servers extend Claude Code with access to external tools and services. These guides walk through installation, configuration, and verification for each one.

---

## What MCPs Are

By default, Claude Code can read your local files and run terminal commands. MCPs give it access to external systems — GitHub, Google Sheets, Notion, and others — so Claude can interact with them directly instead of you having to copy-paste data back and forth.

---

## When You Need an MCP (vs. When You Don't)

**Use an MCP when:**
- You frequently reference data from an external service (reading Sheets, checking GitHub issues)
- You want Claude to write back to an external service (updating a cell, creating an issue)
- The copy-paste cycle is slowing you down

**Skip the MCP when:**
- You only occasionally reference something — just paste it in the chat
- The service doesn't have a reliable MCP server yet
- Setup complexity isn't worth the time savings for your use case

---

## Guides in This Kit

| Guide | Service | Best For |
|---|---|---|
| [GitHub](./github.md) | GitHub repos, issues, PRs | Developers, project managers |
| [Google Sheets](./google-sheets.md) | Spreadsheets, data | Analysts, operations, freelancers |
| Notion *(Phase 2)* | Notion pages, databases | Knowledge workers |
| Filesystem *(Phase 2)* | Local files and folders | Power users, automation |

---

## How MCPs Are Configured

All MCPs are configured in a single JSON file:

- **Mac/Linux:** `~/.claude/mcp.json`
- **Windows:** `C:\Users\<you>\.claude\mcp.json`

Each guide includes the exact JSON snippet to add. If you're installing multiple MCPs, merge their `mcpServers` entries into the same file:

```json
{
  "mcpServers": {
    "github": { ... },
    "gdrive": { ... }
  }
}
```

Restart Claude Code after any change to `mcp.json`.

---

## Security Note

MCP config files often contain API tokens and credentials. Do not commit `mcp.json` to git. Add it to your `.gitignore`:

```
.claude/mcp.json
```

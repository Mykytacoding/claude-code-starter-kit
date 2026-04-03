# MCP Guide: Notion

Connect Claude Code to Notion so it can read pages, query databases, and create or update content — without leaving your conversation.

---

## What This Connects

The Notion MCP server gives Claude access to your Notion workspace via the Notion API. Claude can read pages, query database records, filter and sort entries, create new pages, and update existing content.

---

## When You Want This

- Your tasks, projects, or notes live in Notion and you want Claude to read them directly
- You want Claude to create or update Notion pages from within a conversation
- You use Notion as a knowledge base and want Claude to search it without copy-pasting

---

## Prerequisites

- [ ] Claude Code installed
- [ ] A Notion account
- [ ] A Notion integration token (Internal Integration Secret)
- [ ] The pages or databases you want to connect shared with the integration
- [ ] Node.js installed (for `npx`)

---

## Authentication Setup

Notion uses Internal Integration tokens — no OAuth flow needed.

**Step 1: Create an integration**
1. Go to [notion.so/my-integrations](https://www.notion.so/my-integrations)
2. Click **New integration**
3. Name it (e.g., "Claude MCP"), select your workspace, click Submit
4. Copy the **Internal Integration Secret** — starts with `secret_`

**Step 2: Share pages with the integration**
Notion doesn't grant access to your entire workspace automatically. You must share each database or page:
1. Open the Notion page or database
2. Click **Share** (top right) → **Invite**
3. Search for your integration name → click to share

Repeat for every database or page Claude needs to access.

---

## Installation

```bash
npx @notionhq/notion-mcp-server
```

---

## Configuration

Add this to `~/.claude/mcp.json` (Mac/Linux) or `C:\Users\<you>\.claude\mcp.json` (Windows):

```json
{
  "mcpServers": {
    "notion": {
      "command": "npx",
      "args": ["-y", "@notionhq/notion-mcp-server"],
      "env": {
        "OPENAPI_MCP_HEADERS": "{\"Authorization\": \"Bearer secret_your_token_here\", \"Notion-Version\": \"2022-06-28\"}"
      }
    }
  }
}
```

Replace `secret_your_token_here` with your integration secret.

---

## Verify It Works

Open Claude Code and run:

```
Search my Notion workspace for pages about [any topic you have notes on].
```

Claude should return matching pages. If it returns nothing or errors, check that the target pages are shared with your integration.

---

## Common Issues

**"Object not found" for a database**
- The database hasn't been shared with your integration — go to Notion, open the database, Share → Invite your integration

**Claude finds pages but can't read content**
- Sub-pages need to be shared separately — sharing a parent page doesn't automatically grant access to children in all cases

**Token format error**
- Make sure the `Authorization` value includes the word `Bearer ` before your token
- Make sure the JSON inside the string is valid (double-check escaping)

**Integration not appearing in Notion's Share menu**
- Make sure you selected the correct workspace when creating the integration

---

## What's Possible

Once connected, try these prompts:

```
List all pages in my [Database Name] database where Status is "In Progress".
```

```
Read the page titled "[Page Name]" in my Notion workspace and summarize it.
```

```
Create a new page in my [Database Name] database with title "Q2 Planning" and status "Todo".
```

```
Find all tasks in my Notion task database that are due this week.
```

```
Search my Notion workspace for everything related to "[topic]".
```

```
Update the Status property of "[Page Name]" in Notion from "In Progress" to "Done".
```

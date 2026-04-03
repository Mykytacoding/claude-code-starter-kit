# MCP Guide: GitHub

Connect Claude Code to GitHub so it can read repos, manage issues, review PRs, and search code — without you copy-pasting file contents into chat.

---

## What This Connects

The GitHub MCP server gives Claude direct access to GitHub's API. Claude can read file contents, list open PRs, create issues, search code, and more — all from within a conversation.

---

## When You Want This

- You want Claude to review a PR without pasting the diff yourself
- You want Claude to search your codebase without having it cloned locally
- You want Claude to create or update issues from within a conversation
- You work on multiple repos and want Claude to cross-reference them

---

## Prerequisites

- [ ] Claude Code installed
- [ ] A GitHub account
- [ ] A GitHub Personal Access Token (PAT) with repo scope
- [ ] Node.js installed (for `npx`)

**Create a PAT:** GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token. Check `repo` scope. Copy it — you won't see it again.

---

## Installation

```bash
npx @modelcontextprotocol/server-github
```

This downloads and runs the MCP server. You don't need to install it globally — `npx` handles it.

---

## Configuration

Add this to your Claude Code MCP config file. Location:
- **Mac/Linux:** `~/.claude/mcp.json`
- **Windows:** `C:\Users\<you>\.claude\mcp.json`

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    }
  }
}
```

Replace `your_token_here` with the PAT you created. Do not commit this file to git — it contains your token.

---

## Verify It Works

Open Claude Code and run:

```
What are the open issues in [your-username]/[your-repo]?
```

Claude should list the open issues without you having to provide any content. If it can't, check the token and restart Claude Code.

---

## Common Issues

**"Could not authenticate" error**
- Check that your PAT has `repo` scope
- Check that the token isn't expired
- Make sure there are no extra spaces around the token in mcp.json

**"npx not found"**
- Install Node.js from nodejs.org, then restart your terminal

**Server starts but Claude doesn't use it**
- Restart Claude Code after editing mcp.json — config changes require a restart
- Ask Claude explicitly: "Use the GitHub MCP to list open PRs in [repo]"

**Rate limiting**
- GitHub's API has rate limits. For high-volume use, consider a token with higher limits or space out requests.

---

## What's Possible

Once connected, try these prompts:

```
List all open PRs in [owner]/[repo] with their titles and authors.
```

```
Read the contents of src/index.js in [owner]/[repo] and explain what it does.
```

```
Search [owner]/[repo] for all uses of the function "processPayment".
```

```
Create an issue in [owner]/[repo] titled "Update auth middleware" with a description of the task.
```

```
Summarize the changes in PR #42 in [owner]/[repo].
```

```
Find all files in [owner]/[repo] that import from "@/components/Modal".
```

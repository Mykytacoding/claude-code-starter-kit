# MCP Guide: Filesystem

Give Claude explicit, sandboxed access to specific folders on your local machine — beyond the project directory Claude Code already works in.

---

## What This Connects

The Filesystem MCP server exposes specific directories on your local filesystem to Claude as a set of tools: read files, list directories, write files, create directories, and move or delete files — all scoped to folders you explicitly allow.

---

## When You Want This

- You want Claude to read or process files in a folder outside your current project
- You want Claude to write output files to a specific location (reports, exports, generated content)
- You work with a large library of documents and want Claude to navigate it directly
- You want Claude to watch a folder and process new files as they appear

---

## Prerequisites

- [ ] Claude Code installed
- [ ] Node.js installed (for `npx`)
- [ ] The folder paths you want to expose (decide before setup — you'll list them explicitly)

---

## Installation

```bash
npx @modelcontextprotocol/server-filesystem /path/to/folder1 /path/to/folder2
```

The paths you pass are the **only** directories Claude can access. Start with the minimum set you need.

---

## Configuration

Add this to `~/.claude/mcp.json` (Mac/Linux) or `C:\Users\<you>\.claude\mcp.json` (Windows):

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/you/Documents/work",
        "/Users/you/Downloads"
      ]
    }
  }
}
```

**Windows paths** use backslashes — escape them in JSON:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "C:\\Users\\you\\Documents\\work"
      ]
    }
  }
}
```

Only list the specific folders Claude needs. Do not expose your home directory, Desktop, or any folder containing credentials or sensitive files.

---

## Verify It Works

Open Claude Code and run:

```
List the files in [the folder path you added].
```

Claude should return a directory listing. If it errors, check that the path matches exactly what you put in `mcp.json`.

---

## Common Issues

**"Path not allowed" error**
- The path you asked Claude to access isn't in the allowed list in `mcp.json`
- Add it to the args array and restart Claude Code

**"Directory not found"**
- Check that the path exists and uses the correct slash direction for your OS
- On Windows in JSON, backslashes must be doubled: `C:\\Users\\...`

**Claude can read but not write**
- The filesystem MCP allows writes by default — check if the directory has write permissions for your user account

**Access to sensitive files**
- The MCP doesn't distinguish sensitive from non-sensitive files within an allowed folder
- Never add folders containing `.env` files, SSH keys, credential stores, or browser profiles

---

## What's Possible

Once connected, try these prompts:

```
List all PDF files in [folder path].
```

```
Read the file [filename] in [folder] and summarize it.
```

```
Find all files in [folder] that were modified in the last 7 days.
```

```
Read all the .md files in [folder] and give me a summary of each.
```

```
Create a file called "report-2026-04.md" in [folder] with the following content: [content].
```

```
Move [file] from [source folder] to [destination folder].
```

---

## Security Notes

- Keep the allowed path list minimal — add paths as you need them, not all at once
- Audit your `mcp.json` periodically — remove folders you no longer need
- Do not add paths that contain credentials, private keys, or sensitive configuration files
- Claude will not access paths outside the explicitly listed directories, but within those directories it has full read/write access

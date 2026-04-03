# Skill: Sheets Update

Read and update Google Sheets values — check status, mark items complete, add rows, update cells.

## Before You Start

Read [Sheet Map](../../docs/sheet-map.md). This tells you which spreadsheet contains what, how tabs are structured, and what each column means. Do not access any sheet without reading this first.

If sheet-map.md has placeholder text, tell the user: "Fill in docs/sheet-map.md with your spreadsheet structure first — I need to know the layout before I can navigate it correctly."

## Before Making Any Change

Always confirm before writing to a sheet:

> "I'm about to update [Sheet Name] > [Tab] > Row [N], Column [X] from '[current value]' to '[new value]'. Proceed?"

Do not skip this confirmation unless the user has explicitly said "proceed without confirming" for this session.

## Steps

1. **Read sheet-map.md** — understand the structure of the relevant sheet and tab
2. **Check automation-patterns.md** — if this matches a documented pattern, follow it exactly
3. **Clarify if needed** — if the request is ambiguous (unclear sheet, unclear row), ask before accessing anything
4. **Read first** — fetch and show the current state of the relevant cells before proposing any change
5. **Confirm the change** — show before/after and ask for approval
6. **Make the update** — apply only the confirmed change
7. **Report** — confirm what changed, where, and the new value

## Common Operations

**Check status across rows:**
Read the relevant tab, filter by the status column from sheet-map.md, return matching rows.

**Mark an item complete:**
Find the row by a unique identifier (name, ID, invoice number). Update the status column. Confirm before writing.

**Add a new row:**
Ask for required fields (from sheet-map.md or automation-patterns.md). Find the last data row. Append. Confirm.

**Look up a value:**
Find the row by identifier. Return the value in the specified column.

## What NOT to Do

- Do not update any cell without confirming first
- Do not guess at column positions — read sheet-map.md
- Do not delete rows or clear data unless explicitly asked
- Do not access a spreadsheet not documented in sheet-map.md without asking

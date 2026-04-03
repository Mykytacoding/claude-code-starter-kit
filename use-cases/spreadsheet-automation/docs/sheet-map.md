# Sheet Map

> **Instructions:** Document every spreadsheet and tab Claude will need to access. Be specific — Claude uses this to navigate your sheets without asking. The more precise you are, the fewer clarifying questions you'll get.
>
> Fill in one section per spreadsheet. Add more sections as needed. Delete the `> Instruction:` notes once filled in.

---

## Spreadsheet 1: [SPREADSHEET NAME]

> **Instruction:** Give this the exact name as it appears in Google Drive.

**Spreadsheet ID or URL:** [PASTE SPREADSHEET URL OR ID]

**What it's for:** [One sentence — e.g., "Tracks all active client projects, their status, and billing"]

### Tab: [TAB NAME — e.g., "Projects"]

> **Instruction:** List every column Claude needs to work with. Be specific about what values mean.

**What this tab is for:** [e.g., "One row per active project"]

**Key columns:**

| Column | Header | What It Contains | Possible Values |
|--------|--------|-----------------|-----------------|
| A | [Header] | [What's in this column] | [e.g., "Text: project name"] |
| B | [Header] | [What's in this column] | [e.g., "Date: project start date"] |
| C | [Header] | [Status column] | [e.g., "Active / On Hold / Complete / Cancelled"] |
| D | [Header] | [What's in this column] | [e.g., "Number: invoice amount in USD"] |

**Row structure:** [e.g., "Row 1 is the header. Data starts at Row 2. No blank rows between entries."]

**Important notes:** [e.g., "Column C is the source of truth for status — don't update other columns to reflect status changes without also updating C"]

---

### Tab: [SECOND TAB NAME]

**What this tab is for:** [Description]

**Key columns:**

| Column | Header | What It Contains | Possible Values |
|--------|--------|-----------------|-----------------|
| A | [Header] | [Description] | [Values] |
| B | [Header] | [Description] | [Values] |

**Row structure:** [Description]

---

## Spreadsheet 2: [SPREADSHEET NAME — if you have a second one]

**Spreadsheet ID or URL:** [URL]

**What it's for:** [Description]

### Tab: [TAB NAME]

**What this tab is for:** [Description]

**Key columns:**

| Column | Header | What It Contains | Possible Values |
|--------|--------|-----------------|-----------------|
| A | [Header] | [Description] | [Values] |

---

## Cross-Sheet Notes

> **Instruction:** Document any relationships between sheets — lookup references, formulas that pull from other sheets, or workflows that span multiple spreadsheets.

- [Note — e.g., "The 'Projects' tab in Spreadsheet 1 is referenced by the 'Billing' tab using VLOOKUP on the project ID in column A"]
- [Note — e.g., "Never delete rows from the 'Master' tab — other sheets reference specific row numbers"]

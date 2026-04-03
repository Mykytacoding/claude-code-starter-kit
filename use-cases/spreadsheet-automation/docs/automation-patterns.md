# Automation Patterns

> **Instructions:** Document each recurring task you want Claude to handle. For each pattern, describe exactly what should happen — what Claude reads, what it checks, what it updates, and what it reports back. Claude reads this before running any automated task.
>
> Delete the `> Instruction:` notes once filled in.

---

## Pattern 1: [PATTERN NAME — e.g., "Weekly Status Check"]

> **Instruction:** Give the pattern a clear name that describes the outcome, not the mechanics.

**Trigger:** [When should this run — e.g., "Every Monday morning" or "When I run /data-report weekly"]

**What Claude does:**

1. [Step 1 — e.g., "Read all rows in the 'Projects' tab where column C (Status) is 'Active'"]
2. [Step 2 — e.g., "Check if column E (Due Date) is within the next 7 days"]
3. [Step 3 — e.g., "Flag any rows where Status is Active and Due Date has passed"]
4. [Step 4 — e.g., "Report: list of overdue projects, list of due-this-week projects, count of active total"]

**Output format:** [How you want the result presented — e.g., "A short summary with three sections: Overdue, Due This Week, All Clear"]

**What NOT to change:** [e.g., "Don't update any cell values during this check — read only"]

---

## Pattern 2: [PATTERN NAME — e.g., "Mark Invoice Paid"]

**Trigger:** [When — e.g., "When I tell you an invoice has been paid"]

**What Claude does:**

1. [Step 1 — e.g., "Find the row in the 'Invoices' tab where column A (Invoice #) matches the number I give you"]
2. [Step 2 — e.g., "Update column D (Status) from 'Sent' to 'Paid'"]
3. [Step 3 — e.g., "Update column E (Paid Date) to today's date"]
4. [Step 4 — e.g., "Confirm: tell me the invoice number, client name, amount, and the cells you updated"]

**Before updating:** [e.g., "Always confirm the row you found before making any changes: 'I found Invoice #[X] for [Client], [Amount], currently marked [Status]. Update to Paid?'"]

**Output format:** [e.g., "Confirmation message with before/after state"]

---

## Pattern 3: [PATTERN NAME — e.g., "Add New Project"]

**Trigger:** [When — e.g., "When I start a new client project"]

**What Claude does:**

1. [Step 1 — e.g., "Ask me: project name, client, start date, estimated value, status"]
2. [Step 2 — e.g., "Find the last row with data in the 'Projects' tab"]
3. [Step 3 — e.g., "Add a new row with the values I provided"]
4. [Step 4 — e.g., "Confirm the row was added with all values"]

**Required fields:** [e.g., "Columns A (Name), B (Client), C (Status), D (Start Date) are required. E (Value) is optional."]

**Default values:** [e.g., "Status defaults to 'Active' if not specified"]

---

## General Rules for All Automation

> **Instruction:** Set any rules that apply across all patterns.

- **Confirm before updating:** [e.g., "Always show me what you're about to change before changing it, unless I've explicitly said to proceed automatically"]
- **Read-only default:** [e.g., "Treat all operations as read-only unless I explicitly ask for an update"]
- **Error handling:** [e.g., "If you can't find a row or sheet that should exist, stop and tell me — don't guess or create it automatically"]
- **Date format:** [e.g., "Always use YYYY-MM-DD format for dates"]

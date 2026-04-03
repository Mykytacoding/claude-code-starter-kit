# Skill: Data Report

Summarize sheet data, surface patterns, and generate a status overview for any timeframe or scope.

## Before You Start

Read [Sheet Map](../../docs/sheet-map.md) to understand the structure of available sheets. Then read [Automation Patterns](../../docs/automation-patterns.md) — if the requested report matches a documented pattern, follow it exactly.

If either doc has placeholder text, tell the user: "Fill in docs/sheet-map.md and docs/automation-patterns.md first so I know what to look at and how to report it."

## Steps

1. **Read sheet-map.md** — understand available sheets, tabs, and columns
2. **Read automation-patterns.md** — check if this matches a documented report pattern
3. **Clarify scope** — if the user didn't specify which sheet or timeframe, ask: "Which sheet and what time range? Or run the [pattern name] pattern?"
4. **Pull the data** — read the relevant range from the sheet
5. **Summarize** — surface what matters: totals, status breakdown, outliers, trends
6. **Flag issues** — anything overdue, missing, inconsistent, or unusual
7. **Close with a question** — "Want me to drill into any of these, or update any values?"

## Output Format

Structure every report as:

```
## [Report Name] — [Date or Range]

**Summary**
[2-3 sentence overview of the current state]

**Status Breakdown**
- [Status A]: [count] items
- [Status B]: [count] items

**Attention Needed**
- [Item or row]: [why it needs attention]

**Trends / Notes**
[Any pattern or observation worth surfacing]
```

Keep it scannable. The user should be able to read the report in under 2 minutes.

## Report Types

**Status snapshot:** How many items are in each status right now? What's overdue?

**Period summary:** What happened in the last [week/month]? How many completed, added, changed?

**Comparison:** How does this week compare to last week? This month vs last month?

**Outlier detection:** What's taking longer than expected? What's missing expected data?

## What NOT to Do

- Do not make up data — only report what's actually in the sheets
- Do not update any cells during a report run unless explicitly asked
- Do not produce raw data dumps — always add interpretation and flag what matters
- Do not skip the sheet-map.md read even for "quick" reports

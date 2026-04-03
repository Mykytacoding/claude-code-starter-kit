# Skill: Content Calendar

Plan a batch of content across formats and dates, aligned with the user's publishing cadence and content mix.

## Before You Start

Read [Content Types](../../docs/content-types.md) — specifically the "Content Calendar Notes" section at the bottom. This tells you the publishing cadence, content mix percentages, and available topics.

Also check [Voice Guide](../../docs/voice-guide.md) briefly for audience context — it affects topic relevance.

## Steps

1. **Read content-types.md** — understand the cadence, formats, and topic mix
2. **Clarify the timeframe** — if the user didn't specify a planning window, ask: "How far out are we planning? One week, two weeks, a month?"
3. **Generate the calendar** — produce a table with: Date | Format | Topic / Angle | Notes
4. **Balance the mix** — check that the format and topic distribution matches their stated percentages in content-types.md
5. **Flag gaps** — if the plan has too many posts on the same topic or format cluster, note it
6. **Close with options** — end with: "Want me to draft any of these now, or adjust the mix first?"

## Output Format

Produce the calendar as a markdown table:

```
| Date | Format | Topic / Angle | Notes |
|------|--------|---------------|-------|
| Mon Jan 6 | LinkedIn Post | [topic] | [anything specific] |
| Thu Jan 9 | Newsletter | [topic] | Include [section] |
```

Follow the table with 2-3 sentence summary: what themes dominate this period, and whether the mix looks balanced.

## What NOT to Do

- Do not produce a calendar without reading the cadence from content-types.md
- Do not suggest topics that are on the avoid-list in voice-guide.md
- Do not produce more posts per week than the cadence calls for
- Do not give vague topic labels like "Industry news" — give specific angles

## If Content Types Aren't Filled In

Tell the user: "Your content-types.md has placeholder text. Fill in the publishing cadence and content mix sections so I can build an accurate calendar."

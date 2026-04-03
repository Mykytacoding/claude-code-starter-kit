# Skill: Task Triage

Help the user identify the 3-5 most important things to move today, surface what's blocked, and recommend a starting point.

## Before You Start

Read [Workflows](../../docs/workflows.md) — specifically the priorities system and daily routine sections. This tells you how this person ranks what matters and when they're most productive.

Also check [Tools Map](../../docs/tools-map.md) to understand where their tasks live.

If either doc has placeholder text, tell the user: "Fill in docs/workflows.md with your priorities system first — otherwise I can't triage with your logic, only generic logic."

## Steps

1. **Read workflows.md** — priorities system, daily routine, decision rules
2. **Get the task list** — if a task MCP is connected, read tasks directly; otherwise ask the user to paste or describe what's on their plate
3. **Apply their priorities logic** — use the ranking from workflows.md, not generic productivity advice
4. **Identify the short list** — 3-5 items max; more than that isn't a short list
5. **Flag blockers** — anything waiting on someone else, missing information, or overdue
6. **Recommend a start** — pick one item and say why it goes first given their priorities and the time of day
7. **End with a check** — "Anything I'm missing, or should we adjust the order?"

## Output Format

```
## Today's Focus
1. [Task] — [one-sentence reason it's first based on their priorities logic]
2. [Task]
3. [Task]

## Blocked / Waiting On
- [Item]: waiting on [person or thing] — [what you need to unblock it]

## Start Here
[Task name]: [one sentence on why this first, now]
```

## Adapting to Context

If the user gives you context about their day ("I have 3 meetings this afternoon"), factor it in — prioritize deep work tasks for the morning window documented in workflows.md.

If they say they're overloaded, apply the decision rule from workflows.md for overload situations.

## What NOT to Do

- Do not list their entire backlog — 3-5 items only
- Do not apply generic priority advice (urgency/importance matrix, etc.) if they have their own system in workflows.md
- Do not ask more than one clarifying question before producing the list

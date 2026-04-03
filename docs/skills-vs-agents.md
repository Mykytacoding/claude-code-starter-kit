# Skills vs. Agent Profiles

Two patterns for giving Claude structured, reusable behaviors. This doc explains what each is, when to use which, and how they work together.

---

## Skills

A skill is a single, focused instruction file. It tells Claude how to handle one class of task.

**File:** `~/.claude/skills/<name>/SKILL.md`
**Invocation:** `/skill-name` in Claude Code
**Size:** Under 100 lines

**Good for:**
- Single-step tasks with clear inputs and outputs
- Behaviors you invoke on demand ("draft this", "check that", "summarize this")
- Reusable procedures that work across different contexts

**Example: `/content-draft`**
```
Read voice-guide.md → draft content → check avoid-list → ask for feedback
```

That's one task, done, ready for the next.

---

## Agent Profiles

An agent profile is a structured SOP (Standard Operating Procedure) for a complex, multi-step workflow. It bundles several skills together with a decision tree, escalation rules, and known gotchas.

**File:** `~/.claude/agents/<name>.md`
**Invocation:** "Load the [name] agent profile"
**Size:** Up to 150 lines

**Good for:**
- End-to-end workflows with multiple phases
- Workflows where errors at one step affect all subsequent steps
- Recurring processes that always follow the same sequence

**Example: Content Production Agent**
```
Step 1: /content-calendar → plan the week
Step 2: /content-draft → draft each piece
Step 3: Review loop → revisions
Step 4: Schedule → confirm dates and publish queue
```

The agent handles the sequencing, branching, and error cases. You just say "run the content workflow."

---

## How to Decide

| Situation | Use |
|---|---|
| "Draft this LinkedIn post" | Skill |
| "Help me plan and execute the full week of content" | Agent profile |
| "Update the status of invoice #42" | Skill |
| "Run the end-of-month invoicing workflow" | Agent profile |
| "What should I focus on today?" | Skill |
| "Run my Monday planning session" | Agent profile |

**The rule:** If it's one thing → skill. If it sequences multiple things → agent profile.

---

## Building Up

Start with skills. Once you have 3-5 skills that naturally go together for a recurring workflow, write an agent profile that sequences them.

```
Week 1: Write /content-draft skill
Week 2: Write /content-calendar skill
Week 3: Notice you always run them in sequence on Monday mornings
Week 4: Write a "Content Week" agent profile that runs both in order
```

Agent profiles shouldn't contain knowledge or detailed instructions — those belong in skills and docs files. An agent profile is a conductor, not a performer.

---

## Anatomy of an Agent Profile

```markdown
# Agent Profile: [Name]

[One-sentence description of what this agent handles]

## Activate With
"Load the [name] agent profile"

## Scope
- [What this agent does]
- [What it does NOT do]
- Exit when: [completion condition]

## Skills Used
- `/skill-one` — [purpose in this workflow]
- `/skill-two` — [purpose in this workflow]

## Workflow

### Phase 1 — [Name]
[Steps, decision logic, what to check]

### Phase 2 — [Name]
[Steps]

## Escalation Rules (always ask before)
- [Action that requires explicit approval]

## Known Gotchas
- [Edge case + how to handle it]
```

Keep it tight. If the profile is over 150 lines, something that belongs in a skill or docs file has leaked into the profile.

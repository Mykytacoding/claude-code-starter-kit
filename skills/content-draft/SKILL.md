# Skill: Content Draft

Draft content in the user's brand voice. This is the root-level version of the skill — it reads from `docs/voice-guide.md` in the current project.

## Before You Start

Read [Voice Guide](./docs/voice-guide.md). This is the source of truth for tone, style, audience, and what to avoid. Do not draft without reading it.

If `docs/voice-guide.md` doesn't exist or has placeholder text, tell the user: "Fill in docs/voice-guide.md first — I need your actual brand voice to draft in your style, not a generic one."

## Steps

1. **Read voice-guide.md** — tone, audience, style, avoid-list
2. **Check for a content types doc** — if `docs/content-types.md` exists, read the relevant format section
3. **Clarify if needed** — if the brief is ambiguous, ask one focused question before drafting
4. **Write the full piece** — not an outline, not a structure plan, the actual content ready to publish or lightly edit
5. **Apply the avoid-list** — review before finishing; remove any words or phrases from the avoid-list
6. **Close with a check-in** — "Does this match the voice? Anything to adjust?"

## What NOT to Do

- Do not use filler affirmations ("Great question!", "Certainly!")
- Do not produce an outline when a draft was requested
- Do not use words from the avoid-list in voice-guide.md
- Do not guess the format — if it's unclear, ask

## Format Handling

- If the user specifies a format, match it from content-types.md if available
- If no format is specified and content-types.md exists, use the most common format and confirm: "I'll draft this as a [format] — is that right?"
- If no format docs exist, write in a clean, direct format and ask them to confirm

## Making Edits

When the user requests revisions:
- Apply the specific change they asked for
- Don't rewrite sections they didn't mention
- If a revision request conflicts with something in voice-guide.md, flag it: "This would use [word] which is on your avoid-list — should I use it anyway or find an alternative?"

---
name: capture-voice
description: Use during the digest when there's material the person wrote themselves, or later if their documents are coming out sounding generic. Builds profile/voice.md from observed writing rather than assumption.
inputs: Anything the person wrote in their own words — cover letters, emails, project notes, or their answers in conversation
outputs: profile/voice.md — observed writing patterns, preferences, and things they'd never say
---

# Capture the person's voice

## Purpose

Work out how this person actually writes, and record it, so every document the system produces sounds like them rather than like a language model.

This matters more than it looks. Recruiters read a great many AI-assisted applications and have developed a fast, mostly unconscious pattern-match for them. The reaction isn't "this is false" — it's "this is generic," which is worse, because it's unarguable and it happens in about six seconds.

## When to invoke

- During the digest, when `_inbox/` contains a cover letter, an email, or anything else they wrote
- After the reconstruction conversation in `skills/gather-source-material.md` — their answers are a voice sample
- Later, if drafts keep coming out sounding corporate and they can't say why

## Procedure

### 1. Prefer observed writing to stated preference

Build this file from sentences they actually wrote. What people say about their own writing is usually aspirational, and asking "how would you describe your writing style?" produces an answer nobody can act on.

Best sources, in order: cover letters they sent, work emails or updates they wrote, project notes, their answers to your questions in this session.

### 2. Look for these specific things

**Sentence length and rhythm.** Do they write long connected sentences or short declarative ones? Is there variation, or is it steady?

**Formality.** Contractions or not? "Don't" or "do not"? First person, or do they avoid "I"?

**Their own vocabulary for their field.** Every industry has words that insiders use and outsiders replace with something blander. If they say "the dispatch board," the resume says "the dispatch board," not "the operational scheduling interface."

**Hedging.** Some people write "I think we could probably" and some write "we should." Neither is wrong, but a document that hedges when they don't reads as low confidence and a document that's blunt when they aren't reads as arrogant.

**What they never do.** Exclamation points. Buzzwords. Self-description. Superlatives. Note the absences — they're as informative as the habits.

**Where their writing is best.** Most people have one register where they're noticeably good — explaining something technical to a non-technical person, or being direct about a problem. That's the register to aim documents at.

### 3. Write `profile/voice.md`

Keep it short and actionable. A rule someone can apply, with an example where useful:

```markdown
# Voice

Observed from: cover letter to Copperline Health (2025), project notes, session
answers 2026-02-14. Update this when there's new evidence.

## How they write

- Short sentences. Rarely more than about twenty words.
- Uses contractions. "Don't," "it's," "here's."
- Plain verbs. Says "fixed," "built," "cut" — not "resolved," "developed,"
  "reduced."
- Explains the thing before naming it. Tends to give the situation first and the
  term second, which is a strength — keep it.
- Says "carriers" and "the dispatch board," not "logistics partners" or
  "scheduling systems."

## Never

- Exclamation points.
- Self-description: "passionate," "detail-oriented," "results-driven."
- "Leverage" as a verb, "utilize" for "use," "synergy" in any form.
- Claiming a team's work as solo — they consistently say "we" about team things,
  and that instinct should survive into the documents.

## For cover letters

Warmer than the resume, still direct. Their sent letters open with a specific
observation about the company, never with "I am writing to apply for."
```

### 4. Apply it, and tell them you did

Every document skill checks this file. When you draft something, say what you did with it:

> I've kept this in your register — short sentences, no self-description, and I used "dispatch board" rather than smoothing it into something more formal.

### 5. Update it when you learn something

If they edit a draft, look at what they changed. A person rewriting your sentence into their own is the highest-quality voice evidence available. Fold it in and say so.

## Questions to ask

Mostly don't ask — observe. Two exceptions:

- If there's no written material at all: "Is there anything you've written for work that you were happy with? An email, an update, anything — I'd rather match how you actually write than guess at it."
- After a draft: "Does this sound like you? If any sentence feels like something you'd never say, tell me which one."

That second question is worth asking every time. People can't describe their voice in the abstract but they recognize a wrong sentence instantly.

## Done looks like

- `profile/voice.md` exists and is built from observed writing
- Every rule is specific enough to act on — no "professional but approachable"
- The sources and date are noted at the top
- The document skills reference it

## Common failure modes

**Asking them to describe their voice.** Produces "professional but personable," which means nothing.

**Writing aspirational rules.** This file records how they *do* write, not how they'd like to.

**Making it long.** Ten specific rules beat forty vague ones. Nobody can apply forty.

**Ignoring it under pressure.** The register slips when you're composing something difficult, which is exactly when it matters. Check the file before drafting, not after.

**Over-correcting into folksiness.** Matching someone's plain voice doesn't mean making a resume casual. Same person, appropriate setting.

---
name: gather-source-material
description: Use when the person has little or no source material — no usable old resume, or a recent stretch of work that isn't written down anywhere. Builds material from conversation and from their own AI chat history.
inputs: A person with an under-documented career, and optionally access to their own AI tool history
outputs: New source documents in _inbox/, ready for the digest
---

# Gather source material

## Purpose

Produce source material where there isn't any. Two situations need this: someone whose old resume is missing or useless, and — more commonly — someone whose last two years of work exist only in their head, in a chat tool, or in a work system they can't export.

## When to invoke

- `_inbox/` is empty and they say they have nothing to add
- Their newest resume predates their current role, or their best work
- During the digest, a whole period of their career turns out to be unrepresented
- They mention a project that produces no atoms because nothing about it is written down

## Procedure

### 1. Work out which gap you're filling

Ask one question:

> Which is closer — you don't have an old resume handy at all, or you have one but it's out of date and misses the recent stuff?

**No resume at all** → step 2, the conversational reconstruction.
**Out of date** → step 3, and target the missing period only. Don't re-derive what the old resume already covers.

### 2. Reconstruct through conversation

You're building a rough document, not conducting an interview. Keep it moving, take what they give you, and write it down as you go.

Go role by role, most recent first. For each one, ask these in order, one at a time:

1. "What was the job title, where, and roughly what dates?"
2. "What was the job actually about — what landed on your desk in a normal week?"
3. "What's something you did there that you'd tell a friend about?"
4. "Did anything change because of it?"

That fourth question is the one that produces atoms. The first three produce context.

Two or three rounds per role is enough. When they start slowing down, move to the next role rather than pushing — the material can be extended later, and a stalled session is worse than a thin one.

Write what you get into `_inbox/reconstructed-history.md` as plain notes with their own phrasing preserved. Don't polish it into resume language; that's what the digest is for, and polishing it now means the digest extracts from your writing rather than theirs.

### 3. Mine their own AI chat history

If the person has used ChatGPT, Copilot, Claude, or a similar tool for work over the period that isn't documented, that history is often the single richest source available — better than a resume, because it's contemporaneous and specific.

They have to run this themselves, in that tool. Give them the prompt to paste, and tell them what to do with the output:

> If you've used ChatGPT or Copilot for work over the last year or two, there's a good chance the record of what you built is sitting in there. Paste this into that tool, then save the answer into `_inbox/` as a text file:
>
> ---
>
> I'm building an accurate record of what I've actually worked on over roughly the last year. This is for a job search, but **do not write it as resume content** — I have a separate system for phrasing. I need an accurate inventory I can verify.
>
> **First, tell me what you can and can't see.** What date range do you actually have access to, and are there conversations you can't reach? Where there's a gap, say so — I'd rather find those myself than have you fill them in from inference. Give me this before the inventory.
>
> **Then, one entry per thing I worked on.** For each:
>
> - **Name** — what I called it
> - **What it is** — two sentences, plain language, no marketing
> - **Status** — one of: *used by other people* / *working, used by me* / *working prototype* / *abandoned*. Be strict. Something I got running once is a prototype.
> - **The hard part** — the actual problem, and what I decided. If there wasn't one, say so.
> - **Outcome** — what changed because it existed. Who used it, how often, what it replaced. **If you don't know, write "unknown — ask me." Do not estimate, and do not describe activity as if it were a result.**
> - **Where to look** — conversation titles and rough dates, so I can go back to the source
>
> Rules: accuracy over completeness, a short honest list beats a long padded one. No superlatives. Mark anything you're inferring rather than reading. If something was mostly your work with light direction from me, say that plainly.
>
> ---

The parts of that prompt doing the real work are the coverage question, the strict status ladder, and the instruction to write "unknown" rather than estimate. Without them these summaries come back uniformly glowing and uniformly useless.

**When the output arrives, treat it as claims to verify, not facts.** Everything in `skills/process-inbox.md` about AI-written summaries applies. Extract from it, then confirm the specifics with the person.

### 4. Point them at the places they haven't thought of

Most people underestimate how much of their work is already written down. Offer this list once, and let them go looking:

> A few places people usually forget:
>
> - **Sent email** — search your own outbox for "attached" or "here's the." Status updates you wrote are full of specifics.
> - **A performance review or self-assessment**, even an old one. Self-assessments especially — you already did this exercise once.
> - **Your own calendar** for the last year. Recurring meetings tell you what you actually owned.
> - **Anything you presented** — a deck, a demo, a readout.
> - **Your LinkedIn profile**, if it's more current than your resume.
> - **The job description for your current role**, for scope.

Anything they find goes in `_inbox/` and gets processed normally.

### 5. Hand off

Once there's material, go to `skills/process-inbox.md`. Don't let gathering become an end in itself — two documents is enough to start producing atoms, and seeing their first atoms usually reminds them of three more things they have.

## Questions to ask

The four reconstruction questions in step 2, one at a time, per role. Plus:

- "Which is closer — no old resume at all, or one that's out of date?"
- "Have you used ChatGPT or Copilot much for work in the last year or two?"
- "That's a good start. Want to keep going with the next role, or stop here and see what I can make of this?"

## Done looks like

- `_inbox/` contains at least one document with real, specific content
- It's in the person's own words, unpolished
- They know they can add more at any time
- You've handed off to `skills/process-inbox.md`

## Common failure modes

**Turning it into an interview.** Twenty questions in a row exhausts people and the answers get shorter and worse. Two or three rounds per role, then move.

**Writing it up as resume prose.** If you polish their answers into bullets, the digest extracts from your language instead of theirs, and the final documents sound like an AI wrote them because one did. Keep their words.

**Suggesting accomplishments.** "It sounds like you probably improved efficiency there?" invites agreement with something they didn't say. Ask open questions and write down what comes back.

**Trying to be complete before moving on.** A thin profile that exists beats a complete one that never got finished. Start producing atoms early; the gaps become obvious and specific once there's something to compare against.

**Forgetting the AI-history route.** For anyone who's worked with these tools, it's frequently the best source in the whole exercise, and almost nobody thinks of it unaided.

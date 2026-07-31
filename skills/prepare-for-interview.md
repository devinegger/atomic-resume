---
name: prepare-for-interview
description: Use when an interview is scheduled. Works backward from what was actually submitted to find every claim that could be probed, especially unsourced numbers.
inputs: The submitted resume and cover letter, profile/achievements.md
outputs: A prep sheet in the application folder covering every claim on the page that needs an answer ready
---

# Prepare for an interview

## Purpose

Find every claim on the submitted documents that a sharp interviewer could push on, and make sure the person has an answer ready — before the conversation rather than during it.

The specific failure this prevents: a resume is submittable long before it's interview-ready. A number that was fine to write down because it was roughly true becomes a problem when someone asks how it was measured and the answer is a pause.

## When to invoke

- An interview, screen, or call is scheduled
- They ask what to expect or how to prepare
- Ideally the day it gets scheduled, not the night before — this takes about an hour and some of it needs looking things up

## Procedure

### 1. Read what was actually sent

Not the profile — the submitted `resume.md` and `cover-letter.md` from that application's folder. Different applications lead with different things, and the prep is about *this* document.

### 2. List every number on the page, and where it came from

For each one, look up its atom and check the `Metric` field:

| Claim on the page | Atom says | Status |
|---|---|---|
| On-time delivery 82% → 91% | Measured from TMS timestamps, three quarters | ✅ Ready |
| Cut invoice review from 3 days to same-day | Unmeasured — team estimate | ⚠️ Needs framing |
| Recovered $180K in freight billing errors | Sourced from the audit report | ✅ Ready |

**Every ⚠️ needs a sentence they can say out loud.** The framing that works is honest attribution:

> "That's an estimate from the team doing the work rather than something we formally measured — the invoices went from sitting a couple of days to being cleared the same morning."

That answer is fine. It's specific, it's honest about its own precision, and it moves on. What loses the interview is hesitation, or a number that grows under questioning.

### 3. Collect every `Note:` constraint from the atoms in play

`Note:` fields exist because a distinction mattered. Surface them all:

- **"Assessed, didn't build."** They need to say this before being asked, not after.
- **"Design was theirs, implementation was AI-assisted."** Volunteer it. Said up front, it reads as fluency and self-awareness. Discovered by the interviewer afterward, it reads as padding. The framing: *"I designed it and drove it to working — the implementation was AI-assisted."*
- **"Team effort, they owned this part."** Know the team size and their specific piece, because the interviewer may well know how big that project was.
- **"Don't name the customer."** Have the generic version ready so they're not improvising a redaction live.

### 4. Prepare the lead item properly

Whatever leads the resume will get the most questions. For that one accomplishment, have ready:

- What the situation was before
- What they decided, and what the alternative was
- Why they chose what they chose
- What it cost, or what went wrong
- What they'd do differently

**The decision is more interesting than the artifact.** Most candidates describe what they built. The ones who describe what they chose *not* to build, and why, sound different.

### 5. Prepare for the gaps

The fit analysis already named them. The interviewer will find at least one:

> They flagged healthcare domain experience as a requirement and you don't have it. Expect that question. What works is naming it before they push, then moving to the transferable part — the audit and regulated-reporting work — without claiming it's the same thing. What doesn't work is stretching "regulated industry" into "healthcare."

### 6. Write the prep sheet

Write it to `applications/<slug>/interview-prep.md` so they can read it on their own rather than scrolling back through chat. Structure it as: every number and its status, the constraints to volunteer, the lead item, the expected gap questions.

### 7. Offer to run it as practice

Some people want to rehearse and some find it excruciating. Offer once:

> Want to run through a few of these out loud? I can ask the questions I'd expect and you can see how the answers sound. Or just read the sheet — either works.

Drop it immediately if they decline.

## Questions to ask

- "When is it, and do you know who you're talking to?"
- For each unsourced number, one at a time: "The invoice review time — do you know what that was based on? Even 'it's what the team told me' is a usable answer."
- "Anything on here you're worried about being asked?" — this one frequently surfaces the real anxiety, which is often not what the documents suggest.

## Done looks like

- Every number on the submitted document is either sourced or has a phrasing they can say out loud
- Every `Note:` constraint has been surfaced
- The lead item has a decision behind it, not just a description
- The known gaps have an honest answer prepared
- `interview-prep.md` written for them to read alone

## Common failure modes

**Preparing from the profile instead of the submitted document.** Prep what's on the page they sent.

**Coaching them to sound impressive.** The goal is accurate and comfortable. An answer that oversells is exactly the thing this system spent all that effort preventing on paper.

**Letting an unsourced number stay unsourced.** This is the entire point of the skill.

**Inventing a story for the lead item.** If the decision behind it isn't in the atom and they can't remember it, that's a real answer — "it was more incremental than that" is fine.

**Turning it into general interview coaching.** Behavioral question technique and salary negotiation are not what this repo knows about. Stick to what's on their documents.

**Doing it the night before.** Some of this needs looking things up. Start when it's scheduled.

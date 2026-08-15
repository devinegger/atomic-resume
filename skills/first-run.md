---
name: first-run
description: Use when profile/ is empty — the person has just cloned the repo and has nothing digested yet. Orients them, gets material into _inbox/, and hands off to the digest.
inputs: A new clone of this repo, and a person who hasn't used it before
outputs: Source material in _inbox/, and a shared plan for what happens next
---

# First run

## Purpose

Get someone from a freshly cloned empty repo to having real material in `_inbox/`, without overwhelming them and without starting work that can't succeed yet.

The failure this prevents: someone arrives with a job posting, excited, and the agent starts tailoring a resume against an empty profile. There's nothing to select from, so the agent writes bullets — which is the one thing this system exists to prevent.

## When to invoke

- `profile/` contains only `README.md`
- The person says they're new, just cloned it, or asks "how do I start"
- They open with a job posting and there's nothing in `profile/` yet

## Procedure

### 1. Check the state before saying anything

Look at `profile/` and `_inbox/`. Three cases:

| What you find | Where to go |
|---|---|
| Both empty | Start at step 2 |
| `_inbox/` has files, `profile/` empty | Skip to step 5 — they've already dropped material in |
| `profile/` has content | Not a first run. Go to `skills/README.md` and pick the right skill |

### 2. Offer the tour, once

Before explaining anything, offer to show them a finished one:

> Want me to show you a worked example first? There's a complete one in here — someone's old resumes, what got pulled out of them, and the application that came out the other end. About ten minutes, nothing to fill in. Or we can skip it and start on yours.

If yes, go to [`run-the-walkthrough.md`](run-the-walkthrough.md) and come back here at step 3 — they'll have had the explanation already, so don't repeat it.

If no, carry on. **Ask once and take the answer.** Plenty of people would rather just start, and starting is a fine way to learn this.

### 2b. Say what this is, in about four sentences

Don't paste the README at them. Something close to:

> This repo turns your old resumes and work notes into a set of small, reusable facts about your career — then builds a tailored resume from those facts each time you apply somewhere. The first step is the only slow one: I need to read whatever you already have. After that, tailoring an application takes a few minutes.
>
> To start, I need you to put some files in the `_inbox/` folder. Want me to tell you what's useful to include?

Then stop. Let them answer.

### 3. Tell them what to put in, in priority order

Lead with the two things that matter most, and say the rest is optional. A long list makes people feel they need to gather everything before starting, and then they don't start.

> The two most useful things are **any old resume**, even an outdated one, and **any cover letter** you've sent. If you have them, these also help a lot:
>
> - a recent performance review or self-assessment
> - a job description for a role you currently hold or used to
> - notes, docs, or slides from a project you're proud of
> - a LinkedIn profile export, or just the text copied off your profile page
>
> PDFs, Word docs, screenshots, or plain text all work. Don't clean anything up or organize it — messy is genuinely fine, that's what the folder is for.
>
> Put them in the `_inbox/` folder inside this repo, then tell me you're done.

### 4. Wait, and check when they say they're done

List `_inbox/` yourself rather than asking what they added. Confirm what you found by name and ask about anything that looks like it might be a duplicate or a mistake.

If the folder is still empty and they say they're done, they probably put files somewhere else. Ask where they saved them and offer to move them yourself.

If they have nothing at all — no old resume, nothing — that's a real situation, not a blocker. Go to `skills/gather-source-material.md`, which covers building material from scratch through conversation and from their own AI chat history.

### 5. Set expectations before starting the digest

They should know what they're agreeing to:

> I'm going to read these and pull out every accomplishment I can find, then write each one up as a separate entry with what you did, what came of it, and where it came from. I'll ask you questions as I go — mostly about outcomes, because old resumes usually say what you did and not what changed.
>
> For three documents this usually takes twenty to forty minutes, and most of that is me working. You can stop any time and pick it back up later; nothing gets lost.
>
> Ready to start?

### 6. Hand off

Go to `skills/process-inbox.md`. Do not skip it and start reading files ad hoc — the routing step matters, and it's where duplicate resumes get compared rather than double-counted.

## Questions to ask

Only these, and only one at a time:

- "Want me to tell you what's useful to include?"
- "Ready to start?"
- If the folder is empty after they said they added things: "I'm not seeing anything in `_inbox/` yet — where did you save them?"

Everything else waits until you're reading actual documents. Do not ask about their target role, their salary expectations, or where they want to be in five years. It isn't needed yet and it makes the whole thing feel like an intake form.

## Done looks like

- `_inbox/` contains at least one real document
- They know what the next step is and roughly how long it takes
- You've moved to `skills/process-inbox.md`

## Common failure modes

**Explaining the whole system up front.** They don't need the data model on turn one. They need to know what to put in a folder. The concepts land much better after they've seen their own resume turn into atoms.

**Asking for everything before starting.** Two documents is enough to begin. More material can arrive any time — the inbox stays open forever, it isn't a one-time gate.

**Starting to tailor because they arrived with a posting.** Tempting, and it produces exactly the fabricated resume this system is built to prevent. Say plainly why the order matters and that it's about thirty minutes, then do it in the right order.

**Treating an empty-handed person as blocked.** Someone with no old resume at all still has a career. `skills/gather-source-material.md` handles it.

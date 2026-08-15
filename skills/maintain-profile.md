---
name: maintain-profile
description: Use to add a new atom, add a skill, or fold an improvement back into the profile — always as a deliberate step, never in the middle of an application.
inputs: A new fact, a better phrasing, or a correction
outputs: Updated profile/ files
---

# Maintain the profile

## Purpose

Keep `profile/` accurate as the person's career continues and as applications surface better material — without letting the profile drift mid-application, which is how a claim ends up on a page before it's been verified.

## When to invoke

- They mention something they did that isn't in the profile
- A tailoring session produced a better phrasing than the atom has
- A fact changes — promotion, new certification, new number for an old metric
- They say a skill is missing from `skills.md`
- **Right after an application goes out** — `skills/track-applications.md` asks the one maintenance question at that point and hands here if the answer is yes. This is the main way the profile improves after the initial digest, so treat it as a normal part of the loop rather than an interruption
- After a rejection or an interview, for whatever the conversation surfaced that the profile didn't have
- **Never during an application.** Finish, then come back to it — a fact that isn't an atom yet isn't usable in the application that surfaced it anyway

## The rule that makes this safe

**A fact that isn't an atom yet isn't usable in the application that surfaced it.**

This feels bureaucratic and it is the single most important guardrail in the system. Here's the failure it prevents: mid-tailoring, a posting asks for something, the person says "oh, I did do that actually," and a bullet gets written from a half-sentence said in passing. Nobody checked the dates. Nobody asked what the outcome was. Nobody wrote down the source. It's now on a submitted document.

The fix is order. Finish the application without it. Then, deliberately, in conversation, capture it properly. It's available from the *next* application onward.

Say this out loud when it comes up, so it doesn't look like obstruction:

> That sounds like it should be an atom — but I'd rather capture it properly than rush it into this resume. Let's finish this application, then spend five minutes on it. It'll be available for everything after this.

## Procedure

### Adding an atom

1. **Ask about it properly**, as a small version of `skills/decompose-into-atoms.md`: what they did, what changed, when, and whether there's a number.
2. **Run the "unaided?" check** if it's technical.
3. **Write it in the standard format**, with `Evidence` recording that it came from conversation and the date.
4. **Show it to them.** Their work, their words — they should recognize it.
5. Only then is it available to a document.

### Adding a skill

Higher bar than it looks. A skills line claims unaided capability, and a technical screen tests it that way.

1. **Ask what they've actually done with it.** If there's no answer, it doesn't go in the file.
2. **Attach the evidence** — which role, which project.
3. **Add the variants** — the other names it goes by, for matching against postings.
4. **Never add a skill and claim it in the same session.** That's the truthfulness rule collapsing on itself: the posting asks for X, so X gets added to the profile, so now the resume can say X. The evidence has to predate the posting that made it convenient.

### Promoting a better phrasing

When tailoring produced a sharper sentence than the atom holds:

1. Show both, the atom's version and the tailored version.
2. Say what's better about the new one — usually a specific detail the atom lost.
3. Ask before changing it. **Never rewrite an atom silently.** These are their words about their own work.
4. If it's better only for that kind of posting, leave the atom alone. Not every improvement generalizes.

### Filling in a metric

The most valuable maintenance there is. Atoms marked `Unmeasured. ⚠️ Needs: …` become substantially stronger when the number arrives.

Update the `Metric` field with the number *and* the method, and remove the ⚠️. If the answer is "we never measured it," record that as a settled answer so nobody asks again:

> **Metric:** Unmeasured, and it was never tracked. Confirmed 2026-03-02.

### Correcting a fact

Dates, titles, spellings. Fix `master.md`, then check whether any atom's `Role` line references the old version.

If the fact appears on already-submitted documents, say so plainly — they may want to know what's out there:

> Fixed. Worth knowing: the Copperline application went out with the March start date, so that one's inconsistent with what we've now got. Probably not worth chasing, but you should know it's there.

## Questions to ask

- "That sounds like it should be an atom. Want to capture it now, or after we finish this application?"
- "What changed because of it?" — the question that turns a mention into an atom
- "Did you build that yourself, or design it and have someone else implement it?"
- "This phrasing came out better than what's in your profile. Want me to update the atom, or keep it specific to that application?"

## Done looks like

- The change is made and the person has seen it
- New atoms have all required fields, including `Evidence` with the date
- New skills have real evidence attached
- Nothing was added and claimed in the same session
- No atom was rewritten without approval

## Common failure modes

**Adding an atom mid-application to close a gap.** The failure this whole skill exists to prevent.

**Adding a skill because a posting wanted it.** Same failure, one file over.

**Rewriting atoms silently.** Their words, their work. Ask.

**Accepting a vague new atom** because the person mentioned it in passing. A new atom gets the same rigor as one from the digest — what changed, when, and how it was measured.

**Letting the profile go stale.** The opposite failure. Six months into a search, the current role has produced new work that's nowhere in the file. Offering a quick catch-up every month or two is reasonable; nagging is not.

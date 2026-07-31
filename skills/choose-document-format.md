---
name: choose-document-format
description: Use immediately before assembling any resume or cover letter. The person picks base or expanded — the agent explains, recommends, and asks. Never decides silently.
inputs: The fit analysis, the posting, and the person's history
outputs: An explicit choice of template, made by the person
---

# Choose the document format

## Purpose

Make the base-versus-expanded choice **the person's**, with enough information to make it in about ten seconds.

This is a separate skill rather than a line inside assembly because it's a step that gets skipped. An agent that quietly picks a format has made a decision about how someone presents themselves, and the person finds out only when they read the draft — at which point restarting feels like a cost and they accept whatever arrived.

## When to invoke

Every time, immediately before:
- `skills/assemble-resume.md`
- `skills/draft-cover-letter.md`

Both documents get their own choice. A one-page resume with an expanded cover letter is a perfectly normal combination.

## Procedure

### 1. Work out which you'd recommend, and why

**Resume — base** (one page) is right for most applications. It's the default. Lean base when:
- Under roughly ten years of history
- The role is mid-level or the posting is brief
- A private-sector application through a normal portal
- Their strongest material fits comfortably

**Resume — expanded** (two pages) when:
- Ten-plus years, or enough roles that one page means dropping something that matters
- Senior or lead roles where depth is the point
- Technical roles where the specifics carry the argument
- Academic, government, or contract applications, which expect detail
- There's genuinely strong material that one page would force out

**Cover letter — base** (~300 words) for most applications.

**Cover letter — expanded** (~450 words) when:
- It's a career change or a pivot
- There's a gap or something that needs explaining
- The posting asks for specific written responses
- The resume alone won't make the case, and the fit analysis says so

The honest default is base for both. Length is a cost — every extra paragraph is one more chance to lose the reader.

### 2. Explain in one or two sentences, recommend, and ask

Short. They don't need the reasoning above, they need the choice:

> Two formats for the resume: **base** is one page and works for most applications, **expanded** is two pages and gives room for a highlights section and more depth on each role.
>
> I'd go with base here — you've got eight years and the strongest material fits, and this posting is brief enough that two pages would read as padding. Want me to go with that, or would you rather see the expanded version?

When expanded is the better call, say why with the same brevity:

> I'd suggest **expanded** for this one. You've got twelve years across four roles and the posting is asking for depth in two areas that would get compressed to nothing on a single page.

### 3. Take "you decide" as base

If they have no opinion, say so and move:

> Base it is — that's the right default. If it comes out feeling cramped I'll tell you and we can switch.

Then actually tell them if it does. Switching format after a draft is cheap; the atoms don't change, only the arrangement.

### 4. Check whether they have their own format

If `templates/` contains anything beyond the four that ship with the repo, they've adopted a format of their own. Offer it as the first option, not an afterthought:

> You've got your own format in here from last time — `templates/resume-mine.md`. Want to use that, or one of the standard two?

If they mention wanting a different look, or say the standard templates feel plain, go to `skills/adopt-template-format.md`.

### 5. Record the choice

Note it in `log.md` so a later session doesn't re-ask:

```markdown
- 2026-02-14 — Format: resume-base (one page), cover-letter-expanded
  (pivot into healthcare needs the extra paragraph).
```

## Questions to ask

Exactly one, per document:

- "I'd go with **base** here because [reason]. Want me to go with that, or see the expanded version?"

Do not ask which they prefer without a recommendation attached. "Base or expanded?" with no context puts the work on them and they'll pick at random.

## Done looks like

- The person has explicitly chosen, or explicitly deferred to your recommendation
- The choice and its reason are in `log.md`
- You know which template file assembly reads

## Common failure modes

**Silently picking one.** The failure this skill exists to prevent.

**Asking without recommending.** They don't know the trade-off; that's your job to have an opinion about.

**Explaining at length.** Two sentences. Any longer and it reads as a bigger decision than it is.

**Never revisiting.** If a base resume turns out cramped, say so and offer the switch. Don't quietly shrink margins to make it fit — that's how a document becomes unreadable.

**Assuming expanded means better.** Two pages of thin material is worse than one page of strong material, and reviewers notice padding immediately.

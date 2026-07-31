---
name: track-applications
description: Use to record what was sent where and what happened next, and to answer questions about the state of the search.
inputs: applications/*/log.md
outputs: An up-to-date log per application, and a plain summary of where everything stands
---

# Track applications

## Purpose

Keep an honest record of what was sent, when, and what came back — so nothing goes cold unnoticed and the search produces information rather than just activity.

## When to invoke

- After an application is submitted
- When the person mentions a response, a screen, an interview, or a rejection
- When they ask where things stand
- Periodically, to catch applications going quiet

## Procedure

### 1. Every posting gets a folder, including the ones passed on

Even a posting declined after intake keeps `posting.md` and a one-line `log.md` saying why. Three months in, knowing what was declined and for what reason is real information about what they're actually looking for. It costs one line.

### 2. `log.md` is append-only

Dated lines, never rewritten. If something turns out to be wrong, add a correcting line — don't edit history. The value of the log is that it records what was believed at the time.

```markdown
# Log — Copperline Health, Product Analyst

- 2026-02-14 — Captured from LinkedIn. Posting saved verbatim.
- 2026-02-14 — Skill intersection: 11 of top 13 direct, 2 gaps. Verdict: apply.
- 2026-02-14 — Fit analysis written. Format: resume-base, cover-letter-expanded.
- 2026-02-15 — Applied through their portal. Resume + cover letter.
- 2026-02-22 — Recruiter screen scheduled for 02-26.
- 2026-03-04 — Rejected after the screen. Reason given: wanted clinical
  domain experience. Matches the gap flagged at intake.
```

That last line is the one that pays off later. A gap that predicted a rejection is worth knowing about.

### 3. Summarize the state when asked

Read every `log.md` and give a plain answer. No dashboard, no invented status vocabulary:

> Six applications out.
>
> - **Copperline Health** — rejected after the screen, 03-04
> - **Meridian Freight** — recruiter screen Thursday
> - **Vantage Systems** — applied 02-20, nothing yet, twelve days
> - **Harbor Point Analytics** — applied 02-27, nothing yet
> - **Lakeside Supply** — passed on it, seniority was two levels below you
> - **Trellis Data** — captured, not applied yet
>
> Vantage is the one going quiet. Twelve days without a response is usually a no, though not always.

### 4. Watch for silence

Roughly two weeks without a response is the point where an application is probably not moving. Say so plainly and without dressing it up as a strategy:

> Vantage is at twelve days with no response. That's usually a no. Some people follow up once at this point; some don't bother. Either's reasonable.

### 5. Archive on close

Offer accepted, rejected, or gone cold for a month or more → move the folder to `applications/archive/`. Keep everything; the archive is a record, not a bin.

### 6. Watch for recurring gaps

When the same gap appears in three or more postings, say it once:

> "Clinical or healthcare domain" has now come up in four of the seven postings you've looked at. That's a pattern rather than a coincidence.

Then stop. Whether to do anything about it is entirely theirs, and unsolicited career advice is not what this repo is for.

Same for the opposite signal — if one atom keeps carrying the application, that's worth knowing:

> The carrier scorecard has been the lead item in five of six applications. It's doing a lot of work for you.

## Questions to ask

- After a document is rendered: "Did you submit it? I'll note the date."
- On a response: "What did they say? I'll log it."
- On a rejection, if they mention a reason: "Did they say why?" — asked once, gently, and dropped immediately if they don't want to get into it.

## Done looks like

- Every application folder has a current `log.md`
- Submitted dates are recorded
- Outcomes recorded, including rejections
- Closed applications archived
- Recurring gaps counted and mentioned once

## Common failure modes

**Building a tracking system.** A dated line in a text file is the whole thing. Anything more elaborate becomes a chore and stops being updated.

**Rewriting the log.** Append-only. Corrections are new lines.

**Editorializing about rejections.** Log it, note whether it matched a predicted gap, move on. No consolation, no analysis they didn't ask for.

**Turning a recurring gap into a lecture.** Say the count once.

**Losing the folders of postings they passed on.** Those are data about what they're actually looking for.

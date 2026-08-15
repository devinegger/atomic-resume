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
> - **Lakeside Supply** — passed on it, you said the level was wrong
> - **Trellis Data** — captured, not applied yet
>
> Vantage is the one going quiet. Twelve days without a response is usually a no, though not always.

### 4. Watch for silence

Roughly two weeks without a response is the point where an application is probably not moving. Say so plainly and without dressing it up as a strategy:

> Vantage is at twelve days with no response. That's usually a no. Some people follow up once at this point; some don't bother. Either's reasonable.

### 5. "Passed on it" and "on hold" are different things

Both mean *not applying right now*, and collapsing them loses the only part that matters later.

**Passed** — the door is shut. Not interested, wrong role, wrong company, bad terms. Log the reason and archive it. It's done.

```markdown
- 2026-02-18 — Passed. Fully onsite five days, and that's a hard no.
```

**On hold** — still wanted, blocked on something **they control and intend to finish**. This is not the same as waiting to hear back, and it's not a soft no.

```markdown
- 2026-02-18 — On hold until the certification exam in April. They ask for
  it explicitly and applying before it's done wastes the shot.
```

⚠️ **A hold has to name what unblocks it.** "Waiting" is not a hold reason. "Until the exam in April" is. Without that, a hold decays into a posting nobody remembers declining — it sits in the folder looking live, gets skipped every time the list is reviewed, and eventually the posting closes with nobody having decided anything.

Two consequences for how you report:

- **A hold is live pipeline, not a closed one.** Don't archive it, and don't leave it out of the summary — it belongs in the list with its unblocking condition visible, so the person sees it every time they look.
- **A hold that never got unblocked is worth one mention.** If the thing that was supposed to unblock it has come and gone, say so once: *"The April exam was the hold on Riverbend — that's passed now. Still want it?"* Then drop it.

### 6. Archive on close

Offer accepted, rejected, passed on, or gone cold for a month or more → move the folder to `applications/archive/`. Keep everything; the archive is a record, not a bin. **Holds don't get archived** — see above.

### 7. Watch for recurring gaps

When the same gap appears in three or more postings, say it once:

> "Clinical or healthcare domain" has now come up in four of the seven postings you've looked at. That's a pattern rather than a coincidence.

Then stop. Whether to do anything about it is entirely theirs, and unsolicited career advice is not what this repo is for.

Same for the opposite signal — if one atom keeps carrying the application, that's worth knowing:

> The carrier scorecard has been the lead item in five of six applications. It's doing a lot of work for you.

### 8. Ask the one maintenance question, at the moments it's actually answerable

This is how the system learns. There's no scheduled maintenance here and no queue to drain later — a folder of markdown has nothing to fire a reminder, so a cadence would just be a promise nobody keeps. Instead the question gets asked at the two moments the answer actually exists.

**After an application goes out**, once:

> Anything come up while we were building that which isn't in your profile yet? A number you remembered, a project I didn't have, a better way of saying something.

**After a rejection or an interview**, the same question aimed at what the conversation surfaced:

> Anything they asked about that your profile didn't have a good answer for?

If they say yes, **do it now, in this conversation.** Go to `skills/maintain-profile.md` and make the change. There's no reason to defer — the application is already sent, so the rule that protects it no longer applies, and a fact deferred is a fact lost.

If they say no, that's the whole step. Don't push, don't ask twice, and don't turn it into a review.

⚠️ **This is the one moment the profile gets better.** Skip it every time and the system stays exactly as good as the day the inbox was digested, which is the failure mode of every well-organized set of notes anyone has ever abandoned.

**Not before the application goes out.** During tailoring, a noticed fact gets mentioned and left alone — see `AGENTS.md`. That isn't bureaucracy: a fact that isn't an atom yet isn't usable in the application that surfaced it, and adding it mid-build is the truthfulness rule collapsing on itself. Afterward, it's just an improvement.

## Questions to ask

- After a document is rendered: "Did you submit it? I'll note the date."
- On a response: "What did they say? I'll log it."
- On a rejection, if they mention a reason: "Did they say why?" — asked once, gently, and dropped immediately if they don't want to get into it.

## Done looks like

- Every application folder has a current `log.md`
- Submitted dates are recorded
- Outcomes recorded, including rejections
- Holds name what unblocks them, and are still in the live list
- Closed applications archived
- Recurring gaps counted and mentioned once
- The maintenance question was asked after the application went out

## Common failure modes

**Building a tracking system.** A dated line in a text file is the whole thing. Anything more elaborate becomes a chore and stops being updated.

**Rewriting the log.** Append-only. Corrections are new lines.

**Editorializing about rejections.** Log it, note whether it matched a predicted gap, move on. No consolation, no analysis they didn't ask for.

**Turning a recurring gap into a lecture.** Say the count once.

**Losing the folders of postings they passed on.** Those are data about what they're actually looking for.

**Recording a hold with no unblocking condition.** "Waiting" isn't one. A hold that doesn't say what ends it becomes a posting nobody ever decided about.

**Skipping the maintenance question.** It's one question, it takes ten seconds, and it's the only step in the entire system where the profile gets better after the initial digest. Skip it every time and the whole thing quietly stops learning.

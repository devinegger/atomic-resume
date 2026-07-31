---
name: process-inbox
description: Use when there is new material in _inbox/ that hasn't been digested yet — on a first run, or any time the person adds something later.
inputs: One or more files in _inbox/ (resumes, cover letters, reviews, project notes, exports, screenshots)
outputs: An inventory of what's there, a conflict list, and material routed to the right digest step
---

# Process the inbox

## Purpose

Read everything new in `_inbox/`, work out what each document is, compare documents that cover the same ground, and route the contents to the right place. This is the triage step that runs *before* atoms get written.

It exists because the naive approach — read each file and extract from it in isolation — double-counts. Two versions of the same resume produce two slightly different copies of the same accomplishment, and now the profile contains a contradiction that nobody notices until an interview.

## When to invoke

- Immediately after `skills/first-run.md`
- Any time the person says they've added something to `_inbox/`
- When `_inbox/` has files that aren't in the processed list at the bottom of `profile/master.md`

## Procedure

### 1. Inventory before reading in depth

List the folder. For each file, say in one line what you think it is and how recent it looks:

> Here's what I found:
> - `resume-2022.pdf` — a resume, looks like your older one, last role ends 2022
> - `resume-current.docx` — a resume, more recent, includes the senior title
> - `2024-review.pdf` — a performance review
> - `carrier-project-notes.md` — project notes, undated
>
> I'll start with the two resumes since they overlap. Sound right?

If you can't read a file — an image-only PDF, an unusual format, a screenshot of text — say so specifically and ask them to paste the content or describe it. Don't skip it silently and don't guess at what's in it.

### 2. Read everything before extracting anything

Read all of it first. Extraction quality depends on context you only have after seeing the whole set: which resume is newer, which project the review is talking about, whether "the platform migration" in one document is the same thing as "the TMS rollout" in another.

### 3. Classify each document

| Type | What to do with it |
|---|---|
| Resume | Facts → `master.md`. Accomplishments → atoms. Skills → `skills.md` |
| Cover letter | Accomplishments → atoms (they're often told better here than on the resume). Language and rhythm → `voice.md` |
| Performance review, self-assessment | Usually the richest source of *outcomes* — the thing resumes are missing. Atoms, and metrics for existing atoms |
| Job description for a role they hold | Scope and responsibilities → `master.md`. **Not accomplishments** — a duty list says what the job was, not what they did with it |
| Project notes, docs, slides | Atoms, usually the most specific ones. Often the only place a real number appears |
| LinkedIn export or profile text | Facts → `master.md`. Recommendations → evidence for existing atoms |
| AI chat export about their work | Atoms, with care — see the warning below |

**The warning about AI-generated summaries.** If a document was written by an AI summarizing their work, treat every claim in it as a claim *the person still has to confirm*. These documents are systematically rich in scope and empty of outcomes, and they inflate: "developed a comprehensive framework" frequently describes a two-page document. Extract from them, then verify the specifics with the person before the atoms are final.

### 4. Compare overlapping documents and build the conflict list

When two documents cover the same ground, put them side by side and look for:

- **Date mismatches** — a role that starts in March in one and June in another
- **Title mismatches** — especially around a promotion, where both titles are true but for different periods
- **The same accomplishment at different magnitudes** — "cut processing time in half" in one, "reduced processing time by about 30%" in another
- **Scope drift** — the same project described as team-wide in one document and company-wide in another
- **Things present in the older document and missing from the newer one** — sometimes deliberate, sometimes an oversight worth recovering

**Never silently pick a version.** Every conflict goes to the person as an explicit question. This is not optional and it is not a judgment call — a resume that goes out with the wrong version of a number is a problem that surfaces in an interview, months later, with no way to trace where it came from.

Collect them and ask as a short batch when you reach step 6, not one interruption at a time while you're reading.

### 5. Route the contents

Work through the material in this order, because each step gives context to the next:

1. **Facts to `profile/master.md`** — roles, titles, dates, employers, locations, education, certifications, contact details. Create the file if it doesn't exist; the structure is in `docs/data-model.md`.
2. **Accomplishments to atoms** — hand off to `skills/decompose-into-atoms.md`. This is the big one.
3. **Skills to `profile/skills.md`** — every skill gets evidence attached. A skill you can't attach evidence to doesn't go in the file.
4. **Voice to `profile/voice.md`** — if there are cover letters or anything else they wrote in their own words, hand off to `skills/capture-voice.md`.

### 6. Report, and ask the conflict questions

Come back with a short summary and then the conflicts, one at a time:

> I've read all four. I found sixteen possible accomplishments — I'll work through those next.
>
> First, three things don't match between your two resumes, and I don't want to guess. The older one says you started at Northwind in March 2020; the newer one says June 2020. Which is right?

One question, wait for the answer, then the next.

### 7. Mark what's been processed

Append to the processed list at the bottom of `profile/master.md`:

```markdown
## Processed source material
- 2026-02-14 — resume-2022.pdf, resume-current.docx, 2024-review.pdf, carrier-project-notes.md
```

This is how a later session knows what's already been digested. It also means the person can leave files in `_inbox/` rather than having to clean up — nothing gets read twice.

## Questions to ask

- Every conflict from step 4, one at a time, with both versions quoted so they can just pick.
- For anything unreadable: "I can't read the text in `<file>` — it looks like a scanned image. Can you paste what's in it, or tell me what it covers?"
- If two documents look like near-identical versions: "`resume-v2.docx` and `resume-final.docx` look like the same resume with small differences. Is one of them the one you've actually been sending?"

## Done looks like

- Every file in `_inbox/` has been read or explicitly flagged as unreadable
- `profile/master.md` exists and holds the factual spine
- Conflicts have been surfaced and resolved by the person, not by you
- The processed list is updated
- You've handed off to `skills/decompose-into-atoms.md`

## Common failure modes

**Extracting from each file in isolation.** Produces duplicate atoms with drifting phrasing. Read everything first.

**Silently resolving a conflict.** The most damaging failure in this skill. You will be tempted, because one version usually looks obviously better. Ask anyway.

**Treating a job description as an accomplishment source.** A duty list describes the role, not the person. "Responsible for vendor management" is not evidence that they managed vendors well, and turning it into a bullet is inventing an accomplishment out of an org chart.

**Trusting an AI-written summary of their work.** Extract, then verify.

**Asking every question the moment you think of it.** Batch them. Ask one at a time when you get to step 6.

# Applications — one folder per posting

Each posting you look at gets a folder here, named `company-role` in lowercase with hyphens. No dates in the folder name; dates live in the log.

```
applications/
  copperline-health-product-analyst/
    posting.md          the posting, saved word for word, plus what it's asking for
    fit-analysis.md     every requirement mapped to your atoms — strong, partial, or gap
    resume.md           the tailored resume, written only after you approve it
    cover-letter.md     when there's one
    log.md              dated lines: applied, responses, outcome
    interview-prep.md   if one gets scheduled
  archive/              closed applications
```

## Why every posting gets a folder, even the ones you skip

If you look at a posting and decide against it, it still gets a folder — the posting and a one-line log saying why you passed.

Three months in, that's real information. The pattern in what you turned down tells you what you're actually looking for, which is often not what you'd say if asked directly. It costs one line.

## What's in each file

**`posting.md`** keeps the posting **verbatim** at the top, then what it's asking for underneath: must-haves, nice-to-haves, the keywords in their own words, an honest read of what seniority the role actually is, and any red flags. Postings get taken down and quietly edited; this copy is the record of what you actually applied to.

It also holds the skill table — the top ten to fifteen things the posting wants, each marked as something you have, something adjacent, or a gap. That table is usually the most useful thing produced in the whole intake, and you'll see it in chat as well.

**`fit-analysis.md`** maps every requirement to your atoms and rates it strong, partial, or gap. Gaps get named plainly. This is the file that decides what goes on the resume — and, just as importantly, what can't.

**`resume.md`** and **`cover-letter.md`** are written only after you've approved what's in them. Drafts live in the conversation; the folder holds decisions.

**No PDFs live here, ever.** The rendered, submittable file is the HTML in `output/`; a PDF is something you print from it yourself, on demand. Storing a PDF next to `resume.md` would mean two copies of the same document that can silently drift apart — you'd edit the markdown, forget to re-export, and send the old one. See [`../output/README.md`](../output/README.md).

**`log.md`** is append-only. Dated lines, never rewritten:

```markdown
- 2026-02-14 — Captured from LinkedIn. Posting saved verbatim.
- 2026-02-15 — Applied through their portal. Resume + cover letter.
- 2026-02-22 — Recruiter screen scheduled for 02-26.
- 2026-03-04 — Rejected after the screen. Wanted clinical domain experience —
  matches the gap flagged at intake.
```

That last kind of line is worth the trouble. A gap that predicted a rejection tells you something a rejection alone doesn't.

## Each folder is frozen once it's sent

When you apply for the next job, the agent copies from a previous resume and changes the copy. It doesn't edit the old one — those folders are the record of what you actually sent, and you'll want that intact when someone calls about an application from two months ago.

## Archiving

Offer, rejection, or gone quiet for a month or more → the folder moves to `archive/`. Nothing is deleted.

## Privacy

Gitignored. Your applications, the postings, the salary figures, and your notes about companies never leave your machine.

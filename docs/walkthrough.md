# A walk through the whole thing

**Optional.** If you'd rather just start, go put an old resume in `_inbox/` and tell your agent — that works fine and you can come back here later.

This follows one complete run of the system using the fictional example in [`../examples/jordan-vale/`](../examples/jordan-vale/), so you can see what everything looks like filled in before any of it is yours. About ten minutes.

Everything below is invented. Jordan Vale isn't a real person, and neither are any of the companies.

---

## The idea, in one paragraph

Most people keep a resume file and edit a copy of it for each job. Do that fifteen times and the copies start disagreeing — the same accomplishment phrased three ways, a number that's "about 30%" in one file and "over a third" in another, a job title that only got fixed in whichever file happened to be open.

This stores each accomplishment **once**, as an *atom*, and builds each resume by selecting from them. The useful side effect is that **the agent can't invent a bullet**, because there's nowhere for a new claim to come from except things you've already told it.

---

## 1. What Jordan started with

[`examples/jordan-vale/_inbox/`](../examples/jordan-vale/_inbox/) — three files, which is a realistic amount to begin with.

Open them in this order, because it's the order they'd have arrived in:

1. **`resume-2021.md`** — an old resume, written in duty language. *"Responsible for carrier relationship management."*
2. **`resume-2024-draft.md`** — a later draft that covers some of the same ground and **disagrees with the first one**.
3. **`performance-review-2025.md`** — a manager's review. Written in evaluation language: *"consistently demonstrates strong ownership."*

Neither register is an accomplishment. A duty says what you were *responsible for*; a review says what someone *thought of you*. The thing worth writing down is underneath both: something was one way, Jordan did something, now it's another way.

**Notice the two disagreements.** The two resumes don't match on a start date, and they don't match on a metric. That's not a contrived example — it's what happens when you edit copies for four years.

---

## 2. What the digest produced

[`examples/jordan-vale/profile/`](../examples/jordan-vale/profile/) — four files.

**The important one is [`achievements.md`](../examples/jordan-vale/profile/achievements.md).** Nine atoms. Open it and read three or four.

Each one is a single fact with a fixed shape:

```markdown
### carrier-scorecard-rollout
- **Long:** Built a carrier performance scorecard from shipment and claims data,
  then ran the quarterly review that used it to renegotiate or drop the bottom tier.
- **Short:** Built a carrier scorecard and ran the quarterly review it fed.
- **Metric:** On-time delivery across the reviewed carriers went from 82% to 91%
  over three quarters, measured from TMS delivery timestamps.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2023-2024
- **Tags:** #data #process #cost
- **Evidence:** _inbox/old-resume-2024.md; performance review Q1 2025
```

**Two lengths**, so the same fact fits a dense layout or a roomy one without being rewritten. **A number and how it was counted** — because a number you can't explain is a number that ends an interview. **A pointer back to where it came from**, so you can check it eighteen months later when someone asks.

Four things in that file are worth looking at specifically:

- **Some atoms say `Unmeasured`.** That's a finished answer, not a defect. Plenty of real accomplishments were never measured, and they go on resumes all the time. What sinks people is a number they can't defend, not the absence of one.
- **One atom has a `Use:` field** saying it's better as an interview answer than a resume bullet. Some work is genuinely good and reads wrong on a page. The atom keeps the record; the field keeps it off the resume by default. You can always overrule it.
- **One records that Jordan directed a build rather than writing the code.** The accomplishment is entirely Jordan's. The programming language still doesn't go on the skills line, because a skills line is a claim about what you can do unaided and a technical screen tests it that way. Both things are true at once and the profile holds both.
- **There's a `## Not extracted` section at the bottom**, listing what was deliberately left out and why. So you can see something was considered rather than missed — and argue if one's wrong.

**And the conflicts?** They became questions, in `master.md` → *Open questions*. The agent didn't quietly pick a version. Two sources disagreeing is information, and resolving it silently throws that information away.

---

## 3. A posting arrives

[`applications/copperline-health-product-analyst/posting.md`](../examples/jordan-vale/applications/copperline-health-product-analyst/posting.md)

The posting is saved **word for word** at the top, because postings get taken down and quietly edited, and this copy is the record of what Jordan actually applied to.

Underneath it, what the posting is asking for: must-haves, nice-to-haves, the keywords in their own words, and the level the posting *states* — quoted, not judged. The system deliberately doesn't rule on whether a role is a step up or a stretch; it can't see what a title means at that company or what the market pays, and a confident wrong guess about that ends up in a cover letter.

It also records **how the posting accepts an application**, which sounds like bookkeeping and isn't: if a posting only takes a one-click apply, then a beautifully tailored resume can't actually be delivered, and the effort should go into the application questions instead.

---

## 4. The honest part

[`fit-analysis.md`](../examples/jordan-vale/applications/copperline-health-product-analyst/fit-analysis.md)

Every requirement, rated **strong**, **partial**, or **gap**.

Jordan is applying to a healthcare company with no healthcare experience, and **the analysis says so, plainly**, instead of stretching adjacent regulated-industry work into something it isn't. Look at the partials too — each one spells out what's real *and* what isn't, so it can't quietly drift into an overclaim two steps later.

This is the file that decides what goes on the resume, and just as importantly what can't.

**Sometimes the honest answer is don't apply.** If the top requirements are all gaps, the system says so at intake, before an hour goes into it.

---

## 5. The documents

[`resume.md`](../examples/jordan-vale/applications/copperline-health-product-analyst/resume.md) and [`cover-letter.md`](../examples/jordan-vale/applications/copperline-health-product-analyst/cover-letter.md)

The resume selects and arranges atoms. It doesn't write new ones. Compare a bullet to its atom in `achievements.md` — the fact is identical; what changed is which version was used and which order things sit in.

**The cover letter addresses the healthcare gap directly, in its own paragraph**, rather than hoping nobody notices. That's usually the right call. A gap named plainly reads as self-awareness; the same gap papered over reads as either padding or not having read the posting.

You'd have approved all of this before it was written. The agent proposes; the folder holds decisions, not drafts.

---

## 6. The file you actually send

[`examples/jordan-vale/output/`](../examples/jordan-vale/output/) — a self-contained HTML file. Open one in a browser; it works with no internet and nothing installed.

**You print it to PDF yourself**, and there's deliberately no button that does it for you. If a PDF got saved into the folder it would go stale the moment the document changed underneath it, and stale is worse than missing — it's the one that gets attached by mistake. See [`../HELP.md`](../HELP.md) → *Printing*.

The templates look plain on purpose. [`ats-notes.md`](ats-notes.md) explains why, but the short version is that the real risk isn't a robot rejecting you — it's your resume parsing into garbage so a recruiter searching for exactly what you're good at never finds you.

---

## What to do now

**Put one or two old resumes in [`../_inbox/`](../_inbox/) and tell your agent.** Any version, any age. A performance review is the single most useful extra thing if you have one.

The first pass takes twenty to forty minutes and is the only slow part. Everything after it is fast, because the thinking already happened.

**You don't need to have read any of this to start**, and you can stop the digest halfway and come back. Nothing is lost between sessions.

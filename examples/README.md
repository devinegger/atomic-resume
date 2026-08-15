# Examples

A complete, worked run of the whole loop for a person who doesn't exist.

**Everything in here is fictional.** Jordan Vale isn't real, Northwind Logistics and Copperline Health aren't real companies, and every number is made up. It's here so you can see what a filled-in system looks like before you have one, and so an agent has a reference for what "good" means.

## What to look at

```
jordan-vale/
  _inbox/                        what Jordan started with — two old resumes and a review
  profile/                       what the digest produced
    master.md                    the factual spine
    achievements.md              ten atoms — the important file
    skills.md                    skills with evidence and alternate names
    voice.md                     how Jordan writes
  applications/
    copperline-health-product-analyst/
      posting.md                 the posting, plus what it's asking for
      fit-analysis.md            every requirement rated
      resume.md                  the tailored resume
      cover-letter.md            the letter
      log.md                     what happened, dated
  output/
    Jordan Vale - Product Analyst - Copperline Health.html   the rendered document
```

## If you only read three files

**[`profile/achievements.md`](jordan-vale/profile/achievements.md)** — the atoms. This is the format everything else depends on, and it's worth seeing what a real one looks like versus the stripped-down example in the docs. Note the range: some atoms have hard numbers with a measurement method, some say `Unmeasured` and are still perfectly good, one carries a `Use:` field saying it shouldn't go on a resume at all, and one records that Jordan designed something but didn't write the code.

**[`applications/copperline-health-product-analyst/fit-analysis.md`](jordan-vale/applications/copperline-health-product-analyst/fit-analysis.md)** — how a posting gets mapped against a profile, including the two gaps that got named rather than smoothed over.

**[`applications/copperline-health-product-analyst/resume.md`](jordan-vale/applications/copperline-health-product-analyst/resume.md)** — the output. Every line traces back to an atom. Compare it against `achievements.md` and you can find the source of every bullet.

## The thing worth noticing

Jordan is applying to a healthcare software company from a freight background, and **has no healthcare experience at all.** The fit analysis says so plainly. The resume doesn't claim otherwise. The cover letter addresses it directly in its own paragraph rather than hoping nobody notices.

That's the system working as intended. A resume that had quietly stretched "regulated industry experience" into something healthcare-adjacent would have read better and gone worse.

The second thing: the two old resumes in `_inbox/` **disagree with each other** — on Jordan's start date and on how much the invoice work improved things. The digest surfaced both conflicts as questions rather than picking a version. One got resolved; the other got recorded as a team estimate, which is what makes it survivable in an interview.

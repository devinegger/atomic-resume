---
name: match-atoms-to-posting
description: Use after analyzing a posting, to map every requirement to the person's atoms and produce an honest strong/partial/gap report before any document gets built.
inputs: applications/<slug>/posting.md and the contents of profile/
outputs: applications/<slug>/fit-analysis.md — requirement-by-requirement mapping, named gaps, and the selection that will drive assembly
---

# Match atoms against a posting

## Purpose

Map every requirement in the posting to specific atoms, rate the match honestly, and name what's missing. This produces the selection that assembly uses, and — just as importantly — the list of things the documents must *not* claim.

## When to invoke

After `skills/analyze-job-posting.md`, when the person has decided to apply.

## Procedure

### 1. Map every requirement

Go through the must-haves and nice-to-haves from `posting.md` one at a time. For each, search the atoms by tag and content, and rate it:

**strong** — one or more atoms directly evidence this. Name them by slug.

**partial** — real but thinner than the posting implies, or adjacent. Say precisely what's there and what isn't. A partial that gets written up vaguely turns into an overclaim at assembly time.

**gap** — nothing in the profile evidences this. Say so plainly, and say what the nearest real thing is without implying it counts.

Write it as a table in `applications/<slug>/fit-analysis.md`:

```markdown
| # | Requirement | Rating | Atoms / evidence |
|---|---|---|---|
| 1 | 3+ years in an analyst role | **strong** | Operations Analyst 2020–2022, Senior 2022–present. Exceeds |
| 2 | Build reporting for non-technical stakeholders | **strong** | `carrier-scorecard-rollout`, `weekly-ops-review` |
| 3 | Healthcare or clinical domain experience | **gap** | Nothing. Nearest is regulated-adjacent work in freight compliance, which is not the same thing and shouldn't be presented as if it were |
| 4 | SQL | **partial** | `skills.md` → SQL, evidenced on reporting and extracts. No data modeling or optimization work anywhere in the profile |
```

### 2. Be specific about partials

A partial is the most dangerous rating, because it's the one that quietly becomes an overclaim. The fix is to write down both halves — what's real and what isn't — in the analysis itself, where assembly will read it:

> **partial** — has run metrics-driven analysis and defined a measurement framework. Has never owned a product-metrics practice. Do not let a bullet imply ongoing ownership.

Now the constraint travels with the requirement instead of living in your head.

### 3. Name the gaps without softening

Gaps are useful. They tell the person what to address in the cover letter, what's coming in the interview, and what to learn next.

> **Healthcare domain — gap.** There's nothing in your background here. The compliance work at Northwind involves external audit and regulated reporting, which is transferable in shape, but it is not healthcare and shouldn't be presented as if it were. This is a good thing to address directly in the cover letter rather than hope goes unnoticed.

### 4. Write the two summary sections

**Where this application wins.** The one or two things that make them a genuinely strong candidate. Be specific — this becomes the lead of the resume and the second paragraph of the cover letter.

> **Requirement 5 is the whole argument.** They want someone who can turn operational data into something a non-technical team acts on. Most applicants will answer that with "built dashboards." You built the scorecard *and* ran the quarterly review that used it to change carrier contracts. That's the same requirement one level up, and it's backed by an atom rather than a claim.

**Where this application is thin.** The gaps and partials, with a one-line judgment on how much each costs.

### 5. Log the recurring gaps

If a gap has appeared before, note the count:

```markdown
## Recurring gaps
- **SQL modeling** — third posting in a row. This is now a
  skills-development signal, not a resume problem.
```

Three appearances is the threshold worth flagging out loud. Say it once, plainly, without turning it into career advice:

> SQL modeling has come up in three of the last four postings you've looked at. Worth knowing.

Then stop. Whether to do anything about it is theirs to decide.

### 6. Report and set up the choice

Summarize in chat, then hand off:

> Fit analysis is written to `applications/copperline-health-product-analyst/fit-analysis.md`.
>
> Eleven strong, three partial, two gaps. The strong case is the carrier scorecard — it hits their main requirement one level above how they asked for it. The real gap is healthcare domain experience, which I'd address head-on in the cover letter rather than hope they miss.
>
> Next is building the resume. Before I start, there's one choice to make about format — want me to walk you through it?

Go to `skills/choose-document-format.md`.

## Questions to ask

Only what the profile can't answer. Ask them together in one short round, three or four maximum:

- **Which strength leads**, when several strong atoms compete for the top slot: "Two things could lead here — the scorecard work or the dispatch process rebuild. The scorecard maps closer to their wording. Any reason to prefer the other?"
- **Whether a gap is genuinely a gap**, or just something never written down: "Nothing in your profile touches healthcare. Is that right, or is there something we haven't captured?"
- **Company knowledge they have that isn't in the posting** — "Do you know anything about this company or anyone there?"
- **Whether to pursue it at all**, if the analysis surfaced something the intake didn't.

Do not ask them to rate their own skills, and do not ask what they want to emphasize before you've shown them the analysis — they can't answer well without seeing it.

## Done looks like

- `fit-analysis.md` exists with every requirement rated and evidenced
- Every partial states what's real and what isn't
- Every gap is named plainly with its nearest-real-thing noted
- The winning argument is identified specifically enough to build a document around
- Recurring gaps counted
- The person has answered the one round of questions

## Common failure modes

**Rating generously.** Every requirement comes back strong, and the analysis becomes decoration. If everything is strong, you're pattern-matching on vocabulary rather than reading the atoms.

**Vague partials.** "Some experience in this area" gives assembly permission to write whatever it likes. State both halves.

**Letting a gap become a partial** because the person seems disappointed. The analysis is what protects them in the interview.

**Turning the recurring-gap log into career advice.** Report the count. Stop.

**Asking questions before showing the analysis.** They'll answer better with the map in front of them.

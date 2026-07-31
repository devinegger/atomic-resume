---
name: analyze-job-posting
description: Use when the person provides a job posting and wants to know how their background maps to it, or wants to apply.
inputs: A job posting — pasted text, a file in _inbox/, or a URL
outputs: applications/<company>-<role>/posting.md with parsed requirements and a ranked skill table, plus a plain verdict on whether to apply
---

# Analyze a job posting

## Purpose

Turn a posting into a structured record of what it's actually asking for, and show the person where they stand against it — **before** any work goes into documents.

The most valuable output of this skill is often the decision not to apply. Finding out in five minutes that the top four requirements are gaps saves an hour and a demoralizing rejection.

## When to invoke

- The person pastes a posting or a link
- They ask "should I apply to this?"
- They ask you to tailor a resume for a specific role — do this first

**Check `profile/` first.** If it's empty, go to `skills/first-run.md` instead and explain why the order matters. Matching against an empty profile means writing bullets, which is the one thing this system exists to prevent.

## Procedure

### 1. Get the posting text

If they gave you a URL, ask before fetching — some boards block it and some need a login:

> Want me to try pulling that page? If it doesn't work, pasting the text or dropping it in `_inbox/` works just as well.

If a fetch fails or returns a browser-support notice, that's normal. Ask them to paste it.

### 2. Create the folder and preserve the posting verbatim

Create `applications/<company-slug>-<role-slug>/` — lowercase, hyphenated, no dates in the name.

Write `posting.md` with the **raw text first, unedited**, under a `## Raw posting` heading. Postings get taken down and edited after the fact; this copy is the record of what they actually applied to. Above it, capture the source, URL, and date.

### 3. Parse it

Then a parsed section, under the raw text:

**Must-haves** — stated as required.

**Nice-to-haves** — stated as preferred, desired, or "a plus."

**Implied requirements** — not stated but obvious from the shape of the role. A posting that mentions three stakeholder groups and no engineering detail wants a communicator, whatever the title says.

**Keywords** — the posting's own vocabulary, for phrasing alignment. Their words, not synonyms.

**Seniority signal** — what level this really is, versus what the title claims. This matters and it's frequently mismatched. Read:
- Years of experience asked for
- The verbs in the responsibility list — a list built on *support*, *assist*, and *participate* is a junior role wearing a senior title
- Whether it says "under general supervision" or "sets direction"
- The compensation band if it's listed

**Compensation** — if stated.

**Red flags** — two jobs in one posting, an unrealistic stack breadth, vague ownership, "wear many hats" alongside a senior title, churn indicators.

### 4. Build the skill intersection table

This is the single most useful artifact in the intake. Extract the **top ten to fifteen skills** the posting is asking for, in the posting's own words, one to three words each, hard skills over soft.

Rank by signal strength, not by order of appearance:

| Rank | Signal |
|---|---|
| Highest | It's in the job title |
| High | Stated as required *and* repeated elsewhere |
| Medium | Stated as required, mentioned once |
| Low | Repeated but never stated as required |
| Lowest | Listed as nice-to-have |

Then intersect against `profile/skills.md`:

```markdown
| # | Skill (posting's words) | Signal | Have it? | Maps to |
|---|---|---|---|---|
| 1 | Backlog grooming | title | ✅ variant | Backlog Management |
| 2 | Azure DevOps | must | ❌ gap | — |
| 3 | Stakeholder management | must | ✅ direct | Stakeholder Management |
| 4 | SQL | nice | ⚠️ partial | SQL — reporting only, not modeling |
```

- **✅ direct** — in their file under that name. Use it.
- **✅ variant** — in their file under a different name. **Use the posting's word.** That's what variants are for.
- **⚠️ partial** — real but thinner than the posting implies. Raise it in the conversation step.
- **❌ gap** — not in their file. It goes to the fit analysis as a gap and **never** becomes a resume line, no matter how central the posting makes it.

Write the table into `posting.md` **and show it in chat.** This is the moment they see where they stand, and it's worth more to them than anything else you produce today.

### 5. Give a verdict

Say plainly what you see. Three shapes:

**Strong fit** — most of the high-signal rows are ✅.

> Eleven of the top thirteen are direct matches. This is a strong one. Want me to run the full fit analysis and start on documents?

**Worth applying, with a real gap** — the gaps are named and survivable.

> Good match overall, with one real gap: they want Azure DevOps and you don't have it. They've listed it as "tools such as," which is softening language, and you have Jira and Figma from the same list. I'd apply and not mention it. Your call.

**Probably skip** — the top rows are gaps, or the seniority is wrong.

> I'd think twice about this one. Four of the top five requirements are gaps, and the ones you have are the generic ones. You could apply, but I don't think the resume would be competitive, and there's an hour of work in it.

**Flag a seniority mismatch loudly, in both directions.** A senior person applying to a junior-banded role gets screened out for being expensive; a junior person applying above their band wastes the application. Say it before any tailoring happens:

> One thing before we go further: the title says Product Owner, but the requirements say two-plus years and "under general supervision," and the duty list is mid-level. You'd be applying below your level. That's sometimes a deliberate choice — but I wanted to flag it before you spend time on it.

### 6. Start the log

Create `log.md` in the folder, append-only, dated lines:

```markdown
# Log — Copperline Health, Product Analyst

- 2026-02-14 — Captured from LinkedIn. Posting saved verbatim.
- 2026-02-14 — Skill intersection: 11 of top 13 direct, 2 gaps (clinical
  domain, SQL modeling). Seniority reads correct for level. Verdict: apply.
```

### 7. Hand off

If they're applying, go to `skills/match-atoms-to-posting.md`.

If they're not, still keep the folder. `posting.md` plus a one-line `log.md` saying why they passed is worth more than a clean directory — three months in, knowing what got declined and why is real information about the search.

## Questions to ask

- "Want me to try pulling that page, or would you rather paste the text?"
- After the table and verdict: "Want to go ahead with this one?"
- If there's a seniority mismatch: "Were you aiming at this level deliberately?"

Nothing else yet. Questions about what to lead with come after the fit analysis, when you know what the real choices are.

## Done looks like

- `applications/<slug>/posting.md` exists, raw text preserved verbatim above the parsed section
- The skill table is written **and** shown in chat
- Seniority signal and red flags are stated, not buried
- A clear verdict, in plain language
- `log.md` started

## Common failure modes

**Paraphrasing the posting instead of preserving it.** The raw text is the record. Save it before parsing it.

**Softening a gap.** "You have adjacent experience here" is how a fabricated bullet gets born two steps later. Say gap.

**Skipping the seniority read.** It's the most common reason a well-matched application goes nowhere, and it's invisible unless you look for it deliberately.

**Adding a skill to their profile because the posting wants it.** This is the truthfulness rule collapsing on itself. If it turns out they genuinely have it and it's just missing from the file, that's a real thing to fix — but it's a separate, deliberate step after the application, not a line added mid-tailoring. See `skills/maintain-profile.md`.

**Burying the table in a file.** Show it in chat. It's the thing they most want to see.

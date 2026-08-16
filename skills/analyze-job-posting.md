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

**Stated band — record it, never rate it.** Capture what the posting *says* about level, and stop there:
- The title, including any modifier (Senior, Lead, II, Associate)
- The years-of-experience floor, if stated
- The compensation band, if stated
- Whether direct reports are mentioned
- The verbs in the responsibility list, quoted — *support*, *assist*, *participate*, *own*, *set direction*
- Any supervision language, quoted — "under general supervision," "operates independently"

Then mark it **ASK THEM** and carry it to the conversation step.

⚠️ **Do not judge whether the role is a step up, a lateral move, or a reach.** That judgment needs things this system cannot see: what a title means at that company's size, what the comp norm is for that market and that stack, how big the team is, and where the person actually sits today. A confident-sounding level read that's wrong doesn't stay contained — it becomes the premise of a cover-letter paragraph, and by then nobody is re-checking it.

**Aggregator level labels are noise.** "Mid Level" and "Senior Level" badges on job boards are generated, not curated, and they contradict themselves constantly — the same week can produce a "Mid Level" tag on a $150–220K posting and a "Senior Level" tag on a $90–130K one. Never carry one into the record as though it meant something.

The person knows their own level. Give them the quoted evidence and let them make the call.

**Compensation** — if stated.

**Apply mechanism** — how this posting actually accepts an application. Direct upload, an employer ATS form, one-click via an aggregator, or application questions only. **Record whether a tailored document can be delivered at all.**

⚠️ **Act on this now — don't just write it down.** If the mechanism can't accept a tailored resume, say so at intake and change what gets built. Building a tailored resume for a one-click-apply posting produces a document nobody can deliver: it gets written, reviewed, approved, and then the apply button submits something else entirely.

Two specific traps:
- **One-click apply submits the resume attached to the *aggregator profile*,** not anything in this repo. If that stored resume is old, every one-click application goes out with it, silently. Say this out loud and ask when they last updated it.
- **A questions-only posting** deserves real work on the answers, which is where the whole application lives. That's a different deliverable, not a lesser one.

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

⚠️ **Before writing ❌ against anything, check the documents too — not just `profile/`.** If they have a saved resume or a template they've been using, search it for the skill before calling it a gap. The profile is supposed to be the source of truth, but a real run marked two things as gaps — a certification and a pair of skills — while both were sitting on the resume that had already been sent out. A derived document can hold a fact the source is missing, and a false gap is worse than a missing skill: it tells the person they can't claim something they can, and it can talk them out of a posting they'd have been strong for.

Write the table into `posting.md` **and show it in chat.** This is the moment they see where they stand, and it's worth more to them than anything else you produce today.

### 5. Give a verdict

Say plainly what you see. Three shapes:

**Strong fit** — most of the high-signal rows are ✅.

> Eleven of the top thirteen are direct matches. This is a strong one. Want me to run the full fit analysis and start on documents?

**Worth applying, with a real gap** — the gaps are named and survivable.

> Good match overall, with one real gap: they want Azure DevOps and you don't have it. They've listed it as "tools such as," which is softening language, and you have Jira and Figma from the same list. I'd apply and not mention it. Your call.

**Probably skip** — the top-ranked rows are gaps.

> I'd think twice about this one. Four of the top five requirements are gaps, and the ones you have are the generic ones. You could apply, but I don't think the resume would be competitive, and there's an hour of work in it.

**Say this early or don't say it at all.** A posting whose highest-signal requirements are all ❌ is a posting to skip, and the whole value of saying so is that it arrives before the hour gets spent. Once documents are underway nobody wants to hear it.

**Hand the level question back, with the evidence.** Don't rule on it — show what the posting said and ask:

> On level: the title says Product Owner, it asks for two-plus years, and the responsibilities are written as "support" and "assist" with one mention of "under general supervision." No comp band listed. I'm not going to tell you whether that's a step up or a step down for you — I can't see how those words map to your market. Does that read the way you'd expect for the roles you're targeting?

That version gives them everything a level read would have been based on and leaves the read to the person who can actually make it.

### 6. Start the log

Create `log.md` in the folder, append-only, dated lines:

```markdown
# Log — Copperline Health, Product Analyst

- 2026-02-14 — Captured from LinkedIn. Posting saved verbatim.
- 2026-02-14 — Apply mechanism: employer ATS, direct upload. Tailored
  documents can be delivered.
- 2026-02-14 — Skill intersection: 11 of top 13 direct, 2 gaps (clinical
  domain, SQL modeling). Band recorded, not rated — Jordan confirmed it
  reads right for what they're targeting. Verdict: apply.
```

### 7. Hand off

If they're applying, go to `skills/match-atoms-to-posting.md`.

If they're not, still keep the folder. `posting.md` plus a one-line `log.md` saying why they passed is worth more than a clean directory — three months in, knowing what got declined and why is real information about the search.

## Questions to ask

- "Want me to try pulling that page, or would you rather paste the text?"
- After the table and verdict: "Want to go ahead with this one?"
- On the recorded band: "Does that read the way you'd expect for what you're targeting?"
- If it's one-click apply: "When did you last update the resume attached to your profile there? That's the one that actually gets sent."

Nothing else yet. Questions about what to lead with come after the fit analysis, when you know what the real choices are.

## Done looks like

- `applications/<slug>/posting.md` exists, raw text preserved verbatim above the parsed section
- The skill table is written **and** shown in chat
- The stated band is recorded with its evidence quoted, and **not** rated
- The apply mechanism is recorded, and if it can't take a tailored document, that changed what gets built
- Red flags are stated, not buried
- A clear verdict, in plain language
- `log.md` started

## Common failure modes

**Paraphrasing the posting instead of preserving it.** The raw text is the record. Save it before parsing it.

**Softening a gap.** "You have adjacent experience here" is how a fabricated bullet gets born two steps later. Say gap.

**Rating the level instead of recording it.** Saying "this is really a mid-level role wearing a senior title" sounds like insight and is a guess. It reads as authoritative, the person believes it, and it ends up as the premise of a paragraph in a cover letter. Quote what the posting said and hand the judgment back.

**Recording the apply mechanism and then ignoring it.** Writing "one-click via aggregator" in the file and then building a tailored resume anyway is the failure this step exists to prevent. The record isn't the point; changing what gets built is the point.

**Calling something a gap without checking their existing documents.** The profile can be behind. A false gap costs a real opportunity.

**Adding a skill to their profile because the posting wants it.** This is the truthfulness rule collapsing on itself. If it turns out they genuinely have it and it's just missing from the file, that's a real thing to fix — but it's a separate, deliberate step after the application, not a line added mid-tailoring. See `skills/maintain-profile.md`.

**Burying the table in a file.** Show it in chat. It's the thing they most want to see.

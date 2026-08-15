# The data model

This is the conceptual document — what an atom is and why the system is built this way. The step-by-step procedures live in [`skills/`](../skills/).

---

## The problem with keeping whole resumes

The normal way to handle a job search is to keep a resume file, copy it when a good posting comes along, and edit the copy. Do that fifteen times and you have fifteen documents that disagree with each other.

They disagree in ways you won't notice. The same accomplishment is phrased three different ways because you rewrote it under time pressure each time. A number is "about 30%" in one file and "over a third" in another. A job title is "Operations Analyst" in some and "Senior Operations Analyst" in others because you were promoted partway through and only fixed it in the file you happened to have open. You improve a sentence in application number eleven and the improvement lives in exactly one file forever.

None of that is carelessness. It's what happens when the same fact is stored in more than one place, which is a problem software people have run into often enough to have a name for it. The fix is always the same: store the fact once, and generate the copies.

## What an atom is

An atom is **one accomplishment, written down once, as evidence.**

It's the smallest piece of your career that can stand on its own on a resume. Not a job — a job contains many. Not a skill — a skill is a claim, an atom is proof. One thing you did, what came of it, and where the record of it lives.

Atoms live in `profile/achievements.md`, one section each:

```markdown
### carrier-scorecard-rollout
- **Long:** Built a carrier performance scorecard from shipment and claims data, then ran the quarterly review that used it to renegotiate or drop the bottom tier.
- **Short:** Built a carrier scorecard and ran the quarterly review it fed.
- **Metric:** On-time delivery across the reviewed carriers went from 82% to 91% over three quarters, measured from the TMS delivery timestamps.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2023-2024
- **Tags:** #data #process #cost
- **Evidence:** _inbox/old-resume-2024.md; performance review Q1 2025
```

Every field is doing a job:

**Long and Short** are the same fact at two densities. A one-page resume with six roles needs the short one; a two-page resume for a senior role can afford the long one. Writing both once means you never compress a bullet badly at midnight because it didn't fit.

**Metric** holds the number *and how it was counted*. This field is the one people are tempted to skip, and it's the one that matters most, because a number you can't source is worse than no number at all. It will get you the interview and then lose you the interview. `Unmeasured` is a completely valid entry and a lot of real accomplishments have it.

**Role** ties the atom to a job, so the assembly step knows which block of the resume it belongs under.

**Tags** are how selection works. When a posting asks for stakeholder management, the agent filters atoms by tag rather than rereading everything and guessing.

**Evidence** is where this came from — which file in your inbox, or which conversation. It's how you check a claim eighteen months later when a hiring manager asks about it and you've forgotten the details.

Two optional fields handle the awkward cases:

**Use:** appears only when an atom should *not* go on a resume by default. Some work is genuinely good and still wrong for a page — it has an audience of one, or it names a customer you shouldn't name, or it reads better as an interview answer than as a bullet. Deleting the atom loses the record. Letting it default onto a resume costs you a screen. The `Use:` field keeps it and says where it belongs instead.

**Note:** constrains how a claim gets phrased. "Assessed this system, did not build it." "Say *contributed to*, not *led* — it was a four-person effort." "Never name the client." These are the distinctions that are obvious to you and invisible to an agent composing a document eight months from now.

## Granularity: what makes a good atom

**One fact, one atom.** If a bullet contains two accomplishments, it's two atoms. The test is whether you could put one on a resume without the other and still have it make sense.

**Too broad** looks like *"Managed the operations analytics function."* That's a job description, not an accomplishment. Nothing in it can be verified, and it can't be selected against a posting because it matches everything and evidences nothing.

**Too fine** looks like *"Added a column to the weekly carrier report."* True, but it isn't a unit of anything. It's a task inside an accomplishment, and it will never earn a line on a page.

**About right** sits where a hiring manager would ask a follow-up question and you'd have an interesting answer. That's the actual test, and it's more reliable than any rule about length.

Some things resist decomposition. A four-year role where you gradually made a team better doesn't break into discrete wins. When that happens, write the atom about the change rather than the activity: what was true before, what's true now, and what you did that connects them.

## Where the rest of the profile lives

Atoms carry accomplishments. Three other files carry everything else, for the same reason — write it once, select from it many times.

| File | Holds | Why it's separate |
|---|---|---|
| `profile/master.md` | Roles, titles, dates, education, certifications, contact details | The factual spine. Never inferred, never rewritten from a resume — the arrow points outward only |
| `profile/skills.md` | Skills, each with evidence and alternate names | A skills line is a claim about what you can do unaided. That's a different kind of claim from an accomplishment and it needs different rules |
| `profile/voice.md` | How you write — register, habits, things you'd never say | Keeps every document sounding like you rather than like a language model |

`skills.md` has one mechanic worth calling out, because it's the difference between matching a posting honestly and keyword-stuffing. Each skill carries **variants** — the other names the same thing goes by:

```markdown
- **Requirements Gathering** — *also called:* Requirements Elicitation, Discovery,
  Business Analysis — *evidence:* ran intake sessions with warehouse leads at Northwind
```

When a posting says "requirements elicitation" and your file says "requirements gathering," you use *the posting's words*. Same skill, their vocabulary — a recruiter searching the applicant database may search for either one. Listing both on the same resume is padding and reads as padding. Pick the one they used.

The rule that makes variants safe rather than dangerous: **a posting keyword with no entry in your file is a gap, not a line to add.** If the skill isn't in `skills.md`, you don't have it, no matter how central the posting makes it. Adding a skill to the file and then claiming it in the same session is the whole system collapsing on itself.

## How atoms become a document

Composition is **selection and arrangement**. It is never authoring.

When a posting arrives, the agent:

1. **Parses the posting** into must-haves, nice-to-haves, the keywords in the posting's own words, the level the posting *states* (quoted, never rated — the system can't see what a title means at that company), and how the posting actually accepts an application.
2. **Maps each requirement to your atoms** and rates it *strong*, *partial*, or *gap*. Gaps get named plainly. A posting where the top requirements are all gaps is a posting to skip, and finding that out in five minutes is a feature.
3. **Selects and orders** — which atoms, in what order, at Long or Short density, with which skills on the skills line in which words.
4. **Fills the template**, or presents a change list against a resume you already have.
5. **Shows you the result for approval** before anything is written to a file.

Notice what's missing from that list. There is no step where new content can enter. The agent can pick atoms, reorder them, choose the long version over the short one, and swap in the posting's phrasing for a skill you already have. It cannot write a bullet, because there's nowhere for a bullet to come from except the atoms file.

**That's the point of the whole design.** The truthfulness rule isn't enforced by telling the agent to be honest — agents under pressure to match a posting will produce a plausible sentence, every time, and it will read well. It's enforced by the shape of the data. If it isn't an atom, it can't be on the page.

New facts do get added, but adding one is a deliberate, separate act: you say it in conversation, the agent writes it as an atom with its evidence, and *then* a document can reference it. Never the other way around, and never inside the application that discovered the need for it.

## What this buys you

**Consistency by construction.** The same accomplishment reads the same way in every application, because there's only one copy of it.

**Improvements compound.** A better phrasing found on application eleven gets promoted back to the atom, and applications twelve through forty get it for free.

**Honest gap reporting.** Because the system knows what you have, it can tell you what you don't — and a gap that shows up in three postings in a row is career information, not a resume problem.

**Speed, eventually.** The first pass is slow: digesting your material takes real time. After that, a tailored application is minutes, because the thinking has already been done and stored.

**A record that outlives the search.** Six months in, `achievements.md` is the most complete account of your own work you've ever had. It's the file you read before a performance review, before asking for a raise, and before the next search after this one.

---

## Related

- [`workflow.md`](workflow.md) — the loop, step by step
- [`ats-notes.md`](ats-notes.md) — why the templates are plain
- [`../skills/decompose-into-atoms.md`](../skills/decompose-into-atoms.md) — how atoms actually get written
- [`../AGENTS.md`](../AGENTS.md) — the operating rules, including the truthfulness contract

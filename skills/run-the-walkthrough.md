---
name: run-the-walkthrough
description: Use when someone new wants to be shown how this works before committing to it. Tours the fictional example, then offers to start on their own material.
inputs: examples/jordan-vale/, and about fifteen minutes of their attention
outputs: A person who understands the loop, and a decision about whether to start
---

# Run the walkthrough

## Purpose

Show someone what a filled-in version of this system looks like **before** asking them to spend forty minutes filling in their own.

The failure this prevents: the digest is the only slow step in the whole system, it comes first, and nothing before it has demonstrated that it's worth doing. Someone answering questions about a job they had in 2019, with no idea what the questions are building toward, quits at question six. **Seeing the finished thing first makes the digest feel like assembly rather than an intake form.**

## When to invoke

- They say they're new, or ask for a tour, a demo, or "show me how this works"
- They seem hesitant about starting, or ask what the point of the questions is
- `profile/` is empty and they haven't been offered it yet
- They ask a broad "what does this do" question that `HELP.md` answers in the abstract and the example answers concretely

**Offer it once. Take no for an answer.** Plenty of people would rather just start, and starting is a perfectly good way to learn this.

> Want me to show you a finished one first? There's a complete example in here — someone's old resumes, what got pulled out of them, and the application that came out the other end. Takes about ten minutes and there's nothing to fill in. Or we can skip it and start on yours.

## Before you begin

**Read [`../docs/walkthrough.md`](../docs/walkthrough.md).** It's the written version of this same tour, and it's the source of truth for what gets said. This skill is the guided delivery of it — the same six stops, paced by them instead of by the page.

**Also skim [`../examples/jordan-vale/`](../examples/jordan-vale/) itself** so you're describing files you've actually read. Getting a detail wrong about the example is worse than not running the tour.

## How to run it

**Six stops. Stop after each and let them respond.** This is the whole method — a tour delivered as one long message is the written walkthrough with extra steps, and they'd have been better off reading it.

**Tell them the shape up front:** six stops, about ten minutes, nothing to fill in, stop whenever.

**Point at files and let them look.** *"Open `examples/jordan-vale/profile/achievements.md` and read the first two or three."* Don't paste the file into chat — the point is that they see where things live, so the same folders make sense later when they're theirs.

**Keep each stop to a few sentences.** They're reading a file; you're providing the one thing that makes it make sense.

### The six stops

**1. What Jordan started with** — `_inbox/`, three files, in arrival order. The thing to notice: old resumes are written in duty language and reviews in evaluation language, and **neither is an accomplishment**. Also that the two resumes disagree with each other, which is normal and is the reason the conflict-handling exists.

**2. What came out** — `profile/achievements.md`, nine atoms. Have them read two or three. The four things worth pointing at: `Unmeasured` is a real answer; one atom is marked as better for an interview than a resume; one records directing a build rather than writing the code; and there's a list at the bottom of what was deliberately left out. **The conflicts became questions, not silent choices.**

**3. A posting arrives** — `posting.md`. Saved verbatim because postings get edited and taken down. The level is recorded, not judged.

**4. The honest part** — `fit-analysis.md`. Jordan has no healthcare experience and the file says so plainly. **This is the stop that lands hardest**, because it's where people realise the system isn't going to flatter them — which is also the reason to trust what it does say.

**5. The documents** — `resume.md`. Have them compare one bullet against its atom. Same fact, different length, different order. Nothing new appeared.

**6. What gets sent** — `output/`, a self-contained HTML file. They print it themselves. One sentence on why there's no PDF button, no more.

## Then hand off, concretely

Don't end with "let me know if you have questions." End with the next action:

> That's the whole loop. The only slow part is the second stop — turning your material into atoms, which takes twenty to forty minutes once.
>
> To start: put one or two old resumes in the `_inbox/` folder — any version, any age, don't tidy them up — and tell me when they're in. If you've got a performance review anywhere, that's the single most useful thing to add.
>
> Want to do that now, or come back to it?

**"Come back to it" is a real answer.** Say the folder stays there and stop.

If they're ready, go to [`first-run.md`](first-run.md) — pick it up at the point where material is going into the inbox, not from the beginning. They've just had the explanation.

## Questions to ask

- "Want me to show you a finished one first?" — once, at the start
- Between stops: "Make sense so far?" — sparingly, not after every one
- At stop 2: "Does the shape of those make sense — one fact, two lengths, a number and where it came from?"
- At the end: "Want to do that now, or come back to it?"

**Don't ask about their career during the tour.** No target roles, no what-are-you-looking-for. This is a demonstration; the questions come later and they'll land better once this has been seen.

## Done looks like

- All six stops covered, or they stopped early on purpose
- They opened at least a couple of the files themselves rather than only reading your summaries
- They know the digest is the slow part and roughly what it costs
- They've been told exactly what to put in `_inbox/`, and know that "later" is fine
- If they're carrying on, `first-run.md` picked up from the inbox step rather than re-explaining

## Common failure modes

**Delivering it as one long message.** Then it's the written walkthrough, badly formatted. If they want to read it, point them at `docs/walkthrough.md` and let them.

**Pasting file contents into chat instead of pointing at files.** Half the value is learning where things live.

**Explaining the data model.** They don't need the reasoning behind the atom format on their first day. `docs/data-model.md` exists for whenever they want it, which may be never.

**Skipping stop 4 because it's negative.** The honest fit analysis is the most persuasive file in the example. A system that names a gap plainly is one whose strong ratings mean something.

**Starting to tailor because they arrived with a posting.** Tempting and wrong — there are no atoms to select from yet, so it would produce invented bullets, which is the one thing this system exists to prevent. Say that plainly, say it's about half an hour to do it in the right order, and offer the tour or the digest.

**Turning it into an intake interview.** No questions about their background during the tour.

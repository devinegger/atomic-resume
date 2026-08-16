# Profile — your career, broken into pieces

This folder is empty until you've digested something from `_inbox/`. After that it holds four files, and together they're the source of truth for everything the system builds.

| File | What's in it |
|---|---|
| `master.md` | The facts: roles, titles, dates, employers, education, certifications, contact details |
| `achievements.md` | **The atoms.** One entry per accomplishment. This is the important one |
| `skills.md` | Skills, each with evidence attached and the other names it goes by |
| `voice.md` | How you write, so documents sound like you |

The agent creates all four during the digest. You don't need to make them yourself.

## What an atom looks like

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

One accomplishment. Two lengths, so it fits whatever space a resume has. A number *and how it was counted* — or the honest word `Unmeasured`, which is a perfectly normal answer. And a note of where it came from, so you can check it eighteen months later when someone asks.

See [`../examples/jordan-vale/profile/`](../examples/jordan-vale/profile/) for a full set, and [`../docs/data-model.md`](../docs/data-model.md) for why it's built this way.

## You can edit these

They're your files and they're plain text. If a bullet doesn't sound like you, change it. If the agent got something wrong, fix it. Nothing here is generated on the fly — what's in these files is what gets used.

The one thing worth keeping intact is the field structure. `**Long:**`, `**Metric:**`, and the rest are what the agent reads to build documents.

## Two rules worth knowing

**Nothing goes on a resume that isn't in here.** That's the point of the whole system. If a posting asks for something and there's no atom for it, that's a gap the agent will name rather than a bullet it will write. It can feel restrictive on a Tuesday afternoon when you're sure you did the thing — but it's why nothing on your resume can surprise you in an interview.

**Adding to this folder is deliberate.** New atoms get added in their own step, in conversation, with the details captured properly — not in the middle of building a resume that would benefit from them. Anything added mid-application is available for the *next* one.

## What's your call, and what isn't

Worth being clear about, because it's the thing most likely to feel annoying:

**Yours.** Whether something goes on the page. Whether a bullet reads well. Whether an accomplishment is worth the space, or sounds like bragging, or belongs in this particular application. If the agent leaves something off and you want it on, say so and it goes on. It doesn't get a vote on your taste.

**Not yours, and not the agent's either.** Whether a claim is true. If you ask for something the profile doesn't support, you'll get a no and an explanation of what's missing — and an offer to write down the real version first, which usually takes about a minute. That's the one thing this system won't bend on, and it's the reason it's worth using at all.

## If it's being too picky

The agent runs in **standard mode** unless you tell it otherwise, which is the more forgiving of two settings. If it's still refusing to write things down, being fussy about numbers you don't have, or asking whether you *really* did something — tell it. That's not how standard mode is supposed to feel, and saying so is enough.

There's also a **strict mode**, for people who want the extra friction — usually after an interview went badly on a detail. It rejects thin material instead of recording it, asks for approval line by line, and pushes harder on unmeasured numbers. Turn it on by asking the agent to, or by adding this line near the top of `master.md`:

```
Extraction mode: strict
```

Delete the line to go back. Neither mode will ever put something on your resume that isn't true — that part isn't a setting.

## Privacy

Gitignored. This folder never leaves your machine, even if you push this repo somewhere.

It's also, after a few months, probably the most complete record of your own work you've ever had. Worth backing up somewhere private — and worth reading before a performance review, not just before a job search.

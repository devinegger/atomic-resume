# Atomic Resume

A system for turning your career history into tailored resumes and cover letters, built around one idea: **write every accomplishment down once, then select from it.**

## Why "atomic"

The normal way to job-search is to keep a resume file and copy-edit it for each posting. Do that fifteen times and the copies start disagreeing with each other — the same accomplishment phrased three different ways, a number that's "about 30%" in one file and "over a third" in another, a job title that only got fixed in the file you happened to have open that day.

This repo stores each accomplishment exactly once — as an **atom**: one fact, what came of it, and where the record of it lives — in a file called `profile/achievements.md`. When a posting comes in, an AI agent reads the posting, picks the atoms that actually match it, and arranges them into a resume. It never invents a bullet, because there's nowhere for a new claim to come from except your own atoms.

That loop — **drop in your old material → the agent digests it into atoms → you apply, and it composes a tailored document from what's true** — is the whole system. [`docs/data-model.md`](docs/data-model.md) has the full reasoning if you want it; you don't need to read it to get started.

## Setup

Three steps, about fifteen minutes. Each one ends with something you can check, so you never move on from a broken state.

**Everything here is free**, and none of it sends your career history anywhere — see [Privacy](#privacy).

### 1. Get the folder

Click the green **Code** button at the top of this repo's page, choose **Download ZIP**, and unzip it. You'll get a folder called `atomic-resume`. Put it somewhere you'll find it again — Documents is fine.

If you use git, `git clone` it instead. It makes no difference to anything below.

> **Check:** the folder exists and contains `README.md`, `AGENTS.md`, and folders named `profile`, `templates`, and `skills`.

### 2. Install Obsidian

[Obsidian](https://obsidian.md) is a free app for reading and editing folders of markdown files. **You don't strictly need it** — this is plain text and any editor works — but it's the most comfortable way to read what the agent writes, and "use whatever editor you like" is unhelpful advice if you don't have one.

1. Download it from [obsidian.md](https://obsidian.md) and install it like any other app.
2. Open it. On the first screen, choose **Open folder as vault**.
3. Pick the `atomic-resume` folder you just unzipped.
4. If it asks about trusting the author or enabling plugins, either answer is fine — nothing here uses plugins.

> **Check:** you can see the folder's files down the left-hand side, and clicking `README.md` shows you this page, formatted.

Obsidian calls a folder a "vault." That's just their word for a folder — it isn't a special format, and nothing you do in Obsidian locks the files into it. You can delete Obsidian later and every file will still be a plain text file.

### 3. Install an agent

You need an AI agent that can read and write files on your computer. **[Claude Code](https://claude.com/claude-code) is the one this repo is built and tested against** — install it, then open a terminal, move into the folder, and run `claude`:

```bash
cd path/to/atomic-resume
claude
```

Other agents work too. **Codex** and most terminal-based tools behave the same way. **Cursor** or another editor-based agent: File → Open Folder, pick this folder. **A browser chat tool:** look for "attach folder" or "add files" and point it here — this works but is the most awkward option, because it can't write files for you.

Once your agent is open, paste this:

```
Read AGENTS.md, then help me get started. I'm new to this.
```

Some tools load a startup file automatically and won't need it. **You'll know it worked if the agent's first reply talks about atoms, your profile, or this repo without you having explained anything.** If it doesn't, paste the line above — it works either way, and pasting it twice does no harm.

> **Check:** the agent knows what this repo is, and has told you what to do next without you asking.

**If nothing works, that's a bug in these instructions, not in you.** See [`docs/troubleshooting.md`](docs/troubleshooting.md).

## Want a tour first?

You don't have to start with your own history. There's a complete worked example in the repo — a fictional person, their old resumes, the atoms pulled out of them, and one finished application.

**Read it yourself:** [`docs/walkthrough.md`](docs/walkthrough.md) walks the whole loop, in order, in about ten minutes.

**Or have the agent walk you through it:**

```
Walk me through this using the example first.
```

Both are optional and skippable. Some people would rather just start.

## Quickstart

Put one or two old resumes in the `_inbox/` folder — any version, any age, doesn't matter. [`_inbox/README.md`](_inbox/README.md) has a longer list if you want ideas for what else helps (a performance review is usually the single best thing to add). Then tell the agent you've added them. It reads everything, works out what's in it, and starts turning it into atoms — asking you a few questions along the way, mostly about outcomes, since old resumes are good at saying what you did and bad at saying what changed.

That first pass takes twenty to forty minutes for two or three documents. After that, applying to a specific posting takes a few minutes, because the thinking already happened.

## How it works

Walking through what actually happens, using the fictional example in [`examples/jordan-vale/`](examples/jordan-vale/):

**1. You drop in raw material.** Jordan Vale's example starts with two old resumes that disagree with each other on a start date and a metric, plus a performance review — see [`examples/jordan-vale/_inbox/`](examples/jordan-vale/_inbox/). Open `resume-2021.md` first, then `resume-2024-draft.md`, then `performance-review-2025.md` — that's the order the material arrived in, and it's easiest to spot the two conflicts in that order. ([`examples/README.md`](examples/README.md) has a fuller guided tour if you want one.)

**2. The agent digests it.** It reads everything, flags the two conflicts as direct questions rather than silently picking a version, and pulls ten atoms out of the material — separating accomplishments from duty language along the way. See [`examples/jordan-vale/profile/achievements.md`](examples/jordan-vale/profile/achievements.md). Notice the range: some atoms carry a hard number with a measurement method, some honestly say `Unmeasured`, one is marked as *not* a default resume bullet because it reads better as an interview answer, one records that Jordan directed a build rather than personally writing the code behind it, and one is marked `thin` — real work with no recorded outcome, kept rather than thrown away so it can be promoted the moment Jordan remembers what came of it.

**3. A posting comes in.** The agent parses it, ranks the top skills it's actually asking for, and checks them against what's in the profile — see [`examples/jordan-vale/applications/copperline-health-product-analyst/posting.md`](examples/jordan-vale/applications/copperline-health-product-analyst/posting.md).

**4. It maps the fit, honestly.** Every requirement gets rated strong, partial, or gap — see [`fit-analysis.md`](examples/jordan-vale/applications/copperline-health-product-analyst/fit-analysis.md) in the same folder. In this example, Jordan is applying to a healthcare company with zero healthcare experience. The analysis says so plainly instead of stretching an adjacent industry into something it isn't.

**5. It builds the documents, and you approve before anything is final.** The resume selects and arranges atoms — see [`resume.md`](examples/jordan-vale/applications/copperline-health-product-analyst/resume.md). The cover letter addresses the healthcare gap directly, in its own paragraph, rather than hoping it goes unnoticed — see [`cover-letter.md`](examples/jordan-vale/applications/copperline-health-product-analyst/cover-letter.md).

**6. It renders a file you can actually send.** A self-contained HTML file that opens in any browser and prints to a clean PDF — see [`output/`](examples/jordan-vale/output/) in the example.

Read [`examples/README.md`](examples/README.md) for a guided tour, or just poke around the folder yourself.

## More than one way through

That loop is the common path and the one to learn first — a posting comes in, documents come out, and once your profile exists each one takes a few minutes.

It isn't the only thing here. Ask for any of these in plain language; none of them need a command, and [`skills/README.md`](skills/README.md) is the full index if you'd rather see everything at once.

**If you'd rather start from your situation than from a list of capabilities**, [`docs/use-cases.md`](docs/use-cases.md) takes ten common ones — nothing's landing, an interview got scheduled, you've lost track of what you've sent — and says what's usually going on and what to ask for.

**Go all in on the one you want most.** Whatever the reason — the work, the company, the money, the timing. **That's the whole signal**, and it's the justification for the time: if the extra day is what gets you the interview, you'll be glad you spent it. The normal loop is built not to go looking; this one inverts that and works through the posting a requirement at a time, following up until an answer couldn't be misread, writing down what surfaces. It pays off best when you feel more qualified than your profile makes you look, because then the gap is in the record rather than in you — but that's what makes the day productive, not what picks the posting. Whatever it turns up is available to every application afterward, so even a rejection leaves you with a bigger profile. Depending on the size of the posting it can take a day or more, so it isn't something to run on everything. See [`skills/run-a-deep-dive.md`](skills/run-a-deep-dive.md).

**Get ready for the interview.** Roughly half a day, and a different job from building the resume — a document is read in six seconds and never argued with, and an interview is an hour of follow-up questions. It works from what you actually *sent*, which has usually drifted from your profile by then, pins down the facts behind each story so nothing gets assembled under pressure, covers the money-and-timing questions no document carries, and runs a mock. See [`skills/prepare-for-interview.md`](skills/prepare-for-interview.md).

**See where everything stands.** Past six or so applications, *"which of these have I not heard back from"* stops being answerable by opening folders one at a time. See [`skills/build-a-tracker.md`](skills/build-a-tracker.md).

**Keep the profile growing.** After an application goes out you get one question about what you learned. It's the only moment in the loop where the system gets smarter rather than just busier. See [`skills/maintain-profile.md`](skills/maintain-profile.md).

**Start when nothing's written down.** If you have no old resume worth digesting, that's a normal starting point and there's a path for it. See [`skills/gather-source-material.md`](skills/gather-source-material.md).

**Turn the caution up or down.** It runs in a forgiving mode by default. If it's still being fussier than you want — or you'd rather it pushed harder, which some people do after an interview goes badly on a detail — say so. See [`HELP.md`](HELP.md) → *make it stop being so fussy*. The one thing that doesn't move is whether a claim is supported by your own evidence.

## Folder map

```
_inbox/         drop your raw material here — old resumes, reviews, notes
profile/        what the agent produces from it: your facts, atoms, skills, voice
templates/      resume and cover letter formats — base (one page) and expanded (two)
applications/   one folder per posting you look at
output/         the finished files you actually send
examples/       the Jordan Vale walkthrough described above
docs/           how and why this is built the way it is
skills/         the step-by-step procedures the agent follows
```

`profile/`, `applications/`, `_inbox/`, and `output/` start empty except for a short README in each. Everything in them is gitignored — your career data never gets committed, even if you push this repo somewhere.

## A note on where you work

The setup above recommends Obsidian because a concrete recommendation beats an open field when you don't already have a preference. **Nothing here depends on it.**

This is plain markdown files in plain folders. It works identically in VS Code, in a terminal, in TextEdit, or in a plain file browser, and any finished document is a self-contained HTML file that opens correctly in any browser no matter what you built it in. If you already have an editor you like, use that and skip step 2 entirely.

## Applicant tracking systems, briefly

The templates in this repo look plain on purpose, and it's worth understanding why before you're tempted to dress one up.

**What they avoid, and why:**

- **Tables, multi-column layouts, text boxes** — parsers flatten them and often read the content out of order, scrambling your dates and titles.
- **Headers and footers** — frequently skipped entirely, which is the single most common way contact information goes missing from an application.
- **Graphics, logos, photos, icons, skill-rating bars** — none of it is extractable text.
- **Text inside images, and image-scanned PDFs** — nothing in them is readable as text at all.
- **Creative section headings** ("Where I've Been" instead of "Experience") — the parser is looking for the standard ones.
- **Unusual bullet glyphs and decorative fonts** — can come through as junk characters.
- **Hidden keyword stuffing** (white text, tiny fonts) — detectable, and a fast way to be discarded by a human who notices it.

**What they include, and why:**

- **Standard section headings** — Summary, Skills, Experience, Education, Certifications — so each section lands where the system expects it.
- **Job title, organization, location, and dates on their own line, in a consistent format** — how the system reconstructs your work history correctly.
- **Contact details in the body**, not a header.
- **Reverse-chronological order** — what every system assumes.
- **Plain bullets, standard fonts.**
- **The posting's own terminology, spelled out and abbreviated on first use** — "Search Engine Optimization (SEO)" — since a recruiter's keyword search may use either form.

**The honest framing:** most applicant tracking systems don't score you and auto-reject you. They parse your resume into a database and make it searchable. The real risk isn't a robot rejecting you — it's your resume parsing into garbage so that a recruiter searching for exactly what you're good at never finds you. That's what all of this is protecting.

**And when none of it applies:** if you're handing a resume straight to a person — someone you met, an internal referral, a small company with an email address — there's no parser in the loop and none of this constrains you. The agent can build you a more designed version for that situation; see the *bring your own template* option below.

More detail in [`docs/ats-notes.md`](docs/ats-notes.md).

## The truthfulness contract

The agent can only recombine, re-emphasize, and rephrase facts you've given it. It cannot invent or inflate an employer, a title, a date, a degree, a tool, a metric, or an outcome. If a posting wants something you don't have, it will say so and offer honest options — never quietly manufacture a match.

This is the entire reason the atom structure exists rather than just asking an AI to "write me a resume for this job." Full detail in [`AGENTS.md`](AGENTS.md).

## Bring your own template

The four templates that ship here (`resume-base.md`, `resume-expanded.md`, `cover-letter-base.md`, `cover-letter-expanded.md`) are deliberately plain — partly to survive an applicant tracking system, partly so a group of people using this same repo don't hand a recruiter the same-looking document twice.

If you'd rather match a format you already like — a PDF, a screenshot, a link, or just a description — drop it in `_inbox/` and tell the agent to use it as your template. It'll take the structure and never your wording, and it'll tell you plainly if that format will cause parsing problems. See [`templates/README.md`](templates/README.md).

## Privacy

Everything stays on your machine. The agent never uploads, transmits, or posts your material anywhere — reading a job posting means reading the posting, not sending your profile along with it. `_inbox/`, `profile/`, `applications/`, and `output/` are all gitignored.

## Troubleshooting

[`docs/troubleshooting.md`](docs/troubleshooting.md) covers the common snags — can't-read files, disagreeing old resumes, documents running long, PDFs that won't open, and more.

## License

MIT — see [`LICENSE`](LICENSE).

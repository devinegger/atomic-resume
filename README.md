# Atomic Resume

A system for turning your career history into tailored resumes and cover letters, built around one idea: **write every accomplishment down once, then select from it.**

## Why "atomic"

The normal way to job-search is to keep a resume file and copy-edit it for each posting. Do that fifteen times and the copies start disagreeing with each other — the same accomplishment phrased three different ways, a number that's "about 30%" in one file and "over a third" in another, a job title that only got fixed in the file you happened to have open that day.

This repo stores each accomplishment exactly once — as an **atom**: one fact, what came of it, and where the record of it lives — in a file called `profile/achievements.md`. When a posting comes in, an AI agent reads the posting, picks the atoms that actually match it, and arranges them into a resume. It never invents a bullet, because there's nowhere for a new claim to come from except your own atoms.

That loop — **drop in your old material → the agent digests it into atoms → you apply, and it composes a tailored document from what's true** — is the whole system. [`docs/data-model.md`](docs/data-model.md) has the full reasoning if you want it; you don't need to read it to get started.

## What you need

An AI agent with access to files on your computer — Claude Code, Codex, Cursor, or a chat tool with this folder attached. That's it. No account to create, no service to sign up for, nothing to install beyond the agent itself.

## Setup

Clone this repo, or download it as a folder. Open it in whatever agent you're using. That's the entire setup — there's no build step and nothing to configure.

```bash
git clone <this-repo-url>
cd atomic-resume
```

**No git, or not sure what that means?** Click the green "Code" button on the repo's page, choose "Download ZIP," then unzip it. You'll get a folder — open that instead of running the commands above.

Then open that folder with your agent:

- **Claude Code, Codex, or a similar CLI tool:** open a terminal, `cd` into the folder, and start the tool (for Claude Code, just run `claude`).
- **Cursor or another editor-based agent:** use File → Open Folder and pick this folder.
- **A chat tool in a browser:** look for an "attach folder" or "add files" option and point it at this folder.

Once it's open, paste this:

```
Read AGENTS.md, then help me get started. I'm new to this.
```

Some tools (Claude Code among them) load a startup file automatically — you'll know it worked if the agent's first reply already talks about atoms, your profile, or this repo without you having explained anything. If that happens, you can skip pasting the prompt above. If nothing seems to happen, paste it anyway; it works either way. (If you're curious: Claude Code specifically reads `CLAUDE.md`, which just points to `AGENTS.md` — you don't need to open either one yourself.)

## Quickstart

Put one or two old resumes in the `_inbox/` folder — any version, any age, doesn't matter. [`_inbox/README.md`](_inbox/README.md) has a longer list if you want ideas for what else helps (a performance review is usually the single best thing to add). Then tell the agent you've added them. It reads everything, works out what's in it, and starts turning it into atoms — asking you a few questions along the way, mostly about outcomes, since old resumes are good at saying what you did and bad at saying what changed.

That first pass takes twenty to forty minutes for two or three documents. After that, applying to a specific posting takes a few minutes, because the thinking already happened.

## How it works

Walking through what actually happens, using the fictional example in [`examples/jordan-vale/`](examples/jordan-vale/):

**1. You drop in raw material.** Jordan Vale's example starts with two old resumes that disagree with each other on a start date and a metric, plus a performance review — see [`examples/jordan-vale/_inbox/`](examples/jordan-vale/_inbox/). Open `resume-2021.md` first, then `resume-2024-draft.md`, then `performance-review-2025.md` — that's the order the material arrived in, and it's easiest to spot the two conflicts in that order. ([`examples/README.md`](examples/README.md) has a fuller guided tour if you want one.)

**2. The agent digests it.** It reads everything, flags the two conflicts as direct questions rather than silently picking a version, and pulls nine atoms out of the material — rejecting duty language and vague claims along the way. See [`examples/jordan-vale/profile/achievements.md`](examples/jordan-vale/profile/achievements.md). Notice the range: some atoms carry a hard number with a measurement method, some honestly say `Unmeasured`, one is marked as *not* a default resume bullet because it reads better as an interview answer, and one records that Jordan directed a build rather than personally writing the code behind it.

**3. A posting comes in.** The agent parses it, ranks the top skills it's actually asking for, and checks them against what's in the profile — see [`examples/jordan-vale/applications/copperline-health-product-analyst/posting.md`](examples/jordan-vale/applications/copperline-health-product-analyst/posting.md).

**4. It maps the fit, honestly.** Every requirement gets rated strong, partial, or gap — see [`fit-analysis.md`](examples/jordan-vale/applications/copperline-health-product-analyst/fit-analysis.md) in the same folder. In this example, Jordan is applying to a healthcare company with zero healthcare experience. The analysis says so plainly instead of stretching an adjacent industry into something it isn't.

**5. It builds the documents, and you approve before anything is final.** The resume selects and arranges atoms — see [`resume.md`](examples/jordan-vale/applications/copperline-health-product-analyst/resume.md). The cover letter addresses the healthcare gap directly, in its own paragraph, rather than hoping it goes unnoticed — see [`cover-letter.md`](examples/jordan-vale/applications/copperline-health-product-analyst/cover-letter.md).

**6. It renders a file you can actually send.** A self-contained HTML file that opens in any browser and prints to a clean PDF — see [`output/`](examples/jordan-vale/output/) in the example.

Read [`examples/README.md`](examples/README.md) for a guided tour, or just poke around the folder yourself.

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

This is plain markdown files in plain folders. It works the same in Obsidian, in VS Code, in a terminal, or in a plain file browser — and any finished document is a self-contained HTML file that opens correctly in any browser, no matter what you used to build it. Obsidian happens to be a pleasant way to browse the folder structure and see the links between files, but nothing here depends on it.

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

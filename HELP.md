# Help

Everything you might need to look up, in one file. Skim the headings; nothing here needs reading in order.

If you'd rather ask than read, **ask your agent** — it can read this file and answer from it. "How do I get a PDF?" works fine.

---

## Contents

- [I just want to start](#i-just-want-to-start)
- [Setting up from nothing](#setting-up-from-nothing)
- [How the whole thing works](#how-the-whole-thing-works)
- [How do I…](#how-do-i)
- [Which files should I actually open?](#which-files-should-i-actually-open)
- [Printing, and why there's no PDF button](#printing-and-why-theres-no-pdf-button)
- [When the agent does something odd](#when-the-agent-does-something-odd)
- [Is any of this private?](#is-any-of-this-private)

---

## I just want to start

Put one or two old resumes in the `_inbox/` folder. Tell your agent you've done it. That's the whole first step.

It'll read them, ask you some questions — mostly about how things turned out, because old resumes are good at saying what you did and bad at saying what changed — and turn the answers into your profile. Twenty to forty minutes. After that, each application takes a few minutes.

**Don't tidy anything up first.** Messy is what the folder is for.

---

## Setting up from nothing

The full version is in [`README.md`](README.md) → *Setup*. Short form:

1. **Download this folder.** Green **Code** button → **Download ZIP** → unzip it.
2. **Install [Obsidian](https://obsidian.md)** (free), open it, choose **Open folder as vault**, pick this folder. Optional but recommended — it's the nicest way to read what gets written. Any text editor works instead.
3. **Install an agent** — [Claude Code](https://claude.com/claude-code) is what this is tested against. Open a terminal, `cd` into the folder, run `claude`.

Then paste: `Read AGENTS.md, then help me get started. I'm new to this.`

**How you know it worked:** the agent's first reply talks about atoms or your profile without you having explained anything.

### "Vault" means folder

Obsidian calls a folder a vault. It's not a special format and it doesn't lock anything in. Delete Obsidian tomorrow and every file here is still a plain text file you can open in anything.

### Do I need to know git?

No. Download the ZIP. Git is useful if you already use it and irrelevant otherwise.

---

## How the whole thing works

**Write every accomplishment down once. Then select from it.**

Instead of keeping a resume and editing a copy for each job — which is how you end up with five files that disagree about what you did — this keeps each accomplishment exactly once, as an **atom**: one fact, what came of it, and where the record of it is. A resume is assembled by picking atoms that match a posting.

The reason this is worth the setup: **the agent can't invent a bullet, because there's nowhere for a new claim to come from except things you've told it.**

Four stages:

| Stage | What happens | How long |
|---|---|---|
| **Drop in** | You put old material in `_inbox/` | 10 minutes of digging |
| **Digest** | The agent reads it and asks about outcomes | 20–40 minutes, once |
| **Apply** | A posting arrives; it picks atoms and builds a document | A few minutes |
| **Print** | You open the HTML and print it to PDF | 1 minute |

Longer versions: [`docs/workflow.md`](docs/workflow.md) for the sequence, [`docs/data-model.md`](docs/data-model.md) for why it's built this way.

**Want to see it before doing it?** [`docs/walkthrough.md`](docs/walkthrough.md), or tell your agent: *"Walk me through this using the example first."*

---

## How do I…

These are individual tasks. If what you have is a *situation* rather than a task — nothing's landing, an interview got scheduled, you've been away for months — [`docs/use-cases.md`](docs/use-cases.md) starts from there instead and says what's usually going on underneath it.

### …apply to a job?

Paste the posting, or the link, and say you want to apply. The agent parses it, shows you how your background maps against what they're asking for, and tells you plainly whether it's worth the effort — sometimes the answer is no, and that's the feature.

### …go deeper on a posting I really want?

Say so, and the agent will run a deep dive instead of the normal loop.

**When it's the right call:** it's the job you want most, for whatever reason. That's the signal, and it's the whole justification for the extra time — if the day is what gets you the interview, you'll be glad you spent it.

It pays off best when you also feel more qualified than your written record makes you look, because then the gap is in the record rather than in you, and this is what closes it. But that's what makes the day *productive* — it isn't what picks the posting. A job you don't especially want, where the profile is thin because the experience genuinely isn't there, is a long shot, and a long shot doesn't earn a day.

Most applications run on what your profile already knows. This one goes the other way: it works through the posting one requirement at a time, keeps asking until an answer couldn't be misread, and writes new material as it goes — the only part of the system that does that during an application rather than after it.

The payoff outlasts the application either way, because everything it uncovers is available to everything you apply to afterward, whether or not this one lands.

**One caveat:** depending on how much the posting asks for, this can run a day or more. It's not something you'll have time for on every posting, and it's the wrong call in a week where you've got six things to get out — say so and the agent will scope it down or talk you out of it.

### …add something I forgot?

Just say it. *"I also ran the vendor migration last year."* It'll ask a couple of questions and write it down properly.

**One catch:** if you're in the middle of building an application, the new fact goes into your profile *afterward* and is available for the next one. That's deliberate — it's the rule that stops a convenient claim from appearing under deadline pressure. The agent will say so.

### …fix something that's wrong?

Tell the agent, or edit the file yourself. They're your files, they're plain text, and nothing is generated on the fly — what's in them is what gets used.

### …get a PDF?

See [Printing](#printing-and-why-theres-no-pdf-button) below.

### …use my own resume design?

Drop the format you like in `_inbox/` — a PDF, a screenshot, a link, or just a description — and say you want to use it as your template. The agent takes the *structure* and never the wording, and it'll tell you honestly if that design will confuse the systems that parse resumes.

### …write a cover letter?

Ask. It'll also tell you when it thinks one isn't worth writing, which is most of the time — a letter with nothing specific to say is a page of evidence that you had nothing specific to say.

### …get ready for an interview?

Say an interview got scheduled and who it's with. It works from what you actually sent (not what's in your profile now, which may have moved), builds a set of stories with the facts pinned down and a bank of questions organised by type, covers the money-and-timing questions no document carries, and runs a mock. Say yes to the mock; it's the part that actually helps.

Don't skip it for lack of time. Ideally it runs the day before so it's fresh, but it flexes — an evening is comfortable and a couple of hours is enough. You already got the interview; that was the scarce part.

### …see where all my applications stand?

Ask. It reads the logs and tells you, including which ones have gone quiet.

Once you've got more than about six going, ask for a tracker — *"build me a tracker"* or *"can I see all of these in a table?"* If you're using Obsidian you'll get a live, sortable table with saved views; otherwise a plain one it rebuilds on request.

One caveat it'll tell you too: **a tracker doesn't update itself.** It stays current because the agent updates it when you say what happened. If that lapses it doesn't go blank, it goes quietly wrong — and it still looks authoritative. The logs in each folder remain the real record.

### …stop for now?

Just stop. Everything's written to files as you go. Come back whenever and say what you were doing.

### …start over?

Delete the contents of `profile/` and say you want to start fresh. Your source material in `_inbox/` stays put, so re-digesting is quick.

### …make it stop being so fussy?

Tell it. It runs in a forgiving mode by default, and if it's refusing to write things down or interrogating you about numbers you don't have, that isn't how it's meant to behave. See [`profile/README.md`](profile/README.md) → *If it's being too picky*.

The one thing it won't bend on is putting something on your resume that isn't supported by what you've told it. That's not fussiness — that's the reason the whole thing exists.

---

## Which files should I actually open?

Most of them you never need to touch.

| Folder | Open it? |
|---|---|
| `_inbox/` | **Yes** — you put things here |
| `profile/` | **Worth reading.** This is your career, written down. Edit freely |
| `applications/` | **Sometimes** — one folder per job, holds the tailored documents |
| `output/` | **Yes** — the finished files you send |
| `templates/`, `skills/`, `docs/` | No. This is how the system works, not your data |

After a few months `profile/achievements.md` is probably the most complete record of your own work you've ever had. It's worth reading before a performance review, not just before a job search.

---

## Printing, and why there's no PDF button

**The agent produces an HTML file in `output/`. You open it in a browser and print it to PDF.** That's the whole export process.

1. Open the file from `output/` — double-clicking usually works.
2. **⌘P** (Mac) or **Ctrl+P** (Windows).
3. Destination: **Save as PDF**.
4. Margins: **Default**. Headers and footers: **off**. Background graphics: **on**.
5. Save it wherever you keep your applications — **not back into this folder**.

Then spend one minute checking:

- **Page count.** One, or two if that's what you chose.
- **No job split across a page break** — a job title stranded at the bottom of page one with its bullets on page two looks careless.
- **The text check.** Select all the text in the PDF, copy it, paste it into a blank note. Is your name there? Your phone number? Are the dates still attached to the right jobs? Whatever you see in that paste is roughly what an employer's system will read.

### Why no automatic PDF?

Because the moment a PDF gets saved into this folder, it starts going stale. You'd edit the resume, forget to re-export, and send the old one — and there's no way to tell two versions apart from the filename. Keeping the HTML as the real document and the PDF as something you print on demand makes that impossible.

It also means there's nothing to install and nothing to break.

### The faint line down the page

That's a page-boundary marker, on screen only. If your content crosses it, you're onto a second page. **It never prints.**

### A portal wants a Word file

Word opens HTML directly. File → Open → pick the `.html`, then Save As `.docx`. Check the spacing afterward; Word usually shifts it a little.

---

## When the agent does something odd

**It wrote something you didn't approve.** It shouldn't. Tell it — the rule is that it proposes and you approve. Undo by editing the file; nothing is hidden.

**It's refusing to put something on your resume.** Two possibilities. If it's saying the claim isn't supported by anything you've told it, it's doing its job — give it the real story and it becomes usable. If it's just being cautious about whether something *reads* well, that's your call, not its. Say "put it on" and it goes on.

**It's asking too many questions at once.** Say so. It's supposed to ask a few at a time and let you stop.

**It's rewriting instead of showing changes.** Ask for a change list instead. Reviewing eight numbered changes is possible; rereading a whole document is not.

**It made up a number.** That's the one serious bug in this system. Tell it, fix the file, and check the rest of the document. If you want it to be stricter about this in general, see the strict mode note in [`profile/README.md`](profile/README.md).

**It's lost, or acting like it's never seen this folder.** Paste: `Read AGENTS.md and skills/README.md, then tell me where we are.`

**Something else:** [`docs/troubleshooting.md`](docs/troubleshooting.md).

---

## Is any of this private?

**Yes. Everything stays on your machine.**

- Your material never gets uploaded, posted, or sent anywhere. Reading a job posting means reading the posting — it doesn't send your profile along with it.
- `_inbox/`, `profile/`, `applications/`, and `output/` are all gitignored, so even if you push this folder to GitHub, none of your career data goes with it.
- Nobody else can see any of it unless you send it to them.

Worth backing up somewhere private, though. After a while it's genuinely irreplaceable.

# Changelog

What changed, written for the person using this rather than the person maintaining it.

Versions are dates, not `1.2.3`. Semantic versions communicate "this breaks things," which isn't the question you have about a folder of markdown. Yours is *"is mine older than the current one"*, and two dates answer that without anyone learning a convention.

**Your copy's version is in [`VERSION`](VERSION).** Compare it to the top entry here. If they match, you're current.

To update, see [`HELP.md`](HELP.md) → *…update my copy?*, or just tell your agent **"update this repo."**

---

## 2026.08.16

The first update since the initial release. Everything below has been shipping wrong, or not shipping at all, for anyone who downloaded before today.

### You can now update without starting over

Previously there was no way to get a fix without re-downloading and hand-moving your data. There is now a `VERSION` file, this changelog, and an update process that leaves everything you've written alone. Setup recommends `git clone` first for this reason — `git pull` merges updates *around* your own edits. The ZIP still works and is still fine.

### It stops rating seniority

The posting analysis used to work out "what level this really is, versus what the title claims." That judgment needs things this system can't see — what a title means at that company's size, the comp norm for that market, where you actually sit today — and a confident wrong answer doesn't stay contained: it becomes the premise of a cover-letter paragraph and nothing downstream re-checks it. It now quotes what the posting says and leaves the judgment to you.

**If you applied to anything before today, this affected it.**

### It's less of an argument

Caution about *presentation* and caution about *truth* had been running in the same voice, which is what made a careful process feel like an adversary. They're now explicitly different: it defers immediately on taste, holds absolutely on evidence, and never drops something from a page without telling you.

Thin material — real work with no recorded outcome — is now written down and marked, rather than refused. Refusing to record something you volunteered about your own career reads as being told it didn't count, and after a few rounds people stop offering things.

### One-click postings are handled at intake

Recording that a posting is apply-with-stored-resume and then building a tailored document anyway produces a document nobody can deliver. It now asks at the start, and asks when that stored resume was last updated.

### The page ruler was wrong

The faint line marking the page break was drawn in the wrong place — it reported one page while you were already onto the second, which is the exact failure it exists to catch. Fixed and verified against a test document.

### New things

- **Deep dive** — the posting you want most, worked one requirement at a time, writing down what surfaces. Costs a day or more; leaves your profile permanently bigger whether or not you get the job.
- **Interview prep**, rebuilt — works from what you actually *sent* rather than your profile, builds a story bank and a question bank, covers money and timing, runs a mock. No worth-it test; it always runs.
- **Application tracker** — one table across every application, once you have more than about six.
- **`HELP.md`** — everything you might need to look up, in one file.
- **`docs/use-cases.md`** — ten situations, what's usually going on underneath each, and what to ask for.
- **A walkthrough** — read it in ten minutes, or be led through it.
- **Setup from nothing**, including installing Obsidian, with something you can check at every step.

---

## 2026.08.04

Initial public release.

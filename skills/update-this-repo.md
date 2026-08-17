---
name: update-this-repo
description: Use when they ask to update, or when their VERSION is behind and it matters. Brings the system files current without touching a word of their career data.
inputs: The repo as they have it, and whether it was cloned or downloaded
outputs: An updated copy, and a plain-language summary of what changed
---

# Update this repo

## Purpose

Get someone the fixes without making them start over.

This system ships as a folder. Folders don't update themselves, and until there was a version stamp there was no way for anyone — including them — to know their copy was months behind. A correction made here reaches nobody unless something like this runs.

## When to invoke

- **They ask.** "Update this", "am I on the latest", "is there a newer version".
- **`VERSION` is behind and it's relevant.** If they hit something the changelog says was fixed, say so and offer. Once.

⛔ **Never update on your own initiative.** It's their folder. Offer, explain what changes, let them decide.

## The rule that governs everything here

⛔ **Their career data is never touched. Not moved, not merged, not "cleaned up."**

`_inbox/`, `profile/`, `applications/`, `output/`, and anything they added to `templates/` are theirs. Under git these are ignored, so git physically cannot overwrite them — say so, because "will this delete my stuff" is the actual question behind the request.

⛔ **Never run `git reset --hard`, `git checkout .`, `git clean`, or a force pull.** Those destroy work. If an update can't proceed cleanly, stop and explain — a blocked update is a normal outcome, and it is enormously better than a lost afternoon.

## Step 1 — Which kind of copy is this?

```bash
git rev-parse --is-inside-work-tree 2>/dev/null
```

**True** → cloned. Go to Step 2.
**Anything else** → downloaded as a ZIP. Go to Step 4.

Also read `VERSION` if it exists. **No `VERSION` file at all means the copy predates versioning** — older than 2026.08.16, and every entry in the changelog applies to them.

## Step 2 — The cloned path

Check for local edits *before* pulling:

```bash
git status --porcelain
```

Anything listed is a tracked file they changed — a tweaked skill, an edited template. Their data won't appear here; it's ignored.

- **Nothing listed:** pull. It cannot conflict.
- **Something listed:** tell them what they've modified and what happens to it. Git merges around their edits and only stops where the same lines changed on both sides. Offer to commit their changes first (`git add -A && git commit -m "my changes"`), which makes the merge safe and reversible. **Don't stash silently** — a stash is invisible and gets forgotten.

Then:

```bash
git pull
```

**If it conflicts:** don't try to be clever. Name the files, explain that both sides changed the same lines, and walk them through one at a time. Their version is always a legitimate choice. If they want out, `git merge --abort` returns everything to exactly where it was.

## Step 3 — Say what actually changed

Read `CHANGELOG.md` for the entries between their old `VERSION` and the new one, and summarise **in terms of what it means for them**, not commit titles.

> Two things worth knowing. It used to guess at seniority level from postings and could be confidently wrong — it now quotes what the posting says instead. And the page-break line in printed resumes was drawn in the wrong place, so a resume could be two pages while showing as one.

⚠️ **If a fix changes something about work they already did, say so plainly.** Someone who applied to nine jobs under the old seniority behaviour should hear that, not discover it.

## Step 4 — The ZIP path

There's no merge here, and being straight about that is the whole job. Their data is safe because it lives in folders the new copy doesn't have; anything they edited in a system file is not.

1. **Ask what they've customised.** Any skill, doc, or template they edited by hand. There's no way to detect this without git — they have to remember. Have them copy those files somewhere first.
2. Download the current ZIP from the repo's green **Code** button and unzip it *next to* the old folder, not on top of it.
3. Move `_inbox/`, `profile/`, `applications/`, `output/` from the old folder into the new one, plus any templates they added.
4. Check the new folder has their material. **Then** delete the old one.
5. Confirm `VERSION` reads what the repo says.

**Offer the one-time fix while you're here:** if they use `git clone` instead, every future update is one command and their edits survive. It's the same folder either way and nothing about how they work changes. Offer it once, take no for an answer — plenty of people don't want git on their machine and that's a complete answer.

## Questions to ask

- **Before anything:** "Have you edited any of the system files yourself — a skill, a template?" Changes the whole path.
- **ZIP only:** "Where did you unzip the original?" Guessing at their folder layout is how data gets moved to the wrong place.
- **After:** "Does everything still look right?" They should open `profile/` and see their own material.

## Done looks like

- `VERSION` matches the repo's current version.
- Their `profile/` and `applications/` are untouched, and they've confirmed it by looking.
- They've been told what changed, in language about their situation rather than the repo's.
- Anything they'd customised either survived or was deliberately let go, with them deciding which.

## Common failure modes

⛔ **Reaching for `--force` or `--hard` when git resists.** Git resists because something would be destroyed. It's right. Stop and explain.

⛔ **Reporting success without checking.** Verify `VERSION` actually changed. A pull that fetched nothing, or a ZIP unzipped into the wrong folder, both look like success from the outside.

⛔ **Summarising the changelog as a list of commits.** "Refactored the analysis phase" means nothing to someone who wants to know whether their resumes were affected.

⛔ **Touching their data folders for any reason at all**, including tidying, renaming, or moving something that looks misplaced. It isn't misplaced; it's theirs.

⚠️ **Assuming the ZIP path is rare.** The setup docs recommended ZIP for a long time, so most existing copies are that shape. It isn't a fallback in practice — for a while it was the default.

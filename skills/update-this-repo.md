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
**Anything else** → downloaded as a ZIP. Go to Step 4, and read the migration path there first — for most people it's the better answer than re-downloading.

Also read `VERSION` if it exists. **No `VERSION` file at all means the copy predates versioning** — older than 2026.08.16, and every entry in the changelog applies to them.

⚠️ **The ZIP case is the common one, not the edge case.** Setup recommended Download ZIP for months, so most copies in existence have no `.git` and no `VERSION`. Expect it rather than treating it as unusual.

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

## Step 4 — The downloaded path

There's no merge available here, and being straight about that is the whole job. Their data is safe because it lives in folders the new copy doesn't have. Anything they edited in a *system* file is not.

**Lead with the migration.** Moving to a clone costs the same five minutes as re-downloading and it's the last time they ever do this by hand. Re-downloading solves today and leaves them in exactly the same position next time. Offer it once, in one sentence, and take no for an answer — plenty of people don't want git on their machine, and that's a complete answer. Step 4b is the re-download path for them.

### Step 4a — Migrating to a clone (preferred)

**First, ask what they've customised.** Any skill, doc, or **template they edited in place** — not a file they added, one of the shipped ones they changed. There is no way to detect this without git; they have to remember. Copy those files somewhere outside both folders before touching anything.

```bash
# 1. Clone next to the old folder, never on top of it
git clone https://github.com/devinegger/atomic-resume.git atomic-resume-new

# 2. Copy their data across — contents, not the folders themselves
for d in _inbox profile applications output templates; do
  cp -R old-folder/$d/. atomic-resume-new/$d/
done

# 3. THIS STEP IS NOT OPTIONAL — see below
cd atomic-resume-new && git status --porcelain
git checkout -- .
```

⛔ **Step 3 is where this goes wrong if you skip it.** Their old folder contains that version's shipped files as well as their data — a `README.md` in each data folder, and the four templates in `templates/`. Copying the folders across overwrites the current ones with old copies. Measured against the initial release: **seven tracked files clobbered, including all four resume and cover-letter templates silently rolled back**, and then every future `git pull` conflicts on them.

`git checkout -- .` restores every shipped file and cannot touch their data, because their data is untracked. Run `git status --porcelain` first anyway and **read out what it's about to restore** — if a filename there is something they told you they'd customised, that edit is about to be discarded, and they need to re-apply it from the copy they saved rather than lose it.

Then:

- Confirm `git status --porcelain` is empty.
- Have them open `profile/` and `applications/` and confirm their own material is there. **They look, not you.**
- Confirm `VERSION` matches the repo.
- **Then** delete the old folder. Not before.

### Step 4b — Re-downloading (if they don't want git)

1. **Ask what they've customised**, as above, and have them copy those files out first.
2. Download the current ZIP from the repo's green **Code** button and unzip it *next to* the old folder, never on top.
3. Copy `_inbox/`, `profile/`, `applications/`, `output/` contents across, plus any templates they **added**. ⚠️ **Not the shipped `README.md` in each folder, and not the four shipped templates** — those are part of the update and the old ones will overwrite them. Without git there's nothing to restore them with, so this has to be done right the first time.
4. Have them confirm their material is present. **Then** delete the old folder.
5. Confirm `VERSION` reads what the repo says.

⚠️ **Tell them plainly that this will need doing again.** Not as a sales pitch for git — so the next update isn't a surprise.

## Questions to ask

- **Before anything:** "Have you edited any of the system files yourself — a skill, a template?" Changes the whole path.
- **ZIP only:** "Where did you unzip the original?" Guessing at their folder layout is how data gets moved to the wrong place.
- **After:** "Does everything still look right?" They should open `profile/` and see their own material.

## Done looks like

- `VERSION` matches the repo's current version.
- Their `profile/` and `applications/` are untouched, and they've confirmed it by looking.
- They've been told what changed, in language about their situation rather than the repo's.
- Anything they'd customised either survived or was deliberately let go, with them deciding which.
- **On a migration:** `git status --porcelain` is empty. Anything left in it is a shipped file still holding an old version, and the update is only partly applied.

## Common failure modes

⛔ **Reaching for `--force` or `--hard` when git resists.** Git resists because something would be destroyed. It's right. Stop and explain.

⛔ **Reporting success without checking.** Verify `VERSION` actually changed. A pull that fetched nothing, or a ZIP unzipped into the wrong folder, both look like success from the outside.

⛔ **Summarising the changelog as a list of commits.** "Refactored the analysis phase" means nothing to someone who wants to know whether their resumes were affected.

⛔ **Touching their data folders for any reason at all**, including tidying, renaming, or moving something that looks misplaced. It isn't misplaced; it's theirs.

⚠️ **Assuming the ZIP path is rare.** The setup docs recommended ZIP for a long time, so most existing copies are that shape. It isn't a fallback in practice — for a while it was the default.

⛔ **Copying the data folders across and stopping there.** This is the specific way a migration fails, and it fails *quietly*: their data arrives intact, everything looks right, and seven shipped files have been rolled back to whatever version they downloaded. The templates are the ones that matter — a resume gets built from an old template and nothing announces it. `git status --porcelain` is the check, and it takes a second.

⛔ **Running `git checkout -- .` without reading the list first.** It's the correct fix and it discards edits to *shipped* files, which is exactly what someone who customised a template will lose. Read the list out before running it. Their data is never at risk from it — untracked files aren't touched — so the answer is to name what's about to go, not to skip the step.

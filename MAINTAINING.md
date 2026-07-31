# Maintaining this repo

Notes for whoever set this up and is keeping it in sync with their own private version. Not for the people using it day to day — they don't need this file.

## Porting improvements from your private version

You'll keep using your own private career vault, and this repo is a sanitized fork of the *system*, not a live mirror of your *data*. When you improve something in the private version — a sharper skill, a better default, a bug fix in the print shell — bring the improvement here, not your content.

1. **Isolate the change.** Diff your private version against what's here conceptually — same skill file, same doc, what's actually different in the *procedure*, not in your data.
2. **Rewrite it generically.** Strip anything specific to you: your employer, your role archetypes, your metrics, your phrasing examples. If an example is useful to keep, replace it with something structurally similar but obviously fictional — same shape as the Jordan Vale material in `examples/`.
3. **Check it against the denylist** (below) before it goes anywhere near a commit.
4. **Update `examples/jordan-vale/`** if the change affects behavior a new user would actually see — a new skill, a changed template shape, a different default. The example should stay a faithful demonstration of the current system, not a snapshot of an old one.
5. **Commit, with a message that describes the capability, not the personal context it came from.**

## Running the scrub check

`scripts/scrub-check.sh` does a case-insensitive search across the whole repo for every term in `scrub-terms.txt`. Both files are gitignored — the denylist itself never gets published, since a list of exactly what to avoid saying is itself sensitive.

```bash
./scripts/scrub-check.sh
```

Run it before every push, not just the first one. It's cheap and it catches the mistake where a real name or a real employer slips into a new example or a new skill file.

If it comes back with hits, look at each one — it may be a real leak, or it may be a false positive (a denylist term that happens to also be a common English word). Fix real leaks; don't just suppress false positives by loosening the check.

## Keeping the denylist current

`scrub-terms.txt` needs a new line whenever:

- You start a new role, so a new employer name enters the picture
- A new project, product, or internal system name shows up in your own material
- You notice a term specific enough to your workplace that a coworker would recognize it, even if it seems generic in isolation

When in doubt, add it. A denylist with a stray false positive costs you a few seconds reviewing a `scrub-check.sh` hit. A denylist missing a real term costs a coworker recognizing your employer's internal tool name in a document you handed them.

## Versioning the templates

The four templates in `templates/` (`resume-base.md`, `resume-expanded.md`, `cover-letter-base.md`, `cover-letter-expanded.md`) and the print shell (`scripts/print-shell.html`) are the parts of this repo most likely to get incrementally improved by the people using it — someone will find a wording rule that should be tighter, or a spacing issue in the shell.

If you take a change back into your own workflow, treat the shipped templates as the baseline others are also using — don't let them drift into something that only makes sense with your specific history. If a template change is substantial enough to matter, note it in the commit message so anyone who forked this repo before the change can see what shifted.

## What not to add

Resist folding your own private conventions back into this shared repo — the session-type write-protection scheme, a promotion queue, role archetypes, anything that assumes one person running parallel sessions under a deadline. Those made sense for your own workflow; they add friction for someone using this for the first time with one session at a time. If a coworker's workflow grows to genuinely need that machinery, that's worth a conversation, not a default.

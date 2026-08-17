# Maintaining this repo

Notes for whoever set this up and is keeping it in sync with their own private version. Not for the people using it day to day — they don't need this file.

## Porting improvements from your private version

You'll keep using your own private career vault, and this repo is a sanitized fork of the *system*, not a live mirror of your *data*. When you improve something in the private version — a sharper skill, a better default, a bug fix in the print shell — bring the improvement here, not your content.

1. **Isolate the change.** Diff your private version against what's here conceptually — same skill file, same doc, what's actually different in the *procedure*, not in your data.
2. **Rewrite it generically.** Strip anything specific to you: your employer, your role archetypes, your metrics, your phrasing examples. If an example is useful to keep, replace it with something structurally similar but obviously fictional — same shape as the Jordan Vale material in `examples/`.
3. **Check it against the denylist** (below) before it goes anywhere near a commit.
4. **Update `examples/jordan-vale/`** if the change affects behavior a new user would actually see — a new skill, a changed template shape, a different default. The example should stay a faithful demonstration of the current system, not a snapshot of an old one.
5. **Commit, with a message that describes the capability, not the personal context it came from.**
6. **Bump [`VERSION`](VERSION) and add a [`CHANGELOG.md`](CHANGELOG.md) entry** if the change alters behaviour a user would notice. Versions are dates (`2026.08.16`), one per shipping day rather than per commit. Write the entry for the person using this — what changes for them, and whether it affects work they've already done. A fix nobody can tell they need is a fix that doesn't get pulled.

### Don't let the cost become the headline

A pattern worth naming, because three skills shipped with it before anyone noticed and it will recur: **what a skill costs is a caveat, not a feature.** Lead with what it does and who it's for; put the time at the end, where someone can weigh it once they know what they'd be getting.

It happens for an understandable reason. In a private tool you already know why a skill exists, so the only thing worth writing down is the part that surprised you — which is usually how long it took. Ported straight across, that honest note lands in the first sentence a stranger reads, and the first thing they learn about a capability is its price.

What it looked like in practice:

- **The deep dive** opened with *"Spend a day on one posting"* — selling the duration as though it were the point.
- **Interview prep** stated *"Roughly half a day"* directly beneath its own line saying there is no *is it worth it* test because the interview is already the scarce thing. The number was also wrong as a floor; two hours is enough.
- **The tracker** leads with its maintenance obligation, which is correct and deliberate — that one is a genuine ongoing commitment someone should decline knowingly. The test isn't whether cost appears early, it's whether cost is doing the work of the purpose.

So: state the cost honestly, keep it accurate, and don't put it where the purpose goes. A related failure is describing a skill by its duration in the index — *"worth a day rather than half an hour"* names no signal and tells a reader nothing about when to reach for it.

## Running the scrub check

`scripts/scrub-check.sh` makes three passes, in decreasing order of certainty. `scrub-terms.txt` is gitignored — a list of exactly what to avoid saying is itself sensitive. The script is tracked, and excluded from its own scan.

```bash
./scripts/scrub-check.sh
```

**What it scans is the publishable set, not the working tree** — tracked files plus untracked files that aren't ignored, straight from `git ls-files`. That's exactly what a push can carry, and untracked-but-not-ignored counts because a new file is one `git add .` away from being published.

It deliberately does *not* walk the filesystem. Anyone actually using this repo has their real career history in `profile/` and `applications/` — gitignored, unpublishable, and full of the employer names, home paths and phone numbers these passes hunt for. Walking the tree meant the check hard-failed on every run with nothing staged and nothing to leak, then instructed the person to delete their own data. A check that fails when nothing is wrong stops being read, which is the failure this script exists to prevent.

⚠️ **It has no view of git history.** Scrubbing a file today does not unpublish what was committed yesterday. A leak found here and fixed here leaves the check green and the data in the history permanently.

1. **Denylist** — every term in `scrub-terms.txt`. Terms above the `=== WARN ===` line fail the run; terms below it only warn, because they're real *and* ordinary English. A term prefixed with `=` matches whole words only, which is what stops a short company name from firing on every word that happens to contain it.
2. **Patterns** — shapes rather than names: absolute `/Users/…` paths, real email addresses, real phone numbers. These catch leaks that were never on anyone's list. Values that are obviously reserved-for-documentation (`@example.com`, `555` numbers) are excluded per *value*, not per line — a real number sitting on the same line as a placeholder still fails. Money figures only warn, since the fixtures carry invented ones on purpose and a real one looks identical.
3. **Proper-noun sweep** — capitalized multi-word tokens in `skills/`, `docs/`, `templates/`, and the root docs that aren't on the fixture allowlist. Warns only. `examples/` is deliberately excluded; it's a reviewed set of invented names and sweeping it buries the signal. **This is the pass that catches an employer name nobody thought to add**, which is the exact failure described below.

### Enabling the pre-push hook

The hook ships in the repo, at [`.githooks/pre-push`](.githooks/pre-push). Git never clones hooks — a repository that could install executable code on clone would be a security hole — so point git at the tracked copy once per clone:

```bash
git config core.hooksPath .githooks
```

That setting lives in `.git/config`, which means **it has to be redone on every fresh clone**, and the failure mode of forgetting is silent. The file itself now survives a re-clone, which is the part that used to be missing: the instruction to "reinstall it" had nothing to reinstall from.

It blocks a push on exit 1, and lets one through with a notice on exit 2 (no `scrub-terms.txt`) — a contributor who forked this repo has no denylist, can't have one, and has nothing of yours to leak.

### Checking history

The passes above only see the current publishable set. **Scrubbing a file today does not unpublish what was committed yesterday**, and a leak found and fixed in the working tree leaves the check green with the data still in the history.

```bash
./scripts/scrub-check.sh --history
```

Runs the denylist and pattern passes over every commit reachable from `HEAD`. The proper-noun sweep is skipped there — across all of history it returns thousands of tokens dominated by prose that's since been rewritten, which buries the signal.

Worth running before any port and once after a stretch of pushing. ⛔ **A hit in history cannot be fixed by editing a file.** It needs the history rewritten (`git filter-repo`) and a force-push, and anyone who already cloned still has it. Treat it as an incident, not a chore.

If it comes back with hits, look at each one. Fix real leaks. If something is a genuine false positive, **narrow the term** (add `=` for whole-word matching, or make it more specific) or move it below the `=== WARN ===` line — don't delete it and don't loosen the check to make it quiet.

## Keeping the denylist current

**`scrub-terms.txt` is derived, not hand-maintained.** This matters, and it's the lesson of the 2026-08-14 rebuild: the original list was written on 2026-07-31 against the repo's source material as it stood that day. It covered two employers, because two applications existed. Ten weeks later there were thirty-six, and the private skills being considered for porting named two of the missing ones **fifty-five times between them**. The check passed the whole time. A hand-maintained denylist decays silently, and it decays fastest exactly when you're busiest — which is also when you're most likely to push.

So re-derive it rather than topping it up. The sources:

- every application folder name, and the `company`, `source`, and `platform` fields in each one's tracking file
- the profile's master record — employers, schools, certifications, locations
- the skills and achievements files — project, system, vendor, and internal-tool names
- a proper-noun sweep of your own private skill files, for anything capitalized that isn't ordinary English

Re-derive whenever you've done a batch of applications, before any port, and any time you're about to push after a gap. It takes a few minutes and it's the only step here that can't be recovered after the fact.

**What not to put on it:** ordinary industry vocabulary. Jira, SharePoint, Figma, Scrum, and their kin are not identifying on their own, and a denylist that fires on every run is a denylist that stops being read. If a combination of generic tools would fingerprint your workplace, that's a judgment call for the proper-noun sweep and your own eyes, not a literal term.

When in doubt about an actual name, add it. A stray false positive costs a few seconds. A missing term costs a coworker recognizing your employer's internal tool name in a document you handed them.

## Versioning the templates

The four templates in `templates/` (`resume-base.md`, `resume-expanded.md`, `cover-letter-base.md`, `cover-letter-expanded.md`) and the print shell (`scripts/print-shell.html`) are the parts of this repo most likely to get incrementally improved by the people using it — someone will find a wording rule that should be tighter, or a spacing issue in the shell.

If you take a change back into your own workflow, treat the shipped templates as the baseline others are also using — don't let them drift into something that only makes sense with your specific history. If a template change is substantial enough to matter, note it in the commit message so anyone who forked this repo before the change can see what shifted.

## What not to add

Resist folding your own private conventions back into this shared repo — the session-type write-protection scheme, a promotion queue, role archetypes, anything that assumes one person running parallel sessions under a deadline. Those made sense for your own workflow; they add friction for someone using this for the first time with one session at a time. If a coworker's workflow grows to genuinely need that machinery, that's worth a conversation, not a default.

**A PDF-rendering toolchain, in any form.** No Puppeteer, Playwright, headless Chrome, wkhtmltopdf, pandoc, WeasyPrint, or LibreOffice — not as a convenience feature, not as an "advanced" option, not even behind a flag. This is a deliberate design decision, not a gap waiting to be filled: see `docs/rendering.md` → *Export policy*. The HTML file is the artifact; the person's own browser produces the PDF. Standing up a renderer costs real money per run, duplicates work the person is already doing when they print, and the moment it exists someone will use it to write a PDF back into the repo — which is the specific failure this policy prevents (a stale PDF sitting in an application folder after the HTML it came from was edited, later attached by mistake). If a coworker asks for automated PDF generation, the answer is no, and this paragraph is why.

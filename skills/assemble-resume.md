---
name: assemble-resume
description: Use to build a tailored resume for a specific posting, either by filling a template from atoms the first time or by presenting a change list against an existing resume.
inputs: fit-analysis.md, the chosen template, and profile/
outputs: applications/<slug>/resume.md — approved, then written
---

# Assemble a resume

## Purpose

Turn selected atoms into a finished resume for one posting, without inventing anything and without producing a wall of prose nobody can review.

## When to invoke

After `skills/match-atoms-to-posting.md` and `skills/choose-document-format.md`.

## Two paths

**First composition** — nothing populated exists yet. Fill the chosen template from atoms.

**Tailoring** — they already have a resume from a previous application that's close to right. Present a change list against it.

The first application uses path one. Most later ones use path two, which is faster and easier to review. Check `applications/*/resume.md` for something recent and relevant before assuming path one.

---

## Path one — first composition

### 1. Select before you write

Work from `fit-analysis.md`. Decide, and be able to justify each choice:

- **Which atoms**, per role, ordered so the ones matching high-signal requirements come first within each block
- **Long or Short** for each — Short for dense layouts and older roles, Long where the detail is doing work
- **Which skills**, in the posting's words, ordered by the posting's priorities
- **Whether the summary earns its place.** Cut it if it would only restate the experience below. A weak summary costs four lines and adds nothing

Three to five bullets for recent and relevant roles, one or two for older ones. If an atom carries a `Use:` field, follow it by default — but say you did, and offer it anyway (see *Offer what you're leaving off*). The field records a past judgment about presentation, and presentation is the person's call.

### 2. Fill the template

Read the chosen file from `templates/`. Replace every `{{PLACEHOLDER}}`. Duplicate the `<!-- REPEAT -->` blocks once per role, most recent first. Strip the HTML comments — they're guidance, not content.

Facts come from `profile/master.md` — name, contact, titles, dates, education. Never retype these from memory or from an old resume; the master record is the source.

Follow `profile/voice.md`. If it doesn't exist, use the person's own phrasing from the atoms rather than smoothing it.

### 3. Show it before writing it

Write nothing to disk yet. Show the draft, or the parts that involved judgment, and say what you chose:

> Here's what I've put together. A few things worth flagging:
>
> - Led with the carrier scorecard in the Northwind block, since it maps to their top requirement
> - Used the long version of that one and short versions everywhere else, to keep it on one page
> - Cut the summary — it was restating the first two bullets
> - Skills line uses their words: "data visualization" rather than your "reporting"
>
> Anything you want changed before I write the file?

### 4. Write on approval

Write to `applications/<slug>/resume.md`. Append to `log.md`.

---

## Path two — tailoring an existing resume

### 1. Present a change list, never a rewritten document

This is the rule that makes review possible. A rewritten document can't be reviewed — the person can't see what moved, so they either accept all of it or reread the whole thing.

```markdown
| # | Change | Section | Detail | Justified by |
|---|---|---|---|---|
| 1 | REORDER | Experience | Move `carrier-scorecard-rollout` above `dispatch-queue` | Must-have 2: "reporting for non-technical stakeholders" |
| 2 | REWRITE | Summary | before → after, both in full | Posting language: "operational data" |
| 3 | CUT | Skills | Drop "process mapping", "Visio" | Not referenced anywhere in the posting |
| 4 | ADD | Experience | Include `freight-audit-recovery` (Short) | Nice-to-have: "cost recovery" |
| 5 | SWAP | Experience | `warehouse-onboarding` Long → Short | Space, after row 4 |
```

Rules:

- **Every row carries a justification tied to a specific line in the posting.** A change you can't justify doesn't get proposed.
- **ADD rows may only reference existing atoms.** If the right content doesn't exist as an atom, that is a **gap** — raise it, and if it turns out to be real work that was never captured, add the atom in a separate deliberate step *before* the resume references it. Not during.
- **REWRITE rows show before and after in full.** Never "tightened the summary."
- **Keep it under about ten rows.** More than that means you're rebuilding rather than tailoring, and path one is the honest way to do it.

### 2. They approve

**In standard mode** (the default — see `AGENTS.md` → *Extraction modes*), show the change list and let a blanket answer stand. "Looks good" means all of it. Most rows are reorderings, cuts, and phrasing swaps, and making someone acknowledge eight of those individually is ceremony that teaches them to skim — which is worse than not asking, because then the rows that matter get skimmed too.

**Two kinds of row always get called out on their own, in both modes:**

- **Anything that changes a claim** — a REWRITE that alters what's being asserted, an ADD that puts a new assertion on the page, any row touching a number. Name these, and get a real answer on each.
- **Anything you're proposing to cut that they've previously asked for.** Cutting it back out without saying so is how a document quietly reverts.

**In strict mode**, every row gets its own answer.

Apply what's approved and nothing else, in both modes.

### 2b. Offer what you're leaving off

**Don't drop an atom silently.** If something strong isn't going on the page — a `Use:` field says it belongs elsewhere, or it lost to length, or you judged it wouldn't land — say so in one line and let them overrule you:

> I've left the internal-tooling project off. Its `Use:` note says it reads better as an interview answer than a bullet, and I think that's right for this posting. Say the word and it goes on.

**If they want it on the page, put it on the page.** A `Use:` field is a note from a past conversation, not a rule they signed. They know something you don't about this application — who's reading it, what was said on a call, whether the note still reflects what they think. Presentation is their call; see `AGENTS.md` → *Whose call is it*.

**In strict mode**, respect the field without the offer — that's what the person opted into.

**What doesn't change in either mode:** a `Note:` field constraining *how* something is claimed still holds, always. "Designed it, didn't write the code" isn't a presentation preference — it's the fact. They can put the atom on the page; they can't put it there in a form that says something untrue.

### 3. Write on approval

Copy the source resume to `applications/<slug>/resume.md`, apply the approved changes there, and append to `log.md`. **Never edit the resume in another application's folder** — each application is a frozen record of what was actually sent.

---

## Both paths

### Check length honestly

Count. A markdown draft is roughly a page per 450–500 words of content, but that's an estimate — the real check happens at render.

If base is overflowing: cut the weakest atom or switch a Long to a Short. Do not shrink type or margins. If it's still overflowing after two cuts, say so and offer expanded:

> This is running about a page and a quarter. I can cut the two oldest bullets, or we can switch to the two-page format. What would you rather?

Offer, then take their answer — including "leave it long and I'll deal with it at print." **In strict mode**, anything added has to be paid for by something cut, and the page budget isn't negotiable.

### Run the tells pass

Before this is done, run `skills/check-for-ai-tells.md` against the draft. Tailoring introduces tells, so it has to run *after* tailoring, not before.

### Hand off

Then `skills/draft-cover-letter.md` if one is in scope, and `skills/render-documents.md` to produce the PDF.

## Questions to ask

- "Anything you want changed before I write the file?"
- On length overflow: "Cut the two oldest bullets, or switch to two pages?"
- When two atoms compete for the lead and the analysis doesn't settle it: "Either of these could lead. I'd pick the scorecard because it matches their wording. Agree?"

## Done looks like

- `applications/<slug>/resume.md` exists and every line traces to an atom or to `master.md`
- The person approved before it was written
- Nothing on the page contradicts a `Note:` field
- Anything left off because of a `Use:` field was named and offered, not dropped quietly
- No gap from the fit analysis has become a claim
- The tells pass has run
- `log.md` updated

## Common failure modes

**Writing a bullet that isn't an atom.** The central failure. Under posting pressure a plausible sentence is easy to produce and reads well. If it isn't in `achievements.md`, it doesn't go on the page.

**Upgrading a verb during selection.** The atom says "contributed to," the resume says "led." Copy the atom's language; adjust for the posting's vocabulary only, never its magnitude.

**Presenting a rewritten document instead of a change list.** They will accept it wholesale, and neither of you will know what changed.

**Overriding a `Use:` field on your own initiative** because the atom is strong and the posting is close. Follow the field by default — then say what you left off and let them decide. What's not allowed is the silent version in either direction: quietly including it, or quietly dropping it and never mentioning it existed.

**Treating a `Note:` field as negotiable.** It isn't. `Use:` is about where something belongs; `Note:` is about what's true. The person can overrule the first and cannot overrule the second.

**Padding to fill a second page.** If base overflows by two lines, cut two lines. If expanded has half a page of white space, it should have been base.

**Editing a previous application's resume in place.** Those are records of what was sent. Copy, then change.

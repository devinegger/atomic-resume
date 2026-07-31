---
name: render-documents
description: Use to turn an approved markdown document into a self-contained HTML file. The agent never generates a PDF — the person prints one from their own browser.
inputs: An approved resume.md or cover-letter.md, and scripts/print-shell.html
outputs: A self-contained HTML file in output/. Nothing else — no PDF gets written by this skill.
---

# Render a document

## Purpose

Get from approved markdown to a self-contained HTML file the person can open and print. That's the entire scope of this skill.

**This skill never produces a PDF.** It produces the HTML the person prints into one, themselves, in their own browser. No pandoc, no LaTeX, no Puppeteer, no headless Chrome, no dependency to install or break — see [`../docs/rendering.md`](../docs/rendering.md) → *Export policy* for why this is a hard rule and not just the current implementation.

## When to invoke

After a document is approved and the tells pass has run.

## Procedure

### 1. Convert the markdown to plain HTML

Read the approved `.md` and translate it by hand — you're doing the conversion, there's no tool involved:

| Markdown | HTML | Note |
|---|---|---|
| `# Name` | `<h1>` | The person's name, once |
| Contact line | `<p class="contact">` | In the body, never a page header |
| `## Section` | `<h2>` | Summary, Skills, Experience, Education, Certifications |
| `### Title — Org` | `<h3>` | |
| Date/location line | `<p>` directly after the `<h3>` | Its own line, consistent format |
| `- bullet` | `<ul><li>` | Plain bullets |
| `**bold**` | `<strong>` | |

Wrap each role — heading, date line, and bullets — in `<div class="role">` so the shell can keep it from splitting across a page break.

For a cover letter, wrap the body in `<div class="letter">` and put the sender block, date, and recipient in `<p class="meta">`.

**Strip every HTML comment.** Template guidance is not content, and a comment left in will not appear on screen but *will* appear in extracted text.

### 2. Fill the shell

Read `scripts/print-shell.html`. Replace `{{DOCUMENT TITLE}}` with the file name a browser should show, and replace the block between `<!-- CONTENT START -->` and `<!-- CONTENT END -->` with your HTML.

Write the result to `output/` with a name that's appropriate to send:

```
output/Jordan Vale - Product Analyst - Copperline Health.html
```

**Name it for the recipient, not for yourself.** The file name is visible to whoever downloads it. Spell things out — no abbreviations, no slugs, no `v3-final`.

### 3. Check the file yourself before handing it over

This is the automated half of verification — text analysis on the HTML you just wrote, no browser involved. Do this before telling them it's ready:

- **No external references.** Grep the file for `http://`, `https://`, `<link`, `<script src`, `@import`. There should be none — everything is inline or it isn't self-contained.
- **No leftover template debris.** No `{{PLACEHOLDER}}` text, no HTML comments, no `<!-- REPEAT -->` markers.
- **The bullet-rhythm and word-count checks from `check-for-ai-tells.md` already ran** before this step — don't re-derive them here, just confirm that skill actually ran if you're not sure.

If any of these fail, fix the HTML directly. None of this requires opening the file in anything.

### 4. Tell them how to get the PDF, and what to check when they do

**You do not render the PDF. They do, in their own browser.** Give them the steps and the checklist together — they're standing at the print dialog anyway, so the checks cost them nothing extra:

> Written to `output/Jordan Vale - Product Analyst - Copperline Health.html`.
>
> To make the PDF: open that file in your browser — double-clicking usually works — and click **Save as PDF** at the bottom, or press Cmd+P (Ctrl+P on Windows).
>
> Three things in the print dialog:
> - **Margins: Default.** The file sets its own; the browser's would double up.
> - **Headers and footers: off.** Otherwise the browser stamps the file name and date onto your resume.
> - **Background graphics: off**, unless you specifically want them.
>
> Then, on the result — takes about a minute:
> 1. **Page count.** Should be one. [or two]
> 2. **No job split across the page break** — a role's heading on one page with its bullets on the next looks careless.
> 3. **The text check.** Select all the text in the PDF, copy it, and paste it into a blank note. Is your name there? Your phone number? Are the dates still attached to the right jobs, in the right order?

That third one is the important one if the target is an applicant tracking system. Whatever they see in the pasted text is approximately what its database will hold. See [`docs/ats-notes.md`](../docs/ats-notes.md).

**Never do this checking for them by generating a PDF yourself.** There's no renderer in this system on purpose — see [`docs/rendering.md`](../docs/rendering.md) → *Export policy*. If they don't want to check it themselves, say the checklist takes about a minute and ask again; don't route around it by producing the PDF.

### 5. Fix problems at the source

**Slightly over a page.** Cut content — a weak bullet, or a Long atom switched to Short. Only after that, nudge `--base-size` down to 10pt or `--line-height` to 1.3 in the shell. Never below 10pt: it reads as desperate and some readers can't comfortably read it.

**A role splits across pages.** Check the `<div class="role">` wrapper is there. If it is and the block is simply too tall, cut a bullet or reorder.

**A page break in an awkward place.** Move a section rather than fighting it.

**The extracted text is scrambled.** Something got introduced that shouldn't be there. Check for tables or columns, and rebuild plainly.

### 6. Log it

```markdown
- 2026-02-14 — Rendered and checked. 1 page, no split roles, text
  extraction verified. output/Jordan Vale - Product Analyst - Copperline Health.html
```

## When a portal demands a Word file

Some application portals accept only `.docx`. Word opens `.html` natively:

> That portal wants a Word file. Open the HTML file in Word — File, Open, then pick the `.html` — and save it as `.docx`. Check what it looks like afterward, because Word usually changes the spacing a little.

Rare, and worth handling as a one-off rather than maintaining a second toolchain for.

## Questions to ask

- "Did it come out at one page?"
- "Do the dates and job titles still line up when you paste the text into a blank note?"
- On overflow: "It's running a few lines long. Want me to cut the oldest bullet, or switch to the two-page format?"

## Done looks like

- A self-contained HTML file in `output/`, opening correctly in a browser with no network, no external references
- Named appropriately for a recipient
- No comments, no placeholders, no template guidance left in the output
- No PDF anywhere in the repo — not in `output/`, not in an application folder
- The person has made the PDF themselves and confirmed page count, page breaks, and the text check
- Logged

## Common failure modes

**Generating the PDF yourself.** This skill produces HTML, full stop. If you find yourself reaching for a renderer — Puppeteer, headless Chrome, anything — stop; that's exactly the dependency this system is built to avoid. Give the person the HTML and the checklist instead.

**Saving a PDF into the repo**, even one the person sent you or asked you to keep. `output/` and `applications/<slug>/` hold the HTML, never a PDF export of it — a stored PDF goes stale the instant the HTML changes, and it's the stale one that gets attached by mistake later. If they want a copy kept, that's outside this repo, wherever they keep outgoing applications.

**Saying it's done without the checks.** You can't see their PDF. Ask, and wait for the answer.

**Leaving template comments in.** Invisible on screen, present in the extracted text.

**Shrinking type to fit.** Below 10pt is worse than cutting a bullet.

**Naming the file badly.** `resume-final-v2.html` is what the hiring manager will see in their downloads folder.

**Adding styling.** The shell is plain on purpose. If they want a designed document, that's `skills/adopt-template-format.md`, with the trade-offs stated.

**Rendering before the tells pass.** Order matters — tells get introduced during tailoring.

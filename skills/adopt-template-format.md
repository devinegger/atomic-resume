---
name: adopt-template-format
description: Use when the person wants a resume or cover letter format other than the ones that ship with the repo — a PDF they like, a screenshot, a link, or a description.
inputs: A sample document or a description of the desired format
outputs: A new template file in templates/, structure only, plus an honest applicant-tracking-system (ATS) warning where warranted
---

# Adopt a template format

## Purpose

Rebuild a format the person likes as a template in this repo — taking its **structure only**, never its content — and tell them honestly where that format will cost them.

The templates that ship here are deliberately plain, partly for parsing and partly so that several people using this system don't hand near-identical documents to the same recruiter. Bringing your own is a supported path, not a workaround.

## When to invoke

- They drop a resume or cover letter into `_inbox/` and say they want that shape
- They send a link, a screenshot, or a description
- They say the standard templates feel plain, or their industry has a house style
- `templates/README.md` sent them here

## Procedure

### 1. Get the sample and read it for structure

Whatever form it's in — a PDF, a screenshot, a link, or a description in words. If you can't read it, ask them to describe it rather than guessing.

Read for:

- **Section order** — what comes first, what's near the bottom
- **Section headings** — their exact words
- **How experience is presented** — bullets or prose, how many per role, whether there's a context line under the title
- **How dates and locations are formatted and positioned**
- **Whether there's a summary, a highlights block, a projects section, anything unusual**
- **Length** — one page, two, longer
- **Tone** — terse and factual, or fuller sentences
- **Visual structure** — columns, sidebars, tables, rules, graphics

### 2. Take structure, never content

**Never copy the sample's wording, bullets, accomplishments, or phrasing.** If the sample is someone else's resume, that person's work is not source material for this person's document, and lifting a well-turned bullet is plagiarism that a reference check can expose.

What you take is the shape. What fills it is their atoms. Say this out loud, because people are sometimes surprised:

> I'll rebuild the layout and section order from this. The wording all comes from your own material — I won't carry over any of their sentences.

### 3. Warn about anything that parses badly

If the format uses columns, tables, sidebars, text boxes, headers, footers, icons, graphics, or skill bars, say so before building it. Be specific about which element causes which problem, and don't moralize — it's their document.

> That layout looks good, and two things in it will cause trouble in an applicant tracking system:
>
> - The **skills sidebar** is a second column. Parsers frequently interleave columns, so your skills can end up spliced into the middle of your job history.
> - **Your name and phone are in the header.** Headers are often skipped entirely, which is the most common way contact details go missing from an application.
>
> I can build it as-is, and I'd suggest also making a plain version for portal submissions — same content, single column, contact details in the body. You'd send the designed one when a person is receiving it directly. Want both?

Point them at [`docs/ats-notes.md`](../docs/ats-notes.md) for the reasoning, and offer the plain version rather than making it conditional on them asking.

### 4. Build the template file

Write it to `templates/` with a descriptive name — `resume-designed.md`, `resume-academic.md`. Don't overwrite the four that ship with the repo; those are the fallback when something goes wrong.

Match the conventions of the existing templates so every skill can read it:

- YAML frontmatter with `template`, `format`, `target_length`, `use_when`, and `rules`
- `{{DOUBLE BRACE}}` placeholders
- HTML comments for guidance, which disappear at render
- `<!-- REPEAT -->` … `<!-- /REPEAT -->` around repeatable blocks

Carry the truthfulness rule into the frontmatter, the same as the shipped templates:

```yaml
rules:
  - Every bullet must trace to an atom in profile/. No invented claims.
```

### 5. If it's a visually designed format

Markdown plus the print shell handles single-column layouts well. It does not do sidebars, precise typography, or graphics.

Be honest about the ceiling:

> I can get the section order, headings, and structure right in markdown. What I can't reproduce is the two-column layout and the typography — that needs a design tool. If the visual design is the point, one option is to keep your content here and paste the finished text into that design once per application. You'd get the atom discipline and the look, at the cost of one manual step.

Don't build something half-designed and call it a match.

### 6. Register it and confirm

Tell them it's available and how to use it:

> Written to `templates/resume-designed.md`. It'll show up as an option next time we build a resume, alongside base and expanded.

Note that anything they add to `templates/` beyond the four shipped files is gitignored — it's theirs and it stays local.

## Questions to ask

- "Is this a format you found, or one you've used before?" — if it's their own old resume, the content is theirs and the constraint in step 2 relaxes, though it still gets rebuilt from atoms rather than copied.
- "Do you want both versions — the designed one for direct sends and a plain one for portals?"
- "Which parts of this matter to you? If it's the section order I can match it exactly; if it's the visual design there's a limit to what I can do here."

## Done looks like

- A new template file in `templates/` following the existing conventions
- Structure taken, wording not
- Any ATS-hostile elements named specifically, with a plain alternative offered
- The person knows what was reproduced and what wasn't
- The shipped templates are untouched

## Common failure modes

**Copying the sample's bullets.** The bright line in this skill.

**Building an ATS-hostile format silently.** They're allowed to choose it. They're not allowed to choose it without knowing.

**Overpromising on visual fidelity.** Markdown and a print shell won't reproduce a designed document. Say so before building, not after.

**Overwriting a shipped template.** New file, new name.

**Moralizing.** Say the trade-off once, offer the plain version, then build what they asked for.

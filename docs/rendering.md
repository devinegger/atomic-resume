# Rendering — from markdown to PDF

How an approved document becomes a file someone can actually submit.

## The stack: a browser, and nothing else

There's no build step, no toolchain, and nothing to install. A finished document is one self-contained HTML file with its CSS inline. Opening it in any browser and printing to PDF is the entire pipeline.

**Why this instead of a document generator or a design tool:**

- **What you see is what prints.** The browser that renders the preview is the same engine that produces the PDF — no format conversion in between to introduce drift.
- **Self-contained means durable.** No external stylesheet, no webfont, no image, no script beyond a print button. The file opens correctly on a machine with no internet connection, and it'll still open correctly in ten years, because nothing it depends on can go offline or get deprecated.
- **Nothing to maintain.** A toolchain is one more thing that can break the week an application is due. This has no toolchain to break.

## The shell

[`../scripts/print-shell.html`](../scripts/print-shell.html) is the template every rendered document uses. It's deliberately plain — see [`ats-notes.md`](ats-notes.md) for why — single column, standard fonts, no tables, no graphics, contact details in the body rather than a page header.

The [`render-documents`](../skills/render-documents.md) skill converts an approved markdown file into HTML by hand (there's no markdown-to-HTML tool involved) and drops it into the shell's content block. If a document runs slightly long or short, the fix is the `--base-size` and `--line-height` variables at the top of the shell — never below 10pt, and cutting content is almost always the better fix.

## Getting the PDF

Open the rendered HTML file in a browser, then either click the **Save as PDF** button at the bottom of the page or press Cmd+P / Ctrl+P. Two settings in the print dialog matter:

- **Margins: Default.** The file sets its own page margins; the browser's default margins would stack on top of them.
- **Headers and footers: off.** Otherwise the browser stamps a file name and today's date across the page.

## Before it's done

Three checks, all covered in [`render-documents.md`](../skills/render-documents.md):

1. **Page count** matches what was intended.
2. **No role splits across a page break** — a job title stranded at the bottom of one page with its bullets starting the next.
3. **The text-extraction check** — select all the text in the PDF, copy it, paste it into a blank note, and confirm the name, contact details, and job history come out in the right order. This is the check that actually matters for applicant tracking systems; see [`ats-notes.md`](ats-notes.md) for why.

## When a portal insists on `.docx`

Some application portals won't accept a PDF. Word opens `.html` files directly — File → Open → select the file → Save As → `.docx` — and it's worth reviewing the result afterward, since Word tends to shift spacing slightly on the way in. This is a one-off conversion for the rare posting that demands it, not a reason to maintain a second rendering path.

## Bringing your own look

The plain shell is the default because it's what several people from the same workplace can safely use without handing a recruiter the same-looking document twice, and because it's built to survive a parser. If you want something with more personality — reasonable when you're sending a resume straight to a person rather than through a portal — see [`../skills/adopt-template-format.md`](../skills/adopt-template-format.md). The honest limit: markdown and this shell handle a single-column, plain-text layout well and don't attempt multi-column design — if the visual design is the whole point, that's a job for a design tool, with this system supplying the disciplined content to paste into it.

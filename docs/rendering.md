# Rendering — from markdown to PDF

How an approved document becomes a file someone can actually submit.

## The stack: a browser, and nothing else

There's no build step, no toolchain, and nothing to install. A finished document is one self-contained HTML file with its CSS inline. Opening it in any browser and printing to PDF is the entire pipeline.

**Why this instead of a document generator or a design tool:**

- **What you see is what prints.** The browser that renders the preview is the same engine that produces the PDF — no format conversion in between to introduce drift.
- **Self-contained means durable.** No external stylesheet, no webfont, no image, no script beyond a print button. The file opens correctly on a machine with no internet connection, and it'll still open correctly in ten years, because nothing it depends on can go offline or get deprecated.
- **Nothing to maintain.** A toolchain is one more thing that can break the week an application is due. This has no toolchain to break.

## Export policy — HTML is the artifact, PDF is a print

**The agent never generates a PDF.** The `.html` file in `output/` is the deliverable. The person opens it in their own browser and prints it to PDF when they need one — that's the entire export step, and it happens on their machine, not in this system.

**Never install, invoke, or depend on a PDF renderer for routine export** — no Puppeteer, Playwright, headless Chrome, wkhtmltopdf, pandoc, WeasyPrint, or LibreOffice. There is no build step in this repo, and adding one to automate what a browser's print dialog already does for free is a regression, not an improvement.

**Never write a PDF into the repo** — not into `output/`, not into an `applications/<slug>/` folder. This isn't a style preference: a stored PDF goes stale the moment the HTML underneath it gets edited, and a stale PDF is worse than none — it's the version that gets attached by mistake, still carrying a paragraph that was already cut. If the person wants to keep a copy, that's fine — just point them outside this repo, wherever they keep their outgoing applications.

**Verification is split by what it costs:**

*Automated — the agent does this itself, no renderer required:*
- per-bullet character count, min/max, spread, and standard deviation
- tricolon ratio (count of `, X, and Y` patterns)
- em-dash and semicolon counts
- word count against the cover letter's format ceiling
- the HTML file's own structure — self-contained, no external stylesheet/script/font reference, no leftover template comments

All of this is text analysis. None of it needs a browser, and it happens before the person ever opens the file. See [`../skills/check-for-ai-tells.md`](../skills/check-for-ai-tells.md) and [`../skills/render-documents.md`](../skills/render-documents.md).

*Human, at print time — the person checks this, the agent gives them the list:*
- page count, and that no role block splits across a page break
- margins **Default**, headers and footers **off**, background graphics off
- the text-extraction check, if the target is an applicant tracking system

**Why the split:** the layout checks genuinely need a rendering engine to answer — page breaks, margins, and print output only exist once something renders. The person is already opening a browser to print; asking them to glance at print preview while they're there costs nothing. Standing up a renderer to do that glance on their behalf costs real money on every single run, for a document they're about to open anyway.

## The shell

[`../scripts/print-shell.html`](../scripts/print-shell.html) is the template every rendered document uses. It's deliberately plain — see [`ats-notes.md`](ats-notes.md) for why — single column, standard fonts, no tables, no graphics, contact details in the body rather than a page header.

The [`render-documents`](../skills/render-documents.md) skill converts an approved markdown file into HTML by hand (there's no markdown-to-HTML tool involved) and drops it into the shell's content block. If a document runs slightly long or short, the fix is the `--base-size` and `--line-height` variables at the top of the shell — never below 10pt, and cutting content is almost always the better fix.

## When a portal insists on `.docx`

Some application portals won't accept a PDF. Word opens `.html` files directly — File → Open → select the file → Save As → `.docx` — and it's worth reviewing the result afterward, since Word tends to shift spacing slightly on the way in. This is a one-off conversion for the rare posting that demands it, not a reason to maintain a second rendering path.

## Bringing your own look

The plain shell is the default because it's what several people from the same workplace can safely use without handing a recruiter the same-looking document twice, and because it's built to survive a parser. If you want something with more personality — reasonable when you're sending a resume straight to a person rather than through a portal — see [`../skills/adopt-template-format.md`](../skills/adopt-template-format.md). The honest limit: markdown and this shell handle a single-column, plain-text layout well and don't attempt multi-column design — if the visual design is the whole point, that's a job for a design tool, with this system supplying the disciplined content to paste into it.

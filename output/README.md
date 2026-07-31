# Output — the files you actually send

Finished documents land here as self-contained HTML files. You open one in a browser and save it as a PDF.

```
output/
  Jordan Vale - Product Analyst - Copperline Health.html
  Jordan Vale - Cover Letter - Copperline Health.html
```

## Getting the PDF

1. **Open the HTML file in your browser.** Double-clicking it usually works. If not, drag it onto a browser window.
2. **Click "Save as PDF"** at the bottom of the page, or press Cmd+P (Ctrl+P on Windows).
3. **Two settings matter** in the print dialog:
   - **Margins: Default** — the file sets its own, and the browser's would double up on them.
   - **Headers and footers: off** — otherwise your browser stamps the file name and today's date across your resume.
4. Save it wherever you keep things you're sending.

No software to install. Any browser works. The HTML file has no dependencies at all — no fonts to download, no internet needed — so it'll still open correctly in ten years.

## Check it before you send it

Takes a minute and catches almost everything:

- **Page count.** One page, or two. Not one and a half.
- **No job split across the page break.** A job title stranded at the bottom of page one with its bullets on page two looks careless.
- **The text check.** Select all the text in the PDF, copy it, paste it into a blank note. Is your name there? Your phone number? Are the dates still with the right jobs, in the right order?

That third one matters most. What you see in that pasted text is roughly what an employer's applicant tracking system will store about you — and if it comes out garbled there, a recruiter searching for someone like you won't find you. [`../docs/ats-notes.md`](../docs/ats-notes.md) explains what's going on.

## If a portal demands a Word file

Some do, and won't take a PDF. Word opens HTML files directly: File → Open → pick the `.html`, then save as `.docx`. Check the spacing afterward, because Word usually shifts things a little.

## Why the documents look plain

On purpose, and the reasoning is in [`../docs/ats-notes.md`](../docs/ats-notes.md). Short version: the formatting is protecting how your resume gets *parsed*, not how it gets scored. If you want something with more visual design — reasonable when you're sending it straight to a person — ask the agent, and it'll tell you what that costs and offer to make you both versions.

## Privacy

Gitignored. These never leave your machine unless you send them.

Regenerating any of these takes seconds, so deleting things here is safe — the real work lives in `profile/` and `applications/`.

# Applicant tracking systems, and why the templates are plain

The templates in this repo look unstyled on purpose. This document explains what they're protecting against, so that when you decide to change something you're making an informed trade rather than an accidental one.

---

## What actually happens to your resume

Most people picture an applicant tracking system as a robot that reads your resume, scores it, and rejects you. That picture is mostly wrong, and believing it leads to bad decisions — like keyword-stuffing, or obsessing over a "match score" that nobody at the company ever looks at.

Here is what usually happens. Your file gets uploaded. The system runs a parser over it that tries to pull structured fields out of an unstructured document: name, email, phone, employer, job title, start date, end date, degree, school, skills. Those fields go into a database row. Your original file is attached to that row.

Then a human — a recruiter or a coordinator — searches that database. They type something like `warehouse management systems` or `Product Owner` and get back a list of candidates. They open a dozen of them and read the attached file with their own eyes.

So there are two separate failure modes, and they have different fixes:

**The parse fails.** Your dates land in the wrong field, your job titles get scrambled, your employer comes through as your job title, or half the document doesn't get extracted at all. Now you're in the database as a malformed record. When the recruiter searches for exactly the thing you're best at, you don't come back in the results. Nobody rejected you. You were never in the running, and no one — including you — will ever know why.

**A human reads it and passes.** That one is a normal outcome of applying for jobs, it's not a technology problem, and no amount of formatting fixes it.

**The plain formatting is entirely about the first failure mode.** It is not about pleasing an algorithm. It's about making sure that when a person goes looking for someone like you, the database has an accurate record of you to find.

Some systems do also compute a keyword match score. Where they exist, those scores are usually a sort order on a list, not a gate. Recruiters routinely ignore them. Optimizing your document for the score at the cost of readability is a bad trade — one audience is a suggestion engine, the other decides whether you get a call.

---

## What these templates deliberately avoid

**Tables** — parsers flatten them into a single stream of text, and often read cells column-first rather than row-first. A two-column table of dates and titles can come out as every date followed by every title, with nothing connecting them.

**Multi-column layouts** — the same problem at page scale. A sidebar of skills next to a column of experience frequently interleaves, producing sentences that alternate between the two.

**Text boxes** — many parsers skip them entirely, because the text isn't part of the main document flow. Anything you put in one may simply not exist as far as the database is concerned.

**Headers and footers** — frequently ignored for the same reason. This is the single most common way contact information disappears: your name and phone number are in the header, the parser never sees them, and the recruiter has a resume they can't respond to.

**Graphics, logos, photos, and icons** — they carry no extractable text. At best they're wasted space; at worst a photo invites bias you didn't ask for, and some employers discard resumes with photos for exactly that reason.

**Skill rating bars** — the visual that shows "Excel ▮▮▮▮▯". A parser sees a shape, not a rating, so your skill list becomes a list of words with no context. And the ratings mean nothing to a reader anyway: your four out of five and mine aren't the same scale.

**Text inside images** — nothing in it is readable as text. A resume where the name is a designed graphic is a resume with no name in the database.

**Image-scanned PDFs** — the whole document is a picture. This happens when you print a resume and scan it back in, or export from certain design tools. Test: open the PDF and try to select a sentence with your cursor. If you can't, no parser can read a word of it.

**Creative section headings** — "Where I've Been" instead of "Experience", "My Toolkit" instead of "Skills". Parsers look for the conventional headings to know where sections start and stop. An unrecognized heading means the content underneath gets attached to the previous section, or dropped.

**Unusual bullet glyphs and decorative fonts** — arrows, checkmarks, dingbats, and display typefaces can come through as replacement characters or as nothing. A bullet list rendered as `??? Managed the vendor relationship` is a bad first impression from a human reader too.

**Hidden keyword stuffing** — white text on white background, or a two-point font block of job titles at the bottom. It is trivially detectable, several systems flag it explicitly, and if a human notices it you are done at that company. There is no version of this that's worth it.

---

## What these templates deliberately include

**Standard section headings** — Summary, Skills, Experience, Education, Certifications. Every parser recognizes these, so every section lands where it's expected to land.

**Job title, organization, location, and dates on their own line, in a consistent format** — this is what lets the system reconstruct your work history correctly. Consistency matters more than which format you pick: if one role says `March 2022 – Present` and another says `3/22–now`, expect one of them to be misread.

**Contact details in the body of the document**, in the first few lines, not in a header. This is the fix for the most common catastrophic failure.

**Reverse-chronological order** — most recent first. These systems assume it, and so does every human reader. A functional resume that groups by skill instead of by job parses poorly and reads as though you're hiding something, whether or not you are.

**Plain bullets and standard fonts** — a normal `-` or `•`, and a typeface that has existed for twenty years. Boring, and it survives every conversion.

**One column, top to bottom** — the reading order is unambiguous, so the extracted text comes out in the order you wrote it.

**The posting's own terminology, spelled out and abbreviated on first use** — "Search Engine Optimization (SEO)", "Applicant Tracking System (ATS)". A recruiter searching the database might type either form, and only one of them is in your document unless you write both. This is legitimate and it's different from keyword stuffing: you're writing the words for a thing you actually did, in both the forms people call it.

---

## When none of this applies

**When you're sending a resume directly to a person** — a hiring manager you met, someone forwarding it internally, a small company with an email address on the careers page — there is no parser in the loop. Nothing here constrains you. If you want a designed resume with your own typography, that's the situation where it costs you nothing and might help.

**When your field expects a portfolio aesthetic** — design, art direction, some creative roles — the visual document *is* part of the application, and a plain one reads as a missing skill. Send the designed version where it belongs, and keep a plain version for the portal.

**A reasonable habit** if you're doing both: keep the plain version as your default, and treat the designed one as a variant you produce when you know a human is receiving it directly. The agent will make you either one; ask.

---

## Checking your own document

Before you submit, do this once. It takes a minute and it catches almost everything on this page:

1. Open your exported PDF.
2. Select all the text and copy it.
3. Paste it into a plain text file or an empty note.

Then read what you got. Is your name at the top? Is your phone number there at all? Are the job titles still attached to the right employers, and the dates to the right jobs? Does it read top to bottom in the order you wrote it?

Whatever you see in that plain text is approximately what the database sees. If it's garbled there, it's garbled everywhere that matters, and no amount of how it looks on screen will fix it.

---

## Related

- [`rendering.md`](rendering.md) — turning a finished document into a PDF
- [`../skills/render-documents.md`](../skills/render-documents.md) — the render procedure, including this check
- [`../skills/adopt-template-format.md`](../skills/adopt-template-format.md) — bringing your own format, and what to watch for

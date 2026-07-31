# Troubleshooting

Things that go wrong, and what to do about them.

## Getting started

**"I don't have an old resume."** Not a blocker. Go to [`../skills/gather-source-material.md`](../skills/gather-source-material.md) — it builds material through conversation and, if you've used ChatGPT or Copilot for work, by mining that history with a prompt built to prevent the summary from inflating what actually happened.

**"I put files in `_inbox/` and nothing happened."** The agent doesn't watch the folder — tell it you've added something. If it says the folder looks empty, check you saved into `_inbox/` specifically and not somewhere else in the repo.

**"It says it can't read my resume."** Almost always an image-scanned PDF — the text isn't actually text, it's a picture of text. Open it yourself, try to select a sentence with your cursor; if you can't, neither can the agent. Paste the content in as plain text instead, or describe what's in it.

**"The agent is asking me a lot of questions."** It should be asking one at a time, in a short batch, with an example answer. If it's dumping a list, say so — that's covered as an anti-pattern in [`../AGENTS.md`](../AGENTS.md) and it should course-correct immediately. You can always say "let's stop for now" and pick it up later.

## The profile

**"I don't know the answer to a metric question."** Say so. `Unmeasured` is a completely normal, permanent answer for an atom — it doesn't get removed or held back for being metric-free. What kills a bullet is a wrong number, not an absent one.

**"Two of my old resumes disagree with each other."** That's exactly what [`process-inbox`](../skills/process-inbox.md) is built to catch. It should surface the conflict as a direct question rather than silently picking one version. If a document went through without that question being asked, something skipped a step — point it out.

**"An atom doesn't sound like something I'd say."** Edit the file directly, or tell the agent what's wrong. `profile/achievements.md` is plain markdown; you're allowed to fix it yourself. See [`../skills/decompose-into-atoms.md`](../skills/decompose-into-atoms.md) if you want to understand why it's phrased a certain way before changing it.

**"I did something that isn't in my profile and I want it added mid-application."** The system will ask you to finish the current application first, then capture it properly. This is deliberate — see [`../skills/maintain-profile.md`](../skills/maintain-profile.md) — and it means the new fact is available for the next application onward, not rushed into the one that surfaced it.

## Building a document

**"The resume is a line or two over one page."** Say so and ask for options — usually cutting the weakest bullet or switching a detailed atom to its short version. The fix is not shrinking the font past 10pt; that reads as more desperate than a cut bullet.

**"I don't understand why something got marked a gap."** A gap means nothing in your profile evidences that requirement — not that the agent doesn't believe you, but that there's no atom to point to yet. If you actually have relevant experience that was never captured, that's real and worth adding — as a deliberate step in [`maintain-profile.md`](../skills/maintain-profile.md), not by writing it directly onto this resume.

**"The cover letter feels like it's just repeating my resume."** It shouldn't — see [`../skills/draft-cover-letter.md`](../skills/draft-cover-letter.md). If a paragraph could be replaced by reading the bullets, it should get cut, not kept. Say this directly and ask for a paragraph that earns its place.

**"This sounds like it was written by AI."** Ask for a pass with [`../skills/check-for-ai-tells.md`](../skills/check-for-ai-tells.md) if it hasn't already run — it should run automatically before rendering, but it's worth asking for explicitly if something still feels off. The fix is always specificity, never a synonym swap; if a rewrite just swaps one generic word for another, say the fix didn't land.

## Rendering and the PDF

**"The file won't open."** It's a plain HTML file — double-click it, or drag it onto an open browser window. If nothing happens, right-click and choose "open with" your browser explicitly.

**"The PDF has a gray background" or "there's a shadow around the page."** That's the on-screen preview styling leaking into print — the shell is supposed to strip it automatically. Make sure "Background graphics" is off in the print dialog, or point out the bug so it can be fixed in [`../scripts/print-shell.html`](../scripts/print-shell.html).

**"The document is two pages when I wanted one."** Content is too long for the format, or the shell's spacing needs a small adjustment. Ask for the cut-or-switch-format conversation described above, or say you want to try the two-page format on purpose instead.

**"A job's bullets got split from its title across a page break."** Should be prevented automatically. If it happens, it's usually one role block simply too tall for where it landed — flag it and ask for a reorder or a trim.

**"I pasted the PDF text and it's scrambled."** Rare with this system's plain shell, but if it happens, something non-standard got introduced — a table, a multi-column element, an odd character. Rebuild plainly rather than trying to patch it. See [`ats-notes.md`](ats-notes.md) for what causes this in general.

**"A job portal only accepts `.docx`."** Open the HTML file in Word and save it as `.docx` — Word reads HTML natively. Check the spacing afterward; it usually shifts a little on the way in.

## General

**"I want a resume that looks more like my old one, with more design."** That's supported — see [`../skills/adopt-template-format.md`](../skills/adopt-template-format.md) and the *Bring-your-own-format* section of [`../templates/README.md`](../templates/README.md). You'll get an honest warning about anything that parses badly through an applicant tracking system, and the option of a plain version alongside it.

**"Where's my data actually stored?"** On your machine, in this repo's `_inbox/`, `profile/`, `applications/`, and `output/` folders — all of them gitignored, meaning none of it gets committed if you ever push this repo anywhere. See the privacy note in [`../AGENTS.md`](../AGENTS.md).

**"Can I use this with a different AI tool than the one I started with?"** Yes — that's the point of keeping everything in plain markdown with no editor-specific features. Open the folder in whatever tool you're using and point it at [`../README.md`](../README.md)'s kickoff prompt.

**"Something in this repo just seems wrong or contradicts something else."** Say so. This is a tool built by a person, not a finished product, and the person who set it up for your team wants to know what's not working.

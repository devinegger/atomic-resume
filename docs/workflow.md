# The workflow, step by step

This is the procedural map. [`data-model.md`](data-model.md) explains *why* the system is built this way; this page traces the actual sequence, naming the skill that runs at each stage. [`../skills/README.md`](../skills/README.md) is the reference index if you land here looking for one specific file.

---

## Setting up, once

```
first-run → process-inbox → decompose-into-atoms → capture-voice
```

**[`first-run`](../skills/first-run.md)** — triggers when `profile/` is empty. Explains the system in about four sentences, tells the person what to put in `_inbox/`, and stops there. Doesn't start tailoring anything yet.

**[`process-inbox`](../skills/process-inbox.md)** — reads everything in `_inbox/`, works out what each document is, and — critically — compares documents that cover the same ground *before* extracting from either one. Two resumes covering the same three years produce a conflict list, not two slightly different atoms. Conflicts go to the person as explicit questions; nothing gets silently resolved.

**[`decompose-into-atoms`](../skills/decompose-into-atoms.md)** — the core of the whole system. Turns the routed material into atoms: rejects verbs-of-intent and duty language, splits multi-fact bullets, gets a real number or writes `Unmeasured`, checks whether something was built unaided or designed-and-directed, tags for selection, and deduplicates across sources. Produces `profile/achievements.md`.

**[`capture-voice`](../skills/capture-voice.md)** — builds `profile/voice.md` from writing the person actually did, not from a description of their style. Runs whenever there's a cover letter or email in the source material to learn from.

This phase is the slow one. Everything after it is fast, because the thinking happened here.

---

## Per application

```
analyze-job-posting → match-atoms-to-posting → choose-document-format
  → assemble-resume → draft-cover-letter → check-for-ai-tells
  → render-documents → track-applications
```

**[`analyze-job-posting`](../skills/analyze-job-posting.md)** — parses a posting into must-haves, nice-to-haves, keywords, the stated level (recorded with the evidence quoted, never rated), and how the posting actually accepts an application — which changes what gets built if a tailored document can't be delivered. Produces the skill-intersection table — the top requirements, ranked, each marked as a direct match, a variant match, a partial, or a gap — and shows it in chat. Ends with a plain verdict on whether the posting is worth pursuing at all.

**[`match-atoms-to-posting`](../skills/match-atoms-to-posting.md)** — maps every requirement to specific atoms and rates it strong, partial, or gap, with partials spelled out precisely so they can't drift into overclaims later. Produces `fit-analysis.md`, which is what assembly reads from.

**[`choose-document-format`](../skills/choose-document-format.md)** — a deliberately separate step, run immediately before building anything. The agent explains base versus expanded in one or two sentences, recommends one with a reason, and asks. Never decided silently.

**[`assemble-resume`](../skills/assemble-resume.md)** — the first time, fills a template from selected atoms. Every application after that, presents a change list against the existing resume — REORDER, CUT, REWRITE, ADD rows, each justified by a specific posting line — for row-by-row approval. Never a rewritten document dropped in whole.

**[`draft-cover-letter`](../skills/draft-cover-letter.md)** — writes one when it's warranted (asked for, or there's something specific to say) and says plainly when it isn't. Pulls its argument from the fit analysis rather than restating the resume.

**[`check-for-ai-tells`](../skills/check-for-ai-tells.md)** — runs last, after tailoring, because tailoring is what introduces the tells. Four passes: vocabulary, structure and rhythm (measured, not eyeballed — bullet-length spread, tricolon ratio), content, and a read-aloud test. Findings only, approved row by row.

**[`render-documents`](../skills/render-documents.md)** — turns the approved markdown into a self-contained HTML file using [`../scripts/print-shell.html`](../scripts/print-shell.html), which the person opens in any browser and prints to PDF. No build step. Includes the page-break and text-extraction checks before anything gets called done.

**[`track-applications`](../skills/track-applications.md)** — logs what went out and when, and later, what came back. Watches for applications going quiet and for gaps that keep recurring across postings.

---

## As needed, not in every run

**[`gather-source-material`](../skills/gather-source-material.md)** — when there's nothing usable to start from, or a recent stretch of work never got written down anywhere. Builds material through structured conversation, and — often the highest-yield move available — mines the person's own AI chat history with a prompt built to prevent the summary from inflating.

**[`adopt-template-format`](../skills/adopt-template-format.md)** — when the person wants a resume shape other than the two that ship here. Takes structure only, never wording, and warns plainly about anything that will parse badly in an applicant tracking system.

**[`prepare-for-interview`](../skills/prepare-for-interview.md)** — once an interview is scheduled. Works backward from what was actually submitted to find every number that needs a ready answer and every distinction (`Note:` field) worth volunteering before it's asked about.

**[`maintain-profile`](../skills/maintain-profile.md)** — adding an atom, adding a skill, promoting a better phrasing, or correcting a fact. Deliberately kept out of the per-application loop: a fact that isn't an atom yet isn't usable in the application that surfaced it, which is what keeps the truthfulness rule from collapsing under time pressure.

---

## Where the loop can end early, on purpose

Two exits are built into the sequence rather than being failures of it:

**A posting gets a verdict of "skip" at intake.** The folder still gets created — `posting.md` plus a one-line reason in `log.md` — but nothing downstream runs. Knowing what got passed on, and why, is information about the search.

**A cover letter doesn't get written.** Most applications don't need one. Writing one anyway, with nothing specific to say, produces a page of evidence that the applicant had nothing particular to say.

Both are the system working correctly, not a shortcut being taken.

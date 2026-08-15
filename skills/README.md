# Skills

One markdown playbook per capability. Plain files any agent can read — nothing here auto-loads, and nothing depends on a particular tool. Read the relevant one before starting the task it covers.

## Index

| Skill | When it fires | What it produces |
|---|---|---|
| [`run-the-walkthrough.md`](run-the-walkthrough.md) | Someone new wants to be shown how this works before starting | A guided tour of the worked example, then a decision |
| [`first-run.md`](first-run.md) | `profile/` is empty — a new clone, a new person | Source material in `_inbox/` and a shared plan |
| [`gather-source-material.md`](gather-source-material.md) | They have little or nothing to digest, or a recent stretch of work isn't written down | New source documents in `_inbox/` |
| [`process-inbox.md`](process-inbox.md) | There's new material in `_inbox/` | An inventory, a conflict list, and material routed to the right place |
| [`decompose-into-atoms.md`](decompose-into-atoms.md) | Source material needs turning into evidence — **the core skill** | Tagged, sourced atoms in `profile/achievements.md` |
| [`capture-voice.md`](capture-voice.md) | There's material they wrote themselves, or drafts sound generic | `profile/voice.md` |
| [`analyze-job-posting.md`](analyze-job-posting.md) | They paste a posting or ask whether to apply | `posting.md`, a ranked skill table, and a plain verdict |
| [`match-atoms-to-posting.md`](match-atoms-to-posting.md) | They've decided to apply | `fit-analysis.md` — every requirement rated strong / partial / gap |
| [`choose-document-format.md`](choose-document-format.md) | Immediately before assembling any document | An explicit base-or-expanded choice, made by them |
| [`adopt-template-format.md`](adopt-template-format.md) | They want a format other than the four that ship here | A new template in `templates/`, plus an honest applicant-tracking-system (ATS) warning |
| [`assemble-resume.md`](assemble-resume.md) | Building the resume for a posting | `applications/<slug>/resume.md`, approved before written |
| [`draft-cover-letter.md`](draft-cover-letter.md) | A letter is asked for, or there's something specific to say | `applications/<slug>/cover-letter.md` |
| [`check-for-ai-tells.md`](check-for-ai-tells.md) | **Last**, before rendering | A findings list, approved row by row |
| [`render-documents.md`](render-documents.md) | A document is approved and needs to become a PDF | A self-contained HTML file in `output/`, and a PDF they save |
| [`track-applications.md`](track-applications.md) | Something was submitted, or something came back | An up-to-date `log.md` and a plain status summary |
| [`prepare-for-interview.md`](prepare-for-interview.md) | An interview or screen is scheduled | `story-bank.md`, a portable mock prompt, and a one-page card for the day |
| [`maintain-profile.md`](maintain-profile.md) | A new fact, a better phrasing, or a correction — **never mid-application** | Updated `profile/` files |
| [`run-a-deep-dive.md`](run-a-deep-dive.md) | One posting is worth a day rather than half an hour | A tailored application, and a much larger `profile/` |

## The usual order

**Setting up, once:**

```
first-run → process-inbox → decompose-into-atoms → capture-voice
```

**Per application:**

```
analyze-job-posting → match-atoms-to-posting → choose-document-format
  → assemble-resume → draft-cover-letter → check-for-ai-tells
  → render-documents → track-applications
```

**As needed:** `gather-source-material` when there's nothing to digest · `adopt-template-format` when the shipped templates aren't right · `prepare-for-interview` when one gets scheduled · `maintain-profile` between applications.

**Occasionally:** `run-a-deep-dive` wraps the per-application sequence for a single posting worth an outsized amount of attention. It's the only skill that expects new atoms to come out of an application rather than after it — see the file for why that's safe there and nowhere else.

## Two rules that cut across all of them

**The truthfulness contract.** Composition rearranges evidence and never manufactures it. Stated in full in [`../AGENTS.md`](../AGENTS.md); referenced by every skill that touches a document.

**Nothing gets written without approval.** Propose, show, wait. The repo holds decisions, not drafts.

## Writing a new skill

Same shape as the existing ones — YAML frontmatter with `name`, `description`, `inputs`, `outputs`, then purpose → when to invoke → procedure → questions to ask → done looks like → common failure modes.

The failure-modes section is the most useful part of these files and the easiest to skip. Write it from what actually went wrong, not from what might.

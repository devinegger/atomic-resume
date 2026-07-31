# Inbox — put your old stuff here

This is where you drop raw material. **Messy is fine.** Genuinely — don't organize it, don't clean it up, don't rename anything. Making it tidy is work you don't need to do, and the agent reads it either way.

When you've added something, **tell the agent.** It doesn't watch this folder; it looks when you say to.

## What to put in

**Start with these two.** They're enough to get going:

- **Any old resume.** Even one that's years out of date. Especially one that's years out of date — old resumes remember things you've forgotten.
- **Any cover letter you've sent.** These are useful twice: they hold accomplishments described better than a resume can, and they show how you actually write.

**Then, if you have them:**

- A performance review or self-assessment. Usually the single best source, because it's the one document that talks about *outcomes* rather than duties.
- The job description for a role you have now or used to have — good for scope.
- Notes, docs, or slides from a project you're proud of.
- A LinkedIn export, or just the text copied off your profile page.
- Anything else with a fact about your work history in it.

**Places people forget to look:** your sent email (search your own outbox for "attached" or "here's the" — status updates you wrote are full of specifics), your calendar from the last year (recurring meetings show what you actually owned), and any AI chat history where you worked through a work problem.

## What formats work

PDFs, Word documents, plain text, markdown, screenshots, images of documents. Drop them in as they are.

Two things to know:

- **A scanned PDF may not be readable.** If you can't select the text with your cursor when you open it, the agent can't read it either. Say so and paste the content instead, or just describe what's in it.
- **A screenshot of text usually works**, but if the agent says it can't read something, that's what happened. Not a problem — paste the text.

## Naming

Doesn't matter much. `resume-2021.pdf`, `old resume final FINAL.docx`, `review.pdf` — all fine. The only thing naming helps with is spotting duplicates, so if you have three versions of the same resume, a hint about which is newest saves a question.

## What happens next

You tell the agent you've added something. It reads everything, then breaks it into **atoms** — small, single-fact pieces of evidence about your career, one accomplishment each. Those land in `profile/`.

It will ask you questions along the way, mostly about outcomes, because resumes are good at saying what you did and bad at saying what changed. "I don't know" is a completely fine answer to any of them.

For two or three documents this takes twenty to forty minutes, most of it the agent working. You can stop partway and pick it up later; nothing is lost.

## This folder is input only

Nothing generated goes here. Your atoms go to `profile/`, applications go to `applications/`, finished documents go to `output/`.

You can leave files here after they're processed — the agent tracks what it's already read, so nothing gets counted twice. Adding more later is normal and expected; this folder doesn't close.

## Privacy

**Everything in here stays on your computer.** This folder is gitignored, which means if you ever push this repo somewhere, the contents don't go with it. Same for `profile/`, `applications/`, and `output/`.

Put your real resume in here. That's what it's for.

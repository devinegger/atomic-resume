---
name: draft-cover-letter
description: Use when a posting asks for a cover letter, or when there's something specific worth saying that the resume can't carry.
inputs: fit-analysis.md, the chosen cover letter template, profile/voice.md
outputs: applications/<slug>/cover-letter.md — approved, then written
---

# Draft a cover letter

## Purpose

Write a letter that says something the resume can't. If it could be replaced by reading the bullets, it shouldn't exist.

## When to invoke

After the resume, and after `skills/choose-document-format.md` has run for the letter specifically.

## First, decide whether to write one at all

Say this plainly rather than assuming:

**Write one when:**
- The posting asks for it
- There's a gap worth addressing directly, rather than hoping it goes unnoticed
- It's a pivot and the resume alone won't explain the move
- They know something specific about the company or the problem
- The fit analysis surfaced an argument that needs three sentences of context

**Skip it when** the posting doesn't ask, there's nothing specific to say, and the fit is straightforward. A generic cover letter is worse than none — it's a page of evidence that the applicant had nothing particular to say.

> They don't ask for a letter, and your fit here is clean enough that the resume makes the case on its own. I'd skip it. The exception would be if you know something about this company I don't — do you?

## Procedure

### 1. Pull the argument from the fit analysis

The letter has room for exactly one story told properly, plus a second angle. Take them from the *Where this application wins* section — the analysis has already done the thinking.

### 2. Fill the template

Read the chosen file from `templates/`. The structure is in the placeholders; the content comes from atoms.

**Opening.** Name the role, then the specific reason for *this* company. Something that couldn't be pasted into a letter for a different employer. Never "I am writing to apply for." Not flattery, and never the company's own marketing language repeated back to them.

**Evidence.** One accomplishment, told as a short narrative: what the situation was, what they decided, what they did, what changed. This is what a resume bullet can't do — it has room for judgment and reasoning. One story told well beats four mentioned in passing.

**Fit, or the hard thing.** Either a second dimension of fit, or — when there's an obvious gap in the must-haves — a direct address of it. Naming a gap and showing the adjacent capability beats hoping nobody notices. State it plainly, say what's actually true about it, say what they bring instead. Confidence without defensiveness, and no apologizing.

**Close.** Plain statement of interest, one or two sentences. No pleasantry stack, no "at your earliest convenience."

### 3. Voice matters more here than anywhere

A resume can survive sounding slightly formal. A cover letter can't — it's the one document where the reader is listening for a person.

Read `profile/voice.md` before drafting. If they use contractions, use contractions. If their sentences are short, keep them short. The test at the end: **would this person say this sentence to someone across a table?** If it would sound absurd spoken aloud, it reads absurd on the page.

### 4. Salutation

If a hiring manager's name is findable, use it. If not, address the team or the department — "Dear Product team," is fine. Never "To Whom It May Concern," and never guess at a name.

### 5. Length

Base is around 300 words, expanded around 450. These are ceilings that people routinely blow through. If it's running long, the usual cause is the letter restating the resume — cut that, not the story.

### 6. Show it, then write it

Show the draft in chat — a cover letter is short enough to read there, unlike a resume. Say what you did with the gap, since that's the part they'll be most anxious about:

> Here's the draft. I've addressed the healthcare gap directly in the third paragraph rather than working around it — that's the paragraph to read carefully and tell me if the tone is wrong.

Write to `applications/<slug>/cover-letter.md` on approval. Append to `log.md`.

### 7. Run the tells pass

`skills/check-for-ai-tells.md`. Cover letters are more susceptible than resumes because they're continuous prose, and a generated-sounding cover letter is disqualifying in a way a slightly generic resume isn't.

## Questions to ask

- "They don't ask for a letter and your fit is clean. I'd skip it — unless you know something about this company I don't?"
- "Do you know anyone there, or anything about why this role is open?"
- On the gap paragraph: "Does this sound right, or is it more apologetic than you'd want?"
- If there's a personal reason for the application: "Is there a reason this particular company appeals to you? It's the strongest possible opening if there is."

## Done looks like

- The letter says something the resume doesn't
- Every claim traces to an atom
- The opening couldn't be pasted into a letter for a different company
- Any real gap is addressed directly or deliberately left alone
- It's under the word ceiling
- It sounds like the person
- The tells pass has run

## Common failure modes

**Summarizing the resume.** The most common cover letter failure in existence. If a paragraph could be replaced by reading the bullets, cut it.

**Generic enthusiasm.** "I have long admired your commitment to innovation" is a sentence about nothing. If there's no specific reason, don't manufacture one — write about the work instead.

**Manufacturing a connection to the company.** Never invent familiarity with a product, a mission, or a person. If they haven't used the product, they haven't used the product.

**Apologizing for a gap.** State it, then move to what they bring. One sentence of acknowledgment, not a paragraph of defense.

**Corporate register.** The letter is where an AI-written document is most obvious. Read it aloud.

**Writing one because the folder looks incomplete without it.** A letter with nothing to say is a liability.

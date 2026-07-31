---
name: decompose-into-atoms
description: Use when turning source material into atoms — the reusable single-fact accomplishment entries in profile/achievements.md. This is the core skill of the whole system.
inputs: Source documents from _inbox/, and the person's answers about outcomes and context
outputs: Tagged, sourced, deduplicated atoms in profile/achievements.md, plus a record of what was deliberately not extracted
---

# Decompose source material into atoms

## Purpose

Turn messy career material into atoms: single-fact, reusable, sourced pieces of evidence. Everything downstream selects from what you produce here, so the quality of the entire system is set in this step.

Read [`docs/data-model.md`](../docs/data-model.md) first if you haven't. This file is the procedure; that one is the reasoning.

## When to invoke

- After `skills/process-inbox.md` has read and routed the material
- When the person tells you about something they did that isn't in the profile yet
- When a `Metric` field gets filled in later and the atom needs revisiting

## The format

```markdown
### <slug>
- **Long:** One sentence. Verb first, lands on what changed.
- **Short:** The same fact in about twelve words.
- **Metric:** The number and how it was measured. "Unmeasured" is a valid answer.
- **Role:** Which job or project this happened in.
- **Tags:** #tag #tag
- **Evidence:** Where this came from — a file in _inbox/, or a conversation and its date.
- **Use:** Optional. Only when the atom should NOT default onto a resume.
- **Note:** Optional. How to claim it precisely — what to say, what not to blur.
```

The slug is kebab-case and descriptive: `carrier-scorecard-rollout`, not `atom-7`. It's how other files refer to this atom.

## Procedure

### 1. Read the document for what changed, not for what it says

Source documents are written in the wrong register. Resumes are written in duty language ("responsible for managing the vendor relationship"), and reviews are written in evaluation language ("consistently demonstrates strong ownership"). Neither is an accomplishment. You're looking underneath both for the same thing: **something was one way, this person did something, and now it's another way.**

Go through the document and mark every place where that shape appears, even partially. Don't write anything yet. A first pass on a two-page resume usually surfaces ten to twenty candidates, and maybe eight survive.

### 2. Reject the things that aren't accomplishments

Be strict here. A profile full of weak atoms is worse than a profile with six strong ones, because selection can't tell them apart and the weak ones crowd out the good ones on the page.

**Verbs of intent are not achievements.** These describe activity, not outcome:

> explored · investigated · researched · participated in · assisted with · supported · was involved in · helped shape · contributed to (when nothing specific followed) · attended · was exposed to · gained familiarity with

*Explored the vendor landscape for a new TMS* is not an accomplishment. If the exploration ended in a recommendation that someone acted on, **that** is the accomplishment, and it's a different sentence.

**Duties are not achievements.** "Managed a team of six" is a fact about the job, and it belongs in `master.md` as scope. What they did with the six people is the atom.

**Evaluations are not achievements.** "Rated exceeds expectations" and "known for attention to detail" are someone's opinion. Look for what the reviewer was describing when they wrote it, and ask about that.

**Keep a ledger of what you rejected and why.** Write it into `achievements.md` under a `## Not extracted` heading at the bottom, with a one-line reason each. Two reasons this matters: the person can see something was considered rather than missed, and a later session doesn't re-litigate the same material. It also means that if "explored the vendor landscape" *did* end in something, the person can look at that list and say so.

### 3. Split until each atom holds one fact

The test: could this appear on a resume without the other half, and still make sense?

A bullet like *"Rebuilt the weekly carrier report and trained the regional team on the new dispatch process"* is two atoms. They happened in the same quarter and they're both true, but a posting might want one and not the other, and a resume that can't separate them has to take both or neither.

Signals that you're looking at more than one atom: the word "and" joining two verbs, a semicolon, or a sentence you can't compress to twelve words without losing something real.

### 4. Get the granularity right

**Too broad** — "Owned the analytics function." No verifiable content, matches every posting equally, evidences nothing. If you find yourself writing one of these, the real atoms are one level down: what did owning it cause?

**Too fine** — "Added a column to the weekly report." A task inside an accomplishment. It will never earn a line on a page and it clutters selection.

**About right** — the level at which a hiring manager would ask a follow-up question and the person would have an interesting answer. That's a better test than any rule about scope, and it's worth applying literally: imagine the follow-up. If you can't imagine one, the atom is too broad. If the follow-up is boring, it's too fine.

### 5. Write the Long and Short versions

**Long:** one sentence, verb first, landing on what changed.

> Built a carrier performance scorecard from shipment and claims data, then ran the quarterly review that used it to renegotiate or drop the bottom tier.

**Short:** about twelve words, same fact, no adjectives.

> Built a carrier scorecard and ran the quarterly review it fed.

Rules for both:

- **Verb first.** Not "was responsible for building" — "built."
- **Plain verbs.** Built, ran, wrote, cut, moved, fixed. Not spearheaded, orchestrated, championed, drove, leveraged.
- **No adjectives about the person.** Not "successfully," not "single-handedly." If it were unsuccessful it wouldn't be here.
- **Their words for their field.** If they call it a scorecard, it's a scorecard, not a "performance measurement framework."
- **Past tense**, except for a current role where present tense reads more naturally.

### 6. Handle the metric honestly

This is where atoms are won or lost.

**If there's a number in the source**, capture it *and how it was counted*:

> **Metric:** On-time delivery across the reviewed carriers went from 82% to 91% over three quarters, measured from TMS delivery timestamps.

**If there's a number with no method**, that's a question for the person, not a thing to write down as-is. A number you can't explain is a number that ends an interview.

**If there's no number**, write `Unmeasured` and move on. Do not estimate. Do not write "significantly improved." An unmeasured accomplishment is still a real accomplishment and it goes on resumes all the time. What kills a candidate is a number they can't defend, not the absence of one.

**If the person offers an estimate**, take it and label it:

> **Metric:** Roughly two hours a day of manual review, by the estimate of the team doing it. Not formally measured.

That phrasing survives an interview. "Saved 10 hours a week" does not, if nobody counted.

Mark atoms that need a number with a visible flag so they're easy to find later:

> **Metric:** Unmeasured. ⚠️ Needs: did anyone outside the team end up using it?

### 7. Run the "unaided?" check

For anything technical, ask yourself: **could this person do this without help?**

There's a common and completely legitimate situation where someone designed a thing, directed it, debugged it, decided what it should do, and drove it to working — but didn't personally write the code, because an AI or a contractor or a teammate did that part.

**The accomplishment is theirs. The tool is not their skill.** Both of those are true at once and the profile has to hold both:

- The atom stands. They built it, in every sense a hiring manager cares about.
- The implementation language does **not** go on the skills line, because a skills line is a claim about unaided capability and a technical screen will test it that way.

Record it as a `Note:` on the atom:

> **Note:** Design and direction were theirs; the implementation was AI-assisted. The atom stands; don't list the language as a skill.

Ask about this directly when something looks more technical than the rest of the profile. It's not an awkward question if you frame it right: *"Did you write this yourself, or did you design it and have someone or something else implement it?"* Both answers are fine, and knowing which one is true prevents a bad interview.

### 8. Tag for selection

Tags are how the composition step finds atoms. Keep the vocabulary small and stable — a starter set:

| Tag | For |
|---|---|
| `#delivery` | Shipped something that runs and is used |
| `#process` | Workflow design, methodology, documentation systems |
| `#leadership` | People, mentoring, setting direction |
| `#stakeholder` | Cross-functional work, executive communication, requirements |
| `#data` | Analysis, reporting, pipelines, measurement |
| `#technical` | Hands-on building |
| `#customer` | Customer- or client-facing work |
| `#cost` | Savings, efficiency, waste removed |
| `#growth` | Revenue, acquisition, retention |

**Tag generously** — three or four per atom is normal. Selection filters by tag, and an under-tagged atom is invisible to the posting it was perfect for.

**Add a new tag only when three or more atoms need it.** A tag that applies to one atom isn't a category, it's a description, and a sprawling tag list makes selection worse rather than better.

### 9. Deduplicate, keeping the stronger phrasing

When the same accomplishment appears in two documents:

1. Write **one** atom.
2. Keep the stronger phrasing — usually the more specific one, not the more impressive-sounding one.
3. If the weaker version contains a detail the stronger one lost, fold the detail in.
4. If they disagree on a fact or a number, that's a conflict — ask, don't pick. (See `skills/process-inbox.md` step 4.)
5. Note both sources in `Evidence`.

### 10. Decide whether it belongs on a resume at all

Some atoms are real, well-executed, and wrong for a page:

- **Audience of one.** A system they built to organize their own work. Genuine, and on a resume it reads as effort spent on themselves.
- **Names a customer or a confidential project.** The atom keeps the detail; the resume gets a generalized version.
- **Better as an interview answer.** Some work needs three sentences of context to land, which a bullet can't carry but a conversation can.

Keep the atom. Add a `Use:` field saying where it belongs instead:

> **Use:** Not a resume bullet by default — audience of one. Strong as an interview answer to "how do you keep yourself organized under load," and usable in a cover letter where self-direction is the point.

Deleting it loses the record. Letting it default onto a resume costs a screen. `Use:` is how both problems get avoided.

### 11. Write the file, then show your work

Write to `profile/achievements.md`. Then report in chat with a summary, not the full contents:

> I've written twelve atoms to `profile/achievements.md`. Open it and skim — they're short.
>
> Nine have real detail. Three are thin because the source only said what you did, not what came of it, and I've marked those with a ⚠️. I've also listed six things I deliberately didn't turn into atoms, at the bottom of the file, with a line on why — worth a look in case I got one wrong.
>
> Want to go through the three thin ones now, or take a break and come back to them?

## How to ask for missing context without interrogating

Most atoms from old resumes are missing their outcome. You will have a lot of questions. How you ask determines whether you get answers.

**Batch them, and cap the batch.** Three or four questions in a round, then stop and let them recover. Fifteen questions in a list gets three answered.

**One question per turn, not one message with four questions in it.** They'll answer the first and the last.

**Ask for what they'd know off the top of their head.** Not "what was the percentage improvement in cycle time" — they don't know, and the question makes them feel they're failing a test. Ask:

> Did anyone outside your team end up using it?

> Roughly how long did that take before, and after?

> Did that change stick, or did it get replaced later?

**Give an example answer** so they know the bar is low:

> Even something rough helps — "it went from a couple of days to same-day, more or less" is exactly the kind of answer I can use.

**Accept "I don't know" immediately.** Write `Unmeasured`, keep the atom, move on. Never ask twice, and never imply the accomplishment is worth less without a number.

**Never suggest the number.** Not "would you say it was about 30%?" — people agree with a plausible-sounding figure under mild social pressure, and now there's an invented metric in the file with their fingerprints on it. Ask open, take what you get.

**Let them stop.** "We can come back to the rest later" should be available at every batch boundary. The profile is useful at eight atoms; it doesn't need to be complete before it's usable.

## Material that doesn't decompose cleanly

**A long role with no discrete wins.** Four years of steadily making a team better. Write the atom about the change rather than the activity: what was true when they arrived, what was true when they left, and what they did that connects the two.

**A team accomplishment.** Find their specific contribution and write that. If it can't be separated, the atom says so — *"contributed to"* with a `Note:` about the team size. Claiming a team's work as solo is the fastest way to get caught, because the interviewer knows how big that project was.

**Something that failed.** Real and often the best interview material, and it usually isn't a resume bullet. Write the atom with a `Use:` field pointing at interviews. The judgment shown in a project that went wrong is frequently more interesting than a success.

**Something they can't talk about.** Write the atom with the specifics, and a `Note:` on how to describe it generically. The profile is private and gitignored; the resume is what gets sanitized.

**Something from a long time ago.** Still write it. Old atoms are cheap to store and occasionally exactly right for a posting that wants a specific domain.

## Done looks like

- `profile/achievements.md` exists with atoms in the documented format
- Every atom has all six required fields, and `Metric` is either sourced or explicitly `Unmeasured`
- Nothing in the file is a duty, an intent, or an evaluation
- A `## Not extracted` section records what was skipped and why
- Every atom traces to a source in its `Evidence` field
- The person has seen the summary and knows what's thin

## Common failure modes

**Writing bullets instead of atoms.** If you're improving the phrasing of a resume line, you're doing the wrong job. Atoms are facts with provenance, not polished copy. Polish happens at composition.

**Inflating during extraction.** The source says "helped implement"; the atom says "implemented." This is the most common failure in the entire system and it happens quietly, one verb at a time.

**Accepting an AI-written summary at face value.** Documents generated by an AI about someone's work are systematically scope-rich and outcome-poor, and they inflate. Extract, then verify with the person.

**Producing thirty atoms from one resume.** You've gone too fine. Most resumes yield six to twelve.

**Filling in an outcome that seems obvious.** If they built a dashboard, it does *not* follow that anyone used it. Ask. "Unknown" is the correct answer surprisingly often, and it's the honest one.

**Asking too many questions at once.** Covered above, and worth repeating: it's the difference between a profile that gets finished and one that gets abandoned.

**Skipping the not-extracted ledger.** Without it, the same weak material gets reconsidered every session, and the person can't tell what you chose to leave out.

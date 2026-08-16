---
name: check-for-ai-tells
description: Use as the last read on any resume or cover letter before it's submitted. Strips the signals that mark a document as machine-written.
inputs: A finished draft, and profile/voice.md
outputs: A findings list, approved row by row. Never a rewritten document.
---

# Check for AI tells

## Purpose

Find and remove the signals that mark a document as generated, before a recruiter's pattern-match does it for you.

Recruiters read a great many AI-assisted applications and have developed a fast, largely unconscious sense for them. The reaction isn't *"this is false"* — it's *"this is generic,"* which is worse, because it's unarguable and it happens in about six seconds.

**The fix is never a synonym swap.** Every tell below is a symptom of one root cause: the sentence could describe a hundred people. The repair is to make it describe one. If a rewrite removes the flagged word and the sentence is still true of anyone in the field, the pass has failed.

## When to invoke

**Last.** After tailoring, after the change list is approved, before rendering. Tailoring introduces tells, so running this earlier checks the wrong draft.

## Procedure

### Pass 1 — Vocabulary

Flag every instance. None of these are banned outright, but each needs a reason to survive.

**Verbs that announce themselves:** leverage · spearhead · orchestrate · drive · foster · empower · unlock · harness · elevate · streamline · optimize (when nothing was measured) · navigate · underscore · showcase · delve · champion · pioneer · revolutionize · transform (unqualified)

**Adjectives doing no work:** robust · seamless · dynamic · comprehensive · holistic · cutting-edge · state-of-the-art · innovative · strategic (as decoration) · scalable (unqualified) · impactful · meaningful · significant · substantial · key · critical · pivotal · crucial

**Self-description that isn't evidence:** results-driven · detail-oriented · passionate · motivated · proven track record · demonstrated ability · adept at · well-versed · thought leader · team player · self-starter

**Nouns from the model's comfort zone:** landscape · realm · tapestry · journey · ecosystem (unless literal) · solutions (as a catch-all) · synergy · paradigm · framework (when nothing was framed)

**Openers:** "In today's fast-paced…" · "In an era of…" · "As organizations increasingly…" · "With the rapid evolution of…"

### Pass 2 — Structure and rhythm

**Structural tells beat vocabulary tells.** A document can pass Pass 1 completely and still read as generated. This is the pass most people skip and it's the one that matters.

- **Tricolons everywhere.** Three-item lists in bullet after bullet. Real writing varies — two here, four there, one when one is the truth. **Count them. More than a third of bullets is a flag.**
- **Uniform bullet length.** Every bullet running exactly two lines is the strongest single tell and the one most people never notice. Human bullets are lumpy because facts are lumpy.
- **Identical cadence.** Every bullet shaped *verb → object → outcome clause*. Vary the shape or the eye reads template.
- **"Not just X, but Y."** Also "It's not about X — it's about Y." Model-favored, rare in real resumes.
- **Em-dash density.** More than one or two in a resume reads generated. **Count them, don't eyeball it.**
- **Semicolons in bullets.** Almost always two bullets pretending to be one. **Count them too** — more than one or two on a resume is a flag the same way em-dashes are.
- **Perfect parallelism across a whole section.** Slight asymmetry reads human.
- **Every section the same length.** Real experience isn't evenly distributed.

⚠️ **Measure the whole document, not just the bullets.** This is the single easiest way to run this pass and still miss everything. Bullets are the obvious unit, so measurement tends to cover the experience section and nothing else — while the Summary, the highlights or career-highlights block, and the cover letter's paragraphs go unmeasured. Those are prose, they're written last, they're the most heavily tailored part of the document, and they are exactly where the tells live. A real run had four recurring findings survive several applications in a row for precisely this reason: every one of them was sitting in a section the measurement never looked at.

**Every prose unit gets measured** — bullets, summary sentences, highlight lines, and cover-letter paragraphs — each as its own population. A summary that's three sentences of identical length is the same tell as eight bullets of identical length.

**Measure, don't eyeball. All of this is plain text analysis — none of it needs a renderer or a browser, and it runs before the document is ever printed.** Actually count:

```
per-unit character count · min · max · spread · standard deviation ·
count of ", X, and Y" patterns · em-dash count · semicolon count
```

Rough targets: **standard deviation above 20**, **spread above 60 characters**, **tricolons under a third of units**, **em-dashes and semicolons combined under three on a resume**. Heuristics, not laws — but a document failing all of them reads generated regardless of its vocabulary.

⚠️ **The targets can fight each other. Chase one at a time.** Splitting one long multi-part bullet into two medium ones improves the tricolon ratio and *lowers* the standard deviation, because you just replaced an outlier with two values near the mean. Both numbers are pointing at real things and the fix for one degrades the other, which is how a pass turns into an afternoon of moving a metric back and forth.

**The rule when they conflict: content wins over cadence.** Split the bullet if it's genuinely two facts — that's a truth-and-clarity decision and the spread number doesn't get a vote. Then re-measure and stop. Don't split a bullet you didn't need to split in order to move a statistic.

**For a cover letter, also count total words against its format ceiling** — 325 for base, 500 for expanded (see the frontmatter of whichever template was used). Over the ceiling almost always means the letter is restating the resume; that's a finding on its own, not just a length problem. Report it the same way as any other tell:

```markdown
| # | Location | Tell | Type | Current | Proposed | Why it's stronger |
|---|---|---|---|---|---|---|
| 4 | Whole letter | Over word ceiling | length | 540 words (expanded ceiling: 500) | Cut paragraph 3, which restates the resume's scorecard bullet | The letter should say something the resume can't — this paragraph doesn't |
```

### Pass 3 — Content tells

- **Vague quantification.** "Significantly improved," "dramatically reduced," "up to 40%," "over 50%." Either the number is known or it isn't.
- **Suspiciously round metrics.** A page where everything lands on 20%, 30%, 50% reads invented. Real numbers are ugly: 43%, "about two hours a day." **Cross-check every number against the atom.** If the atom says unmeasured, the document cannot say measured.
- **Outcome with no mechanism.** "Improved efficiency by 30%" with no statement of what changed. A number without a mechanism invites the interview question that ends it.
- **"Resulting in" as a connector.** Model-favored causal glue. The sentence is usually stronger without it.
- **Claims outrunning scope.** "Led enterprise transformation" for a four-person team. Precise scope is more impressive than inflated scope, because it's believable.
- **Zero idiosyncrasy.** No domain-specific noun, no named system, no real constraint anywhere. Specificity is the antidote to every tell on this page.

### Pass 4 — Read it aloud

Would this person say this sentence to someone across a table? If it would sound absurd spoken, it reads absurd on the page.

Then the harder test: **does this describe one person, or a category of person?** Cover the name at the top. If the document could belong to any competent person in that field, the problem isn't phrasing — it's that no specific fact survived the drafting.

## When the same tell keeps coming back

**A tell that survives three or more applications in a row isn't tailoring drift — it's in the base.**

Tailoring introduces tells, which is why this pass runs last. But that also makes it easy to treat every finding as a fresh one and fix it in place, in this application, again. If you're flagging the same summary sentence or the same highlight line for the third time, the problem was never in the tailoring — it's sitting in the saved resume or the template that every application starts from, and patching the copy leaves the source untouched.

**Fix it at the base instead**, so it stops arriving. That's a `skills/maintain-profile.md` job, not something to do mid-application — mention it, finish the application, and offer to fix the source afterward.

Worth saying out loud when it happens, because it changes what the person should do:

> This is the third time I've flagged that opening line. It's not coming from the tailoring — it's in your saved resume, so it'll keep showing up. Want me to fix it at the source after we send this one?

## Output format

Findings only. **Never a rewritten document.**

```markdown
| # | Location | Tell | Type | Current | Proposed | Why it's stronger |
|---|---|---|---|---|---|---|
```

- Group by pass, ordered by severity — structural first, vocabulary last.
- **Every proposed rewrite must add specificity, not just remove a word.** If the only available fix is a synonym, say so and flag it unresolved. A synonym swap moves the tell; it doesn't remove it.
- **Never invent a detail to make a bullet specific.** If the specificity needed doesn't exist as an atom, that's a question for the person, not a rewrite.
- Note anything flagged that should stay. Real language sometimes collides with this list, and a deliberate keep is a valid finding.

Then they approve row by row, same as any change list.

## Questions to ask

- "Three of these need a detail I don't have. For the scorecard bullet — what specifically was the review deciding? Even one concrete noun fixes it."
- "This one's flagged but I think it should stay, because it's true and specific. Agree?"

## Done looks like

- All four passes have run
- The structural measurements were taken, not estimated — including em-dash, semicolon, and (for a cover letter) word-count-vs-ceiling
- **Measurement covered the summary and highlight sections, not only the bullets**
- Anything flagged for the third time was named as a base problem, not patched again in place
- Every number cross-checked against its atom
- Findings presented as a list, approved row by row
- Unresolvable tells flagged rather than papered over with synonyms

## Common failure modes

**Skipping Pass 2.** Vocabulary is easy to check and structure is what actually gives a document away.

**Measuring only the bullets.** The tells that survive longest are the ones in the summary, because the summary never gets counted.

**Chasing two structural targets at once.** Splitting a bullet to fix the tricolon ratio lowers the standard deviation. Content wins, then re-measure, then stop.

**Fixing the same tell for the third time.** If it keeps coming back it lives in the base document, and every fix you make here is a copy that gets thrown away.

**Synonym swapping.** Replacing "leverage" with "utilize" achieves nothing. Replacing it with what actually happened achieves everything.

**Inventing specificity.** The fix for a generic bullet is a real detail from the person, not a plausible one from you.

**Running it before tailoring.** Tailoring introduces tells. This runs last.

**Returning nothing.** A pass that finds no tells in a freshly tailored document did not run properly. Check again.

**Flagging the person's actual voice.** If they genuinely say "circle back," and `voice.md` records it, that's their register, not a tell. Note it as a deliberate keep.

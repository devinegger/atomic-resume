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
- **Em-dash density.** More than one or two in a resume reads generated.
- **Semicolons in bullets.** Almost always two bullets pretending to be one.
- **Perfect parallelism across a whole section.** Slight asymmetry reads human.
- **Every section the same length.** Real experience isn't evenly distributed.

**Measure, don't eyeball.** The eye habituates to a rhythm within about three bullets and stops registering it. Actually count:

```
per-bullet character count · min · max · spread · standard deviation ·
count of ", X, and Y" patterns
```

Rough targets: **standard deviation above 20**, **spread above 60 characters**, **tricolons under a third of bullets**. Heuristics, not laws — but a document failing all three reads generated regardless of its vocabulary.

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
- The structural measurements were taken, not estimated
- Every number cross-checked against its atom
- Findings presented as a list, approved row by row
- Unresolvable tells flagged rather than papered over with synonyms

## Common failure modes

**Skipping Pass 2.** Vocabulary is easy to check and structure is what actually gives a document away.

**Synonym swapping.** Replacing "leverage" with "utilize" achieves nothing. Replacing it with what actually happened achieves everything.

**Inventing specificity.** The fix for a generic bullet is a real detail from the person, not a plausible one from you.

**Running it before tailoring.** Tailoring introduces tells. This runs last.

**Returning nothing.** A pass that finds no tells in a freshly tailored document did not run properly. Check again.

**Flagging the person's actual voice.** If they genuinely say "circle back," and `voice.md` records it, that's their register, not a tell. Note it as a deliberate keep.

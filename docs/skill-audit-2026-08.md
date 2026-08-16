# Skill audit — August 2026

A pass over every skill in this repo, asking three questions of each:

1. Does anything here contradict something learned since it was written?
2. Does any step describe something **nobody has ever actually done**?
3. Would a first-time user hit a step that can't succeed?

**Why this was worth doing.** Most of these skills were written at once, during the extraction that created this repo, by reading a working private system and describing what it appeared to do. About a dozen of them documented behaviour that had **no written procedure** in the original — it existed as habit, and the extraction turned habit into instruction by inference. Inference is not observation, and at least one of those inferences was flatly wrong for months.

Findings are classified as:

| Kind | Meaning | Fix |
|---|---|---|
| **Regression** | Contradicts something since learned | Correct it |
| **Invention** | A procedure nobody has performed | Run it, or cut it |
| **Wiring** | Two files that should know about each other, don't | Connect them |
| **Assumption** | Depends on a capability not everyone has | Degrade gracefully |

---

## Fixed in this pass

### `analyze-job-posting.md` — **regression**, the serious one

Instructed the agent to determine "what level this really is, versus what the title claims" and to "flag a seniority mismatch loudly, in both directions."

That read requires things this system cannot see: what a title means at a given company's size, the compensation norm for that market, team size, and where the person actually sits today. It produced a confident, wrong assessment that became the premise of an entire cover-letter paragraph before anyone caught it — and a wrong premise doesn't stay contained, because nothing downstream re-checks it.

**Now:** the posting's own words are quoted — title, years floor, stated band, supervision language — and the judgment goes to the person, who can actually make it. Aggregator level badges are explicitly named as noise; they contradict themselves constantly.

**This is the finding that justified auditing everything else.** It sat in the repo for months, reading as authoritative.

### `maintain-profile.md` — **wiring**

The profile now gets its improvement moment right after an application goes out, asked from `track-applications.md`. `maintain-profile.md` didn't know it was being called from there, so the loop was written on one side only.

**Now:** it lists the post-application and post-interview triggers, and frames them as a normal part of the loop rather than an interruption.

### `first-run.md` — **wiring**

The walkthrough exists, and `AGENTS.md` routes to it, but the skill that actually fires on an empty profile never offered it — so the people most likely to want a tour were the least likely to be shown one.

**Now:** offers it once, hands to `run-the-walkthrough.md`, and resumes without repeating the explanation.

### `choose-document-format.md` — **invention**, and a friction cost

Written from a requirement rather than from practice: this behaviour did not exist in the source system at all. It mandated a full explain-recommend-ask cycle **every time, for both documents, forever.**

The reasoning for the skill is sound — an agent silently choosing a format has made a decision about how someone presents themselves, and they find out too late to object cheaply. The *frequency* was never tested. By the tenth application the person knows the difference, and asking in full is ceremony that trains them to skim, which is expensive because the questions that matter arrive later in the same conversation.

**Now:** asked properly the first few times, then carried forward as a one-line default they can wave off — and asked in full again whenever the situation actually changes.

### `AGENTS.md` — **assumption**

Every skill assumes it can write files. The README advertises browser-based chat tools as a supported setup, and those typically can't.

**Now:** the agent says so up front, produces complete file contents instead of diffs, names exact paths, and confirms each save before building on it. Never pretends a write happened.

---

## Unvalidated — plausible, and nobody has run them

These describe behaviour that had no written procedure in the source system. They read well. That is not evidence.

| Skill | Why it's unvalidated |
|---|---|
| `first-run.md` | Nothing in the source covered "the profile is empty and the person is new" — it was hand-bootstrapped by its author. **This is the path every new person takes first, and it has the least evidence behind it.** |
| `capture-voice.md` | The source said `voice.md` should be built from real sentences and never said how. The entire procedure is reconstructed. |
| `adopt-template-format.md` | Mentioned as a capability; nothing implemented it. |
| `gather-source-material.md` | Derived from a single one-off prompt, not from a repeated practice. |
| `process-inbox.md` | Partially grounded — the routing steps are real, the conflict-detection procedure is reconstructed from evidence that conflicts *were* caught, not from a written method. |

**These get tested by running the system cold, as a stranger, rather than by reading them again.** Re-reading a plausible document produces the same verdict every time; that's what makes this category dangerous. Where a cold run and this audit disagree, the cold run wins.

---

## Deliberately left alone

`decompose-into-atoms.md`, `match-atoms-to-posting.md`, `assemble-resume.md`, `check-for-ai-tells.md`, `render-documents.md`, `track-applications.md`, `draft-cover-letter.md` — all substantially grounded in real practice, and all revised this pass for other reasons.

---

## The general lesson

**A skill written by inference reads exactly like a skill written by observation.** Both are confident, both are well-organized, and nothing in the file marks which is which. The seniority instruction was wrong for months and never looked wrong.

The mitigations, in order of value:

1. **Run it cold.** A stranger following the instructions finds in ten minutes what re-reading never finds.
2. **Write down which parts were inferred**, at the time, while you still know. That information is free at the moment of writing and unrecoverable later.
3. **Prefer "we haven't tried this" to silence.** A documented uncertainty is a thing someone can check. An undocumented one is a thing someone will trust.

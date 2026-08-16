---
name: prepare-for-interview
description: Use as soon as an interview or screen is scheduled. Works from what was actually submitted, finds what has to hold up under questioning, and rehearses delivery — which is where prep usually fails.
inputs: The submitted documents, profile/, the interviewer's name and function, and the person's time
outputs: applications/<slug>/story-bank.md and question-bank.md, a portable mock-interview prompt, and a one-page card for the day
---

# Prepare for an interview

## Purpose

Get someone ready to be asked about their own resume by a person holding it.

That's a different job from building the resume. A document is read in six seconds and never argued with. An interview is an hour of follow-up questions, and every number on the page is a question waiting to be asked.

**No "is it worth it" test.** Unlike a deep dive, this always runs — an interview is already the scarce thing.

## What it takes

Less than people expect, and it flexes. An evening is comfortable. Two hours is enough for a real one. It splits across sittings without losing anything.

⚠️ **Don't lead with the time.** It isn't the deciding factor, and presenting it as one invites someone to skip preparing for an interview they already have — which is the scarce thing. No version of this is worse than walking in cold. Say what it does; mention the time when they ask, or when scheduling actually matters.

**Ideally it runs the day before**, so it's fresh when it gets used.

The one part that benefits from lead time is looking things up — a number nobody wrote down, a date, a record that has to be checked. If Phase 1 turns up anything like that, start it when the interview is scheduled and leave the rehearsal for the day before. Rehearsal decays; lookups don't.

Under real time pressure, run Phase 1, Phase 3, and the mock. Those three are what most often change what someone says out loud.

## The branch that sets the whole session

**Did this posting get a deep dive?**

| | |
|---|---|
| **Yes** | Phase 1 is short. The atoms exist, the gaps were interrogated, the posting was already read line by line |
| **No** | **Phase 1 is a mini deep dive, and every gap in `fit-analysis.md` is unverified.** See *The gap rule* — this is where the largest recoveries happen |

---

## Phase 0 — Three questions before anything else

**Ask all three. None can be inferred, and each changes the session.**

**1. Who is the interviewer — name and function?** Get the title, then **research the title before the person.** A recruiter, an HR business partner, a hiring manager, and a panel produce four completely different sessions. "Someone in HR" is not an answer — an HR business partner typically owns the compensation band and screens hardest for people-management risk, and preparing for a recruiter screen instead would be preparing for the wrong conversation entirely.

**2. How long is it?** Duration is the format signal. Forty-five minutes with HR is not a screen.

**3. Did this posting get a deep dive?** The branch above.

Also worth asking, cheap and occasionally decisive: **is there anything in writing from them** — the invite text, an agenda, a "what to expect" note. People forget they have it.

**Agree a continuation marker up front** (`... more ...`), same as the deep dive, and never interpret a partial answer. Watch for answers that stop mid-sentence *without* the marker — say so and wait rather than inferring the rest of the thought.

---

## Phase 1 — What was sent, versus what's true now

### Read what actually went out

Not the profile — the submitted documents from that application's folder. Different applications lead with different things, and the prep is about *this* one.

If what went out was rendered HTML, strip it to text so you're reading what a parser and a human would see:

```
python3 -c "import re,html,sys; s=open(sys.argv[1]).read(); \
  s=re.sub(r'(?s)<style.*?</style>','',s); s=re.sub(r'(?s)<script.*?</script>','',s); \
  s=re.sub(r'<br\s*/?>','\n',s); s=re.sub(r'</(p|div|li|h1|h2|h3|section|tr)>','\n',s); \
  s=re.sub(r'<[^>]+>',' ',s); print(html.unescape(s))" output/whatever-you-sent.html
```

### Every number on the page, and where it came from

For each one, look up its atom and check the `Metric` field:

| Claim on the page | Atom says | Status |
|---|---|---|
| On-time delivery 82% → 91% | Measured from TMS timestamps, three quarters | Ready |
| Cut invoice review from 3 days to same-day | Unmeasured — team estimate | Needs framing |
| Recovered $180K in freight billing errors | Sourced from the audit report | Ready |

**Everything in the middle column that isn't a hard source needs a sentence they can say out loud.** Honest attribution is the framing that works:

> "That's an estimate from the team doing the work rather than something we formally measured — the invoices went from sitting a couple of days to being cleared the same morning."

That answer is fine. It's specific, it's honest about its own precision, and it moves on. What loses an interview is hesitation, or a number that grows under questioning.

### The discrepancy sweep

**Run this before anything else, because it changes what's safe to say out loud.**

This is a structural hazard, not an accident. Applications never edit `profile/` mid-build — that's the rule keeping invented claims out of the permanent record. The side effect is that a correction made afterward **never flows back into a document that already went out.** The longer between submitting and interviewing, the further the two drift.

So a sent resume can say something the profile now says differently: a number refined, a title corrected, a date fixed — and the sent copy still carries the old version, permanently.

⛔ **Never coach someone to contradict their own page.** It's what the interviewer is holding, and "that's not quite right about my own resume" is a bad opening regardless of which version is more accurate.

✅ **Coach the version that contains both and makes the page look conservative.** If the resume claims two hours a day saved and the truer figure is six person-hours because three people were doing it:

> That's two hours a day each, across a three-person team — so about six person-hours. The resume states the per-person number.

Both true, the page is now the cautious one, nothing contradicted.

⛔ **Never edit a submitted document.** It's a frozen record of what was sent. The prep works around it.

### Diff the resume against who actually walks in

The application loop optimizes a resume *for the posting*. **Nothing in it ever asks what that resume looks like sitting next to the person.**

This produces near-certain questions that appear on no list. If a posting had no signal for some part of their background, the tailoring correctly de-emphasized it — while their current job title, their public profile headline, and their email signature all lead with exactly that thing. *"Your title says X. Why are you applying for Y?"* is coming, and it only surfaces when the resume is read against the person rather than against the posting.

**Check:** current title · public profile headline · email signature · location line · anything the resume de-emphasized that they lead with everywhere else.

**Every discrepancy is a question.** Write the answer.

### The gap rule — a gap on a page is not a gap in a conversation

⛔ **On any posting that skipped the deep dive, treat every gap in `fit-analysis.md` as unverified and re-ask it.**

A recorded gap means *the profile has no entry for this.* **That's a statement about the profile, not about the person.** The application loop asks only what the profile can't answer and treats "not present" as settled — correct when building a document under time pressure, wrong the week before an interview.

Real recoveries come from four places, and each is worth asking about:

- **A rule that governs documents but not conversation.** "Don't add a skill and claim it in the same application" protects the resume. It says nothing about whether they can discuss the topic.
- **Atoms that landed after the resume froze.** Anything captured since is missing from the sent document by construction.
- **Things never interrogated**, because no deep dive ran and the loop had no reason to ask.
- **Things they don't count as experience** because it was self-taught, side work, or "just" part of another job.

⚠️ **Recover at the right depth, and guard the seams.** "I've done A/B testing" may be true while attaching it to a conversion outcome that actually came from a different project is not. **Name the boundary explicitly** in the story bank — under pressure, two adjacent true things merge into one false one.

### Collect every `Note:` constraint from the atoms in play

`Note:` fields exist because a distinction mattered. Surface them all, and plan to **volunteer** them:

- **"Assessed, didn't build."** Said before being asked, not after.
- **"Design was theirs, implementation was AI-assisted."** Volunteer it. Up front it reads as fluency and self-awareness; discovered by the interviewer afterward it reads as padding. The framing: *"I designed it and drove it to working — the implementation was AI-assisted."*
- **"Team effort, they owned this part."** Know the team size and their specific piece. The interviewer may well know how big that project was.
- **"Don't name the customer."** Have the generic version ready rather than improvising a redaction live.

---

## Phase 2 — Employer and interviewer research

**This is the one phase that doesn't need the person.** Run it while they're working through Phase 3. On a day-before session that parallelism is most of the schedule.

**Verify claims about the employer against a primary source** — `skills/run-a-deep-dive.md` § *Verify claims about the employer* governs here unchanged. Fetch and read; never paraphrase a paraphrase.

### Go look at the actual product

**Highest-value cheap step in this file.**

A posting describes a product in the abstract. **The live product tells you its architecture.** Twenty minutes on the company's own site turns "the marketing site, the customer portals, and the integrations between them" into: the real navigation, the actual product families, where the portal boundary sits, and which properties are separate systems wearing the same brand.

**Then map that architecture against their strongest atom.** A national site with semi-independent regional sites underneath it is structurally the same problem as a corporate site with franchise microsites — and that match makes an excellent opening move. **It cannot be derived from the posting text.** It exists only if someone looked.

Also surface what only research finds: an anniversary the company is making noise about, a conference on the calendar, a recent launch, a leadership change. On a role touching any of those, knowing about it is the difference between interest and homework.

⛔ **Never state a count you couldn't verify.** "At least six that I found" is honest and safe. "Six" is a hostage.

---

## Phase 3 — The logistics block

**This is the category of fact no document ever carries, and it's where prep is most often completely empty.**

A profile can be hundreds of lines deep on achievements and blank on money, timing, motive, and availability — because it was built to produce documents, and documents need none of it. **Nothing in the application loop ever had a reason to ask.** Every item below is a standard question in a screen.

### The block

Compensation — current, target, walk-away · why they're leaving · relocation timeline and how committed · availability and notice · travel tolerance · people-management readiness · who they'd report to and what they'd own · anything they've been sent in writing.

**Batch these. Don't excavate them.** This deliberately breaks the one-question-at-a-time protocol, because salary and start date have one correct answer each and no hidden depth. That protocol exists to surface material someone doesn't know they have, and there is none here. Phase 4 goes back to one at a time.

### The real output is coaching, not facts

**Expect roughly a third of these answers to be correct as personal facts and wrong as interview answers.**

After collecting the block, **run every answer through one question: can this be said as given?**

Three shapes recur:

**The ask that's pure downside right now.** Wanting flexibility on a term the posting has already pre-empted. Raising it with the person whose job is screening for exactly that risk, *before an offer exists*, can only cost. **Defer to offer stage.** Answer what was asked, completely, and ask for nothing.

**The true reason that's the wrong true reason.** A start date driven by a financial detail is true, and it makes the start date about their finances. **Lead with the other true reason** — finishing what they're responsible for — which is equally true and reads as professionalism.

**The constraint that shouldn't be volunteered at all.** ⛔ **Never volunteer family status, health, or anything else that invites bias that is both illegal and real.** It also concedes a constraint before anyone has asked for one. **Convert it into an information question** — ask what the travel cadence actually looks like — and evaluate privately.

⚠️ **This is not coaching anyone to mislead.** Every version above is fully true. **What changes is which true reason leads, and what gets volunteered versus what gets answered when asked.** Someone answering an internal question answers honestly and completely; an interview answer is a *selection* among true things. That distinction is the whole phase.

### Two recurring shapes

**The wound behind the want.** *"I've been through two layoffs in three years and it's exhausting"* — the want underneath it (stability, somewhere to stay a while) is excellent and often a real fit signal. The wound is pure downside. **State the want. The cost stays private.**

**The diagnosis nobody asked for.** Asked why a job ended, people give an accurate, detailed analysis of a former employer's decisions. ⛔ **All of it stays out.** The exculpatory fact is usually one clause mentioned in passing — *"about twenty-five of thirty people went, across three rounds."* **When three-quarters of a company goes, nobody wonders about the candidate.** Find the scale fact, use only that, cut the rest.

---

## Phase 4 — The story bank

**You cannot predict which question arrives. You can predict which stories are needed.**

So the stories are the primary artifact, and they get built first. A bank of predicted questions with *scripted answers* fails in a specific way: the interview turns out to be entirely behavioral, the two questions marked "near-certain" are never asked, two competency questions arrive that nothing anticipated — and the scripts were never portable anyway.

**The questions still get built** — see Phase 4a, which follows. What fails is scripting them, not having them.

### The bank

**Ten to sixteen stories, each with its facts fixed in writing**, in `applications/<slug>/story-bank.md`:

| Field | Purpose |
|---|---|
| **The facts** | Every number, name, date, and outcome. ⛔ **They do not improvise past this** |
| **Answers** | Which question types this story serves |
| **Guards** | What must not be said — internal names, overclaims, seams that must not merge |

**Open the file with an index: question type → story.** That index is what actually gets used.

⚠️ **Why the facts have to be written down: the failure mode is assembly, not lying.** People describe it exactly this way afterward — *"I don't think I ever really lied, but I did kind of put pieces together into a story as I was telling it."* That's the invented flourish from the deep-dive skill, firing live and under pressure.

✅ **The rule to give them: if a detail isn't in the file, the answer is "I'd have to check."** That costs nothing. Nobody loses an offer for not remembering a number.

**Prepare the lead item hardest.** Whatever leads the resume draws the most questions. For that one, have ready: what the situation was before · what they decided, and what the alternative was · why they chose it · what it cost or what went wrong · what they'd do differently. **The decision is more interesting than the artifact** — most candidates describe what they built, and the ones who describe what they chose *not* to build sound different.

**Cap the failure stories at two**, pointing in different directions. Most records accumulate more, and picking in the room goes badly.

⚠️ **Check each atom's `Use:` field and notes first.** An atom flagged as not interview-ready — a failure where they never worked out what they'd do differently — **must not become tomorrow's answer.** That flag exists for exactly this moment.

⛔ **Never let two atoms merge.** If two stories are adjacent enough to blur, flag the seam explicitly in the file.

---

## Phase 4a — The question bank. Build this too.

**Both files get built. They do different jobs and neither replaces the other.**

The story bank holds **what you'll say** — the facts, fixed, so nothing gets assembled under pressure. The question bank holds **what you practice against** — so that on the day, no question is the first time you've had to produce an answer to it.

The correction earlier in this file is about *scripting*, not about *questions*. A tiered bank of predicted questions with pre-written answers fails, because the interview is behavioral, the "near-certain" ones go unasked, and the scripts were never portable anyway. **The questions themselves are still worth every minute.** Said plainly by someone who'd skipped the practice and regretted it: *"the questions would have been helpful if I would have studied them. I think I need both."*

Write `applications/<slug>/question-bank.md`.

### Organize by type, not by likelihood

**This is the fix for the failure above.** Ranking questions by how likely they are is the part that doesn't work — you can't predict which arrives. Grouping by *type* works, because a type you've rehearsed once transfers to every question in it.

| Type | What it's testing | How many |
|---|---|---|
| **Tell me about yourself / why this role** | Whether there's a coherent narrative | 2–3 |
| **Behavioral — a thing you did** | Ownership, and whether the story survives follow-up | 8–10 |
| **Behavioral — a thing that went wrong** | Judgment, and whether they've reflected | 3–4 |
| **Competency / technical for this role** | Whether they can do the job | 5–8, drawn from the posting's must-haves |
| **Hypothetical — "how would you…"** | Approach, and whether they ask before answering | 3–4 |
| **Logistics** | Money, timing, notice, travel | from Phase 3 |
| **The gaps** | Whatever `fit-analysis.md` rated as a gap. **Every one gets a question** | as many as there are |

**Pull the competency questions out of the posting's own language.** If a must-have says "partner with clinical stakeholders to translate requirements," the question is *"tell me about a time you translated requirements for a group that didn't share your vocabulary."* That's the question they will actually ask, in their words.

### What goes next to each question

**One line: which story answers it, and the single fact that has to be in the answer.** That's all.

```markdown
- **"Tell me about a time you had to say no to a stakeholder."**
  → `quoting-tool-scope` · lead with: two competing use cases, shipped one first
```

⛔ **Do not write out the answer.** That's the thing that fails. A written answer gets half-memorized, comes out stilted, and collapses the moment the question is phrased differently — and the phrasing is always different.

### Then make them answer each one, once, out loud

**This is the entire value of the file**, and it's the part that gets skipped because it feels like homework.

A question you've been forced to answer once is a question you don't assemble live. It doesn't need to be a good answer, and it doesn't need to be the answer they eventually give — it needs to have happened once already, so the interview isn't the first attempt. (See Phase 4b: nearly every strong answer is a second attempt, and in the room you only get one.)

The practical way through it is the mock in Phase 6 — that's what the bank feeds. **Cover the types, not every question**, and prioritize: every gap question, every failure question, and two or three behavioral ones.

⛔ **Don't print this file for the interview.** Shorthand notes on predicted questions are wasted paper — they'll be holding a list of questions nobody asked. **The one-page card in Phase 7 is what goes with them.** The question bank did its work beforehand.

---

## Phase 4b — Delivery, which is where prep actually fails

**A prep pack can be full of exactly the right material and still not survive contact, because none of it addresses how an answer is shaped.** Every item here is a delivery failure, not a knowledge failure.

- **Every strong answer is the second attempt.** First passes ramble through setup and run out of room before the result. In a real interview there is one take. ✅ **Rehearse three stories out loud to a hard sixty seconds. Lead with the result. Say the number in the first sentence.**

- **People bury their own best numbers.** They'll say traffic doubled and omit the qualified-inquiry figure; tell a story about a tool and leave out that it halved the turnaround. ✅ **Mark the load-bearing number in each story, with the instruction that it goes in the first sentence.**

- **They say nothing about the employer.** ✅ **Put employer facts *inside* specific answers, not only in a research section.** Knowing them and never saying them is the same as not knowing them. "I like this kind of work" is a category answer, not a company answer.

- **Resourcing questions get answered without assigning anyone anything.** ✅ A question about deploying a team is testing delegation. **Name people, assign work.**

- ⛔ **They apologize.** *"That's my own fault," "I don't know if I have a good answer for this."* ✅ **Never volunteer a missing baseline, and never apologize for an answer.** State what was measured and how. If it wasn't measured, say what happened and move on.

---

## Phase 5 — Their questions

**Four to six asked, eight prepared.** ⚠️ **Mark which are for this interviewer and which are for a later round** — a question about authority boundaries reads as negotiating before an offer exists.

**One question should convert their biggest gap into something they raised.** If the hardest thing they'll be screened on is people-management experience, asking *"how does the team think about development and support for new people leaders?"* puts the subject on the table on their terms. **Whoever raises the gap owns the framing of it.**

---

## Phase 6 — The mock. Not optional.

⛔ **Do not present this as a nice-to-have.** It is the only phase that tests delivery, and delivery is where prep fails. The verdict from skipping it is consistent: *"I was improvising a lot, and that was uncomfortable."*

**Grade on six things:** accuracy against the record · landmines stayed out · volunteer-first items got volunteered · **sixty seconds, result first** · **whether employer specifics appeared inside answers** · whether it sounded like them rather than like the document.

### Build a portable mock prompt — a standard deliverable

Write `applications/<slug>/mock-interview-prompt.md` as **one self-contained block that assumes no access to this repo**, so it can be pasted into a fresh session — including a voice session in a car, which is the cheapest rehearsal time a working person has and is otherwise unusable.

It carries:

1. **The interviewer persona** — name, title, background, and what they'd screen hardest on.
2. **Voice rules, stated hard.** One question then stop · turns under about forty words · no lists, headers, or markdown · **never reference anything visual, they may be driving** · no coaching mid-interview.
3. **The question pool from `question-bank.md`**, mixed and interleaved by type rather than grouped — deliberately not in the order they were practiced in.
4. **Their real facts**, so follow-ups can be pointed — with an instruction *not to read them back*.
5. **Anything unverified, marked unverified, with an instruction to test it hard.** This is how a mock surfaces what the prep missed.
6. **A debrief spec** — strongest, weakest, where a claim didn't hold, and three fixes.

⚠️ **Mocks break their own format.** A rule stated once gets violated: the mock coaches mid-answer and allows retakes, which inflates how the session felt and teaches nothing. **State the no-coaching rule twice, and forbid retakes by name.**

### Bring the debrief back

Record what the mock found. ⚠️ **Mark the provenance honestly** — a mock's read is the person's own statements, summarized by a summarizer, which makes it second-hand. Record it as a finding with that noted. ⛔ **Don't promote a mock's characterization into the profile as fact.**

---

## Phase 7 — The one-page card

One page, for the day itself. **Everything on it is either something that must be said precisely or something that must not be said at all.**

- The interviewer's name and function
- The load-bearing numbers, exactly as they'll be said
- The story index — question type → which story
- The volunteer-first items: distinctions to raise before being asked
- **"Know, don't say"** — research they need in their head that must never come out of their mouth. A re-posted requisition, a departure, anything that reads as leverage. **Mark these explicitly.**
- Their questions, in order
- The logistics answers, in the coached form

⛔ **Do not print the submitted resume.** People bring it and report it useless — they already know what's on it, and it pulls attention off the card.

**Writing it down is the point.** Everything said in a prep conversation is lost. Only the file survives to the morning of.

---

## Multi-round

**Re-run this skill per round. Don't reuse the previous pack.** A second-round panel is a different function, different questions, different risks. Don't overwrite the earlier card either — it's the record of what was said.

⚠️ **Consistency is a hard constraint across rounds.** Compensation, start date, and timing are **on record from round one.** Carry them forward verbatim into every later card. ⛔ **Never let a number drift between rounds** — it's the one inconsistency that's trivially checkable, and it reads as either carelessness or invention.

⚠️ **Don't change a prepared number the night before.** Analysis may justify a higher ask. Delivery confidence matters more than the marginal improvement, and a figure they've rehearsed beats a better figure they haven't.

---

## Guardrails

- ⛔ **Internal system names, clients, customers, and individuals never reach an answer.**
- ⛔ **Never describe a manager or a former employer as not understanding something.**
- ⚠️ **Check every editorial adjective about the employer against the posting and the company's own site.** Prep amplifies — a warm characterization written at midnight becomes a sentence said out loud at nine.
- ⚠️ **Most people under-claim.** Push on the hedges: *"I sort of knew,"* *"I was a collaborator,"* *"it wasn't really me."* The largest gap recoveries come out of those.
- ⚠️ **Don't infer hiring urgency from posting metadata.** A re-post plus an extended date reads like urgency and is usually an ordinary competitive process with several candidates and a normal timeline. Acting on the inference produces bad negotiating instincts.
- ⚠️ **The stated format is not reliable.** "A quick one-on-one" turns into a panel. Prepare for what they said and don't be thrown by something else.
- ⏸️ **When the interview is imminent, deliver to the conversation first and the file second.** With twenty minutes to go, a complete answer in chat beats a perfect document nobody opens.

## Questions to ask

- "When is it, how long, and do you know who you're talking to — name and job title?"
- For each unsourced number, one at a time: "The invoice review time — do you know what that was based on? Even 'it's what the team told me' is a usable answer."
- "Anything on here you're worried about being asked?" — frequently surfaces the real anxiety, which is often not what the documents suggest.
- After the logistics block: "Anything in there you'd rather not get into with them?"

## Done looks like

- The interviewer's function is known, and the prep matches it
- Every number on the submitted document is either sourced or has a phrasing they can say out loud
- Every place the sent document disagrees with the current record has a coached answer
- The resume was diffed against their public identity, and each discrepancy has an answer
- On a posting without a deep dive, every recorded gap was re-asked
- Every `Note:` constraint is on the volunteer-first list
- `story-bank.md` exists, with facts fixed and seams flagged
- `question-bank.md` exists, organized by type, with every gap in `fit-analysis.md` represented — and they have answered a representative question from each type out loud at least once
- The logistics block is answered, and every answer passed "can this be said as given?"
- The mock ran, and the debrief came back
- The one-page card exists, including the "know, don't say" items

## Common failure modes

**Scripting answers to predicted questions.** The questions won't be the ones asked, and a written answer half-memorized comes out stilted and collapses when the phrasing changes. Stories transfer; scripts don't.

**Skipping the question bank because the story bank exists.** They do different jobs. The stories fix the facts; the questions make sure no type of question is being attempted for the first time in the room.

**Preparing knowledge and skipping delivery.** The material is usually fine. The sixty-second, result-first, number-in-the-first-sentence part is what fails, and it's the part that only rehearsal fixes.

**Treating a recorded gap as settled.** It's a statement about the profile, not about the person — and on a posting that never got a deep dive it's frequently wrong.

**Letting the prep contradict the sent page.** Coach the version that contains both, with the page as the conservative one.

**Researching the employer and never using it.** Facts sitting in a research section that never enter an answer are the same as not having them.

**Preparing from the profile instead of the submitted document.** Prep what's on the page they sent.

**Coaching them to sound impressive.** The goal is accurate and comfortable. An answer that oversells is the exact thing this system spent all that effort preventing on paper.

**Skipping the mock because time is short.** It's the highest-value hour in the process and the first one people cut.

**Doing it the night before.** Some of this needs looking things up. Start when it's scheduled.

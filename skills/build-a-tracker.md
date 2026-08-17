---
name: build-a-tracker
description: Use when someone wants to see all their applications in one place — a sortable table of what's out, what's waiting, and what's gone quiet. Builds an Obsidian Base, or a plain markdown table for any other editor.
inputs: The application folders and their log.md files
outputs: status.md in each application folder, and either pipeline.base (Obsidian) or a regenerated table
---

# Build an application tracker

## The short version

- ⛔ **Don't build one unprompted.** Below about six applications the summary in `track-applications.md` is faster than any table.
- **State the maintenance obligation before building anything.** It doesn't update itself, and a neglected tracker doesn't go blank — it goes quietly wrong while still looking authoritative, and nobody double-checks a table.
- **Three things get decided per person:** whether they use Obsidian at all, what they'd actually filter on, and whether they want that obligation.
- **Add a `status.md` per application folder**, backfilled from the logs. ⛔ **Leave a field empty where the record is silent — never guess**, and say which ones you couldn't fill.
- **`log.md` says what happened; `status.md` says where it stands.** The log stays append-only prose.
- **Then build one of two things:** an Obsidian Base, or a plain table regenerated on request.
- **Updating it is part of logging** — same moment, same conversation, not a separate chore.

Everything below is the trade to state out loud, the field definitions, and the Base syntax. Read the whole file when you're running this skill.

## Purpose

Answer "where does everything stand?" at a glance, instead of by opening nine folders.

Past about six applications, the log files stop being enough. They're the right shape for *history* — what happened, in order, never rewritten — and the wrong shape for *state*. "Which of these have I not heard back from in two weeks" is a question about state, and reading nine append-only logs to answer it is why people stop asking it.

## When to invoke

- They ask for a tracker, a dashboard, a table, a Base, or "somewhere to see all of this"
- They ask where things stand and the answer takes you more than a few seconds to assemble
- They have roughly six or more application folders
- They mention using Obsidian and ask what it's good for here

⛔ **Don't build one unprompted.** Below about six applications the summary in `skills/track-applications.md` is faster than any table, and a tracker nobody asked for is a maintenance obligation nobody agreed to.

## First, the honest trade

**Say this before building anything**, because it's the whole reason a tracker goes bad:

> One thing worth knowing up front: this table won't update itself. It reads a small block of fields at the top of a file in each application folder, and something has to write those fields — me, when you tell me what happened, or you, by hand.
>
> If that gets skipped, the table doesn't go blank. It goes **quietly wrong**, and it still looks authoritative. That's worse than not having one, because you'll trust it.
>
> I'll keep it current as part of logging things, as long as you tell me. Want to go ahead?

**A tracker that's wrong is worse than no tracker.** Nobody double-checks a table.

## Which kind

Ask, don't assume:

**An Obsidian Base** (`pipeline.base`) — a live, sortable, filterable table with multiple saved views. Genuinely good, and Obsidian-only. If they're using Obsidian, this is the better answer by a distance.

**A plain markdown table**, regenerated on request. Works in any editor, in a terminal, on GitHub. Not live — it's a snapshot, accurate as of when you last built it, and it says so at the top.

> Are you using Obsidian to read these files? If so I can build you a proper live table you can sort and filter. If not, I'll write a plain table and rebuild it whenever you want.

⚠️ **Neither is a substitute for the logs.** `log.md` stays the history and the source of truth. The tracker is a derived view of current state, and if the two ever disagree, **the log is right.**

---

## Step 1 — Add `status.md` to each application folder

The tracker needs structured fields to read. They go in one file per application, separate from the log, because the two answer different questions: **`log.md` says what happened; `status.md` says where this stands.**

```markdown
---
company: "Copperline Health"
role: "Product Analyst"
status: applied
date_applied: 2026-02-15
last_contact: 2026-02-22
deadline:
fit_strong: 6
fit_partial: 1
fit_gap: 2
comp_range: "$78–92K"
work_mode: hybrid
location: "Rochester, NY"
source: "LinkedIn"
posting_url: "https://..."
direct_apply: yes
hold_reason:
passed_reason:
notes:
---

Current state only. History lives in `log.md`.
```

**`status` values** — keep this list and don't invent more: `captured` · `applied` · `screening` · `interview` · `offer` · `rejected` · `passed` · `on-hold`.

Two of those are easy to conflate and shouldn't be — see `skills/track-applications.md`:
- **`passed`** — the door is shut. `passed_reason` says why.
- **`on-hold`** — still wanted, blocked on something they control. **`hold_reason` must name what unblocks it.** "Waiting" is not a hold reason.

**Backfill from the existing logs.** Read each `log.md` and fill in what's already recorded — the applied date, the last response, the outcome. **Don't guess at anything that isn't written down**; leave the field empty and say which ones you couldn't fill:

> I've built these from your logs. Three folders don't have a comp range recorded and two don't have a source — I've left those blank rather than guessing. You can fill them in any time, or leave them; the table just shows gaps.

⛔ **Leave `log.md` alone.** It's append-only and it stays that way.

---

## Step 2a — The Obsidian Base

Write `pipeline.base` at the top level of the folder. This is a working starting point; adjust the views to what they actually care about.

```yaml
filters:
  and:
    - file.name == "status"

formulas:
  days_since_applied: if(date_applied, ((number(now()) - number(date_applied)) / 86400000).round(), "")
  days_since_contact: if(last_contact, ((number(now()) - number(last_contact)) / 86400000).round(), "")
  days_to_deadline: if(deadline, ((number(deadline) - number(now())) / 86400000).round(), "")
  fit_total: if(fit_strong, fit_strong + fit_partial + fit_gap, "")
  posting_link: if(posting_url, link(posting_url, "Posting"), "")
  resume_link: if(link(file.folder + "/resume.md").asFile(), link(file.folder + "/resume.md", "Resume"), "")

properties:
  company:
    displayName: Company
  role:
    displayName: Role
  status:
    displayName: Status
  date_applied:
    displayName: Applied
  formula.days_since_applied:
    displayName: Days out
  last_contact:
    displayName: Last contact
  formula.days_since_contact:
    displayName: Days quiet
  deadline:
    displayName: Deadline
  formula.days_to_deadline:
    displayName: Days left
  fit_strong:
    displayName: Strong
  fit_partial:
    displayName: Partial
  fit_gap:
    displayName: Gap
  comp_range:
    displayName: Comp
  work_mode:
    displayName: Mode
  location:
    displayName: Location
  source:
    displayName: Source
  hold_reason:
    displayName: Hold reason
  formula.posting_link:
    displayName: Posting
  formula.resume_link:
    displayName: Resume

views:
  - type: table
    name: Everything
    groupBy:
      property: status
      direction: ASC
    order:
      - company
      - role
      - status
      - formula.posting_link
      - fit_strong
      - fit_gap
      - comp_range
      - date_applied
    sort:
      - property: company
        direction: ASC

  - type: table
    name: Sent - waiting
    filters:
      and:
        - status == "applied"
    order:
      - company
      - role
      - date_applied
      - formula.days_since_applied
      - last_contact
      - formula.days_since_contact
    sort:
      - property: formula.days_since_applied
        direction: DESC

  - type: table
    name: Not built yet
    filters:
      and:
        - status == "captured"
    order:
      - company
      - role
      - fit_strong
      - fit_partial
      - fit_gap
      - comp_range
      - work_mode
    sort:
      - property: fit_strong
        direction: DESC

  - type: table
    name: On hold
    filters:
      and:
        - status == "on-hold"
    order:
      - company
      - role
      - hold_reason
      - deadline
      - formula.days_to_deadline

  - type: table
    name: Deadlines
    filters:
      and:
        - deadline != ""
        - status != "rejected"
        - status != "passed"
    order:
      - company
      - role
      - deadline
      - formula.days_to_deadline
      - status
    sort:
      - property: deadline
        direction: ASC
```

⚠️ **Keep view names plain ASCII** — `Sent - waiting`, not `Sent — waiting`. The block above matches a configuration known to work; don't get creative with the syntax, because a `.base` file that fails to parse shows an error where the table should be and gives no hint which line caused it.

**The "Sent — waiting" view sorted by days-out is the one that earns its keep.** It's the question people actually have, and the top row is usually the thing they've been avoiding.

**Then offer to tailor the views.** The shipped ones are generic; the useful ones are personal. Ask what they'd filter on — a city they're targeting, a comp floor, remote only — and add a view for it. One question:

> Anything you'd want its own view for? A location, remote-only, a comp floor — that kind of thing.

⚠️ **Don't add a formula linking to a rendered file by absolute path** unless they ask. It works, and it breaks silently the moment the folder moves or someone else opens it. If they do want it, generate the real path and tell them plainly that moving the folder breaks it.

---

## Step 2b — The plain markdown table

For anyone not using Obsidian. Write `TRACKER.md` at the top level:

```markdown
# Applications

Snapshot — rebuilt 2026-03-04. Ask me to rebuild it any time.
History lives in each folder's `log.md`; this is current state only.

| Company | Role | Status | Applied | Days out | Last contact | Fit | Comp |
|---|---|---|---|---|---|---|---|
| Copperline Health | Product Analyst | rejected | 02-15 | — | 03-04 | 6/1/2 | $78–92K |
| Meridian Freight | Ops Analyst | screening | 02-20 | 13 | 02-28 | 5/2/1 | — |
| Vantage Systems | Data Analyst | applied | 02-20 | 13 | — | 4/3/2 | $85–95K |
```

**Put the date it was built at the top, and say it's a snapshot.** A stale table that admits to being stale is fine. One that doesn't is the failure mode above.

**Sort by days-out descending**, so the quiet ones are at the top.

---

## Step 3 — Say how it stays current

**This is the step that determines whether the tracker is worth anything in a month.**

> From now on, when you tell me you've applied or heard back, I'll update both the log and the status file. If you want to change something yourself, `status.md` in the application folder is the one to edit — the fields at the top.

Then actually do it. `skills/track-applications.md` handles the logging; **once a tracker exists, updating `status.md` is part of that step and not a separate chore.** A tracker that only gets updated when someone remembers to ask is the quietly-wrong case.

⚠️ **A field nothing writes is a field that should be deleted.** If `comp_range` is empty on every row after a month, it isn't a useful column — it's a reproach. Offer to cut it.

## Questions to ask

- "Are you using Obsidian to read these files?"
- Before building: "This won't update itself — I'll keep it current as you tell me things, but it can go quietly wrong if that lapses. Still want it?"
- After building: "Anything you'd want its own view for?"
- Later, if fields stay empty: "Nothing's filled in the comp column in a month — want me to drop it?"

## Done looks like

- Every application folder has a `status.md`, backfilled from its log
- Fields that couldn't be filled from the record are **empty, not guessed**, and they know which
- Either `pipeline.base` or `TRACKER.md` exists, and they've seen it
- The plain table, if that's what was built, is dated and says it's a snapshot
- They know what keeps it current, and that a stale one is worse than none
- `log.md` files are untouched

## Common failure modes

**Building one for four applications.** A summary in chat is faster. This starts paying off around six or eight.

**Guessing at fields to make the table look complete.** An invented comp range or a made-up date is the same failure as an invented resume bullet, in a place nobody thinks to check. Empty is the honest value.

**Letting it drift.** The specific danger is that it degrades into *plausible* rather than *blank* — three applications sitting at `applied` that were actually rejected in February. Nobody double-checks a table.

**Inventing new status values.** The eight cover it. A ninth that means "sort of interviewing" makes every filter subtly wrong.

**Rewriting `log.md` to match the tracker.** Backwards. The log is the record; the tracker is derived from it.

**Building it in Obsidian for someone who doesn't use Obsidian.** A `.base` file is inert everywhere else — it won't even render as text usefully. Ask first.

**Adding twenty columns because the fields exist.** The useful table is the one they'll actually scan. Six or seven columns per view, and let the views differ.

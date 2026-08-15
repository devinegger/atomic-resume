<!-- FICTIONAL EXAMPLE. Jordan Vale is not a real person. This file shows what a
     digested profile looks like: hard metrics, honest "Unmeasured" entries, a
     directed-vs-written case, and one atom that's deliberately NOT a default
     resume bullet. See docs/data-model.md for the format this follows. -->

# Achievements — Jordan Vale

Atomic accomplishments. Every bullet any resume can use exists here first, exactly once.

## Atom format

```
### <slug>
- **Long:** full bullet, one sentence, verb first, lands on the outcome.
- **Short:** compressed to ~12 words.
- **Metric:** the number, and how it was measured. "Unmeasured" is valid.
- **Role:** which position this happened in.
- **Tags:** from the vocabulary below.
- **Evidence:** where this came from.
- **Use:** optional — present only when the atom should NOT default onto a resume.
- **Note:** optional — how to claim it precisely.
```

## Tag vocabulary

`#data` `#process` `#leadership` `#stakeholder` `#cost` `#growth` `#technical` `#customer` `#delivery`

---

## Atoms

### carrier-scorecard-rollout
- **Long:** Built a carrier performance scorecard from shipment and claims data, then used it to drive the quarterly carrier reviews that led to two renegotiations and one termination.
- **Short:** Built a carrier scorecard that drove two renegotiations and a termination.
- **Metric:** On-time delivery across reviewed carriers rose from 82% to 91% over three quarters, measured from TMS delivery timestamps. Confirmed in the 2025 performance review.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2023–present
- **Tags:** #data #stakeholder #cost
- **Evidence:** _inbox/performance-review-2025.md; _inbox/resume-2024-draft.md
- **Note:** The manager's review credits the underlying data work, but the harder and less obvious part was getting carrier managers to agree on a shared definition of "on time" before measuring anything — see `carrier-definition-alignment`. Worth mentioning that groundwork if asked how the scorecard earned trust.

### freight-billing-audit-recovery
- **Long:** Identified an eighteen-month pattern of accessorial overcharges in freight billing, worked the claims through with carriers, and recovered $184,000, then built the recurring check that catches it going forward.
- **Short:** Recovered $184,000 in freight overcharges and built the check that prevents recurrence.
- **Metric:** $184,000 recovered, confirmed by Finance. Recurring check has been live since early 2025; no comparable overcharge found since.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2025
- **Tags:** #cost #data #process
- **Evidence:** _inbox/performance-review-2025.md; _inbox/resume-2024-draft.md

### invoice-exception-redesign
- **Long:** Redesigned the invoice exception queue, cutting the time exceptions sat unresolved from several days to same-day.
- **Short:** Redesigned the invoice exception queue from multi-day to same-day resolution.
- **Metric:** Never formally measured. Team's own estimate, per the 2025 performance review: reviews that used to sit "a couple of days" now clear "the same morning." Treat as an estimate, not a percentage — the two source resumes disagreed on the exact figure (one said "reduced by half," the other implied a bigger change) and neither is traceable to a measurement.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2024
- **Tags:** #process #delivery
- **Evidence:** _inbox/resume-2021.md; _inbox/resume-2024-draft.md; _inbox/performance-review-2025.md
- **Note:** ⚠️ Say "the team's estimate" if asked how this was measured. Do not restate either source resume's conflicting figure — both were unsourced.

### dispatch-status-dashboard
- **Long:** Specified and shipped a dispatch status dashboard now used daily by the regional dispatch team.
- **Short:** Shipped a dispatch dashboard used daily by regional dispatch.
- **Metric:** Daily use by the regional dispatch team (5 people), per the 2025 review. ⚠️ Adoption outside that group has not happened — the review explicitly cautions against overstating this one.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2024
- **Tags:** #technical #delivery
- **Evidence:** _inbox/resume-2024-draft.md; _inbox/performance-review-2025.md
- **Note:** Jordan wrote the spec and did QA; a teammate on the BI team built it in Tableau. Directed, not personally built in Tableau — see `reporting-automation-script` for the same distinction applied elsewhere. Don't claim hands-on Tableau dashboard-building depth beyond what `skills.md` documents.

### reporting-automation-script
- **Long:** Designed and directed a script that automates the weekly carrier and shipment report, replacing several hours of manual assembly with a scheduled run IT maintains.
- **Short:** Designed an automated weekly reporting script, cutting manual assembly time.
- **Metric:** Unmeasured. ⚠️ Needs: roughly how many hours a week did the manual version take?
- **Role:** Operations Analyst, Northwind Logistics, 2021
- **Tags:** #process #technical
- **Evidence:** Captured in conversation during the digest, 2026-02-10 — not in any source document.
- **Note:** Jordan specified the report logic and the schedule; IT wrote and maintains the script itself. The achievement is Jordan's — the automation exists because Jordan designed it — but the scripting language is not a claimable skill. Standard directed-vs-written handling: the atom stands, the implementation tool does not go on the skills line.

### peak-season-staffing-model
- **Long:** Built the peak-season staffing model used to plan seasonal hiring for the warehouse team.
- **Short:** Built the peak-season staffing model used for seasonal hiring.
- **Metric:** Unmeasured. ⚠️ Needs: has hiring accuracy or overtime cost improved since the model went into use?
- **Role:** Senior Operations Analyst, Northwind Logistics, 2023
- **Tags:** #data #process
- **Evidence:** _inbox/resume-2024-draft.md

### warehouse-onboarding-playbook
- **Long:** Wrote the warehouse onboarding playbook still in use for new hires.
- **Short:** Wrote the warehouse onboarding playbook still used for new hires.
- **Metric:** Unmeasured — "still in use" is the only confirmed outcome; usage volume and any effect on ramp time are unknown.
- **Role:** Operations Analyst, Northwind Logistics, 2021
- **Tags:** #process #delivery
- **Evidence:** _inbox/resume-2024-draft.md

### escalation-triage-process
- **Long:** Built the escalation triage process for a six-person support team, reducing repeat contacts from customers whose issues had already been reported.
- **Short:** Built an escalation triage process that cut repeat customer contacts.
- **Metric:** Unmeasured. ⚠️ Needs: was there a before/after contact count, or is "reduced" a team impression?
- **Role:** Customer Support Lead, Brightline Outfitters, 2018–2020
- **Tags:** #process #leadership #customer
- **Evidence:** _inbox/resume-2024-draft.md

### carrier-definition-alignment
- **Long:** Before building the carrier scorecard, spent about a month getting carrier account managers to agree on a single definition of "on-time delivery" — resolving disagreements that would otherwise have made every subsequent number contestable.
- **Short:** Aligned carrier managers on a shared on-time definition before any measurement began.
- **Metric:** Not applicable — the outcome is that the later scorecard numbers were trusted rather than disputed, which isn't independently countable.
- **Role:** Senior Operations Analyst, Northwind Logistics, 2023
- **Tags:** #stakeholder #process
- **Evidence:** _inbox/performance-review-2025.md, employee comments section
- **Use:** ⚠️ Not a resume bullet by default. On its own it reads as internal process work with no visible outcome, and it's really the *reason the scorecard atom is credible* rather than a separate accomplishment. It's genuinely strong material for an interview question like "how did you get people to trust a new metric" — pair it with `carrier-scorecard-rollout` there. Revisit if a posting specifically asks about stakeholder alignment or change management, where it could stand on its own.

---

### tms-implementation-support
- **Long:** Did data validation and user acceptance testing for a transportation management system implementation.
- **Short:** Ran data validation and UAT for a TMS implementation.
- **Status:** thin — real work, but the outcome isn't recorded and Jordan was clear this wasn't ownership. Not a default resume bullet; kept because it's true, it's the only TMS exposure in the profile, and a posting that names TMS work would want to know about it.
  ⚠️ Needs: did the validation catch anything that changed the rollout, or was it routine?
- **Metric:** Unmeasured.
- **Role:** Operations Analyst, Northwind Logistics, 2020–2022
- **Tags:** #data #delivery
- **Evidence:** _inbox/resume-2024-draft.md ("assisted with the implementation of a new transportation management system"); Jordan, during the digest — "I did data validation and some UAT, nothing I'd call ownership."

---

## Not extracted — and why

**Running in standard mode**, so material that's real but thin became an atom marked `Status: thin` rather than being rejected — see `tms-implementation-support` above. What's left here is material that isn't an accomplishment of Jordan's in any mode: duties, attendance, and someone else's opinion.

Kept visible so the same material doesn't get re-litigated every session, and so Jordan can correct it — **if any of these did end in something, say so and it becomes an atom.**

- *"Responsible for reporting on carrier performance and shipment data"* — a duty, not an accomplishment. Superseded by the specific, dated version of this work captured in `carrier-scorecard-rollout` and `reporting-automation-script`.
- *"Participated in weekly operations meetings with regional managers"* — attendance is not an accomplishment.
- *"Supported the warehouse team during peak season"* — vague, no artifact. Superseded by `peak-season-staffing-model`, which is the specific thing this was probably gesturing at.
- *"Maintained a high customer satisfaction rating"* — no number, no source, and "high" is doing all the work in the sentence. Asked Jordan; no record of the actual rating exists anymore.
- *"Assisted with the returns process"* at Brightline — no specifics recoverable. Left out.
- The objective statement on the 2021 resume ("detail-oriented operations professional seeking to leverage...") — not an accomplishment, and also exactly the kind of language `voice.md` now flags.

## Processed source material

- 2026-02-10 — resume-2021.md, resume-2024-draft.md, performance-review-2025.md. First extraction pass, ten atoms (nine full, one marked thin).

# Probe: shortest route vs misconceptions M1-M4 (brindle-3.html)

Method: page loaded in headless Chrome with an injected script that uses the page's own PLACE, GATE, coverSet and toll logic. For each Mk the learner answers every item with the toll.py Mk variant (correct model otherwise; M3/M4 only differ at full-toll scope, M1 from rule 4, M2 from rule 2). 200 draws per Mk. Shortest route = placement, then "I've got this, test me" on each unskipped part, Part 6 test-me set, two Part 7 audits, Part 8 closing set. "Confronting" = an item whose Mk answer differs from the true toll.

Divergence over all 324 travelers matches the spec (M1 35, M2 25, M3 25, M4 31).

| Mk | placement confronting | parts placed out (of 5) | Part 6 test set (min/med/max) | Part 8 set (min/med/max) | total after placement (min/med/max) | seeds with 0 | Part 6 test passable while holding Mk |
|----|----|----|----|----|----|----|----|
| M1 | 2/2/2 | 1 | 2/2/3 | 2/2/3 | 5/6/10 | 0 | 0/200 |
| M2 | 1/1/1 | 2 | 1/1/2 | 1/1/2 | 3/4/7 | 0 | 0/200 |
| M3 | 1/1/1 | 3 | 1/1/2 | 1/1/2 | 2/2/6 | 0 | 0/200 |
| M4 | 0/0/0 | 5 (all) | 0/1/1 | 0/1/1 | 0/2/3 | 1 | 14/200 |

## Findings
- M1, M2, M3: always confronted at least once on every seed, but thinly: M3 median 1 at placement plus 2 after (the gate item that catches it is the single item, 1 crate Weaver Day salt).
- M4 is the flaw. Placement has no traveler where the cap bites with salt, so an M4 learner scores 7/7, places out of all five parts, and jumps to Part 6 level 3. Nothing is guaranteed to confront M4 afterward: the Part 6 test set misses M4 in 14/200 seeds (7%), the Part 8 set in 25/200 (12.5%), both in 1/200 seeds (0.5%, one full pass with 0 confrontation incl. Part 7 audits). The page's own check "shortest route covers every misconception" only checks the page's 14 built-in slips; none of them is M4 (the page's noCap is "forgets cap entirely", not "cap before salt"), and its freePassBeforeSalt differs from M3 (free pass right after crates). So coverSet guarantees nothing about M3/M4 as specified. M4 gets caught only incidentally, via items that happen to have a salted heavy bill.
- Part 7 audits rarely catch any Mk (0 in the median seed): they only confront when the random traveler happens to differ.
- Caveat: ledger levels 1-3 of Part 6 not simulated (test-me skips them); drills at scope below 6 cannot expose M3/M4 at all.

## Fix suggestions
- Add a placement item with salt, non-Dawn and a pre-cap total above 20 (e.g. 9 crates, Weaver, Dusk, lit, salt: true 20, M4 25).
- Add M3 and M4 as proper MIS entries (free pass after rule 1; cap before salt) so coverSet/exposes/GATE guarantee confrontation.

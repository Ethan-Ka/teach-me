# Domain: Driftstones scoring (invented)

Procedural domain. The tutor receives this whole file **except** the "Planted misconceptions" and "Tests" sections.

## Material to teach

Driftstones is played on a row of tiles. Each tile holds a stack of stones, and each stone is **red**, **blue**, or **grey**. At the end of a round, each stack is scored, and the round score is the sum of the stack scores.

**Scoring one stack** (read from the bottom stone up):
1. **Base:** each red = 2, each blue = 3, each grey = 0.
2. **Runs:** a run is 2 or more adjacent stones of the same color. Each run doubles the base value of the stones in it. (A run of grey stays 0.)
3. **Capstone:** if the top stone is grey, the stack is *capped*: subtract 1 from the stack total for each blue stone in the stack, but never go below 0.
4. **Drift:** if the stack has more than 5 stones, only the top 5 count. Remove the bottom stones before applying rules 1–3.

**Order matters:** drift (4) first, then base and runs (1–2), then capstone (3).

**Worked example:** stack bottom→top: blue, blue, red, grey.
- Drift: 4 stones, nothing removed.
- Base: 3+3+2+0 = 8. Runs: blue,blue is a run, so those become 6+6. Total 6+6+2+0 = 14.
- Capstone: the top is grey, and there are 2 blues → 14 − 2 = 12.

## Planted misconceptions (learner persona only)
- M1: "Runs double the whole stack." (They double only the stones in the run.)
- M2: "Drift removes the top stones." (It removes the bottom ones.)

## Tests (examiner only)

**Pre-test** (expected score: 0. Used to confirm there's no leakage.)
1. Score: red, red.

**Post-test** (1 point each)
1. *Near:* red, blue, blue. → 2 + 6 + 6 = **14**
2. *Near:* red, red, grey. → 4+4+0 = 8; capped, 0 blue → **8**
3. *Near (M1):* blue, red, red, blue. → 3 + 4 + 4 + 3 = **14**
4. *Near (M2):* bottom→top: blue, blue, red, red, red, blue (6 stones). Drift removes the bottom blue → blue, red, red, red, blue. Base 3 + (2+2+2 → run → 12) + 3 = **18**
5. *Far:* bottom→top: blue, grey, blue, grey. → 3+0+3+0 = 6; no runs; capped, 2 blues → **4**
6. *Far:* With stack red, red, ?, which top stone gives the highest score? → red (run of 3: 12). Blue gives 4+4+3 = 11. Grey gives 8. Answer **red, 12**
7. *Far (explain):* Why can adding a grey stone on top lower a stack's score? → it caps the stack, subtracting 1 per blue

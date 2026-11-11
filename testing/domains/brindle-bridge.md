# Domain: Brindle Bridge tolls (invented)

Conceptual domain with interacting rules (order and exceptions), not a single procedure. The tutor receives this file **except** the "Planted misconceptions" and "Tests" sections. Designed after the iteration-1 ceiling effect: short independent rules are followed perfectly by a simulated learner, so here the rules interact and a half-remembered model gives wrong answers.

## Material to teach

The keeper of Brindle Bridge works out each traveler's toll, in coins. A traveler has: a number of **crates** (1 to 9), a **guild** (Weaver, Miller, or none), the **hour** they arrive (Dawn, Day, or Dusk), a **lantern** (lit or unlit), and whether they carry **salt** (yes or no).

The keeper applies six rules **in this order**, each one working on the toll so far:

1. **Crates.** Each crate costs 2 coins, but every crate beyond the 6th costs 3 coins.
2. **Dusk.** If the hour is Dusk and the lantern does not count as lit, the toll so far is doubled. A lit lantern counts as lit only if the traveler has 4 crates or fewer. (With more, their hands are full and the lantern is lowered.) At Dawn and Day, the lantern does nothing.
3. **Guild.** A Miller's toll so far is halved, rounding down. A Weaver's toll so far drops by 4 coins, but not below 0. No guild, no change.
4. **Salt.** A traveler carrying salt adds 5 coins. This is a fee, not part of the load, so rule 3 never touches it. The salt fee is waived at Dawn.
5. **Free pass.** If the toll so far is 4 coins or less, it becomes 0.
6. **Cap.** The final toll is never more than 20 coins.

**Worked example:** 6 crates, Miller, Dusk, lit lantern, carrying salt.
- Crates: 6 x 2 = 12.
- Dusk: lit, but 6 crates is more than 4, so the lantern doesn't count. Doubled: 24.
- Guild: Miller halves it: 12.
- Salt: it is Dusk, so the fee applies: 12 + 5 = 17.
- Free pass: not 4 or less. Cap: not over 20. Toll: **17**.

## Planted misconceptions (learner persona only)
- **M1:** "The guild discount applies to the whole bill, salt included." (Salt is added after the guild rule, so it is never discounted.)
- **M2:** "A lit lantern always saves you from the Dusk doubling." (Only with 4 crates or fewer.)
- **M3:** "If the crate charge is small, the traveler passes free." The free pass is checked right after rule 1. (It is checked fifth, on the toll after doubling, guild, and salt.)
- **M4:** "The cap limits the crate charge, so salt can push you past 20." (The cap is last and covers everything.)

Divergence over all 324 travelers (9 crate counts x 3 guilds x 3 hours x 2 lanterns x 2 salt), from the script below:
- M1 gives a wrong toll on 35 travelers (35 of the 72 with a guild, salt, and not Dawn).
- M2 gives a wrong toll on 25 (25 of the 30 with Dusk, a lit lantern, and more than 4 crates).
- M3 gives a wrong toll on 25 (crate charge of 4 or less, so 1 or 2 crates, where doubling, salt, or both lift the real toll above 4).
- M4 gives a wrong toll on 31 (high bills with salt, not at Dawn).

## Tests (examiner only)

**Pre-test** (expected score: 0. Used to confirm there's no leakage.)
1. Toll for: 3 crates, no guild, Day, unlit, no salt.

**Post-test** (1 point each; items are written as crates, guild, hour, lantern, salt). Answers come from `posttest.py` below.

*Near transfer (4)*
1. 5 crates, Weaver, Day, unlit, no salt. 10, then minus 4 = **6**
2. 3 crates, no guild, Dusk, unlit, salt. 6, doubled 12, plus 5 = **17**
3. 7 crates, Miller, Day, unlit, no salt. 6x2 + 3 = 15, halved and rounded down = **7**
4. 8 crates, no guild, Day, lit, no salt. 12 + 6 = **18**

*Diagnostic, one per misconception (3). Only the correct model gets these right.*
5. (M1) 6 crates, Miller, Day, unlit, salt. 12, halved 6, plus 5 = **11** (M1 says 8)
6. (M2) 5 crates, no guild, Dusk, lit, no salt. 5 crates, so the lantern doesn't count: 10, doubled **20** (M2 says 10)
7. (M3) 2 crates, no guild, Dusk, unlit, no salt. 4, doubled **8** (M3 says 0, since the crate charge of 4 is "small")

*Far transfer (3)*
8. *Explain why:* A Miller at Dusk with a lit lantern and 4 crates pays **0**. An otherwise identical Miller with 5 crates pays **10**. Why does one extra crate cost so much? Key: the 5th crate costs 2, but it also fills the traveler's hands, so the lantern stops counting, so the Dusk doubling applies. Credit needs both the lantern exception and the doubling (4 crates: 8, lit, halved 4, free pass, 0. 5 crates: 10, doubled 20, halved **10**).
9. *Predict a new case:* 9 crates, Weaver, Dusk, lit, salt. Crates 12 + 9 = 21; lantern doesn't count (more than 4 crates): 42; Weaver: 38; salt: 43; cap: **20**. (M4 says 25.) The learner must also say which rules fired.
10. *Design a case:* Describe a traveler carrying salt, with at least 4 crates, whose toll is exactly 0. Key: only **4 crates, Dawn (salt waived), Weaver or Miller**, either lantern (4 crates at Dawn is 8, minus 4 or halved leaves 4, free pass). The learner should explain why Dawn is required (salt otherwise adds 5, which clears the free pass) and why no guild fails (8 stays 8).

Score ambiguous answers by reasoning, not just the final number: a correct number reached by a rule the learner stated wrongly counts half.

## Script and output

`toll.py` is the reference implementation, with a variant for each misconception. `posttest.py` computes the keys.

```python
import itertools
GUILDS=["Weaver","Miller","None"]; HOURS=["Dawn","Day","Dusk"]
def toll(c,g,h,lit,salt,M=None):
    """c crates (1-9), guild, hour, lantern lit (bool), carrying salt (bool).
    M = None for the true rules, or 'M1'..'M4' for a misconception's rules."""
    t=2*min(c,6)+3*max(c-6,0)                         # R1 crates
    if M=="M3" and t<=4: return 0                      # M3: free pass checked right after R1
    lit_eff = lit and (c<=4 or M=="M2")                # R2 exception: hands full above 4 crates
    if h=="Dusk" and not lit_eff: t*=2                 # R2 dusk doubling
    guild=lambda t: t//2 if g=="Miller" else max(t-4,0) if g=="Weaver" else t
    salty=lambda t: t+5 if salt and h!="Dawn" else t   # R4 salt, waived at Dawn
    if M=="M1": t=guild(salty(t))                      # M1: guild discount covers the salt
    else: t=salty(guild(t))                            # R3 then R4
    if M=="M4": t=t                                    # M4: cap only limits the crate charge
    if t<=4: t=0                                       # R5 free pass
    return t if M=="M4" else min(t,20)                 # R6 cap
def toll_M4(c,g,h,lit,salt):
    t=2*min(c,6)+3*max(c-6,0)
    if h=="Dusk" and not (lit and c<=4): t*=2
    t=t//2 if g=="Miller" else max(t-4,0) if g=="Weaver" else t
    t=min(t,20)                                        # M4: cap applied before the salt
    if salt and h!="Dawn": t+=5
    return 0 if t<=4 else t
ALL=list(itertools.product(range(1,10),GUILDS,HOURS,[True,False],[True,False]))
def var(M,x): return toll_M4(*x) if M=="M4" else toll(*x,M=M)
if __name__=="__main__":
    print(len(ALL))
    rel={"M1":lambda x:x[1]!="None" and x[4] and x[2]!="Dawn","M2":lambda x:x[2]=="Dusk" and x[3] and x[0]>4,
         "M3":lambda x:True,"M4":lambda x:True}
    for M in ["M1","M2","M3","M4"]:
        d=[x for x in ALL if toll(*x)!=var(M,x)]; r=[x for x in ALL if rel[M](x)]
        print(M,len(d),round(len(d)/len(ALL),3), "diverge among relevant:",len([x for x in r if toll(*x)!=var(M,x)]),"/",len(r))
```

Output of `python3 toll.py`:

```
324
M1 35 0.108 diverge among relevant: 35 / 72
M2 25 0.077 diverge among relevant: 25 / 30
M3 25 0.077 diverge among relevant: 25 / 324
M4 31 0.096 diverge among relevant: 31 / 324
```

`posttest.py`:

```python
from toll import *
ITEMS=[("N1",(5,"Weaver","Day",False,False)),("N2",(3,"None","Dusk",False,True)),
("N3",(7,"Miller","Day",False,False)),("N4",(8,"None","Day",True,False)),
("D1 (M1)",(6,"Miller","Day",False,True)),("D2 (M2)",(5,"None","Dusk",True,False)),
("D3 (M3)",(2,"None","Dusk",False,False)),
("F1 pair a",(4,"Miller","Dusk",True,False)),("F1 pair b",(5,"Miller","Dusk",True,False)),
("F2",(9,"Weaver","Dusk",True,True))]
for n,x in ITEMS: print(f"{n:10} {x}  TRUE={toll(*x):>2}  M1={var('M1',x):>2} M2={var('M2',x):>2} M3={var('M3',x):>2} M4={var('M4',x):>2}")
print("F3 (salt, >=4 crates, toll exactly 0):",[x for x in ALL if x[0]>=4 and x[4] and toll(*x)==0])
```

Output of `python3 posttest.py`:

```
N1         (5, 'Weaver', 'Day', False, False)  TRUE= 6  M1= 6 M2= 6 M3= 6 M4= 6
N2         (3, 'None', 'Dusk', False, True)  TRUE=17  M1=17 M2=17 M3=17 M4=17
N3         (7, 'Miller', 'Day', False, False)  TRUE= 7  M1= 7 M2= 7 M3= 7 M4= 7
N4         (8, 'None', 'Day', True, False)  TRUE=18  M1=18 M2=18 M3=18 M4=18
D1 (M1)    (6, 'Miller', 'Day', False, True)  TRUE=11  M1= 8 M2=11 M3=11 M4=11
D2 (M2)    (5, 'None', 'Dusk', True, False)  TRUE=20  M1=20 M2=10 M3=20 M4=20
D3 (M3)    (2, 'None', 'Dusk', False, False)  TRUE= 8  M1= 8 M2= 8 M3= 0 M4= 8
F1 pair a  (4, 'Miller', 'Dusk', True, False)  TRUE= 0  M1= 0 M2= 0 M3= 0 M4= 0
F1 pair b  (5, 'Miller', 'Dusk', True, False)  TRUE=10  M1=10 M2= 5 M3=10 M4=10
F2         (9, 'Weaver', 'Dusk', True, True)  TRUE=20  M1=20 M2=20 M3=20 M4=25
F3 (salt, >=4 crates, toll exactly 0): [(4, 'Weaver', 'Dawn', True, True), (4, 'Weaver', 'Dawn', False, True), (4, 'Miller', 'Dawn', True, True), (4, 'Miller', 'Dawn', False, True)]
```

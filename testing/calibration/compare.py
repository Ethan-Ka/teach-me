"""Compare blind grader outputs to the calibration key.
Usage: python3 testing/calibration/compare.py testing/results/calibration/<label>
Key values mirror key.md (keep them in sync). None = N/A."""
import json, re, sys, pathlib
N = None
KEY = {  # gates G1..G7 ("F" = FAIL, "P" = PASS or N/A), dims D1..D8
 "item-01": ("PPPPPPP", [3,4,3,3,4,3,4,N]),
 "item-02": ("PPFPPPP", [N,1,1,2,1,N,1,2]),
 "item-03": ("FPPFPPF", [0,0,0,0,0,1,1,N]),
 "item-04": ("PPPPPPF", [N,0,0,2,1,N,0,1]),
 "item-05": ("PFPPPPP", [2,3,3,2,3,3,3,N]),
 "item-06": ("PPPPPPF", [1,0,1,0,0,0,0,N]),
}
def load(p):
    t = p.read_text(); m = re.search(r"\{.*\}", t, re.S)
    try: return json.loads(m.group(0))
    except json.JSONDecodeError:  # graders sometimes leave quotes unescaped in prose fields
        gates = [{"id": a, "result": b} for a, b in re.findall(r'"id":\s*"(G\d)",\s*"result":\s*"([^"]+)"', t)]
        dims = [{"id": a, "score": None if b in ("null", '"N/A"') else float(b)}
                for a, b in re.findall(r'"id":\s*"(D\d)",\s*"score":\s*(null|"N/A"|[\d.]+)', t)]
        v = re.search(r'"verdict":\s*"(\w+)"', t)
        return {"gates": gates, "dimensions": dims, "verdict": v and v.group(1)}
out = pathlib.Path(sys.argv[1]); allerr = []; rows = []; ok_all = True
for item, (gk, dk) in KEY.items():
    g = load(out / f"{item}.json")
    gg = {x["id"]: ("F" if x["result"].upper().startswith("F") else "P") for x in g["gates"]}
    gr = "".join(gg.get(f"G{i}", "P") for i in range(1, 8))
    gate_dis = [f"G{i+1}(key {a}/grader {b})" for i, (a, b) in enumerate(zip(gk, gr)) if a != b]
    gd = {x["id"]: x["score"] for x in g["dimensions"]}
    errs, cells = [], []
    for i, k in enumerate(dk):
        s = gd.get(f"D{i+1}"); s = s if isinstance(s, (int, float)) else None
        if k is None or s is None:
            cells.append(f"{'–' if k is None else k}/{'–' if s is None else s}"); continue
        errs.append(s - k); cells.append(f"{k}/{s}" + ("!" if abs(s - k) > 1 else ""))
    passed = not gate_dis and all(abs(e) <= 1 for e in errs)
    ok_all &= passed; allerr += errs
    mae = sum(abs(e) for e in errs) / len(errs); mse = sum(errs) / len(errs)
    rows.append(f"| {item} | {g.get('verdict')} | {'agree' if not gate_dis else ', '.join(gate_dis)} | {' '.join(cells)} | {mae:.2f} | {mse:+.2f} | {'PASS' if passed else 'FAIL'} |")
print("| Item | Grader verdict | Gates | D1..D8 key/grader | MAE | Mean signed | Calibrated |")
print("|---|---|---|---|---|---|---|"); print("\n".join(rows))
print(f"\nOverall: MAE {sum(map(abs, allerr))/len(allerr):.2f}, mean signed error {sum(allerr)/len(allerr):+.2f} (positive = lenient), "
      f"{sum(abs(e)>1 for e in allerr)} of {len(allerr)} dimension scores off by more than 1. Pass bar {'MET' if ok_all else 'NOT MET'}.")

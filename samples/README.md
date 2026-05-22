# Comparator sample cases for catept-main / feat/publication

Each case dir has `Challenge.lean` (statement with `sorry`),
`Solution.lean` (real proof, delegating to the library theorem), and
`config.json`. Run against a Lean 4.29 catept-main checkout:

```bash
# from the comparator repo root (parked on local/v4.29.0-pinned):
scripts/catept-comparator-check.sh <catept-4.29-worktree> samples/matsubara --cache
```

`--cache` is only needed the first time on a fresh worktree (fetches
Mathlib oleans). A pass prints `Your solution is okay!` and exits 0.

## matsubara
Validates `MatsubaraLuttingerWardCarrier.S_I_eq_hbar_tauEnt`
(the identity `S_I = ℏ · τ_ent`). Kernel-only axioms.

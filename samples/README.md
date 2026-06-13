# Comparator sample cases for jagg-ix/physlib:entropic-physlib-core

12 cases independently re-validating the entropic-time-support spine
on the `entropic-physlib-core` branch of `jagg-ix/physlib` (Lean
v4.30.0 / Mathlib v4.30.0).

Each case directory has `Challenge.lean` (statement with `sorry`),
`Solution.lean` (real proof delegating to the library theorem), and
`config.json` (theorem name + kernel-only `permitted_axioms`). Run
against a Lean v4.30.0 physlib checkout:

```bash
# from the comparator repo root (entropic-physlib-core-v4.30.0 branch):
scripts/entropic-physlib-core-suite.sh <physlib-v4.30-worktree> --cache
```

`--cache` is only needed the first time on a fresh worktree (fetches
Mathlib oleans). A passing case prints `Your solution is okay!` and
exits 0. The suite runner exits 0 iff all 12 cases pass.

## Coverage

| Case | Library theorem | PR |
|---|---|---|
| `entropic-physlib-core-non-hermitian-collapse` | `nonHermitian_evolution_collapses_to_unitary_at_H_I_zero` | PR1 |
| `entropic-physlib-core-tise-mazur-ulam` | `tise_via_mazur_ulam_chain` | PR1 |
| `entropic-physlib-core-positive-operator-kernel` | `ContinuousLinearMap.IsPositive.apply_eq_zero_of_reApplyInnerSelf_eq_zero` | PR1 |
| `entropic-physlib-core-entropy-rate-nonneg` | `EntropyControlledSchrodingerSystem.entropyRate_nonneg` | PR1 |
| `entropic-physlib-core-gkls-rate-nonneg` | `gklsEntropicRate_nonneg` | PR2 |
| `entropic-physlib-core-herglotz-rescaled-invariant` | `HerglotzNoetherBalance.rescaled_invariant_deriv_zero` | PR3 |
| `entropic-physlib-core-relative-entropy-time-nonneg` | `relativeEntropyTime_nonneg` | PR4 |
| `entropic-physlib-core-wick-recovers` | `weighted_wick_expansion_recovers_wicks_theorem` | PR5 |
| `entropic-physlib-core-cfl-reparam-iff` | `cflCondition_reparam_iff` | PR6 |
| `entropic-physlib-core-entropic-time-cfl` | `EntropicTimeCourantStep.entropic_time_preserves_CFL` | PR6 |
| `entropic-physlib-core-tau-ent-monotone` | `EntropyProductionWorldline.entropicProperTime_monotone` | PR7 |
| `entropic-physlib-core-time-iff-entropy-order` | `EntropyProductionWorldline.entropicProperTime_le_iff` | PR7 |

## Axioms

Every Solution uses **only** the kernel baseline:

```
["propext", "Quot.sound", "Classical.choice"]
```

No additional axioms are permitted. The comparator's `lean4export`
inspection rejects any Solution that depends on more.

import Physlib.SpaceAndTime.EntropicProperTime
open QuantumInfo.Finite
/-- Challenge: the dimensional relative-entropy time
`relativeEntropyTime U ρ σ = (ℏ/(k_B T_∞)) · D(ρ‖σ)` is non-negative
for any state pair. -/
theorem relative_entropy_time_nonneg_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (U : RelativeEntropyTimeScale) (ρ σ : MState d) :
    0 ≤ relativeEntropyTime U ρ σ := by
  sorry

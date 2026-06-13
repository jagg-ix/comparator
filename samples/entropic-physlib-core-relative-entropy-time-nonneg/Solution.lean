import Physlib.SpaceAndTime.EntropicProperTime
open QuantumInfo.Finite
/-- Solution: discharged by `QuantumInfo.Finite.relativeEntropyTime_nonneg`. -/
theorem relative_entropy_time_nonneg_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (U : RelativeEntropyTimeScale) (ρ σ : MState d) :
    0 ≤ relativeEntropyTime U ρ σ :=
  relativeEntropyTime_nonneg U ρ σ

import Physlib.QFT.Wick.Consistency
open Physlib.QFT.Wick.Consistency QuantumInfo.Finite FieldSpecification
/-- Solution: discharged by
`Physlib.QFT.Wick.Consistency.weighted_wick_expansion_recovers_wicks_theorem`. -/
theorem wick_recovers_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    {𝓕 : FieldSpecification} (S_R hbar : ℝ) (ρ σ : MState d)
    (φs : List 𝓕.FieldOp) :
    WickAlgebra.timeOrder (WickAlgebra.ofFieldOpList φs) =
      ∑ φsΛ : WickContraction φs.length, φsΛ.wickTerm :=
  weighted_wick_expansion_recovers_wicks_theorem S_R hbar ρ σ φs

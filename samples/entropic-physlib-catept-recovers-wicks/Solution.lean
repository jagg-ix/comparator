import Physlib.QFT.Wick.Consistency
open Physlib.QFT.Wick.Consistency
/-- Solution: discharged by the library theorem
`Physlib.QFT.Wick.Consistency.catept_recovers_wicks_theorem`. -/
theorem catept_recovers_wicks_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    {𝓕 : FieldSpecification} (S_R hbar : ℝ) (ρ σ : MState d) (φs : List 𝓕.FieldOp) :
    WickAlgebra.timeOrder (WickAlgebra.ofFieldOpList φs) =
      ∑ φsΛ : WickContraction φs.length, φsΛ.wickTerm :=
  catept_recovers_wicks_theorem S_R hbar ρ σ φs

import Physlib.QFT.Wick.Consistency
open Physlib.QFT.Wick.Consistency QuantumInfo.Finite FieldSpecification
/-- Challenge: weighted Wick expansion recovers Wick's theorem. The
complex action weight `w` is a never-zero complex exponential, so
dividing it out of the weighted identity returns the standard Wick
expansion `𝓣(ofFieldOpList φs) = ∑_{φsΛ} φsΛ.wickTerm`. -/
theorem wick_recovers_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    {𝓕 : FieldSpecification} (S_R hbar : ℝ) (ρ σ : MState d)
    (φs : List 𝓕.FieldOp) :
    WickAlgebra.timeOrder (WickAlgebra.ofFieldOpList φs) =
      ∑ φsΛ : WickContraction φs.length, φsΛ.wickTerm := by
  sorry

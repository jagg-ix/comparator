import Physlib.QFT.Wick.Consistency
open Physlib.QFT.Wick.Consistency QuantumInfo.Finite FieldSpecification
/-- Challenge: CAT/EPT embeds & recovers Wick's theorem — the standard
contraction expansion is obtained by cancelling the non-zero entropic weight
from the weighted identity (HepLean's `wicks_theorem` used as input). -/
theorem catept_recovers_wicks_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    {𝓕 : FieldSpecification} (S_R hbar : ℝ) (ρ σ : MState d) (φs : List 𝓕.FieldOp) :
    WickAlgebra.timeOrder (WickAlgebra.ofFieldOpList φs) =
      ∑ φsΛ : WickContraction φs.length, φsΛ.wickTerm := by
  sorry

import Physlib.QuantumMechanics.FiniteTarget.NagaoNielsenSchrodinger
open QuantumMechanics.FiniteTarget
/-- Challenge: positive-operator pointwise kernel — for a positive
`T : H →L[ℂ] H` on a finite-dim complex Hilbert space, vanishing of
`T.reApplyInnerSelf ψ = Re ⟨T ψ, ψ⟩` forces `T ψ = 0`. -/
theorem positive_operator_pointwise_kernel_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    {T : H →L[ℂ] H} (hT : T.IsPositive) {ψ : H}
    (h_zero : T.reApplyInnerSelf ψ = 0) :
    T ψ = 0 := by
  sorry

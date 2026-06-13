import Physlib.QuantumMechanics.FiniteTarget.NagaoNielsenSchrodinger
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by `QuantumMechanics.FiniteTarget.ContinuousLinearMap.IsPositive.apply_eq_zero_of_reApplyInnerSelf_eq_zero`. -/
theorem positive_operator_pointwise_kernel_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    {T : H →L[ℂ] H} (hT : T.IsPositive) {ψ : H}
    (h_zero : T.reApplyInnerSelf ψ = 0) :
    T ψ = 0 :=
  ContinuousLinearMap.IsPositive.apply_eq_zero_of_reApplyInnerSelf_eq_zero hT h_zero

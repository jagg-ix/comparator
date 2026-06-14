import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameKMS
open QuantumMechanics.FiniteTarget
/-- Challenge: for the KMS QIF at inverse temperature `β` with
modular Hamiltonian `H_θ`, every `H_θ`-eigenstate satisfies the
complex-Hamiltonian TISE with the same modular-energy eigenvalue. -/
theorem kms_modular_eigenstate_tise_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_θ : H →L[ℂ] H) (hbar : ℝ) (hbar_pos : 0 < hbar)
    (beta : ℝ) (beta_pos : 0 < beta)
    {ψ : H} {E_θ : ℂ} (h_eig : H_θ ψ = E_θ • ψ) :
    (kmsQIF H_θ hbar hbar_pos beta beta_pos).complexHamiltonian ψ
      = E_θ • ψ := by
  sorry

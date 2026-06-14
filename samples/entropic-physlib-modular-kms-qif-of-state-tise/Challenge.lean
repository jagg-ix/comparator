import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Challenge: **TISE on modular-Hamiltonian eigenstates** for the
constructive KMS QIF built from a density matrix `ρ`. Any eigenstate
of `H_θ[ρ] = −log ρ` with eigenvalue `E_θ` is an eigenstate of the
full complex Hamiltonian of `kmsQIF_ofState` at the same eigenvalue. -/
theorem kms_qif_of_state_tise_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (ρ : MState d) (hbar : ℝ) (hbar_pos : 0 < hbar)
    (beta : ℝ) (beta_pos : 0 < beta)
    {ψ : EuclideanSpace ℂ d} {E_θ : ℂ}
    (h_eig : modularHamiltonianClm ρ ψ = E_θ • ψ) :
    (kmsQIF_ofState ρ hbar hbar_pos beta beta_pos).complexHamiltonian ψ
      = E_θ • ψ := by
  sorry

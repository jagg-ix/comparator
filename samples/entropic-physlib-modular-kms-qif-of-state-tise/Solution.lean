import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by
`QuantumMechanics.FiniteTarget.kmsQIF_ofState_tise`. -/
theorem kms_qif_of_state_tise_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (ρ : MState d) (hbar : ℝ) (hbar_pos : 0 < hbar)
    (beta : ℝ) (beta_pos : 0 < beta)
    {ψ : EuclideanSpace ℂ d} {E_θ : ℂ}
    (h_eig : modularHamiltonianClm ρ ψ = E_θ • ψ) :
    (kmsQIF_ofState ρ hbar hbar_pos beta beta_pos).complexHamiltonian ψ
      = E_θ • ψ :=
  kmsQIF_ofState_tise ρ hbar hbar_pos beta beta_pos h_eig

import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrame
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by
`QuantumMechanics.FiniteTarget.QuantumInertialFrame.tise_at_equilibrium`. -/
theorem equilibrium_qif_tise_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (Q : QuantumInertialFrame H)
    {ψ : H} (h_eq : Q.IsEquilibriumAt ψ)
    {E : ℂ} (h_eig : Q.H_R ψ = E • ψ) :
    Q.complexHamiltonian ψ = E • ψ :=
  Q.tise_at_equilibrium h_eq h_eig

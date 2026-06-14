import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrame
open QuantumMechanics.FiniteTarget
/-- Challenge: **TISE at equilibrium-QIF** — capstone of the QIF
equivalence chain `λ(ψ) = 0 ⟹ H_C ψ = E·ψ`. At an equilibrium QIF
state `ψ` that is also an `H_R`-eigenvector with eigenvalue `E`,
the full complex Hamiltonian satisfies `H_C ψ = E·ψ`. -/
theorem equilibrium_qif_tise_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (Q : QuantumInertialFrame H)
    {ψ : H} (h_eq : Q.IsEquilibriumAt ψ)
    {E : ℂ} (h_eig : Q.H_R ψ = E • ψ) :
    Q.complexHamiltonian ψ = E • ψ := by
  sorry

import Physlib.QuantumMechanics.FiniteTarget.NagaoNielsenSchrodinger
open QuantumMechanics.FiniteTarget
/-- Challenge: for the Mazur-Ulam-derived complex Hamiltonian
`H_C = H_R − i·H_I` on an `H_R`-eigenvector `ψ` annihilated by a positive
`H_I`, `ψ` satisfies the TISE for the full complex Hamiltonian. -/
theorem tise_mazur_ulam_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_R H_I : H →L[ℂ] H) (ψ : H) (E : ℂ)
    (hH_I_pos : H_I.IsPositive)
    (h_H_I_zero : H_I ψ = 0)
    (h_H_R_eig : H_R ψ = E • ψ) :
    complexHamiltonian H_R H_I ψ = E • ψ := by
  sorry

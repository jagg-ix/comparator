import Physlib.QuantumMechanics.FiniteTarget.NagaoNielsenSchrodinger
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by the library theorem
`QuantumMechanics.FiniteTarget.nonHermitian_evolution_collapses_to_unitary_at_H_I_zero`. -/
theorem non_hermitian_collapse_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (H_R : H →L[ℂ] H) (hbar : ℝ) (ψ : H) :
    complexHamiltonian H_R 0 = H_R
    ∧ complexHamiltonian H_R 0 ψ = H_R ψ
    ∧ normSquaredDecayRate hbar 0 = 0 :=
  nonHermitian_evolution_collapses_to_unitary_at_H_I_zero H_R hbar ψ

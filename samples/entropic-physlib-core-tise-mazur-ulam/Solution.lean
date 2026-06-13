import Physlib.QuantumMechanics.FiniteTarget.NagaoNielsenSchrodinger
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by `QuantumMechanics.FiniteTarget.tise_via_mazur_ulam_chain`. -/
theorem tise_mazur_ulam_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_R H_I : H →L[ℂ] H) (ψ : H) (E : ℂ)
    (hH_I_pos : H_I.IsPositive)
    (h_H_I_zero : H_I ψ = 0)
    (h_H_R_eig : H_R ψ = E • ψ) :
    complexHamiltonian H_R H_I ψ = E • ψ :=
  tise_via_mazur_ulam_chain H_R H_I ψ E hH_I_pos h_H_I_zero h_H_R_eig

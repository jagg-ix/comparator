import Physlib.QuantumMechanics.NonHermitian.Propagator
open Physlib.QuantumMechanics.NonHermitian.Propagator
/-- Solution: discharged by the library theorem
`Physlib.QuantumMechanics.NonHermitian.Propagator.schrodingerGenerator_eigen`. -/
theorem tise_eigenstate_scalar_evolution
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_C : H →L[ℂ] H) (hbar : ℝ) (ψ : H) (E_C : ℂ) (h : H_C ψ = E_C • ψ) :
    schrodingerGenerator H_C hbar ψ = (-Complex.I / (hbar : ℂ) * E_C) • ψ :=
  schrodingerGenerator_eigen H_C hbar ψ E_C h

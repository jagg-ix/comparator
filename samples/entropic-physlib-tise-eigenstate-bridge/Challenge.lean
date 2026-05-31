import Physlib.QuantumMechanics.NonHermitian.Propagator
open Physlib.QuantumMechanics.NonHermitian.Propagator
/-- Challenge: TiSE-style eigenstate ↔ scalar-evolution bridge. On an
`H_C`-eigenstate `H_C ψ = E_C ψ` (the non-Hermitian TiSE), the operator
Schrödinger generator acts as the scalar coefficient `−i E_C/ℏ` — exactly the
scalar coefficient driving `evolutionFactor`'s ODE. -/
theorem tise_eigenstate_scalar_evolution
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_C : H →L[ℂ] H) (hbar : ℝ) (ψ : H) (E_C : ℂ) (h : H_C ψ = E_C • ψ) :
    schrodingerGenerator H_C hbar ψ = (-Complex.I / (hbar : ℂ) * E_C) • ψ := by
  sorry

import Physlib.QuantumMechanics.NonHermitian.Propagator
open Physlib.QuantumMechanics.NonHermitian.Propagator
/-- Challenge: operator-level non-Hermitian Schrödinger equation
`iℏ ∂_t U = H_C U`, stated with `sorry`. -/
theorem schrodinger_operator_eq
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_C : H →L[ℂ] H) (hbar : ℝ) (hbar0 : hbar ≠ 0) (t : ℝ) :
    (Complex.I * (hbar : ℂ)) • (schrodingerGenerator H_C hbar * propagator H_C hbar t)
      = H_C * propagator H_C hbar t := by
  sorry

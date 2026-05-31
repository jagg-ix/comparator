import Physlib.QuantumMechanics.NonHermitian.WickRotation
open Physlib.QuantumMechanics.NonHermitian.WickRotation QuantumMechanics.FiniteTarget
/-- Solution: discharged by the library theorem
`Physlib.QuantumMechanics.NonHermitian.WickRotation.reduces_to_unitary_at_H_I_zero`. -/
theorem entropic_time_reduces_to_unitary
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_R : H →L[ℂ] H) (E_R hbar t : ℝ) :
    evolutionFactor E_R 0 hbar t = reversiblePhase E_R hbar t
    ∧ ‖evolutionFactor E_R 0 hbar t‖ = 1
    ∧ complexHamiltonian H_R 0 = H_R :=
  reduces_to_unitary_at_H_I_zero H_R E_R hbar t

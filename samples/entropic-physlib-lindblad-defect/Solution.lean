import Physlib.QuantumMechanics.Lindblad.NoetherDefect
open Physlib.QuantumMechanics.Lindblad.NoetherDefect
/-- Solution: same statement, discharged by the library theorem
`Physlib.QuantumMechanics.Lindblad.NoetherDefect.lindbladNoetherDefect_eq_normSq`. -/
theorem lindblad_defect_eq_normSq
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (L : H →L[ℂ] H) (ψ : H) :
    lindbladNoetherDefect L ψ = ‖L ψ‖ ^ 2 :=
  lindbladNoetherDefect_eq_normSq L ψ

import Physlib.QuantumMechanics.Lindblad.NoetherDefect
open Physlib.QuantumMechanics.Lindblad.NoetherDefect
/-- Challenge: the Lindblad Noether defect equals `‖L ψ‖²`, stated with `sorry`. -/
theorem lindblad_defect_eq_normSq
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (L : H →L[ℂ] H) (ψ : H) :
    lindbladNoetherDefect L ψ = ‖L ψ‖ ^ 2 := by sorry

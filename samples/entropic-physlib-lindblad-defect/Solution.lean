import Physlib.CATEPT.NoetherDissipation.LindbladNoether
open Physlib.CATEPT Physlib.CATEPT.NoetherDissipation
/-- Solution: same statement, discharged by the library theorem
`Physlib.CATEPT.NoetherDissipation.lindbladNoetherDefect_eq_normSq`. -/
theorem lindblad_defect_eq_normSq
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (L : H →L[ℂ] H) (ψ : H) :
    lindbladNoetherDefect L ψ = ‖L ψ‖ ^ 2 :=
  lindbladNoetherDefect_eq_normSq L ψ

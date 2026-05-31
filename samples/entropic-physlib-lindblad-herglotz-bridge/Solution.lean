import Physlib.QuantumMechanics.Lindblad.HerglotzBridge
open Physlib.QuantumMechanics.Lindblad.HerglotzBridge
/-- Solution: discharged by the library theorem
`Physlib.QuantumMechanics.Lindblad.HerglotzBridge.ofLindbladRate_alpha_nonpos`. -/
theorem lindblad_herglotz_alpha_nonpos
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (L : H →L[ℂ] H) (hbar : ℝ) (hbar_pos : 0 < hbar) (ψ : H) (J0 : ℝ) :
    ∀ t, (ofLindbladRate L hbar ψ J0).alpha t ≤ 0 :=
  ofLindbladRate_alpha_nonpos L hbar hbar_pos ψ J0

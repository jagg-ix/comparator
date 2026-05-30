import Physlib.CATEPT.NoetherDissipation.LindbladNoether
open Physlib.CATEPT Physlib.CATEPT.NoetherDissipation QuantumMechanics.FiniteTarget
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.NoetherDissipation.lindblad_noether_generates_entropic_time`. -/
theorem lindblad_noether_capstone
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] [FiniteDimensional ℂ H]
    (H_R L : H →L[ℂ] H) (hbar : ℝ) (hbar_pos : 0 < hbar) (ψ : H) (E_R : ℝ) :
    lindbladNoetherDefect L ψ = ‖L ψ‖ ^ 2
    ∧ 0 ≤ lindbladNoetherDefect L ψ
    ∧ (positiveGeneratorSystem H_R (lindbladDissipator L) hbar hbar_pos
        (lindbladDissipator_isPositive L)).entropyRate ψ
        = (2 / hbar) * lindbladNoetherDefect L ψ
    ∧ (∀ {t₁ t₂ : ℝ}, t₁ ≤ t₂ →
        (ofLindbladNoetherDefect H_R L hbar hbar_pos ψ).S_I_along t₁ ≤
          (ofLindbladNoetherDefect H_R L hbar hbar_pos ψ).S_I_along t₂)
    ∧ (∀ σ : ℝ, 0 ≤ σ → ‖properTimeGreenKernel E_R (lindbladNoetherDefect L ψ) σ‖ ≤ 1) :=
  lindblad_noether_generates_entropic_time H_R L hbar hbar_pos ψ E_R

import Physlib.QuantumMechanics.Lindblad.NoetherDefect
open Physlib.QuantumMechanics.Lindblad.NoetherDefect Physlib.QuantumMechanics.Lindblad.GreensFunction Physlib.Thermodynamics.SecondLaw QuantumMechanics.FiniteTarget
/-- Challenge: the Lindblad–Noether capstone — `L†L ⪰ 0` generates the full
chain (defect = ‖Lψ‖², entropy rate, monotone arrow, Green contraction). -/
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
    ∧ (∀ σ : ℝ, 0 ≤ σ → ‖properTimeGreenKernel E_R (lindbladNoetherDefect L ψ) σ‖ ≤ 1) := by
  sorry

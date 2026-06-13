import QuantumInfo.Entropy.EntropyProductionWorldline
open QuantumInfo.Finite
/-- Challenge: **time order is exactly entropy order.** Entropic time
`τ_ent` carries no ordering information beyond accumulated entropy:
`τ_ent(t₁) ≤ τ_ent(t₂) ⟺ S_I(t₁) ≤ S_I(t₂)`. -/
theorem time_iff_entropy_order_thm
    (W : EntropyProductionWorldline) (t₁ t₂ : ℝ) :
    W.entropicProperTime t₁ ≤ W.entropicProperTime t₂ ↔
      W.S_I t₁ ≤ W.S_I t₂ := by
  sorry

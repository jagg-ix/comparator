import QuantumInfo.Entropy.EntropyProductionWorldline
open QuantumInfo.Finite
/-- Solution: discharged by
`QuantumInfo.Finite.EntropyProductionWorldline.entropicProperTime_le_iff`. -/
theorem time_iff_entropy_order_thm
    (W : EntropyProductionWorldline) (t₁ t₂ : ℝ) :
    W.entropicProperTime t₁ ≤ W.entropicProperTime t₂ ↔
      W.S_I t₁ ≤ W.S_I t₂ :=
  W.entropicProperTime_le_iff t₁ t₂

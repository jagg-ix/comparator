import Physlib.CATEPT.SecondLawEntropicArrow
open Physlib.CATEPT
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.EntropyArrowWorldline.time_order_iff_entropy_order`. -/
theorem entropic_time_order_iff_entropy_order
    (W : EntropyArrowWorldline) {t₁ t₂ : ℝ} :
    W.τ_ent_along t₁ ≤ W.τ_ent_along t₂ ↔ W.S_I_along t₁ ≤ W.S_I_along t₂ :=
  W.time_order_iff_entropy_order

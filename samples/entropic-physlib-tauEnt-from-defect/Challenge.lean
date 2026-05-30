import Physlib.CATEPT.NoetherDissipation.EntropyProduction
open Physlib.CATEPT.NoetherDissipation
/-- Challenge: entropic time is monotone **as a side effect** of the non-negative
dissipative defect (the Noether-balance leakage); not posited but derived. -/
theorem entropic_time_monotone_from_dissipation
    (W : EntropicNoetherWorldline) {t₁ t₂ : ℝ} (h : t₁ ≤ t₂) :
    W.tauEnt t₁ ≤ W.tauEnt t₂ := by
  sorry

import Physlib.CATEPT.NoetherDissipation.EntropyProduction
open Physlib.CATEPT.NoetherDissipation
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.NoetherDissipation.EntropicNoetherWorldline.tauEnt_monotone_from_noether_defect`. -/
theorem entropic_time_monotone_from_dissipation
    (W : EntropicNoetherWorldline) {t₁ t₂ : ℝ} (h : t₁ ≤ t₂) :
    W.tauEnt t₁ ≤ W.tauEnt t₂ :=
  W.tauEnt_monotone_from_noether_defect h

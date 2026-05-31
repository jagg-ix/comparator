import Physlib.StatisticalMechanics.EntropyProduction
open Physlib.StatisticalMechanics.EntropyProduction
/-- Solution: discharged by the library theorem
`Physlib.StatisticalMechanics.EntropyProduction.tauEnt_monotone_from_noether_defect`. -/
theorem entropic_time_monotone_from_dissipation
    (W : EntropicNoetherWorldline) {t₁ t₂ : ℝ} (h : t₁ ≤ t₂) :
    W.tauEnt t₁ ≤ W.tauEnt t₂ :=
  W.tauEnt_monotone_from_noether_defect h

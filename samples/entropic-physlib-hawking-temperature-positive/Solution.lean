import Physlib.Relativity.SemiClassical.HawkingTemperature
open Physlib.Relativity.SemiClassical
/-- Solution: discharged by
`Physlib.Relativity.SemiClassical.hawkingTemperature_pos`. -/
theorem hawking_temperature_positive
    (ℏ κ c kB : ℝ) (hℏ : 0 < ℏ) (hκ : 0 < κ) (hc : 0 < c) (hkB : 0 < kB) :
    0 < hawkingTemperature ℏ κ c kB :=
  hawkingTemperature_pos ℏ κ c kB hℏ hκ hc hkB

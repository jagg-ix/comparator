import Physlib.Relativity.SemiClassical.HawkingTemperature
open Physlib.Relativity.SemiClassical
/-- Challenge: For positive `ℏ, κ, c, kB`, the Hawking temperature
`ℏκ/(2π·c·kB)` is strictly positive. -/
theorem hawking_temperature_positive
    (ℏ κ c kB : ℝ) (hℏ : 0 < ℏ) (hκ : 0 < κ) (hc : 0 < c) (hkB : 0 < kB) :
    0 < hawkingTemperature ℏ κ c kB := by
  sorry

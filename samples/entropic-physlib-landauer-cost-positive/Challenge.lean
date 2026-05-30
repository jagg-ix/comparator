import Physlib.Thermodynamics.Landauer
open Physlib.Thermodynamics.Landauer
/-- Challenge: Landauer's principle, strict form. At any positive temperature,
the per-bit erasure cost `kB · T · log 2` is strictly positive. -/
theorem landauer_cost_positive (T : ℝ) (hT : 0 < T) :
    0 < landauerCost T := by
  sorry

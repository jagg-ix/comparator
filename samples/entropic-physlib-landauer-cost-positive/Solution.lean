import Physlib.Thermodynamics.Landauer
open Physlib.Thermodynamics.Landauer
/-- Solution: discharged by `Physlib.Thermodynamics.Landauer.landauerCost_pos`. -/
theorem landauer_cost_positive (T : ℝ) (hT : 0 < T) :
    0 < landauerCost T :=
  landauerCost_pos T hT

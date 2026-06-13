import Physlib.ClassicalMechanics.Herglotz.Balance
open Physlib.ClassicalMechanics.Herglotz.Balance
/-- Solution: discharged by `HerglotzNoetherBalance.rescaled_invariant_deriv_zero`. -/
theorem herglotz_rescaled_invariant_thm
    (B : HerglotzNoetherBalance) (t : ℝ) :
    HasDerivAt (fun s => B.J s * Real.exp (- B.A s)) 0 t :=
  B.rescaled_invariant_deriv_zero t

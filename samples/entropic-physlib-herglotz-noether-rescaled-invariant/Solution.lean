import Physlib.CATEPT.NoetherHerglotz.Balance
open Physlib.CATEPT.NoetherHerglotz
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.NoetherHerglotz.HerglotzNoetherBalance.rescaled_invariant_deriv_zero`. -/
theorem herglotz_noether_rescaled_invariant_deriv_zero
    (B : HerglotzNoetherBalance) (t : ℝ) :
    HasDerivAt (fun s => B.J s * Real.exp (- B.A s)) 0 t :=
  B.rescaled_invariant_deriv_zero t

import Physlib.ClassicalMechanics.Herglotz.Balance
open Physlib.ClassicalMechanics.Herglotz.Balance
/-- Solution: discharged by the library theorem
`Physlib.ClassicalMechanics.Herglotz.Balance.rescaled_invariant_deriv_zero`. -/
theorem herglotz_noether_rescaled_invariant_deriv_zero
    (B : HerglotzNoetherBalance) (t : ℝ) :
    HasDerivAt (fun s => B.J s * Real.exp (- B.A s)) 0 t :=
  B.rescaled_invariant_deriv_zero t

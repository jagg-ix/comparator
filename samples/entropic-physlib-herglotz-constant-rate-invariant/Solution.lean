import Physlib.ClassicalMechanics.Herglotz.Instances
open Physlib.ClassicalMechanics.Herglotz.Instances
/-- Solution: discharged by the library theorem
`Physlib.ClassicalMechanics.Herglotz.Instances.constant_rate_rescaled_invariant_eq`. -/
theorem constant_rate_rescaled_invariant_eq_J0
    (alpha J0 t : ℝ) :
    (ofConstantRate alpha J0).J t * Real.exp (- (ofConstantRate alpha J0).A t) = J0 :=
  constant_rate_rescaled_invariant_eq alpha J0 t

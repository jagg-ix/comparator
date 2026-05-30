import Physlib.CATEPT.NoetherHerglotz.Instances
open Physlib.CATEPT.NoetherHerglotz
/-- Challenge: for the constant-rate Herglotz–Noether balance the rescaled
invariant takes the explicit value `J₀`: `J(t) · exp(−A(t)) = J₀` for all t.
A concrete witness that `HerglotzNoetherBalance` is non-vacuously inhabited. -/
theorem constant_rate_rescaled_invariant_eq_J0
    (alpha J0 t : ℝ) :
    (ofConstantRate alpha J0).J t * Real.exp (- (ofConstantRate alpha J0).A t) = J0 := by
  sorry

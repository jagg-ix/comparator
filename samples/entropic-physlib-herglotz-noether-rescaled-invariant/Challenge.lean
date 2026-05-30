import Physlib.CATEPT.NoetherHerglotz.Balance
open Physlib.CATEPT.NoetherHerglotz
/-- Challenge: **Noether–Herglotz integrated form** (Simoes–Colombo 2025, Prop 4.4).
The Herglotz momentum `J_σ` satisfies `J̇ = α J` (`α = ∂L/∂z`); multiplying by the
integrating factor `exp(−A) = exp(−∫α)` makes the *rescaled* momentum conserved. -/
theorem herglotz_noether_rescaled_invariant_deriv_zero
    (B : HerglotzNoetherBalance) (t : ℝ) :
    HasDerivAt (fun s => B.J s * Real.exp (- B.A s)) 0 t := by
  sorry

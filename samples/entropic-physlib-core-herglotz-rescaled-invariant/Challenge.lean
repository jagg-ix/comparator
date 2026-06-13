import Physlib.ClassicalMechanics.Herglotz.Balance
open Physlib.ClassicalMechanics.Herglotz.Balance
/-- Challenge: Noether–Herglotz integrated form. The Herglotz momentum
`J_σ` satisfies `J̇ = α J` (`α = ∂L/∂z`); multiplying by the integrating
factor `exp(−A) = exp(−∫α)` makes the **rescaled** momentum conserved. -/
theorem herglotz_rescaled_invariant_thm
    (B : HerglotzNoetherBalance) (t : ℝ) :
    HasDerivAt (fun s => B.J s * Real.exp (- B.A s)) 0 t := by
  sorry

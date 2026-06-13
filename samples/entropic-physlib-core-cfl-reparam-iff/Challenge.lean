import Physlib.FluidDynamics.CourantNumber
open FluidDynamics
/-- Challenge: CFL stability is invariant under positive monotone time
reparameterization with contravariant speed transformation:
`CFL(Δt, Δx, a) ⟺ CFL(λ·Δt, Δx, a/λ)` for `0 < λ`. -/
theorem cfl_reparam_iff_thm
    (Δt Δx a lam : ℝ) (hΔx : 0 < Δx) (ha : 0 < a) (hlam : 0 < lam) :
    CFLCondition Δt Δx a ↔ CFLCondition (lam * Δt) Δx (a / lam) := by
  sorry

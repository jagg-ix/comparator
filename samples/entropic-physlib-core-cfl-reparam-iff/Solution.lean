import Physlib.FluidDynamics.CourantNumber
open FluidDynamics
/-- Solution: discharged by `FluidDynamics.cflCondition_reparam_iff`. -/
theorem cfl_reparam_iff_thm
    (Δt Δx a lam : ℝ) (hΔx : 0 < Δx) (ha : 0 < a) (hlam : 0 < lam) :
    CFLCondition Δt Δx a ↔ CFLCondition (lam * Δt) Δx (a / lam) :=
  cflCondition_reparam_iff Δt Δx a lam hΔx ha hlam

import QuantumInfo.Entropy.EntropicTimeCFL
open QuantumInfo.Finite FluidDynamics
/-- Challenge: **entropic time is admissible as a CFL-stable evolution
parameter.** For a step driven by an entropic clock with the
contravariance equation `a_τ · Δτ = a_t · Δt`, the engineering CFL
bound in coordinate time is equivalent to the bound in entropic time. -/
theorem entropic_time_cfl_thm (S : EntropicTimeCourantStep) :
    CFLCondition S.Δt S.Δx S.a_t ↔ CFLCondition S.Δτ S.Δx S.a_τ := by
  sorry

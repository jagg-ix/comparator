import QuantumInfo.Entropy.EntropicTimeCFL
open QuantumInfo.Finite FluidDynamics
/-- Solution: discharged by
`QuantumInfo.Finite.EntropicTimeCourantStep.entropic_time_preserves_CFL`. -/
theorem entropic_time_cfl_thm (S : EntropicTimeCourantStep) :
    CFLCondition S.Δt S.Δx S.a_t ↔ CFLCondition S.Δτ S.Δx S.a_τ :=
  S.entropic_time_preserves_CFL

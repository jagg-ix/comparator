import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by
`QuantumMechanics.FiniteTarget.modularGroupOfState_group_law`,
which delegates to `ModularGroupData.ofGenerator`'s constructive
`group_law` field. -/
theorem constructive_sigma_group_law_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (ρ : MState d) (s t : ℝ)
    (a : EuclideanSpace ℂ d →L[ℂ] EuclideanSpace ℂ d) :
    (modularGroupOfState ρ).σ (s + t) a
      = (modularGroupOfState ρ).σ s
          ((modularGroupOfState ρ).σ t a) :=
  modularGroupOfState_group_law ρ s t a

import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Challenge: **constructive Tomita-Takesaki group law** for the
modular automorphism group built from a density matrix `ρ`:

  `σ_{s+t}^ρ(a) = σ_s^ρ(σ_t^ρ(a))`,

where `σ_t^ρ(a) := exp(i·t·H_θ[ρ]) · a · exp(-i·t·H_θ[ρ])` and
`H_θ[ρ] := −log ρ`. Both the unitary flow `exp(i·t·H_θ[ρ])` and
its group law are *derived* — the flow via `NormedSpace.exp`, the
group law via `NormedSpace.exp_add_of_commute_of_mem_ball` — so no
axiomatised σ_t is assumed. -/
theorem constructive_sigma_group_law_thm
    {d : Type*} [Fintype d] [DecidableEq d]
    (ρ : MState d) (s t : ℝ)
    (a : EuclideanSpace ℂ d →L[ℂ] EuclideanSpace ℂ d) :
    (modularGroupOfState ρ).σ (s + t) a
      = (modularGroupOfState ρ).σ s
          ((modularGroupOfState ρ).σ t a) := by
  sorry

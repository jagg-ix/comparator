import Physlib.QuantumMechanics.Lindblad.GKLSEntropicRate
open Physlib.QuantumMechanics.Lindblad
/-- Solution: discharged by `gklsEntropicRate_nonneg`. -/
theorem gkls_rate_nonneg_thm
    {d ι : Type*} [Fintype d] [DecidableEq d] [Fintype ι]
    (L : ι → Matrix d d ℂ) (ρ : MState d) :
    0 ≤ gklsEntropicRate L ρ :=
  gklsEntropicRate_nonneg L ρ

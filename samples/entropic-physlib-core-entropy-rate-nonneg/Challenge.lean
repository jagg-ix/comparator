import Physlib.QuantumMechanics.FiniteTarget.EntropyControlledSchrodinger
open QuantumMechanics.FiniteTarget
/-- Challenge: the entropy production rate `(2/ℏ)·⟨ψ|H_I|ψ⟩` of an
`EntropyControlledSchrodingerSystem` is non-negative pointwise. -/
theorem entropy_rate_nonneg_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (S : EntropyControlledSchrodingerSystem (H := H)) (ψ : H) :
    0 ≤ S.entropyRate ψ := by
  sorry

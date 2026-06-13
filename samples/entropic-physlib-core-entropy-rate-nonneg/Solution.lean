import Physlib.QuantumMechanics.FiniteTarget.EntropyControlledSchrodinger
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by `EntropyControlledSchrodingerSystem.entropyRate_nonneg`. -/
theorem entropy_rate_nonneg_thm
    {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (S : EntropyControlledSchrodingerSystem (H := H)) (ψ : H) :
    0 ≤ S.entropyRate ψ :=
  S.entropyRate_nonneg ψ

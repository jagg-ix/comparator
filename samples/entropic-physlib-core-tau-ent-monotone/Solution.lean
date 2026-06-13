import QuantumInfo.Entropy.EntropyProductionWorldline
open QuantumInfo.Finite
/-- Solution: discharged by
`QuantumInfo.Finite.EntropyProductionWorldline.entropicProperTime_monotone`. -/
theorem tau_ent_monotone_thm (W : EntropyProductionWorldline) :
    Monotone W.entropicProperTime :=
  W.entropicProperTime_monotone

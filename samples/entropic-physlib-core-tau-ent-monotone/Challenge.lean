import QuantumInfo.Entropy.EntropyProductionWorldline
open QuantumInfo.Finite
/-- Challenge: **entropic proper time is monotone non-decreasing — a
derived consequence of the second law.** Given a worldline with monotone
imaginary action `S_I` (the second law) and `ℏ > 0`, the entropic time
`τ_ent := S_I/ℏ` is monotone non-decreasing. The arrow of time is a
side effect of entropy production, not an independent input. -/
theorem tau_ent_monotone_thm (W : EntropyProductionWorldline) :
    Monotone W.entropicProperTime := by
  sorry

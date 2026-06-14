import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameKMS
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by
`QuantumMechanics.FiniteTarget.connesRovelliThermalTime_rate_eq`. -/
theorem connes_rovelli_thermal_time_rate_thm
    (beta hbar t₁ t₂ : ℝ) :
    connesRovelliThermalTime beta hbar t₂
      - connesRovelliThermalTime beta hbar t₁
      = beta * hbar * (t₂ - t₁) :=
  connesRovelliThermalTime_rate_eq beta hbar t₁ t₂

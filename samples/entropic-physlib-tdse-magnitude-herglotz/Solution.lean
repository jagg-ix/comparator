import Physlib.CATEPT.NoetherHerglotz.SchrodingerHerglotzTDSE
open Physlib.CATEPT.NoetherHerglotz
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.NoetherHerglotz.ofTDSEMagnitudeDecay_alpha_nonpos`. -/
theorem tdse_magnitude_herglotz_alpha_nonpos
    {ρ : Type*} (D : TDSEMagnitudeDecay ρ)
    (A : ℝ → ℝ) (hA : ∀ t, HasDerivAt A (- D.gamma t) t) :
    ∀ t, (HerglotzNoetherBalance.ofTDSEMagnitudeDecay D A hA).alpha t ≤ 0 :=
  ofTDSEMagnitudeDecay_alpha_nonpos D A hA

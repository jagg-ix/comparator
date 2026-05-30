import Physlib.CATEPT.QTM.LandauerShannonDuality
open Physlib.QuantumMechanics.QuantumChannel
open Physlib.Thermodynamics.Landauer
open Physlib.CATEPT.QTM.CompCommSplit
open Physlib.CATEPT.QTM.LandauerShannonDuality
/-- Challenge (CATEPT capstone): any CATEPT channel pair respecting the
Landauer floor at temperature `T` has total info cost ≥ `landauerCost T`. -/
theorem qtm_landauer_shannon_capstone
    {backend : QuantumChannelBackend}
    (R : CATEPTChannelPair backend) (T : ℝ)
    (h : R.RespectsLandauer T) :
    landauerCost T ≤ totalInfoCost R := by
  sorry

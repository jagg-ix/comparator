import Physlib.CATEPT.QTM.LandauerShannonDuality
open Physlib.QuantumMechanics.QuantumChannel
open Physlib.Thermodynamics.Landauer
open Physlib.CATEPT.QTM.CompCommSplit
open Physlib.CATEPT.QTM.LandauerShannonDuality
/-- Solution: discharged by
`Physlib.CATEPT.QTM.LandauerShannonDuality.qtmFull_landauer_shannon`. -/
theorem qtm_landauer_shannon_capstone
    {backend : QuantumChannelBackend}
    (R : CATEPTChannelPair backend) (T : ℝ)
    (h : R.RespectsLandauer T) :
    landauerCost T ≤ totalInfoCost R :=
  qtmFull_landauer_shannon R T h

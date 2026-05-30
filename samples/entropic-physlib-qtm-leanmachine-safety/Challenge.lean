import Physlib.CATEPT.QTM.LeanMachine
open Physlib.QuantumMechanics.QuantumChannel
open Physlib.Thermodynamics.Landauer
open Physlib.CATEPT.QTM.LandauerShannonDuality
open Physlib.CATEPT.QTM.LeanMachine
/-- Challenge (Lean machine as CATEPT region): every `LeanMachineBridge`
satisfies the Landauer–Shannon lower bound on total info cost. -/
theorem qtm_leanmachine_safety
    {backend : QuantumChannelBackend} (B : LeanMachineBridge backend) :
    landauerCost B.temperature ≤ totalInfoCost B.pair := by
  sorry

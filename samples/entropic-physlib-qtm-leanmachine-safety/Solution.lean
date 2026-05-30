import Physlib.CATEPT.QTM.LeanMachine
open Physlib.QuantumMechanics.QuantumChannel
open Physlib.Thermodynamics.Landauer
open Physlib.CATEPT.QTM.LandauerShannonDuality
open Physlib.CATEPT.QTM.LeanMachine
/-- Solution: discharged by
`Physlib.CATEPT.QTM.LeanMachine.LeanMachineBridge.leanMachine_safety`. -/
theorem qtm_leanmachine_safety
    {backend : QuantumChannelBackend} (B : LeanMachineBridge backend) :
    landauerCost B.temperature ≤ totalInfoCost B.pair :=
  LeanMachineBridge.leanMachine_safety B

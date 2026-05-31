import Physlib.Thermodynamics.LeanMachineBridge
open Physlib.QuantumMechanics.QuantumChannel
open Physlib.Thermodynamics.Landauer
open Physlib.Thermodynamics.LandauerShannonDuality
open Physlib.Thermodynamics.LeanMachineBridge
/-- Solution: discharged by
`Physlib.Thermodynamics.LeanMachineBridge.LeanMachineBridge.leanMachine_safety`. -/
theorem qtm_leanmachine_safety
    {backend : QuantumChannelBackend} (B : LeanMachineBridge backend) :
    landauerCost B.temperature ≤ totalInfoCost B.pair :=
  LeanMachineBridge.leanMachine_safety B

import Physlib.QuantumMechanics.QuantumChannel.Basic
open Physlib.QuantumMechanics.QuantumChannel
/-- Solution: discharged by
`Physlib.QuantumMechanics.QuantumChannel.QuantumChannelPair.sequentialCompose_left_identity_computation`. -/
theorem qtm_channel_monoidal_left_identity
    {backend : QuantumChannelBackend}
    (R : QuantumChannelPair backend) (ρ : backend.State) :
    backend.applyChannel
        (QuantumChannelPair.sequentialCompose
            (QuantumChannelPair.identityPair backend) R).computationChannel ρ =
      backend.applyChannel R.computationChannel ρ :=
  QuantumChannelPair.sequentialCompose_left_identity_computation R ρ

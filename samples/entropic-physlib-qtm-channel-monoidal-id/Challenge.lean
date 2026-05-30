import Physlib.QuantumMechanics.QuantumChannel.Basic
open Physlib.QuantumMechanics.QuantumChannel
/-- Challenge: Left-identity of `sequentialCompose` on the computation lane.
Identity-pair on the left is a left unit of monoidal channel composition. -/
theorem qtm_channel_monoidal_left_identity
    {backend : QuantumChannelBackend}
    (R : QuantumChannelPair backend) (ρ : backend.State) :
    backend.applyChannel
        (QuantumChannelPair.sequentialCompose
            (QuantumChannelPair.identityPair backend) R).computationChannel ρ =
      backend.applyChannel R.computationChannel ρ := by
  sorry

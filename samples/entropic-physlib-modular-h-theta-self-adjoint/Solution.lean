import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Solution: discharged by
`QuantumMechanics.FiniteTarget.modularHamiltonianClm_isSelfAdjoint`. -/
theorem modular_h_theta_self_adjoint_thm
    {d : Type*} [Fintype d] [DecidableEq d] (ρ : MState d) :
    IsSelfAdjoint (modularHamiltonianClm ρ) :=
  modularHamiltonianClm_isSelfAdjoint ρ

import Physlib.QuantumMechanics.FiniteTarget.QuantumInertialFrameModularFromState
open QuantumMechanics.FiniteTarget
/-- Challenge: the **modular-Hamiltonian CLM is self-adjoint** as an
operator on `EuclideanSpace ℂ d`. Constructively, `H_θ[ρ] := −log ρ`
is built from a Hermitian matrix via `HermitianMat.log` and lifted
through the star-algebra equivalence `Matrix.toEuclideanCLM`; the
star map of a Hermitian matrix is itself, so its CLM lift is
self-adjoint. -/
theorem modular_h_theta_self_adjoint_thm
    {d : Type*} [Fintype d] [DecidableEq d] (ρ : MState d) :
    IsSelfAdjoint (modularHamiltonianClm ρ) := by
  sorry

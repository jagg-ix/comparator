import Physlib.CATEPT.MatrixHeisenberg
open Physlib.CATEPT.MatrixHeisenberg
/-- Solution: discharged by the library theorem
`Physlib.CATEPT.MatrixHeisenberg.densityMatrixEvolution_doubleSpace_mapping_for`. -/
theorem dm_evolution_doubleSpace_mapping_for_any_generator
    (n : ℕ) (Heff : ℝ → LiouvilleHam n) :
    ∃ traj : LiouvilleTrajectory n, doubleSpaceSchrodinger n Heff traj :=
  densityMatrixEvolution_doubleSpace_mapping_for n Heff

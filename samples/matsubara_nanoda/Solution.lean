import CATEPTMain.Integration.MatsubaraLuttingerWardCarrier
open CATEPTMain.Integration.MatsubaraLuttingerWardCarrier
/-- Solution: same statement, discharged by the library theorem
`MatsubaraLuttingerWardCarrier.S_I_eq_hbar_tauEnt` (rw + ring). -/
theorem matsubara_S_I_eq_hbar_tauEnt (M : MatsubaraLuttingerWardCarrier) :
    M.S_I = M.ℏ * M.τ_ent :=
  M.S_I_eq_hbar_tauEnt

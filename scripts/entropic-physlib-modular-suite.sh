#!/usr/bin/env bash
#
# entropic-physlib-modular-suite.sh
#
# Run the Comparator over all `samples/entropic-physlib-modular-*` cases
# in sequence (Lean v4.30.0 / matching jagg-ix/physlib branch
# `entropic-physlib-modular`).
#
# Each case is kernel-replayed against the physlib working tree: same
# statement, permitted axioms only, accepted by a fresh Lean kernel.
# The runner restores physlib's lakefile and removes staged
# Challenge/Solution after each run, so the worktree stays clean even
# on partial failure.
#
# Usage:
#   scripts/entropic-physlib-modular-suite.sh <physlib-path> [--cache]
#
#   <physlib-path>  A Lean v4.30.0 physlib checkout (the
#                   `entropic-physlib-modular` branch on jagg-ix/physlib).
#                   Must build the modules the cases import.
#   --cache         Run `lake exe cache get` (Mathlib oleans) before
#                   the first case. Useful on a fresh worktree.
#
# Exit code: 0 iff every case passed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPARATOR_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PHYSLIB="${1:?usage: entropic-physlib-modular-suite.sh <physlib-path> [--cache]}"
DO_CACHE="${2:-}"

PHYSLIB="$(cd "$PHYSLIB" && pwd)"

# The 6 Connes–Rovelli / QIF cases covering the modular-flow extension
# of the entropic-time spine on jagg-ix/physlib:entropic-physlib-modular
# (which sits on top of jagg-ix/physlib:entropic-physlib-core).
CASES=(
  # KMS / modular-flow Quantum Inertial Frame
  entropic-physlib-modular-connes-rovelli-thermal-time
  entropic-physlib-modular-kms-modular-eigenstate-tise
  entropic-physlib-modular-equilibrium-tise
  # Constructive H_θ from a density matrix (off-equilibrium extension)
  entropic-physlib-modular-h-theta-self-adjoint
  entropic-physlib-modular-kms-qif-of-state-tise
  # Constructive σ_t group law via NormedSpace.exp_add_of_commute
  entropic-physlib-modular-constructive-sigma-group-law
)

LOG_DIR="$(mktemp -d -t entropic-physlib-modular-suite.XXXXXX)"
echo ">> log dir: $LOG_DIR"

declare -a RESULTS
PASS_COUNT=0
FAIL_COUNT=0
SUITE_RC=0

# Restore physlib's lakefile.toml and remove staged files even on Ctrl-C.
cleanup_physlib() {
  ( cd "$PHYSLIB" && \
    rm -f Challenge.lean Solution.lean comparator_config.json && \
    git checkout -- lakefile.toml 2>/dev/null || true
  )
}
trap cleanup_physlib EXIT

FIRST=1
for CASE in "${CASES[@]}"; do
  echo
  echo "==================================================="
  echo "=== CASE: $CASE"
  echo "==================================================="
  CASE_FLAG=""
  if [[ $FIRST -eq 1 && "$DO_CACHE" == "--cache" ]]; then
    CASE_FLAG="--cache"
  fi
  FIRST=0
  LOG="$LOG_DIR/$CASE.log"
  bash "$COMPARATOR_ROOT/scripts/catept-comparator-check.sh" \
    "$PHYSLIB" "$COMPARATOR_ROOT/samples/$CASE" $CASE_FLAG \
    > "$LOG" 2>&1
  RC=$?
  if [[ $RC -eq 0 ]]; then
    echo "PASS  (log: $LOG)"
    RESULTS+=("PASS  $CASE")
    PASS_COUNT=$((PASS_COUNT + 1))
  else
    echo "FAIL  (exit $RC; log: $LOG)"
    tail -10 "$LOG"
    RESULTS+=("FAIL  $CASE  (exit $RC)")
    FAIL_COUNT=$((FAIL_COUNT + 1))
    SUITE_RC=1
  fi
done

echo
echo "==================================================="
echo "=== entropic-physlib-modular comparator suite — results"
echo "==================================================="
for R in "${RESULTS[@]}"; do echo "  $R"; done
echo "  ---"
echo "  $PASS_COUNT passed, $FAIL_COUNT failed (of ${#CASES[@]})"
echo "  logs: $LOG_DIR"
exit $SUITE_RC

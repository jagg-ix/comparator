#!/usr/bin/env bash
#
# entropic-physlib-suite.sh
#
# Run the Comparator over all `samples/entropic-physlib-*` cases in sequence
# (Lean v4.29.1 / matching the jagg-ix/physlib entropic-physlib branch).
#
# Each case is kernel-replayed against the physlib working tree: same statement,
# permitted axioms only, accepted by a fresh Lean kernel. The script restores
# physlib's lakefile.lean and removes staged Challenge/Solution after each run,
# so the worktree stays clean even on partial failure.
#
# Usage:
#   scripts/entropic-physlib-suite.sh <physlib-path> [--cache]
#
#   <physlib-path>  A Lean v4.29.1 physlib checkout (the `entropic-physlib`
#                   branch). Must build the modules the cases import.
#   --cache         Run `lake exe cache get` (Mathlib oleans) before the first
#                   case. Useful on a fresh worktree.
#
# Exit code: 0 iff every case passed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPARATOR_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PHYSLIB="${1:?usage: entropic-physlib-suite.sh <physlib-path> [--cache]}"
DO_CACHE="${2:-}"

PHYSLIB="$(cd "$PHYSLIB" && pwd)"

# The cases to run, in dependency-light to heavy order. Add new lines as new
# load-bearing theorems land on the branch.
CASES=(
  entropic-physlib-lindblad-defect
  entropic-physlib-time-order-iff-entropy-order
  entropic-physlib-tauEnt-from-defect
  entropic-physlib-herglotz-noether-rescaled-invariant
  entropic-physlib-herglotz-constant-rate-invariant
  entropic-physlib-lindblad-herglotz-bridge
  entropic-physlib-tdse-magnitude-herglotz
  entropic-physlib-double-space-schrodinger-mapping
  entropic-physlib-reduces-to-unitary
  entropic-physlib-tise-eigenstate-bridge
  entropic-physlib-lindblad-noether-capstone
  entropic-physlib-catept-recovers-wicks
  entropic-physlib-schrodinger-operator
)

LOG_DIR="$(mktemp -d -t entropic-physlib-suite.XXXXXX)"
echo ">> log dir: $LOG_DIR"

declare -a RESULTS
PASS_COUNT=0
FAIL_COUNT=0
SUITE_RC=0

# Always restore physlib's lakefile.lean and remove staged files, even on Ctrl-C.
cleanup_physlib() {
  ( cd "$PHYSLIB" && \
    rm -f Challenge.lean Solution.lean comparator_config.json && \
    git checkout -- lakefile.lean 2>/dev/null || true
  )
}
trap cleanup_physlib EXIT

FIRST=1
for CASE in "${CASES[@]}"; do
  echo
  echo "==================================================="
  echo "=== CASE: $CASE"
  echo "==================================================="
  # --cache is only meaningful on the first run (warms the Mathlib cache).
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
echo "=== entropic-physlib comparator suite — results"
echo "==================================================="
for R in "${RESULTS[@]}"; do echo "  $R"; done
echo "  ---"
echo "  $PASS_COUNT passed, $FAIL_COUNT failed (of ${#CASES[@]})"
echo "  logs: $LOG_DIR"
exit $SUITE_RC

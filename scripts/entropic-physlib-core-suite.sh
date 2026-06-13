#!/usr/bin/env bash
#
# entropic-physlib-core-suite.sh
#
# Run the Comparator over all `samples/entropic-physlib-core-*` cases
# in sequence (Lean v4.30.0 / matching jagg-ix/physlib branch
# `entropic-physlib-core`).
#
# Each case is kernel-replayed against the physlib working tree: same
# statement, permitted axioms only, accepted by a fresh Lean kernel.
# The runner restores physlib's lakefile and removes staged
# Challenge/Solution after each run, so the worktree stays clean even
# on partial failure.
#
# Usage:
#   scripts/entropic-physlib-core-suite.sh <physlib-path> [--cache]
#
#   <physlib-path>  A Lean v4.30.0 physlib checkout (the
#                   `entropic-physlib-core` branch on jagg-ix/physlib).
#                   Must build the modules the cases import.
#   --cache         Run `lake exe cache get` (Mathlib oleans) before
#                   the first case. Useful on a fresh worktree.
#
# Exit code: 0 iff every case passed.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPARATOR_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PHYSLIB="${1:?usage: entropic-physlib-core-suite.sh <physlib-path> [--cache]}"
DO_CACHE="${2:-}"

PHYSLIB="$(cd "$PHYSLIB" && pwd)"

# The 12 cases covering the entropic-time support spine on
# jagg-ix/physlib:entropic-physlib-core. Order: dependency-light to
# heavy (positivity facts first, capstones last).
CASES=(
  # PR1: non-Hermitian Schrödinger spine
  entropic-physlib-core-non-hermitian-collapse
  entropic-physlib-core-positive-operator-kernel
  entropic-physlib-core-tise-mazur-ulam
  entropic-physlib-core-entropy-rate-nonneg
  # PR2: GKLS entropy-production rate
  entropic-physlib-core-gkls-rate-nonneg
  # PR3: Herglotz–Noether dissipative balance
  entropic-physlib-core-herglotz-rescaled-invariant
  # PR4: relative-entropy time scale
  entropic-physlib-core-relative-entropy-time-nonneg
  # PR5: complex action ↔ Wick compatibility
  entropic-physlib-core-wick-recovers
  # PR6: CFL invariance + entropic-time admissibility
  entropic-physlib-core-cfl-reparam-iff
  entropic-physlib-core-entropic-time-cfl
  # PR7: entropic time produced from second-law entropy production
  entropic-physlib-core-tau-ent-monotone
  entropic-physlib-core-time-iff-entropy-order
)

LOG_DIR="$(mktemp -d -t entropic-physlib-core-suite.XXXXXX)"
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
echo "=== entropic-physlib-core comparator suite — results"
echo "==================================================="
for R in "${RESULTS[@]}"; do echo "  $R"; done
echo "  ---"
echo "  $PASS_COUNT passed, $FAIL_COUNT failed (of ${#CASES[@]})"
echo "  logs: $LOG_DIR"
exit $SUITE_RC

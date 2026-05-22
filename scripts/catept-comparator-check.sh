#!/usr/bin/env bash
#
# catept-comparator-check.sh
#
# Independently re-validate a Lean theorem with Comparator, all on the
# Lean v4.29.0 toolchain (matching catept-main / feat/publication).
#
# Comparator confirms that the Solution theorem:
#   1. proves the same statement as the Challenge,
#   2. uses no axioms beyond `permitted_axioms` in the config,
#   3. is accepted by a fresh Lean kernel replay (independent of the
#      project's own `lake build`).
#
# DEV-MODE ONLY on macOS: `landrun` is Linux-only, so this uses the
# `scripts/fake-landrun.sh` shim, which performs NO sandboxing. The
# kernel-replay guarantee is real; the anti-adversarial sandbox is not.
# Use only to self-validate your own proofs, never to judge untrusted
# Solution files.
#
# Usage:
#   scripts/catept-comparator-check.sh <project-dir> <case-dir> [--cache]
#
#   <project-dir>  A Lean 4.29 project (e.g. a catept-main worktree).
#                  Its lakefile must build the module the case imports.
#   <case-dir>     A directory containing Challenge.lean, Solution.lean,
#                  and config.json (see samples/ for an example).
#   --cache        Run `lake exe cache get` in the project first
#                  (needed on a fresh worktree to fetch Mathlib oleans).
#
# Exit code 0 == "Your solution is okay!"; non-zero otherwise.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPARATOR_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

PROJECT_DIR="${1:?usage: catept-comparator-check.sh <project-dir> <case-dir> [--cache]}"
CASE_DIR="${2:?usage: catept-comparator-check.sh <project-dir> <case-dir> [--cache]}"
DO_CACHE="${3:-}"

PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
CASE_DIR="$(cd "$CASE_DIR" && pwd)"

COMPARATOR_BIN="$COMPARATOR_ROOT/.lake/build/bin/comparator"
LEAN4EXPORT_BIN="$COMPARATOR_ROOT/.lake/packages/lean4export/.lake/build/bin/lean4export"
SHIM="$COMPARATOR_ROOT/scripts/fake-landrun.sh"

# 1. Build the comparator stack if needed (all v4.29.0).
if [[ ! -x "$COMPARATOR_BIN" || ! -x "$LEAN4EXPORT_BIN" ]]; then
  echo ">> building comparator + lean4export (v4.29.0) ..."
  ( cd "$COMPARATOR_ROOT" && lake build lean4export comparator )
fi

# 2. v4.29.0 comparator reads `landrun` / `lean4export` from PATH by
#    name (it predates the COMPARATOR_* env overrides). Stage a bin dir.
BINDIR="$COMPARATOR_ROOT/.lake/catept-check-bin"
mkdir -p "$BINDIR"
cp "$SHIM" "$BINDIR/landrun"
chmod +x "$BINDIR/landrun"
ln -sf "$LEAN4EXPORT_BIN" "$BINDIR/lean4export"

# 3. Stage the case files into the project and register the libs.
cp "$CASE_DIR/Challenge.lean" "$PROJECT_DIR/Challenge.lean"
cp "$CASE_DIR/Solution.lean" "$PROJECT_DIR/Solution.lean"
cp "$CASE_DIR/config.json" "$PROJECT_DIR/comparator_config.json"

LAKEFILE="$PROJECT_DIR/lakefile.lean"
if [[ -f "$LAKEFILE" ]] && ! grep -q "^lean_lib Challenge" "$LAKEFILE"; then
  cat >> "$LAKEFILE" <<'EOF'

-- Comparator dev-mode validation libs (appended by catept-comparator-check.sh).
lean_lib Challenge where
  srcDir := "."
lean_lib Solution where
  srcDir := "."
EOF
fi

# 4. Optionally warm the Mathlib cache.
if [[ "$DO_CACHE" == "--cache" ]]; then
  echo ">> lake exe cache get (Mathlib oleans) ..."
  ( cd "$PROJECT_DIR" && lake exe cache get >/dev/null 2>&1 || true )
fi

# 5. Run comparator.
echo ">> running comparator (v4.29.0, dev-mode / no sandbox) ..."
cd "$PROJECT_DIR"
set +e
PATH="$BINDIR:$PATH" lake env "$COMPARATOR_BIN" comparator_config.json
RC=$?
set -e

if [[ $RC -eq 0 ]]; then
  echo ">> PASS: solution accepted (same statement, permitted axioms, kernel-checked)."
else
  echo ">> FAIL: comparator rejected the solution (exit $RC)."
fi
exit $RC

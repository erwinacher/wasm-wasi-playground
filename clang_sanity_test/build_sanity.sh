#!/usr/bin/env bash
# -------------------------------------------------------------
# Build script for C++23 sanity test using LLVM 21.1.0 + libc++
# -------------------------------------------------------------

set -e

SRC="cxx23_sanity.cpp"
OUT="cxx23_sanity"

LLVM_ROOT="/opt/llvm-21.1.0"
GCC15_LIB="/usr/local/gcc-15/lib/gcc/x86_64-pc-linux-gnu/15.2.0/../../../../lib"

echo "[1/2] Building $SRC with clang++ from LLVM 21..."
"${LLVM_ROOT}/bin/clang++" -std=c++23 -O2 "$SRC" -o "$OUT" \
  -I "${LLVM_ROOT}/include/c++/v1" \
  -I "${LLVM_ROOT}/include/x86_64-unknown-linux-gnu/c++/v1" \
  -L "${GCC15_LIB}" \
  -L "${LLVM_ROOT}/lib/x86_64-unknown-linux-gnu" \
  -stdlib=libc++ -lc++ -lc++abi

echo "[2/2] Setting runtime library path..."
export LD_LIBRARY_PATH="${LLVM_ROOT}/lib/x86_64-unknown-linux-gnu:${LD_LIBRARY_PATH}"

echo
echo "✅ Build complete!"
echo "You can now run it with:"
echo "  ./cxx23_sanity"
echo
echo "Or run ./run_sanity.sh if you want auto-LD path setup."


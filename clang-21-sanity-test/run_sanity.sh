#!/usr/bin/env bash
# Run C++23 sanity binary with LLVM 21 runtime.

LLVM_LIB_PATH="/opt/llvm-21.1.0/lib/x86_64-unknown-linux-gnu"

export LD_LIBRARY_PATH="${LLVM_LIB_PATH}:${LD_LIBRARY_PATH}"

echo "[clang++ 21 runtime path set]"
echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"

./cxx23_sanity


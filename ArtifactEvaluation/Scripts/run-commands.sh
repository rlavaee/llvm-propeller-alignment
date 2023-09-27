# Usage ./run-commands $1 $2
# $1 : path to the clang binary
# $2 : number of commands to run

set -eu

# Set the base directory
BASE_DIR="$(pwd)"/clang_propeller_binaries
if [[ ! -d "${BASE_DIR}" ]]; then
    echo "Directory clang_propeller_bolt_binaries must exist!"
    exit 1
fi

BENCHMARKING_CLANG_BUILD=${BASE_DIR}/benchmarking_clang_build

export CCP=$(cd $(dirname $1); pwd)/$(basename $1)
cd ${BENCHMARKING_CLANG_BUILD}
ninja -t commands | head -n $2 | xargs -P1 -L1 -d "\n" bash -x -c

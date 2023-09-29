# Usage ./run-commands $1 $2 $3
# $1 : path to the clang binary: Use ${BASE_DIR}/path/to/clang-18
# $2 : number of commands to run
# $3 : taskset argument

set -eu

# Set the base directory
BASE_DIR="$(pwd)"/clang_propeller_binaries
if [[ ! -d "${BASE_DIR}" ]]; then
    echo "Directory clang_propeller_bolt_binaries must exist!"
    exit 1
fi

export CCP=$(cd $(dirname $1); pwd)/$(basename $1)

BENCHMARKING_CLANG_BUILD=${BASE_DIR}/benchmarking_clang_build
cd ${BENCHMARKING_CLANG_BUILD}/symlink_to_clang_binary
ln -sf ${CCP} clang
ln -sf ${CCP} clang++
cd ..
ninja clean
ninja -t commands | head -n $2 | xargs -P1 -L1 -d "\n" taskset $3 bash -x -c

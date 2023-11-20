#!/bin/bash

export TASKSET=0x4
declare -A bins=( ["none"]="" )
bins['base']="baseline_propeller_only_clang_build"
bins['prop']="optimized_propeller_noalign_build"
bins['align']="optimized_propeller_align_build"

B="${bins[$1]}"
PWD=$(pwd)
cmd="./Scripts/run-commands.sh ${PWD}/clang_propeller_binaries/$B/bin/clang-18 200"
[[ -z "${TASKSET}" ]] || cmd="taskset $TASKSET $cmd"
log=.$B-$2-$$.log

#set -x
$cmd > $log 2>&1

grep -H -c clang $log

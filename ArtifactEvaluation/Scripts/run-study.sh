#!/bin/bash
# Remember to run do.py setup-perf
PT=${HOME}/copt/source/perf-tools
STUDY_MODE=cond-misp $PT/study.py align prop base -a ./clang.sh --tune :calibrate:1 :imix:0x2f :size:1 :sample:3 :tma-group:"\"'Bad'\"" -t5

## Propeller: A Profile Guided, Relinking Optimizer for Warehouse Scale Applications

Hardware requirements
```
Intel Skylake or newer
32 GB of RAM or more.
Access to hardware performance counters using linux perf
```

To run the experiments for Artifact Evaluation
```
$ cd llvm-propeller-alignment/ArtifactEvaluation
$ Scripts/optimize_clang.sh

# Expected contents of Results
# Contents of Results
$ Results
    mem_propeller_profile_conversion.txt
    mem_propeller_noalign_build.txt
    mem_propeller_align_build.txt
    perf_clang_baseline.txt
    perf_clang_propeller_noalign.txt
    perf_clang_propeller_align.txt
    sizes_clang.txt
```

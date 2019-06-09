
### CAR3S Group: Progress Report

### Week 3

**Focus for the week**

To verify Flush+Flush attack's accuracy and manipulate per-core frequencies.

**Progress**

* Analysis of `intel_pstate` driver suggested that manipulating per-core frequencies using this driver is not straight-forward since the algorithms employed don't really give heed to software based values.
* This called for a change of strategy, namely disabling the driver altogether! It isn't really complicated. Addition of a few lines to `grub` achieves this. The kernel loads other available drivers without any hiccups, the default of which is `ondemand`.
* This is an older power governor which much stricter policies regarding software-enforced frequency scaling and manipulating the per-core frequencies using this achieves the intended result.
* All of this has been automated using scripts and placed in the [intel_pstate_manipulations](../intel_pstate_manipulations) directory. This still requires root level privileges. Using `time` command against any instruction which we might like to record the execution time for, one can easily gauge the performance difference using the `perf_check` script, using `taskset` command for CPU pinning.
* It became apparent that the current version of `gedit` are patched for the vulnerabilities being tested using Flush+Flush attack, yielding unsatisfactory and unpredictable results. The focus then shifted to using an older version (3.10) to verify the published research.
* By compiling the application locally and after installing a few old libraries, I was able to profile the older version for suitable cache memory addresses.

**Challenges**

* The older version of Gedit (3.10), released circa 2014, uses a lot of deprecated libraries which had to be compiled themselves, which required still older applications.
* After going through this tedious task, the work-system crashed, probably due to clashing graphics libraries (particularly `gtksourceview`) and has been particularly challenging to get back on.
* The current focus is to get the system back on.

##### Anish Saxena


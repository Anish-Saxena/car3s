### Warning

The following code is intended and verified to run on Intel i7-6700 CPU only. The execution may result in instability/ overheating and corruption of driver or grub. Use at your own risk.
You will need root privileges to run `manip_*.sh` and `restore.sh` scripts.

### Description

`manip_*.sh` : These scripts will cause two threads to run at 3.4 GHz (minimum) while others will operate at 1 GHz maximum.

`restore.sh` : This script is intended to restore normal operations.

`cpu_gauge.sh` : This script will display core frequencies in real time (with 0.5 second interval).

`perf_check.sh` : This script builds a simple benchmarking application, then produces results of different execution times (hopefully) by pinning them to different cores. The `manip_*.sh` scripts should be executed first to have significant time difference.

#### Anish Saxena


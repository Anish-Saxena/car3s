### CAR3S Group: Progress Report
### Week 1

**Focus for the week**

To emulate Flush+Flush attack and DVFS-like behaviour on the workstation.

**Progress**

* I was able to identify individual cache locations used to store particular characters using the profiling tools provided by IAIK’s [cache template attacks](https://github.com/IAIK/cache_template_attacks) repository. This forms the base for the Flush+Flush attack.

* Next, I fed the profiled memory addresses to the [Flush+Flush tool](https://github.com/IAIK/flush_flush) provided by IAIK’s repository. This provides a “cache hit” prompt whenever it detects that the particular cache line is filled, suggesting the particular character associated with this line (we know the specific character through profiling, explained above) was likely recently hit, thereby enabling key-logging. I haven’t tallied the accuracy though.

* I then looked up Linux kernel to learn about [CPUfreq core](https://www.kernel.org/doc/html/latest/admin-guide/pm/cpufreq.html) and its features. I found that currently the power scaling driver used in most Intel systems is [“intel_pstate”](https://www.kernel.org/doc/html/latest/admin-guide/pm/intel_pstate.html).
* Using sysfs to manipulate driver thresholds in real-time, I was able to switch from “powersave” adaptive power-management mode to “performance” mode which basically makes the cores run at maximum clock speed.

* Manipulating various parameters such as “min_perf_pct”, “no_turbo”, “scaling_governor” and “scaling_available_governors”, I was able to make the CPU run at various clock speeds, per my liking.

* I was able to manipulate the maximum/ minimum clock speeds, set the current speed to the maximum or minimum and turn on/off hyper-threading and turbo boost.

**Challenges**

* While the Flush+Flush execution looks straightforward, I am yet to verify its accuracy as published. This will involve running the spying tools with a script to print characters and verify the results obtained from spying tool.

* The P State driver is more limiting than older power governors and doesn’t allow setting core voltages by the user. It also requires root-shell to manipulate the various parameters, which is not exactly low privileged.

* I am currently trying to figure out setting frequencies per-core (PCPS) since currently the manipulations affect all 4 physical cores, which will render our proposed improvement strategy rather useless.

* I do have insight regarding the involvement of per-core policies visible through sysfs which might be the key for per-core frequency scaling. Since we’re not trying to make the system unstable VCore manipulation is pushed to the backseat anyways.

##### Anish Saxena
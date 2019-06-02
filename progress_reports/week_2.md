
### CAR3S Group: Progress Report

### Week 2

**Focus for the week**

To verify Flush+Flush attack's accuracy and manipulate per-core frequencies using `intel_pstate` driver.

**Progress**

* I have developed simple scripts to make the processor cores run at different frequencies, with one physical core at high frequency while the other cores run at a low frequency. This is present under [intel_pstate_manipulations](../intel_pstate_manipulations) directory.

* In order to verify the results obtained in [Flush+Flush](https://gruss.cc/files/flushflush.pdf) paper, I analyzed the profiled memory addresses and derived the likely characters which map to one or more addresses.

* The analysis of profiled results don't necessarily provide a "distinct peak" pattern for all addresses, it's more of a trial and error task. I suggest monitoring atleast 2-3 addresses per character.

* I then wrote a simple script to simultaneously run [generic Flush+Reload](../profiling_and_exploitation) spying tool on all likely memory addresses for the letter 'a' to check for its accuracy, before moving on to Flush+Flush attack.

**Challenges**

* The results of Flush+Reload key-logging, as of now, are inconsistent even for a single character, with some noise present in the system and cache hits even for non-desired characters. 

* The potential solutions are reduction in noise, which is unlike a real-world system, or increment in number of monitored memory locations, which puts more overhead on the processor.

* The `intel_pstate` driver cannot take full control of processor frequencies, since at many crucial points of time, the processor hardware can adjust the frequency to its liking.

* As a result, the normal execution of the provided scripts result in all cores running at Max(all specified speeds) which defeats the purpose of per-core frequency scaling.

* Tang _et al._ in their [CLKscrew](https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-tang.pdf) paper used a custom kernel driver to achieve differential processor frequencies, albeit on ARM platform.
 
* One tedious but potentially useful solution is to develop a tweaked version of the current driver or use an older driver which does support this feature.

##### Anish Saxena


#!/bin/bash

sudo -s <<EOF
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy2/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy3/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy5/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy6/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy7/scaling_min_freq

echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy2/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy3/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy5/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq

echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq

echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq

echo "done"

EOF

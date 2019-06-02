#!/bin/bash

sudo -s <<EOF
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy1/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy2/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy3/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy5/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy6/scaling_min_freq
echo -n "800000" > /sys/devices/system/cpu/cpufreq/policy7/scaling_min_freq

echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy1/scaling_max_freq
echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy2/scaling_max_freq
echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy3/scaling_max_freq
echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy5/scaling_max_freq
echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy6/scaling_max_freq
echo -n "1000000" > /sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq

echo -n "3200000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo -n "3200000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq

echo -n "3600000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo -n "3600000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq

while true; do

clear
cat /proc/cpuinfo | grep -E "MHz|processor"
sleep 0.5

done

EOF

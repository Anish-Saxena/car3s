#!/bin/bash
clear
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

echo -n "3400000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo -n "3400000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq

echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo -n "4000000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
echo "differential frequencies enabled"
EOF
isempty=`cat /etc/default/grub | grep "intel_pstate=disable"`
if [ -z "$isempty" ];
then
echo "Disabling intel_pstate now"
sudo -s<<EOF
printf "GRUB_CMDLINE_LINUX_DEFAULT=\"intel_pstate=disable\"\n" >> /etc/default/grub
update-grub
EOF
shutdown -r 10
echo "Rebooting in 10 seconds, please standby"
fi


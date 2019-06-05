#!/bin/bash
clear
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

echo "frequencies reset"
EOF
isempty=`cat /etc/default/grub | grep "intel_pstate=disable"`
if [ -n "$isempty" ];
then
echo "Enabling intel_pstate now"
sudo -s<<EOF
sed -i '/intel_pstate/d' /etc/default/grub
update-grub
EOF
shutdown -r 30
echo "System reboot in 30 seconds, please standby"
fi


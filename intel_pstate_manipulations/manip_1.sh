#!/bin/bash
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


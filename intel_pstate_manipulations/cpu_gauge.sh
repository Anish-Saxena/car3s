#!/bin/bash

while true; do

clear
cat /proc/cpuinfo | grep -E "MHz|processor"
sleep 0.5

done

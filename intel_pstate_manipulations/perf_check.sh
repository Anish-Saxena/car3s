#!/bin/bash

if_exists=$(ls | grep bench)
if [ -z "$if_exists" ];
then
echo "compiling per_check.c now"
gcc -o bench perf_check.c;
fi
echo "executing tests"
high_power=`{ time taskset 0x1 ./bench; } |& grep user | tr -d 'user'`
low_power=`{ time taskset 0x2 ./bench; } |& grep user | tr -d 'user'`
echo "High powered CPU took: " $high_power
echo "Low powered CPU took:  " $low_power

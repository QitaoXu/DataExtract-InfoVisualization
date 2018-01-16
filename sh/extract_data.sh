#!/bin/bash

cat /home/warehouse/qitao.xu/cse560m/configs/stats/sim_seconds.txt | while read line
do
    echo "${line:12:8}" >> /home/warehouse/qitao.xu/cse560m/configs/stats/pure_sim_seconds.txt
done

cat /home/warehouse/qitao.xu/cse560m/configs/stats/floating_rename.txt | while read line
do
    echo "${line:36:4}" >> /home/warehouse/qitao.xu/cse560m/configs/stats/pure_floating_rename.txt
done
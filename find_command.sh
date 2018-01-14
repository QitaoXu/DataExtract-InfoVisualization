#!/bin/bash

num_phys_float_regs=64

num_rob_entries=4

num_iq_entries=4

#sim_command=`$GEM5/build/X86/gem5.opt --outdir=/home/warehouse/qitao.xu/cse560m/configs/results/teste, -d /home/warehouse/qitao.xu/cse560m/configs/results/teste hw3config.py -c daxpy/daxpy --cpu-type="DerivO3CPU" --caches --l2cache --num-phys-float-regs=64 --num-rob-entries=4 --num-iq-entries=4`
#sim_command=`$GEM5/build/X86/gem5.opt --outdir=/home/warehouse/qitao.xu/cse560m/configs/results/teste, -d /home/warehouse/qitao.xu/cse560m/configs/results/teste hw3config.py -c daxpy/daxpy --cpu-type="DerivO3CPU" --caches --l2cache --num-phys-float-regs=${num_phys_float_regs} --num-rob-entries=${num_rob_entries} --num-iq-entries=${num_iq_entries}`
#echo "\n"
#echo $sim_command
#echo "\n"
while [ $num_phys_float_regs -ne 4096 ]
do
    while [ $num_iq_entries -ne 512 ]
    do
        while [ $num_rob_entries -ne 512 ]
        do
        #printf 'num_phys_float_regs: %d, num_iq_entries: %d, num_rob_entries: %d \n' $num_phys_float_regs $num_iq_entries $num_rob_entries
        #file_dir="/home/warehouse/qitao.xu/cse560m/configs/results/result_${num_phys_float_regs}_${num_iq_entries}_${num_rob_entries}"
        find_command=`grep 'sim_seconds' /home/warehouse/qitao.xu/cse560m/configs/results/result_${num_phys_float_regs}_${num_iq_entries}_${num_rob_entries}/stats.txt`
        echo $find_command >> /home/warehouse/qitao.xu/cse560m/configs/stats/sim_seconds.txt
        num_rob_entries=`expr $num_rob_entries \* 2`
        #printf 'num_phys_float_regs: %d, num_iq_entries: %d, num_rob_entries: %d \n' $num_phys_float_regs $num_iq_entries $num_rob_entries
        done
        num_iq_entries=`expr $num_iq_entries \* 2`
        num_rob_entries=4
    done
    num_phys_float_regs=`expr $num_phys_float_regs \* 2`
    num_iq_entries=4
done
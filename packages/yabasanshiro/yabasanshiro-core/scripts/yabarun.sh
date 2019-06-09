#! /bin/sh

#204000 306000 408000 510000 612000 714000 816000 918000 1020000 1122000 1224000 1326000 1428000 1581000 1683000 1785000 1887000 1989000 2091000

echo 1 | tee /sys/kernel/tegra_cpufreq/overclock
echo 1785000 | tee /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq

/usr/bin/yabasanshiro -b /storage/bios.bin

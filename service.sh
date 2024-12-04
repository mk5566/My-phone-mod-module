#!/system/bin/sh

MODDIR=${0%/*}

sleep 1

resetprop -n debug.renderengine.backend skiavkthreaded
su -c "echo y >/sys/kernel/mm/lru_gen/enabled"

# Disable ZRAM at boot by stopping and unmounting
sleep 20

su -c "echo 0 > /sys/block/zram0/disksize"
su -c "swapoff /dev/block/zram0"

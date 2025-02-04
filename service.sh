#!/system/bin/sh
MODDIR=${0%/*}
sleep 1
su -c "resetprop -n debug.renderengine.backend skiavkthreaded"
su -c "logcat -c"
su -c "stop logd"
su -c "setprop init.svc.logd stopped"
su -c "setprop persist.logd.enable 0"
su -c "setprop persist.logd.size -1"
# Set ZRAM

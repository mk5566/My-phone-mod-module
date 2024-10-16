#!/system/bin/sh

MODDIR=${0%/*}

sleep 1

resetprop -n debug.renderengine.backend skiavkthreaded

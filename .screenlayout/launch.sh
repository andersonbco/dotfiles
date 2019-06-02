#!/bin/sh
 
hdmi_off=$(xrandr -q | grep "HDMI-1" | grep "disconnected")
 
if [ -n "$hdmi_off" ]
then
    ./default.sh
else
    ./dual_screen.sh
fi

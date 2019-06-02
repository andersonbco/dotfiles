#!/bin/sh
 
hdmi_off=$(xrandr -q | grep "HDMI-1" | grep "disconnected")
 
if [ -n "$hdmi_off" ]
then
    ~/.screenlayout/default.sh
else
    ~/.screenlayout/dual_screen.sh
fi

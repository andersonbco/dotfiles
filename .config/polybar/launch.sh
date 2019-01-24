#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

hdmi_off=$(xrandr -q | grep "HDMI-1" | grep "disconnected" -q)

if [ "$hdmi_off" ]
then
	polybar main_bar &
else
  polybar main_bar &
	polybar aux_bar &
fi


echo "Bars launched..."

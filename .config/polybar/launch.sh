#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

hdmi_off=$(xrandr -q | grep "HDMI-1" | grep "disconnected" -q)

if [ "$hdmi_off" ]
then
	MONITOR=eDP-1 polybar single_bar &
else
  MONITOR=HDMI-1 polybar main_bar &
	MONITOR=eDP-1 polybar aux_bar &
fi


echo "Bars launched..."

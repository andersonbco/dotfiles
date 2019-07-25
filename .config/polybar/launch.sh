#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

hdmi_connected=$(xrandr -q | grep -i "HDMI" | grep -i " connected")

if [ -n "$hdmi_connected" ]
then
  get_monitors
  MONITOR=${MONITOR_LIST[0]} polybar aux_bar &
  MONITOR=${MONITOR_LIST[1]} polybar main_bar &
else
  get_monitors
  MONITOR=${MONITOR_LIST[0]} polybar single_bar &
fi

echo "Bars launched..."

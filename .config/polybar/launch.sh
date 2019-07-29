#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

get_monitors

get_primary_monitor

if [ ${MONITOR_LIST[0]} == $PRIMARY_MONITOR ]
then
  MONITOR=${MONITOR_LIST[0]} polybar single_bar &
else
  MONITOR=${MONITOR_LIST[0]} polybar aux_bar &
  MONITOR=${MONITOR_LIST[1]} polybar main_bar &
fi

echo "Bars launched..."

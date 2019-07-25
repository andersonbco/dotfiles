#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

count_monitors

if [[ $NUMBER_OF_MONITORS -eq 1 ]]
then
  get_default_monitor
	MONITOR=$DEFAULT_MONITOR polybar single_bar &
else
  get_multiple_monitors
  MONITOR=${MONITOR_LIST[0]} polybar aux_bar &
	MONITOR=${MONITOR_LIST[1]} polybar main_bar &
fi

clear_xrandr_variables

echo "Bars launched..."

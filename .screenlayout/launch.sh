#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

count_monitors

if [[ $NUMBER_OF_MONITORS -eq 1 ]]
then
  get_default_monitor
  ~/.screenlayout/default.sh $DEFAULT_MONITOR
else
  get_multiple_monitors
  ~/.screenlayout/dual_screen.sh ${MONITOR_LIST[0]} ${MONITOR_LIST[1]}
fi

clean_xrandr_variables

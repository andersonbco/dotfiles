#!/usr/bin/env bash
 
. $HOME/dotfiles/xrandr_utils

count_monitors 

if [[ $NUMBER_OF_MONITORS -eq 1 ]]
then
  get_default_monitor
  echo "default"
  ~/.screenlayout/default.sh $DEFAULT_MONITOR
else
  get_multiple_monitors
  echo "dual"
  ~/.screenlayout/dual_screen.sh ${MONITOR_LIST[0]} ${MONITOR_LIST[1]}
fi

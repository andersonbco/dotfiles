#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

get_monitors

get_sys_vendor_name

if [[ $SYS_VENDOR == *"Apple"* ]]
then
  MODE="1920x1200"
else
  MODE="1920x1080"
fi

xrandr --output ${MONITOR_LIST[0]} --primary --mode $MODE --pos 0x0 --rotate normal --output ${MONITOR_LIST[1]} --off

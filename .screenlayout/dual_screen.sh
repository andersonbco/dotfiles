#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

get_monitors

xrandr --output ${MONITOR_LIST[0]} --mode 1920x1080 --pos 0x0 --rotate normal --output ${MONITOR_LIST[1]} --primary --mode 1920x1080 --pos 1920x0 --rotate normal

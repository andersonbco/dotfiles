#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

count_monitors

if [[ $NUMBER_OF_MONITORS -eq 1 ]]
then
  ~/.screenlayout/default.sh
else
  ~/.screenlayout/dual_screen.sh
fi

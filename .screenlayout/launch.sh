#!/usr/bin/env bash

. $HOME/dotfiles/xrandr_utils

count_monitors

if [[ $NUMBER_OF_MONITORS -eq 1 ]]
then
	echo "default"
  ~/.screenlayout/default.sh
else
	echo "dual screen"
  ~/.screenlayout/dual_screen.sh
fi

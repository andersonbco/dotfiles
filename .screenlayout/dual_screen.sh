#!/bin/sh

xrandr --output $1 --mode 1920x1080 --pos 0x0 --rotate normal --output $2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal

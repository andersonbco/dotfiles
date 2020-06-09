#!/usr/bin/env bash

killall -q ranger

while pgrep -u $UID -x ranger > /dev/null; do sleep 1; done

ranger

#!/usr/bin/env bash

cd $HOME

# remove the nohup.out file from a previous session
if [ -e nohup.out ]; then
  rm nohup.out
fi

# kill all running instances of bum
killall -q bum

# wait until the processes have been shut down
while pgrep -u $UID -x bum >/dev/null; do sleep 1; done

# kill all running instances of mopidy
killall -q mopidy

# wait until the processes have been shut down
while pgrep -u $UID -x mopidy >/dev/null; do sleep 1; done

# start mopidy and fork to the background
nohup mopidy &

# wait until mopidy starts to avoid errors in the bum startup
sleep 5

# start bum and fork to the background
nohup bum &

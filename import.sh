#!/bin/bash

find . -type d | sed "s|^.\{1\}|${HOME}|g" | xargs mkdir -p

find . -type f -print0 |
  while IFS= read -r -d '' line; do
    origin=$(echo ${line} | sed "s|^.\{1\}|$(pwd)|g")
    destination=$(echo ${line} | sed "s|^.\{1\}|${HOME}|g")
    ln -sf ${origin} ${destination}
  done

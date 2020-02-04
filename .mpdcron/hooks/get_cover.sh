#!/usr/bin/env bash

temp_dir=$HOME/.cache/covers

mkdir -p $temp_dir

artist=$(mpc status -f %artist% | awk 'NR==1')
album=$(mpc status -f %album% | awk 'NR==1')
title=$(mpc status -f %title% | awk 'NR==1')

file_name=${temp_dir}/${artist}_${album}_400.jpg

echo $file_name

if [[ -e ${file_name} ]]; then
  cp "${file_name}" "${temp_dir}/current.jpg"
else
  sacad "${artist}" "${album}" "400" "${file_name}"
	cp "${file_name}" "${temp_dir}/current.jpg"
fi

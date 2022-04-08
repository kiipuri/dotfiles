#!/bin/sh

down="$(ifstat enp5s0 | grep 'enp5s0' | awk '{print $7}')"
up="$(ifstat enp5s0 | grep 'enp5s0' | awk '{print $9}')"
netuse="$down down $up up"
echo "$netuse"

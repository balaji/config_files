#!/bin/sh

OUTPUT=`xrandr |grep -w 'connected' | grep -v 'eDP1' | awk '/connected/{print $1}'`

#xrandr --output ${OUTPUT} --scale 1.5x1.5
xrandr --output ${OUTPUT} --auto --above eDP1

#xrandr --output ${OUTPUT} --rotate left


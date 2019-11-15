#!/bin/sh

OUTPUT=`xrandr |grep -w 'connected' | grep -v 'eDP1' | awk '/connected/{print $1}'`
xrandr --output $OUTPUT --off

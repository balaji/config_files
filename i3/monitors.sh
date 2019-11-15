#!/bin/sh

if [ -z "$1" ]
  then
      echo "No argument supplied. 'usage: monitors on (or) off'"
      exit 0
fi

external_monitor () {
    OUTPUT=`xrandr |grep -w 'connected' | grep -v 'eDP1' | awk '/connected/{print $1}'`

    if [ -z $OUTPUT ]
    then
        echo "No external monitor found"
        exit 0
    fi
}

if [ $1 = 'on' ]
then
    external_monitor
    #xrandr --output ${OUTPUT} --scale 1.5x1.5
    xrandr --output ${OUTPUT} --auto --above eDP1
    #xrandr --output ${OUTPUT} --rotate left
    exit 0
elif [ $1 = 'off' ]
then
     external_monitor
     xrandr --output $OUTPUT --off
else
    echo "usage: monitors on (or) off"
fi


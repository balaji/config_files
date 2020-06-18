#!/bin/sh

if [ -z "$1" ]
  then
      echo "No argument supplied. 'usage: monitors on (or) off'"
      exit 0
fi

external_monitor () {
    OUTPUT=`xrandr | grep -w 'connected' | grep -v 'eDP1' | awk '/connected/{print $1}'`

    if [ -z $OUTPUT ]
    then
        echo "No external monitor found"
        exit 0
    fi
}

if [ $1 = 'extend' ]
then
    external_monitor
    xrandr --output ${OUTPUT} --auto --above eDP1
    xrandr --output eDP1 --auto --below $OUTPUT    
    exit 0
elif [ $1 = 'bottom' ]
then
    external_monitor
    xrandr --output $OUTPUT --off
    xrandr --output eDP1 --auto --below $OUTPUT
elif [ $1 = 'top' ]
then
    external_monitor
    xrandr --output $OUTPUT --auto --above eDP1
    xrandr --output eDP1 --off
else
    echo "usage: monitors on (or) off"
fi

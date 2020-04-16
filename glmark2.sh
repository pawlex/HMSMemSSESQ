#!/usr/bin/env bash

i="0"

startx &
export DISPLAY=:0
sleep 5
xset s off -dpms

while [ $i -lt 1 ]
do
        glmark2 --fullscreen
done


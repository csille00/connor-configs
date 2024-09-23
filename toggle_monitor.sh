#!/bin/bash

# Check if the external monitor is connected
monitor_status=$(xrandr --query | grep 'DP-1-2 connected')

if [[ $monitor_status ]]; then
    # If DP-1-2 is connected, toggle between extended and mirror modes

    # Check if the current mode is extended (monitor to the right of eDP-1)
    if xrandr --query | grep -q "DP-1-2 connected 3840x2160+2560+0"; then
        # If extended mode, switch to mirror mode
        xrandr --output eDP-1 --auto --output DP-1-2 --same-as eDP-1
    else
        # If mirror mode or single mode, switch to extended (right-of) with HDMI resolution
        xrandr --output eDP-1 --auto --output DP-1-2 --right-of eDP-1 --auto
    fi
else
    # If DP-1-2 is disconnected, just use the laptop screen
    xrandr --output eDP-1 --auto --output DP-1-2 --off
fi


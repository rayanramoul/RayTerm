#!/usr/bin/env bash

swww init &

swww img ~/Pictures/wallpaper.png &

nm-applet --indicator &

#bash ~/.config/hypr/launch-waybar.sh &
waybar &

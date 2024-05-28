#!/usr/bin/env bash

function run {
  if  ! pgrep -f $1;
  then 
    $@&
  fi
}


run picom --config $HOME/.config/picom.conf 
run feh --no-fehbg --bg-center '/home/ronald/Pictures/wallpapers/Lofi-Urban-Nightscape.png'
# run terminology
# run exec alacritty
run brave

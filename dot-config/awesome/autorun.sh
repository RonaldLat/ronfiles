#!/usr/bin/env bash

# function run {
  # if  ! pgrep -f $1;
  # then 
    # $@&
  # fi
# }


# run picom --config $HOME/.config/picom.conf 
 picom --config ../awesome/picom.conf &
# run feh --no-fehbg --bg-center '~/Dev/ronfiles/wallpapers/Lofi-Urban-Nightscape.png'
feh --no-fehbg --bg-center '../awesome/wallpapers/Lofi-Urban-Nightscape.png'
# run terminology
# run exec alacritty
# run brave

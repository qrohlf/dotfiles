#!/bin/bash
# Party Terminal
#
# credit goes to http://rcr.io/words/dynamic-xterm-colors.html
# OSX port by @qrohlf (http://qrohlf.com)

party() {
  A=0;
  F="0.1"

  while true; do
    [ $A == 628318 ] && A=0 || A=$((A + 1))
    R=$(echo "s ($F*$A + 0)*32767 + 32768" | bc -l | cut -d'.' -f1)
    B=$(echo "s ($F*$A + 2)*32767 + 32768" | bc -l | cut -d'.' -f1)
    G=$(echo "s ($F*$A + 4)*32767 + 32768" | bc -l | cut -d'.' -f1)

    osascript -e " \
    tell application \"Terminal\"
    set normal text color of window 1 to {$R, $G, $B}
    set cursor color of window 1 to {$R, $G, $B}
    end tell"

    sleep 0.01
  done &
}

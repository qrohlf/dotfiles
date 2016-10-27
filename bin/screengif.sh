#!/bin/sh

palette="/tmp/palette.png"

scale=${3:-"650"}

filters="fps=15,scale=$scale:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
du -sh $2

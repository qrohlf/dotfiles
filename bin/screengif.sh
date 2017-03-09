#!/bin/sh

palette="/tmp/palette.png"

scale=${3:-"650"}

filters="fps=15,scale=$scale:-1:flags=lanczos"
# use filters="fps=15" for no rescale

ffmpeg -v warning -i $1 -vf "palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
echo "unoptimized file size:"
du -sh $2
echo "optimizing:"
gifsicle -O3 $2 > $2.opti
du -sh $2.opti

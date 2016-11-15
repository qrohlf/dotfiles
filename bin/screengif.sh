#!/bin/sh

palette="/tmp/palette.png"

scale=${3:-"650"}

filters="fps=15,scale=$scale:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
echo "unoptimized file size:"
du -sh $2
echo "optimizing:"
FILENAME=${FILE##*/}
FILEPATH=${FILE%/*}
NOEXT=${FILENAME%\.*}
gifisicle -O3 $2 "$FILEPATH/$FILENAME-opti.gif"

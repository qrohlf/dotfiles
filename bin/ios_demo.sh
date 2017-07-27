# iphone 6 videos
# SCALE=240:-1
# android nexus videos
# SCALE=242:-1

SCALE=240:-1
ffmpeg -i $1 -vf scale=$SCALE -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis $2.webm
ffmpeg -i $1 -vf scale=$SCALE -vcodec h264 -acodec aac -strict -2 $2.mp4

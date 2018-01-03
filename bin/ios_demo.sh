# some helpful filters (-vf $FOOBAR)
# iphone 6 videos
# SCALE=240:-1
# android nexus videos
# SCALE=242:-1
# crop dumb keynote black bars for garmin
# crop=200:265:1180:588

# install: brew install ffmpeg --with-libvpx

# SCALE=450:-1
ffmpeg -i $1 -an -vf scale=450:-1 -c:v libvpx -crf 10 -b:v 1M $2.webm
ffmpeg -i $1 -an -vf scale=450:-1 -vcodec h264 -strict -2 $2.mp4

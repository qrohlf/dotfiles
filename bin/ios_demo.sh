# some helpful filters (-vf $FOOBAR)
# iphone 8 videos
# SCALE=242:-1
# android nexus videos
# SCALE=242:-1
# crop dumb keynote black bars for garmin
# crop=200:265:1180:588

# install: brew install ffmpeg --with-libvpx

# SCALE=450:-1
ffmpeg -i $1 -an -vf scale=242:-1 -c:v libvpx -crf 10 -b:v 1M $1.webm
ffmpeg -i $1 -an -vf scale=242:-1 -vcodec h264 -strict -2 $1.mp4

atomize () {
  egrep -o '.*:\d+' | sed -n "${1:-1}p" | xargs atom
}

sublimate () {
  egrep -o '.*:\d+' | sed -n "${1:-1}p" | xargs subl
}

#!/bin/bash

setvol() {
  if [ "$1" ]; then
    osascript -e "set volume output volume $1"
  fi
  echo "volume: `osascript -e 'output volume of (get volume settings)'`"
  echo "muted: `osascript -e 'output muted of (get volume settings)'`"
}
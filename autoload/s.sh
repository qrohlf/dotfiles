#!/bin/bash
# autojump mashed up with sublime text

s() {
  j $1 && subl .
}

so() {
  BACK=`pwd`
  s $1
  cd "$BACK"
}
#!/bin/bash
# autojump mashed up with sublime text

sj() {
  j $1 && subl .
}

so() {
  BACK=`pwd`
  sj $1
  cd "$BACK"
}
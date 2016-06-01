#!/bin/bash
# autojump mashed up with sublime text & atom

alias s="subl"
alias a="atom"

sj() {
  j $1 && subl .
}

so() {
  sj $1
  cd - &> /dev/null
}

aj() {
  j $1 && atom .
}

ao() {
  aj $1
  cd - &> /dev/null
}

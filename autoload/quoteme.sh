#!/bin/sh

quoteme() {
  grep -v '^#' ~/.dotfiles/resources/quotes.txt | gsort -R | head -n 1
}

quoteme_pretty() {
  local QUOTE="`quoteme`"
  echo $QUOTE | sed -e 's/\(.*\)-/\1\
  -/' | fold -w 40 -s
}
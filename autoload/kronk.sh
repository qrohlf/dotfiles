#!/bin/bash

kronk() {
  DEFAULT_LOC=~/Downloads
  rsync -azvP --inplace "qrohlf@kronk.wtf:'/home/qrohlf/downloads/complete/$1'" ${2:-"$DEFAULT_LOC"}
}

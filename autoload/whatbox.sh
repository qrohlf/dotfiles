#!/bin/bash

whatbox() {
  DEFAULT_LOC=~/Downloads
  rsync -azvP --inplace "qrohlf@stew.whatbox.ca:'/home/qrohlf/files/$1'" ${2:-"$DEFAULT_LOC"}
}

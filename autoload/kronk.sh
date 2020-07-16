#!/bin/bash

kronk() {
  DEFAULT_LOC=~/Downloads
  rsync -azvP --inplace "coboid@viking.whatbox.ca:'/home/coboid/files/$1'" ${2:-"$DEFAULT_LOC"}
}

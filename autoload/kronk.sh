#!/bin/bash

kronk() {
  DEFAULT_LOC=~/Downloads
  rsync -azvP --inplace "coboid@atlantis.whatbox.ca:'/home/coboid/files/$1'" ${2:-"$DEFAULT_LOC"}
}

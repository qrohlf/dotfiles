#!/bin/bash

# load functions
for i in ~/.dotfiles/autoload/* ; do
    if [ -r "$i" ]; then
        . $i
    fi
done

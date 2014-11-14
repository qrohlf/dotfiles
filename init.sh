#!/bin/bash

# load functions
for i in ~/.dotfiles/autoload/*.sh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done
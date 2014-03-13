#!/bin/bash

# load functions
for i in .dotfiles/functions/*.sh ; do
    if [ -r "$i" ]; then
        . $i
    fi
done
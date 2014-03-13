#!/bin/bash

# load the dotfiles

for i in .dotfiles/functions/*.sh ; do
    echo $i
    if [ -r "$i" ]; then
        . $i
    fi
done
#!/bin/bash

# symlink config items to get up and running with dotfiles

mkdir -p ~/.config

for f in config/*
do
  echo "Symlinking ./$f to ~/.$f"
  ln -s "/Users/qrohlf/.dotfiles/$f" ~/.config
done


echo "Symlinking .zshrc"
ln -s "/Users/qrohlf/.dotfiles/zsh/.zshrc" ~/.zshrc

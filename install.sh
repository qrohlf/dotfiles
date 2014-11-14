#!/bin/sh
# idempotent (won't break stuff if run multiple times)

ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.gemrc ~/.gemrc
ln -s ~/.dotfiles/.irbrc ~/.irbrc
ln -s ~/.dotfiles/.sqliterc ~/.sqliterc
ln -s ~/.dotfiles/sublime ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# xcoooode
xcode-select --install
# [@qrohlf](https://github.com/qrohlf) does [dotfiles](http://dotfiles.github.io)

## Installation:

Important: you'll want to be making temporary edits to your .zprofile while
you set up homebrew/nvm/pyenv/etc. Wait to run the symlink-configs script until
all of the dependencies are in place for the zsh/.zshrc big config file, or
you'll end up with a broken shell!

```bash
# clone the repo
git clone git@github.com:qrohlf/dotfiles.git ~/.dotfiles
cd .dotfiles

# Setup nvm
open "https://github.com/nvm-sh/nvm#readme"
nvm install --lts # if you're on an M1, this will probably compile node from source
npm install --global yarn

# follow instructions here to install homebrew:
open "https://brew.sh"
# set up homebrewed dependencies
brew install python coreutils direnv autojump gh
# TODO - investigate swapping to fasd over autojump: https://dimmaski.com/looking-for-max-terminal-prod/

# install powerline
pip3 install powerline-status powerline_gitstatus

# symlink the configs
./scripts/symlink-configs.sh
# restart iterm. You might get errors about missing powerline but things *should* boot
```

## Sublime Text

Adapt the instructions found at https://packagecontrol.io/docs/syncing#dropbox-osx, using the dotfiles Sublime Text folder instead of Dropbox.

## Pyenv notes

_this is all a work-in-progress_

Installing pyenv is dangerous since it doesn't always play nice with brewed python. Don't do it until you need it.

Here's what I've investigated so far:

```sh
# grab the latest stable python
export PYTHON_VERSION=$(pyenv install --list | grep --extended-regexp '^\s+[0-9.]+$' | tail -1 | sed 's/ //g')
pyenv install $PYTHON_VERSION
pyenv global system
```

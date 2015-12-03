# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify correct menu_complete
unsetopt beep
bindkey -e
#bindkey -M menuselect '^M' .accept-line # only hit enter once for menu select. Problematic for things involving multiple paths

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/qrohlf/.zshrc'
zstyle ':completion:*' menu select=4 # use a cli menu for autocomplete >8

autoload -Uz compinit
compinit
# End of lines added by compinstall'

# up arrow search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Autojump, yo
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# python stuff
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# boot up powerline-daemon and powerline
# (installation: sudo -H pip install powerline-status powerline-gitstatus)
powerline-daemon -q
. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Load rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi;

# Load The Fuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Load dotfiles
. ~/.dotfiles/init.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

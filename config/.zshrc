# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify share_history correct menu_complete
unsetopt beep
bindkey -e
#bindkey -M menuselect '^M' .accept-line # only hit enter once for menu select. Problematic for things involving multiple paths

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/qrohlf/.zshrc'
zstyle ':completion:*' menu select=10 # use a cli menu for autocomplete >8

autoload -Uz compinit
compinit
# End of lines added by compinstall'

# Autojump, yo
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# boot up powerline-daemon and powerline
powerline-daemon -q
. $(brew --prefix)/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Load rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi;

# Load The Fuck
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

# Load dotfiles
. ~/.dotfiles/init.sh

# for the wonderfulness
blue_on_default "\n`quoteme_pretty`\n\n"

# python stuff
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

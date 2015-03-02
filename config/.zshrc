# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/qrohlf/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autojump, yo
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# boot up powerline-daemon and powerline
powerline-daemon -q
. $(brew --prefix)/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Load rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi;

# Load dotfiles
. ~/.dotfiles/init.sh

# for the wonderfulness
blue_on_default "\n`quoteme_pretty`\n\n"
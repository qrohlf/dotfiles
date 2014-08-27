# Load rbenv
if which rbenv > /dev/null;
    then eval "$(rbenv init -)";
fi;

# Load sexy-bash-prompt
. ~/.bash_prompt

# Load autojump
[[ -s `brew --prefix`/etc/autojump.bash ]] && . `brew --prefix`/etc/autojump.bash

# Load dotfiles
. ~/.dotfiles/init.sh

# ENV variables
export EDITOR="atom"

# Homebrew Bash Completion
# This doubles the time it takes to login to a shell
# (does not include git bash completion)
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi

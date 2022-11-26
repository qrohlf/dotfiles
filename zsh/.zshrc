# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify menu_complete
unsetopt beep
bindkey -e
#bindkey -M menuselect '^M' .accept-line # only hit enter once for menu select. Problematic for things involving multiple paths

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/qrohlf/.zshrc'
zstyle ':completion:*' menu select=4 # use a cli menu for autocomplete >8

fpath=( "$HOME/.zfunctions" $fpath )
autoload -Uz compinit
compinit

# boot powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# prefix-scoped up arrow search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# add sublime to PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# add ~/.dotfiles/bin to PATH
export PATH="$HOME/.dotfiles/bin:$PATH"

# configure local-only env variables
source ~/.dotfiles/zsh/.env.local

# configure custom aliases
source ~/.dotfiles/zsh/aliases.sh

# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# set up NVM
. ~/.dotfiles/zsh/nvm-setup.sh

# set up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# boot up powerline
# UPDATE 2022-02-28: actually, don't it's garbage
# . /Users/qrohlf/Library/Python/3.8/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# boot up autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# I don't like precommit hooks, disable husky (can be re-enabled with a .direnv)
export HUSKY=0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# boot up homebrew zsh completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -Uz compinit
compinit # this is erroring?
# End of lines added by compinstall'

# up arrow search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# boot up pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# boot up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# NVM zsh integration
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# boot up powerline
# TODO - this is definitely slowing down shell boot. Maybe setup powerline-daemon to boot on startup?
. ~/.pyenv/versions/3.9.0/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# boot up direnv
eval "$(direnv hook zsh)"

# boot up autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ALIASES
up() {
  cd ../ && $@;
}
alias g='git'
alias s='subl'
sj() {
  j $1 && subl .
}

so() {
  sj $1
  cd - &> /dev/null
}
alias gh='git github'
alias rezsh="reset && source ~/.zshrc"
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"
alias chat="open ~/.dotfiles/resources/chat.html"
alias kelvin="open ~/.dotfiles/resources/kelvin.html"
alias c="bones component"
source ~/.dotfiles/autoload/jump_to_git_root.sh
alias gr=jump_to_git_root
new_project() {
  mkdir "$1"
  cd "$1"
  touch .gitignore
  git init
  git add .gitignore
  git commit -m "initial commit"
}

# I don't like precommit hooks, disable husky (can be re-enabled with a .direnv)
export HUSKY=0

# load Kronk util
. ~/.dotfiles/autoload/kronk.sh

# disabled for now:
# chaos_burst() {
#   NUM=$(( $RANDOM % 10000 ))
#   TURNS=$(( $RANDOM % 20 ))
#   EFFECT=`sed "${NUM}q;d" ~/.dotfiles/resources/chaos_bursts.txt`
#   light_black_on_default "\nThe incantation fails. The following effect is applied for $TURNS turns:\n"
#   light_black_on_default $NUM": "
#   cyan_on_default $EFFECT"\n\n"
# }

# # todo package this up into an easy-install curl script
# trap '[ "$?" -eq 127 ] && chaos_burst' ERR

# add ~/.dotfiles/bin to PATH
export PATH="$HOME/.dotfiles/bin:$PATH"

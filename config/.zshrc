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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# boot up powerline
# TODO - this is definitely slowing down shell boot. Maybe setup powerline-daemon to boot on startup?
. ~/.pyenv/versions/3.9.0/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# boot up direnv
eval "$(direnv hook zsh)"

# boot up FASD
eval "$(fasd --init auto)"

# ALIASES
alias j='fasd_cd -d'
alias g='git'
alias s='subl'
so() {
  subl `fasd -d $1`
}
alias rezsh="reset && source ~/.zshrc"
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"
alias chat="open ~/.dotfiles/resources/chat.html"
alias kelvin="open ~/.dotfiles/resources/kelvin.html"

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

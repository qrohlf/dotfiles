# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set up rbenv
eval "$(rbenv init - --no-rehash zsh)"

# add ~/bin to PATH
export PATH="$HOME/bin:$PATH"

# aliases
alias g='git'
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"

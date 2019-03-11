# Handy aliases
# alias disapprove=~/.disapprove.sh # uselessness (github.com/qrohlf/look-of-disapproval)
alias g="git"
alias gh="hub browse" # open github for the current repo
alias wub="booyah -xb" # wub == web
alias ls="ls -G" # colored ls output
alias duh="du -sh" # quick file/directory size
alias gitroot='cd $(git rev-parse --show-cdup)' # quickly cd to the repo root
alias gr="gitroot"
alias mm="middleman"
alias flushdns="sudo discoveryutil udnsflushcaches"
alias be="bundle exec"
alias xkcdpass="~/.dotfiles/scripts/xkcdpass.rb"
alias rezsh="reset && source ~/.zshrc"
# clear AND erase scrollback in tmux, Terminal.app, and iTerm2
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"
alias chat="open ~/.dotfiles/resources/chat.html"
alias 🚀="git push"
alias 👊="git push -f"
alias 🛁="git pull --rebase upstream master"
alias oops="fuck"
export EDITOR=subl
alias nodesucks="nvm use && rm -rf node_modules && npm i"
alias disapprove="echo -n ಠ_ಠ | pbcopy && echo 'ಠ_ಠ copied to clipboard'"
alias sl="sublimate"
alias c="bones component"
alias pbc="pbcopy"

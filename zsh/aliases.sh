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
alias rezsh="reset && source ~/.zshrc"
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"
alias chat="open ~/.dotfiles/resources/chat.html"
alias kelvin="open ~/.dotfiles/resources/kelvin.html"
alias c="bones component"
source ~/.dotfiles/misc/jump_to_git_root.sh
alias gr=jump_to_git_root
new_project() {
  mkdir "$1"
  cd "$1"
  touch .gitignore
  git init
  git add .gitignore
  git commit -m "initial commit"
}

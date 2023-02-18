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
alias v="code"
vo() {
  code $(autojump $1)
}
alias rezsh="reset && source ~/.zshrc"
alias cls="clear && printf '\e[3J' && printf '\e]50;ClearScrollback\a'"
alias chat="open ~/.dotfiles/resources/chat.html"
alias kelvin="open ~/.dotfiles/resources/kelvin.html"
alias bones="yarn run -T bones"
alias c="bones component"
source ~/.dotfiles/misc/jump_to_git_root.sh
alias gr=jump_to_git_root
alias freyr='docker run -it --rm -v $PWD:/data freyrcli/freyrjs'
new_project() {
  mkdir "$1"
  cd "$1"
  touch .gitignore
  git init
  git add .gitignore
  git commit -m "initial commit"
}

localip () {
  ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}

alias wifip="ipconfig getifaddr en0"
alias butler-status='gh pr status --json statusCheckRollup -q ".currentBranch.statusCheckRollup[0].state"'
alias bs="butler-status"
alias embeds="cd ~/Code/strava/web-embeds && yarn dev"

export CANARY_NAME="better-canary-bookmarklet"
export CANARY_TRACKING_BRANCH="qr/better-canary-bookmarklet"

ssh-canary () {
  /Users/qrohlf/Code/strava/configuration/mesos/tools/paasage tasks --app-id "active/canary/$CANARY_NAME" shell
}

logs-canary () {
  /Users/qrohlf/Code/strava/configuration/mesos/tools/paasage tasks --app-id "active/canary/$CANARY_NAME" logs -- --follow --timestamps
}

verbose-ssh-canary () {
  /Users/qrohlf/Code/strava/configuration/mesos/tools/paasage --verbose tasks --app-id "active/canary/$CANARY_NAME" shell
}

block-on-butler-build () {
  butler_status=$(gh pr status --json statusCheckRollup -q ".currentBranch.statusCheckRollup[0].state")
  echo $butler_status
  while [[ $butler_status != "FAILURE" && $butler_status != "SUCCESS" ]]; do
    sleep 30
    butler_status=$(gh pr status --json statusCheckRollup -q ".currentBranch.statusCheckRollup[0].state")
    echo $butler_status
  done
}

sync-canary () {
  osascript -e "display notification \"listening\" with title \"🔄 Canary Write Sync\""
  fswatch \
    -e 'app/javascript' \
    -e '.git' \
    -e 'tmp' \
    -e '.log' \
    -e '.idea' \
    -r /Users/qrohlf/Code/strava/active | xargs -n 1 -I {} zsh -c 'write-to-canary {}'
}

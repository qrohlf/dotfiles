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

localip () {
  ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}

alias wifip="ipconfig getifaddr en0"
alias butler-status='gh pr status --json statusCheckRollup -q ".currentBranch.statusCheckRollup[0].state"'
alias bs="butler-status"
alias embeds="cd ~/Code/strava/web-embeds && yarn dev"

export CANARY_NAME="qrohlf"
export CANARY_TRACKING_BRANCH="qr/feed-suggestion-analytics"

update-canary () {
  aws-login
  /Users/qrohlf/Code/strava/configuration/mesos/tools/paasage app /Users/qrohlf/Code/strava/configuration/mesos/services/active/conf/canary/canary.conf deploy --no-diff name="$CANARY_NAME" branch="$CANARY_TRACKING_BRANCH"
  osascript -e 'display notification "✅ Canary deploy complete"'
}

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
  while [ $(gh pr status --json statusCheckRollup -q ".currentBranch.statusCheckRollup[0].state") = "PENDING" ]; do
    echo "PENDING"
    sleep 30
  done
}

sync-canary () {
  osascript -e "display notification \"listening\" with title \"🔄 Canary Write Sync\""
  fswatch -e 'app/javascript' -e '.git' -r /Users/qrohlf/Code/strava/active | xargs -n 1 -I {} zsh -c 'write-to-canary {}'
}

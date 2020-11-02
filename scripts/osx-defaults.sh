#!/bin/sh

# Save screenshots to Downloads folder
defaults write com.apple.screencapture location ~/Downloads
# Disable the window shadow on cmd+shift+4 space
defaults write com.apple.screencapture disable-shadow -bool true
# Enable text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Kill finder with cmd+q
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "Close All" -string "@q"
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0
# enable the locate command in terminal
# sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
# speed up dock animations
# defaults write com.apple.dock autohide-time-modifier -float 1.0
# defaults write com.apple.dock autohide-delay -float 0.2

# Apply changes
killall SystemUIServer Finder Dock

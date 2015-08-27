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
# Apply changes
killall SystemUIServer Finder

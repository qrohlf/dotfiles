#! /bin/bash

patch_atom_icon() {
  RES="${BASH_SOURCE%/*}/../resources"
  cp -f "$RES/atom-yosemite.icns" /Applications/Atom.app/Contents/Resources/atom.icns
  sudo find /private/var/folders -name com.apple.dock.iconcache -exec rm {} \; # probably not needed
  #sudo find /private/var/folders -name com.apple.iconservices -exec rm -rf {} \; # probably not needed
  #sudo mv /Library/Caches/com.apple.iconservices.store com.apple.iconservices.backup # Almost definitely not needed
  echo "Now reboot."
}

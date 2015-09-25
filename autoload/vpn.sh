#!/bin/bash
alias vpnconnect="pbcopy < /Volumes/Secure/passwords/newrelic/chicago_vpn && scutil --nc start 'Chicago VPN'"
function vpndisconnect {
/usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "Chicago VPN"
                if exists VPN then disconnect VPN
        end tell
end tell
return
EOF
}

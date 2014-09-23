#!/bin/bash

# Bypass SafeConnect

bypass_safeconnect() {
  # Flush DNS
  sudo killall -HUP mDNSResponder

  # Bypass SafeConnect with user agent spoofing
  for i in 'http://www.google.com' 'http://www.apple.com' 'http://www.qrohlf.com' 'http://www.reddit.com'
  do
    wget -O- --user-agent="Mozilla/5.0 (iPad; CPU OS 8_0 like Mac OS X) AppleWebKit/538.34.9 (KHTML, like Gecko) Mobile/12A4265u" $i
  done

  # Flush DNS again
  sudo killall -HUP mDNSResponder
}

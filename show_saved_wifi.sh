#!/bin/bash
# show_wifi_win_bash.sh

set -euo pipefail

# collect profiles (clean CRLF with tr)
profiles=$(netsh wlan show profiles 2>/dev/null | grep -E "All User Profile" | sed -E 's/.*: *//g' | tr -d '\r')

if [ -z "$profiles" ]; then
  echo "No saved WLAN profiles found or netsh not available."
  exit 0
fi

while IFS= read -r profile; do
  [ -z "$profile" ] && continue

  echo "Profile: $profile"

  # request profile info
  info=$(netsh wlan show profile name="$profile" key=clear 2>/dev/null || true)
  # remove CRLF that can break parsing
  info=$(echo "$info" | tr -d '\r')

  # extract SSID
  ssid=$(echo "$info" | grep -E "SSID name|SSID" | head -n1 | sed -E 's/.*: *"?([^"]+)"?.*/\1/' || true)
  if [ -z "$ssid" ]; then
    ssid="$profile"
  fi

  # Extract Key Content (password). Might not exist for Enterprise or open profiles.
  key=$(echo "$info" | grep -E "Key Content" | sed -E 's/.*: *//g' || true)
  if [ -z "$key" ]; then
    key="<no saved key / Enterprise profile / permission denied>"
  fi

  echo "SSID: $ssid"
  echo "Password: $key"
  echo

done <<< "$profiles"

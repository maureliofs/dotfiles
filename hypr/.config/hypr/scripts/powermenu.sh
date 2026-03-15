#!/bin/bash

# Options list
options="🔒 Lock\nLogout\n🔄 Reboot\n⏻ Shutdown"

# Show menu using wofi
selected=$(echo -e "$options" | wofi --dmenu --prompt "System Menu" --width 300 --height 280 --cache-file /dev/null)

# Logic based on selection
case $selected in
    "🔒 Lock")
        # Runs hyprlock or falls back to swaylock if hyprlock isn't installed
        hyprlock || swaylock
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    "🔄 Reboot")
        systemctl reboot
        ;;
    "⏻ Shutdown")
        systemctl poweroff
        ;;
esac

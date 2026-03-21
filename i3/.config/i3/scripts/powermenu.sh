#!/bin/bash

# Opções do menu
shutdown="󰐥 Shutdown"
reboot="󰜉 Reboot"
lock="󰌾 Lock"
logout="󰍃 Logout"

options="$lock\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -theme-str 'window {width: 15%;}')"

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock-fancy
        ;;
    $logout)
        i3-msg exit
        ;;
esac

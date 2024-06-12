#!/usr/bin/env bash
#
# Script name: dmconf
# Description: Choose from a list of configuration files to edit.
# Dependencies: dmenu
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# Contributors: Derek Taylor

# Defining the text editor to use.
# DMENUEDITOR="vim"
# DMENUEDITOR="leafpad"
# DMEDITOR="alacritty -e nvim"
DMEDITOR="wezterm -e nvim"

export NVIM_APPNAME=lazyvim

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
	"i3 - $HOME/.config/i3/config"
	"i3-icons - $HOME/.config/i3/app-icons.json"
	"aliases - $HOME/.aliases"
	"zsh - $HOME/.zshrc"
	"nvim - $HOME/.config/nvim/init.vim"
	"vim - $HOME/.vimrc"
	"dunst - $HOME/.config/dunst/dunstrc"
	"picom - $HOME/.config/picom/picom.conf"
	"rofi - $HOME/.config/rofi/config.rasi"
	"alacritty - $HOME/.config/alacritty/alacritty.toml"
	"wezterm - $HOME/.config/wezterm/wezterm.lua"
	"quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p ' Editar ')

# What to do when/if we choose 'quit'.
if [[ "$choice" == "quit" ]]; then
	echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$DMEDITOR "$cfg"

# What to do if we just escape without choosing anything.
else
	echo "Program terminated." && exit 1
fi

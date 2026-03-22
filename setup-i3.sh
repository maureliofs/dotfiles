#!/bin/bash

# --- Cores ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_REPO="https://github.com/maureliofs/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_APPS=("i3" "kitty" "nvim" "dunst" "nitrogen" "picom" "polybar" "rofi")

# 1. Instalação de pacotes (Detectando a distro)
echo -e "${BLUE}Instalando dependências e o GNU Stow...${NC}"
if [ -f /etc/arch-release ]; then
    sudo pacman -S --needed --noconfirm \
    i3 picom dunst kitty rofi git nitrogen stow neonvim polybar \
    papirus-icon-theme lxappearance arc-theme nemo arandr \
    i3lock-fancy btop nm-applet lsd zoxide pavucontrol
elif [ -f /etc/fedora-release ]; then
    sudo dnf install -y 'dnf-command(copr)'
    sudo dnf copr enable -y solopasha/hyprland
    sudo dnf install -y \
    i3 picom dunst kitty rofi git nitrogen stow neonvim polybar \
    papirus-icon-theme lxappearance arc-theme nemo arandr \
    i3lock-fancy btop nm-applet lsd zoxide pavucontrol
elif [ -f /etc/lsb-release ]; then
    sudo apt update && sudo apt install -y \
    i3 picom dunst kitty rofi git nitrogen stow neonvim polybar \
    papirus-icon-theme lxappearance arc-theme nemo arandr \
    i3lock-fancy btop network-manager-gnome lsd zoxide pavucontrol
fi

# 2. Clonar Dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${BLUE}Clonando repositório de dotfiles...${NC}"
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo -e "${GREEN}Repositório já existe. Atualizando...${NC}"
    cd "$DOTFILES_DIR" && git pull
fi

# 4. Limpeza de Configurações Existentes
echo -e "${RED}Limpando diretórios de configuração antigos...${NC}"

for app in "${CONFIG_APPS[@]}"; do
    if [ -d "$HOME/.config/$app" ]; then
        echo "Removendo ~/.config/$app"
        rm -rf "$HOME/.config/$app"
    fi
done

if [ -f "$HOME/.aliases" ]; then
    echo "Removendo ~/.aliases"
    rm -f "$HOME/.aliases"
fi

if [ -d "$HOME/.local/share/backgrounds" ]; then
    echo "Removendo ~/.local/share/backgrounds"
    rm -rf "$HOME/.local/share/backgrounds"
fi

if [ -d "$HOME/.local/share/fonts" ]; then
    echo "Removendo ~/.local/share/fonts"
    rm -rf "$HOME/.local/share/fonts"
fi

# 5. Usar o Stow para criar os links
echo -e "${GREEN}Aplicando Stow...${NC}"
cd "$DOTFILES_DIR"

# Linka cada pasta de config
for app in "${CONFIG_APPS[@]}"; do
    stow -v "$app"
done

stow -v aliases wallpapers fonts

echo -e "${GREEN}Setup concluído com sucesso!${NC}"

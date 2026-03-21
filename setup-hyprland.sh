#!/bin/bash

# --- Cores ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

DOTFILES_REPO="https://github.com/maureliofs/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_APPS=("hypr" "kitty" "nvim" "swaync" "waybar" "waypaper" "wofi")

# 1. Instalação de pacotes (Detectando a distro)
echo -e "${BLUE}Instalando dependências e o GNU Stow...${NC}"
if [ -f /etc/arch-release ]; then
    sudo pacman -S --needed --noconfirm \
    stow git hyprland waybar kitty neovim zsh swaync wofi fzf nwg-look \
    hyprpaper hyprlock hypridle grim slurp swappy cliphist wl-clipboard \
    waypaper playerctl xdg-desktop-portal-hyprland fastfetch btop \
    network-manager-applet lsd
elif [ -f /etc/fedora-release ]; then
    sudo dnf install -y 'dnf-command(copr)'
    sudo dnf copr enable -y solopasha/hyprland
    sudo dnf install -y \
    stow git hyprland waybar kitty neovim zsh swaync wofi fzf nwg-look \
    hyprpaper hyprlock hypridle grim slurp swappy cliphist wl-clipboard \
    waypaper playerctl xdg-desktop-portal-hyprland fastfetch btop nm-applet \
    lsd zoxide pavucontrol papirus-icon-theme arc-theme
elif [ -f /etc/lsb-release ]; then
    # sudo apt update && sudo apt install -y \
    # hyprland nwg-look hyprpaper hyprlock hypridle swappy \
    # waypaper xdg-desktop-portal-hyprland fastfetch

    sudo apt update && sudo apt install -y \
    stow git waybar kitty neovim zsh sway-notification-center wofi fzf grim slurp \
    wl-clipboard playerctl btop network-manager-gnome lsd zoxide pavucontrol \
    papirus-icon-theme arc-theme
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

# Removendo .zshrc antigo se for um arquivo real
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Removendo ~/.zshrc"
    rm -f "$HOME/.zshrc"
fi

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

# Linka a pasta do ZSH (que contém o .zshrc)
stow -v zsh aliases wallpapers fonts

# 6. Finalização
echo -e "${BLUE}Mudando shell padrão para ZSH...${NC}"
sudo chsh -s $(which zsh) $USER

echo -e "${GREEN}Setup concluído com sucesso!${NC}"

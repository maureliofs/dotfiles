#!/bin/bash

# --- Cores ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}Configurando ZSH, Oh My Zsh e Plugins...${NC}"

# 1. Instalar o Oh My Zsh (se não existir)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${BLUE}Instalando Oh My Zsh...${NC}"
    # O --unattended evita que o script pare e entre no prompt do ZSH no meio da instalação
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}Oh My Zsh já instalado.${NC}"
fi

# Definir caminho de plugins customizados
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# 2. Instalar zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo -e "${BLUE}Clonando zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 3. Instalar zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo -e "${BLUE}Clonando zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
    echo -e "${BLUE}Clonando Spaceship Prompt...${NC}"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
fi

# 2. Criar o link simbólico para o Oh My Zsh reconhecê-lo como tema
if [ ! -f "$ZSH_CUSTOM/themes/spaceship.zsh-theme" ]; then
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

echo -e "${GREEN}ZSH e Plugins configurados com sucesso!${NC}"
#!/bin/bash

# Verifica se é Arch Linux
if command -v checkupdates >/dev/null 2>&1; then
    updates=$(checkupdates | wc -l)

# Verifica se é Fedora
elif command -v dnf >/dev/null 2>&1; then
    # O dnf retorna 100 se houver atualizações
    updates=$(dnf check-update -q | grep -v "^$" | wc -l)

# Verifica se é Ubuntu/Debian
elif command -v apt >/dev/null 2>&1; then
    # Atualiza o cache silenciosamente (pode exigir sudo sem senha no apt)
    # Mas o comando abaixo lê apenas o que já está no cache local
    updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
    # Subtrai 1 porque o apt lista uma linha de cabeçalho
    if [ "$updates" -gt 0 ]; then updates=$((updates - 1)); fi
else
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "󰚰 $updates"
else
    echo "󰚰 0"
fi
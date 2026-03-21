#!/usr/bin/env bash
#
# launch.sh — Inicia a Polybar (suporte a múltiplos monitores)
# Coloque em: ~/.config/polybar/launch.sh
# Torne executável: chmod +x ~/.config/polybar/launch.sh
#

# Mata instâncias anteriores
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.3; done

# Inicia uma barra por monitor
if type "xrandr" > /dev/null 2>&1; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main 2>&1 | tee -a /tmp/polybar-$m.log & disown
    done
else
    polybar --reload main 2>&1 | tee -a /tmp/polybar.log & disown
fi

echo "Polybar iniciada"
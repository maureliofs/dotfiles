#!/bin/bash

# apt install rofi && apt install mlocate

locate home | rofi -threads 0 -width 100 -dmenu -i -p "locate:" | xargs -r -0 xdg-open

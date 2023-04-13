#!/usr/bin/env bash

if [ -d ~/.config/alacritty/ ]
then
    rm -rf ~/.config/alacritty/*
    stow alacritty/ --target ~/.config/alacritty/
else
    mkdir -p ~/.config/alacritty/
    stow alacritty/ --target ~/.config/alacritty/
fi

if [ -d ~/.config/i3/ ]
then
    rm -rf ~/.config/i3/*
    stow i3/ --target ~/.config/i3/
else
    mkdir -p ~/.config/i3/
    stow i3/ --target ~/.config/i3/
fi

if [ -d ~/.config/i3blocks/ ]
then
    rm -rf ~/.config/i3blocks/*
    stow i3blocks/ --target ~/.config/i3blocks/
else
    mkdir -p ~/.config/i3blocks/
    stow i3blocks/ --target ~/.config/i3blocks/
fi

if [ -d ~/.config/rofi/ ]
then
    rm -rf ~/.config/rofi/*
    stow rofi/ --target ~/.config/rofi/
else
    mkdir -p ~/.config/rofi/
    stow rofi/ --target ~/.config/rofi/
fi

if [ -d ~/.config/picom/ ]
then
    rm -rf ~/.config/picom/*
    stow picom/ --target ~/.config/picom/
else
    mkdir -p ~/.config/picom/
    stow picom/ --target ~/.config/picom/
fi

#if [ -f ~/.gitconfig ]
#then
#    rm -f ~/.gitconfig
#    stow git/
#else
#    stow git/
#fi

if [ -f ~/.vimrc ]
then
    rm -f ~/.vimrc
    stow vim/ 
else
    stow vim/ 
fi

if [ -f ~/.zshrc ]
then
    rm -f ~/.zshrc
    stow zsh/ 
else
    stow zsh/ 
fi

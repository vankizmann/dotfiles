#!/usr/bin/env bash

if [ ! -d "$HOME/.config/hypr" ]; then
  mkdir "$HOME/.config/hypr"
fi

cp "./config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"

if [ ! -d "$HOME/.config/tofi" ]; then
  mkdir "$HOME/.config/tofi"
fi

cp "./config/tofi/config" "$HOME/.config/tofi/config"

if [ ! -d "$HOME/.config/waybar" ]; then
  mkdir "$HOME/.config/waybar"
fi

cp "./config/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
cp "./config/waybar/modules.json" "$HOME/.config/waybar/modules.json"
cp "./config/waybar/style.css" "$HOME/.config/waybar/style.css"

if [ ! -d "$HOME/.config/gtk-3.0" ]; then
  mkdir "$HOME/.config/gtk-3.0"
fi

cp "./config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

if [ ! -d "$HOME/.config/gtk-4.0" ]; then
  mkdir "$HOME/.config/gtk-4.0"
fi

cp "./config/gtk-4.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"

if [ ! -d "$HOME/.config/kitty" ]; then
  mkdir "$HOME/.config/kitty"
fi

cp "./config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

if [ ! -d "$HOME/.local/share/icons" ]; then
  mkdir "$HOME/.local/share/icons"
fi
  
cp -r "./local/share/icons" "$HOME/.local/share"
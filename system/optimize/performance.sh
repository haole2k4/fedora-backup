#!/usr/bin/env zsh

echo "Switching to MAX PERFORMANCE mode..."

sudo systemctl start docker.service docker.socket

echo "Enabling UI animations and extensions..."
gsettings set org.gnome.desktop.interface enable-animations true
gnome-extensions list | while read ext; do
  gnome-extensions enable "$ext"
done

echo "Max Performance activated."

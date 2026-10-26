#!/usr/bin/env zsh

echo "Switching to POWER SAVE mode..."

sudo systemctl stop docker.service docker.socket

echo "Disabling UI animations and extensions..."
gsettings set org.gnome.desktop.interface enable-animations false
gnome-extensions list | while read ext; do
  gnome-extensions disable "$ext"
done

echo "Power Save mode activated."

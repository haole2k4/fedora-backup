#!/usr/bin/env zsh

echo "Switching to POWER SAVE mode..."

sudo systemctl stop mysqld
sudo systemctl stop postgresql

# 3. GNOME UI - Tắt để giảm tải GPU/CPU
echo "Disabling UI animations and extensions..."
gsettings set org.gnome.desktop.interface enable-animations false
gnome-extensions list | while read ext; do
  gnome-extensions disable "$ext"
done

# 4. Tắt các dịch vụ nặng nề
sudo systemctl stop docker.service docker.socket

echo "Power Save mode activated."
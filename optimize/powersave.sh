#!/usr/bin/env zsh

echo "Switching to POWER SAVE mode..."

# 1. Dừng scx_lavd (Scheduler này ưu tiên độ nhạy, có thể gây tốn pin hơn scheduler mặc định)
sudo pkill -f scx_lavd

# 2. Kích hoạt TLP đúng cách
sudo systemctl enable --now tlp
sudo tlp start
# Ép TLP chạy chế độ Battery ngay cả khi đang cắm sạc (nếu bạn muốn)
sudo tlp bat

# 3. GNOME UI - Tắt để giảm tải GPU/CPU
echo "Disabling UI animations and extensions..."
gsettings set org.gnome.desktop.interface enable-animations false
gnome-extensions list | while read ext; do
  gnome-extensions disable "$ext"
done

# 4. Tắt các dịch vụ nặng nề
sudo systemctl stop docker.service docker.socket

echo "Power Save mode activated. TLP is in control."
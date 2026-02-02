#!/usr/bin/env zsh

echo "Switching to MAX PERFORMANCE mode..."

# 1. Dừng hoàn toàn TLP để tránh can thiệp vào Scheduler
sudo systemctl stop tlp
sudo systemctl disable tlp

# 2. Quản lý scx_lavd (Dừng bản cũ nếu đang chạy để tránh chồng chéo)
sudo pkill -f scx_lavd
sleep 1
sudo scx_lavd --performance &! 

# 3. Ép CPU chạy ở chế độ Performance (Tối ưu cho kernel CachyOS)
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
    echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
fi

# 4. GNOME UI & Extensions
echo "Enabling UI animations and extensions..."
gsettings set org.gnome.desktop.interface enable-animations true
gnome-extensions list --user | while read ext; do
  gnome-extensions enable "$ext"
done

# 5. Services cho công việc
sudo systemctl start docker.service docker.socket

echo "Max Performance activated. scx_lavd is handling the load."
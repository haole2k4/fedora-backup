sudo dnf install gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly ffmpeg-libs --allowerasing
sudo dnf install uxplay

sudo firewall-cmd --add-service=mdns --permanent
sudo firewall-cmd --add-port=43210-43212/tcp --permanent
sudo firewall-cmd --add-port=43213-43215/udp --permanent
sudo firewall-cmd --reload


# lưu ý sẽ có các cảnh báo như Warning: ALREADY_ENABLED: 43210-43212:tcp
# và cảnh báo Warning: ALREADY_ENABLED: 43213-43215:udp
# chỉ đơn giản là đã có các rule này rồi nên nó báo vậy thôi, không có gì phải lo lắng cả


# trước đó phải bật 2 này lên đã nhé, nếu không sẽ không tìm thấy thiết bị để kết nối đâu
sudo systemctl start avahi-daemon
sudo systemctl enable avahi-daemon


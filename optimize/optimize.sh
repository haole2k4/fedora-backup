# tắt localsearch để giảm I/O nền không cần thiết trên ổ SSD
systemctl --user mask localsearch-3.service localsearch-control-3.service localsearch-writeback-3.service
# xong lệnh trên thì mò vào ~/.cache và chạy rm -rf tracker3

# xem các file đã bị mask
systemctl --user list-unit-files --state=masked

# dành cho hoàn lương 
systemctl --user unmask localsearch-3.service \
  localsearch-control-3.service \
  localsearch-writeback-3.service

# tắt hết đi, có mô tả ở dưới
sudo systemctl disable --now \
    bluetooth.service \
    ModemManager.service \
    cups.service \
    avahi-daemon.service \
    NetworkManager-wait-online.service \
    geoclue.service \
    smartd.service \

# bluetooth.service Nếu không dùng BT (tai nghe, chuột, bàn phím)
# ModemManager.service Nếu không có 4G/5G modem
# cups.service Nếu không in ấn 
# avahi-daemon.service Nếu không dùng mDNS / AirPlay / network discovery:
# NetworkManager-wait-online.service Laptop / dev machine, chỉ dùng cho server
# geoclue.service Nếu không dùng:
# - GNOME Weather
# - Maps
# - Auto timezone
# smartd là daemon giám sát sức khỏe ổ cứng/SSD dựa trên chuẩn S.M.A.R.T Gây disk wakeups Phá deep idle (C-state, PCIe ASPM)
#->Làm pin tụt chậm nhưng đều
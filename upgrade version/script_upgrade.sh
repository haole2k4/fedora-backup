# 1, sau đó reboot lại máy, không được skip
sudo dnf upgrade --refresh

# 2 , sau đó chạy lệnh này để nâng cấp lên Fedora 44
# tham số --releasever=44 là để chỉ định phiên bản Fedora mà bạn muốn nâng cấp lên
# tham số --allowerasing là để cho phép xóa các gói phần mềm không tương thích với phiên bản mới của Fedora, nếu cần thiết
# tham số --best là để đảm bảo rằng các gói phần mềm được nâng cấp lên phiên bản mới nhất có sẵn trong kho lưu trữ của Fedora
# nếu muốn dnf system-upgrade download thì nên set --setopt=keepcache=1 để giữ lại các gói đã tải về trong cache, 
# giúp tiết kiệm thời gian nếu cần phải tải lại các gói đó sau này
sudo dnf system-upgrade download --releasever=44

# 3, sau đó chạy lệnh này để khởi động lại máy và hoàn tất quá trình nâng cấp
sudo dnf5 offline reboot

# sau khi nâng cấp xong, chạy lệnh này để dọn dẹp các gói cũ đã tải về trong cache, giúp giải phóng không gian lưu trữ trên máy tính của bạn
sudo dnf5 offline clean

# Hậu update 
# xem tiếp ở https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
# docs thêm: https://fedoraproject.org/security/
# tác giả làm biếng T.T
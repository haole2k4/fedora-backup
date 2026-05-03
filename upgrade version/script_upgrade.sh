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

# sau khi nâng cấp xong, chạy
sudo dnf install rpmconf
sudo rpmconf -a
# Chú ý: nên chạy D trước, cảm thấy ổn thì Y

# Sau đó cập nhật grub bootloader
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
# Lưu ý quan trọng: Đừng cố tìm file ở /boot/efi/EFI/fedora/grub.cfg. 
# Trên Fedora hiện đại, file đó chỉ là một file "stub" trỏ về /boot/grub2/grub.cfg. 
# Nếu bạn ghi đè trực tiếp vào file ở phân vùng EFI, 
#bạn có thể làm hỏng khả năng tự động cập nhật của hệ thống trong tương lai.

# chạy efibootmgr để kiểm tra và quản lý các mục khởi động EFI trên hệ thống của bạn.
sudo dnf install efibootmgr
sudo efibootmgr
# thấy boot order có fedora là được

# tải để loại bỏ các gói phần mềm đã lỗi thời hoặc không còn được hỗ trợ trên Fedora 44
sudo dnf install remove-retired-packages
remove-retired-packages

# cài bộ giải cứu mới
# đừng ngựa ngựa mà làm theo các bước khác, cách này ngon nhất cho zsh rồi
sudo rm /boot/*rescue*
sudo kernel-install add "$(uname -r)" "/lib/modules/$(uname -r)/vmlinuz"

# có thể cài thêm này để tạo một môi trường cứu hộ (rescue environment) mới, giúp bạn khôi phục hệ thống nếu gặp sự cố sau khi nâng cấp.
sudo dnf install dracut-config-rescue

# clean mấy cái chữ ký trước đó
sudo dnf install clean-rpm-gpg-pubkey
sudo clean-rpm-gpg-pubkey

# clean simplink cũ
sudo dnf install symlinks
sudo symlinks -r /usr | grep dangling

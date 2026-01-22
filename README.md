# Hướng Dẫn Cài Đặt Fedora Sau Khi Cài Mới

Bộ hướng dẫn này giúp bạn dựng nhanh một môi trường Fedora mới với các gói thiết yếu, tối ưu touchpad, shell, prompt và vài công cụ tùy chọn.

---

## Chuẩn bị nhanh
- Kết nối internet ổn định và có quyền `sudo`.
- Sao lưu các tệp cấu hình hệ thống hiện tại (nhất là `/etc/dnf/dnf.conf`).
- Clone repo vào thư mục làm việc: `git clone https://github.com/.../fedora-backup` (hoặc sao chép thủ công).

---

## 1. Tối ưu hóa DNF
Sao chép cấu hình đã chuẩn bị để bật tải song song và chọn mirror nhanh:
```bash
sudo cp backupdnf.conf /etc/dnf/dnf.conf
sudo dnf makecache
```

---

## 2. Bộ cài đặt chính (`mustdo.sh`)
Script bao gồm: cập nhật hệ thống, cập nhật firmware (`fwupdmgr`), cài dnf5 + RPM Fusion, cài bộ gói cơ bản (dev, media, ntfs, vlc, java, android-tools), `timeshift`, `tlp`, và phần chuẩn bị driver NVIDIA.

**Cách chạy:**
1. Xem nhanh nội dung để biết các bước và điểm dừng: `sed -n '1,200p' mustdo.sh`.
2. Cấp quyền và chạy: `chmod +x mustdo.sh && bash mustdo.sh`.
3. Script có `sudo reboot now` ngay sau bước cập nhật firmware; hãy để máy khởi động lại khi được yêu cầu rồi chạy lại script từ bước tiếp theo nếu cần.

**Lưu ý NVIDIA:** Khi được hỏi, tạo mật khẩu MOK, ghi nhớ nó và sau reboot chọn **Enroll MOK → Continue → nhập mật khẩu → Reboot** để driver được kích hoạt.

---

## 3. Cấu hình Touchpad (tùy chọn)
1. Cài phụ thuộc: `bash touchpadfix.sh`.
2. Tạo `/etc/libinput.conf` với:
   ```ini
   scroll-factor-x=0.5
   scroll-factor-y=0.2
   ```
3. Tùy chỉnh nâng cao: xem repo [libinput-config](https://gitlab.com/warningnonpotablewater/libinput-config).

---

## 4. Cài đặt Terminal Ghostty (tùy chọn)
[Ghostty](https://github.com/ghostty-org/ghostty) là terminal hỗ trợ GPU. Cài đặt theo hướng dẫn mới nhất của dự án, ví dụ:
```bash
git clone https://github.com/ghostty-org/ghostty.git
cd ghostty
cargo build --release
sudo cp target/release/ghostty /usr/local/bin/
```

---

## 5. Chuyển sang Zsh
```bash
sudo dnf install zsh -y
chsh -s $(which zsh)
cp zshrc.sh ~/.zshrc
```
Đăng xuất/đăng nhập lại để shell mới có hiệu lực. Tệp `zshrc.sh` sẽ tự cài Zinit và các plugin gợi ý, tô sáng.

---

## 6. Cài đặt Starship Prompt
```bash
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config
cp starship-config.toml ~/.config/starship.toml
```

---

## 7. Bảo trì định kỳ (`maintaince.sh`)
Chạy định kỳ để dọn dẹp cache, journal và TRIM SSD:
```bash
chmod +x maintaince.sh
bash maintaince.sh
```

---

## 8. Video và link tham khảo
- **[Video Hướng Dẫn 1](https://www.youtube.com/watch?v=iRUt8As9hXM)**
- **[Video Hướng Dẫn 2](https://www.youtube.com/watch?v=ud7YxC33Z3w&t=4s)**
- **[Bài viết touchpad (đã gỡ) và bình luận](https://www.reddit.com/r/framework/comments/17z30p3/comment/kdywvuy/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)**

---

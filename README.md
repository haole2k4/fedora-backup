# Fedora Backup

Backup cấu hình và script cho Fedora.

## Cấu trúc

```
├── zshrc.sh                 # Config Zsh
├── after-install/           # Chạy sau cài mới
├── optimize/                # Tối ưu hệ thống
└── terminal-customize/      # Config terminal
```

---

## 1. after-install/

Chạy **từng lệnh một** trong các file:

| File | Mô tả |
|------|-------|
| `backupdnf.conf` | Config DNF (tải song song, mirror nhanh) |
| `mustdo.sh` | Cài đặt cơ bản: dnf5, RPM Fusion, codec, driver... |
| `touchpadfix.sh` | Fix touchpad |

**Lưu ý NVIDIA:** Tạo mật khẩu MOK → Reboot → Enroll MOK → Nhập mật khẩu.

---

## 2. optimize/

Chạy bằng `source`:
```bash
source maintainance.sh   # Dọn cache, journal, TRIM
source performance.sh    # Tối ưu hiệu năng
source powersave.sh      # Tiết kiệm pin
```

Chạy trực tiếp:
```bash
bash optimize.sh
bash resignfornewkernel.sh   # Ký lại module sau update kernel
```

Xem thêm: `tipntrick.md`

---

## 3. terminal-customize/

Copy vào vị trí tương ứng:

```bash
cp ghosttybackup ~/.config/ghostty/config
cp starship-config.toml ~/.config/starship.toml
```

---

## 4. Zsh

```bash
sudo dnf install zsh -y
chsh -s $(which zsh)
cp zshrc.sh ~/.zshrc
```

---

## Tham khảo

- [Video 1](https://www.youtube.com/watch?v=iRUt8As9hXM)
- [Video 2](https://www.youtube.com/watch?v=ud7YxC33Z3w)
- [Touchpad fix](https://www.reddit.com/r/framework/comments/17z30p3/comment/kdywvuy/)

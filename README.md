# Fedora Dotfiles & System Scripts

Kho lưu trữ cấu hình cá nhân (**GNU Stow**) và bộ công cụ tối ưu hóa hệ thống cho **Fedora Linux**.

## Cấu trúc thư mục

```text
fedora-backup/
├── Makefile                     # Tự động hóa stow dotfiles, tối ưu máy & backup GNOME
├── .gitignore                   # Chặn file rác, cache, history và secret/token
├── .stow-local-ignore           # Ngăn GNU Stow symlink nhầm thư mục hệ thống
│
├── system/                      # [HỆ THỐNG] Các script cấp hệ thống (cần sudo)
│   ├── after-install/           # Thiết lập sau khi cài mới Fedora (dnf.conf, codec, driver...)
│   ├── optimize/                # Tối ưu dịch vụ nền, tiết kiệm pin, dọn kernel cũ, bảo trì
│   ├── upgrade/                 # Quy trình nâng cấp phiên bản Fedora (system-upgrade)
│   └── setup-apps/              # Script cài đặt Niri, Ollama (Open WebUI), UxPlay, mẹo MPV
│
├── gnome/                       # [GNOME] Sao lưu/khôi phục riêng nhánh /org/gnome/
│   └── backup-gnome.sh          # Tránh xung đột với các Wayland compositor khác (Niri/DMS)
│
├── zsh/                         # [STOW] ~/.zshrc (Zinit, Starship, Git Worktree helpers)
├── ghostty/                     # [STOW] ~/.config/ghostty/ (config & themes)
├── starship/                    # [STOW] ~/.config/starship.toml
├── tmux/                        # [STOW] ~/.tmux.conf
├── git/                         # [STOW] ~/.gitconfig
├── mpv/                         # [STOW] ~/.config/mpv/ (mpv.conf & uosc.conf)
├── vim/                         # [STOW] ~/.vimrc
└── nvim/                        # [STOW] ~/.config/nvim/
```

---

## 1. Quản lý Dotfiles bằng GNU Stow (Thay thế `cp` thủ công)

Không cần copy từng file hay đổi tên dự phòng. Mọi chỉnh sửa trên `~/.zshrc`, `~/.config/ghostty/config`, v.v. sẽ trực tiếp cập nhật vào repo thông qua symlink.

```bash
# Cài đặt GNU Stow (nếu chưa có)
sudo dnf install stow -y

# Symlink toàn bộ các module (nếu máy đang có sẵn file thật ở ~/, dùng make adopt)
make adopt

# Hoặc làm mới (re-stow) toàn bộ symlink
make stow

# Nếu chỉ muốn bật lẻ 1 module bất kỳ:
stow -v -R -t ~ zsh ghostty
```

---

## 2. Sao lưu & Khôi phục cấu hình GNOME (`dconf`)

Chỉ trích xuất nhánh `/org/gnome/` để không gây xung đột với Niri hay các Wayland compositor khác:

```bash
make gnome-backup    # Xuất cấu hình ra gnome/gnome-settings.dconf
make gnome-restore   # Nạp lại cấu hình từ gnome/gnome-settings.dconf
```

---

## 3. Tối ưu & Bảo trì Hệ thống (`system/`)

### Chạy nhanh qua `Makefile`:
```bash
make optimize        # Dọn cache dnf5, cập nhật gói, dọn journalctl (7 ngày) & fstrim SSD
make performance     # Bật Docker & hiệu ứng/extension GNOME
make powersave       # Tắt Docker & hiệu ứng/extension GNOME để tiết kiệm pin
```

### Thiết lập sau khi cài mới (`system/after-install/`):
- **Cấu hình DNF:** `sudo cp system/after-install/dnf.conf /etc/dnf/dnf.conf`
- **Cài đặt cơ bản:** Xem và chạy từng bước trong [`system/after-install/mustdo.sh`](system/after-install/mustdo.sh) (RPM Fusion, Multimedia Codecs, NVIDIA `akmod-nvidia`, `tlp`...).
- **Sửa tốc độ cuộn Touchpad:** Xem [`system/after-install/touchpadfix.sh`](system/after-install/touchpadfix.sh).

### Quản lý Kernel & Dịch vụ nền (`system/optimize/`):
- [`system/optimize/optimize.sh`](system/optimize/optimize.sh): Tắt các dịch vụ ngầm gây tốn pin/SSD (`localsearch`, `abrtd`, `ModemManager`...) và cài `auto-cpufreq`.
- [`system/optimize/deloldkernel.sh`](system/optimize/deloldkernel.sh) & [`system/optimize/resignfornewkernel.sh`](system/optimize/resignfornewkernel.sh): Xóa kernel cũ và ký lại Secure Boot (MOK) cho kernel CachyOS/Fedora.
- [`system/optimize/tipntrick.md`](system/optimize/tipntrick.md): Sổ tay kiểm tra phần cứng, pin, dịch vụ đang chạy và cổng mạng.

---

## Tham khảo
- [Hướng dẫn tối ưu Fedora - Video 1](https://www.youtube.com/watch?v=iRUt8As9hXM)
- [Hướng dẫn tối ưu Fedora - Video 2](https://www.youtube.com/watch?v=ud7YxC33Z3w)
- [Touchpad Scroll Fix (Framework/Fedora)](https://www.reddit.com/r/framework/comments/17z30p3/comment/kdywvuy/)

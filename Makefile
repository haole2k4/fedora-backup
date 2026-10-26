# Danh sách các module GNU Stow quản lý dotfiles trong ~/
STOW_MODULES := zsh ghostty starship tmux git mpv vim nvim
TARGET_DIR   := $(HOME)

.PHONY: help stow adopt unstow optimize maintain performance powersave gnome-backup gnome-restore

help:
	@echo "=================================================================="
	@echo "  FEDORA DOTFILES & SYSTEM ARCHITECT - BẢNG ĐIỀU KHIỂN"
	@echo "=================================================================="
	@echo "  make stow          : Symlink toàn bộ dotfiles vào ~/ (stow -R)"
	@echo "  make adopt         : Đồng bộ ngược từ ~/ vào repo & tạo symlink (stow --adopt)"
	@echo "  make unstow        : Gỡ bỏ toàn bộ symlink khỏi ~/ (stow -D)"
	@echo "  make optimize      : Chạy script bảo trì & tối ưu hệ thống (cần sudo)"
	@echo "  make performance   : Bật chế độ hiệu năng tối đa (Docker + GNOME UI)"
	@echo "  make powersave     : Bật chế độ tiết kiệm pin (Tắt Docker + GNOME UI)"
	@echo "  make gnome-backup  : Sao lưu cấu hình GNOME (/org/gnome/) qua dconf"
	@echo "  make gnome-restore : Khôi phục cấu hình GNOME từ bản sao lưu dconf"
	@echo "=================================================================="

stow:
	@if ! command -v stow >/dev/null 2>&1; then \
		echo "[INFO] Chưa cài đặt GNU Stow. Đang cài đặt qua dnf..."; \
		sudo dnf install -y stow; \
	fi
	@echo "[INFO] Đang tạo symlink cho các module: $(STOW_MODULES) -> $(TARGET_DIR)"
	stow -v -R -t "$(TARGET_DIR)" $(STOW_MODULES)
	@echo "[OK] Hoàn tất symlink toàn bộ dotfiles!"

adopt:
	@if ! command -v stow >/dev/null 2>&1; then \
		echo "[INFO] Chưa cài đặt GNU Stow. Đang cài đặt qua dnf..."; \
		sudo dnf install -y stow; \
	fi
	@echo "[INFO] Đang adopt & tạo symlink cho các module: $(STOW_MODULES) -> $(TARGET_DIR)"
	stow -v --adopt -t "$(TARGET_DIR)" $(STOW_MODULES)
	@echo "[OK] Đã adopt và tạo symlink thành công! Kiểm tra thay đổi bằng 'git diff'."

unstow:
	stow -v -D -t "$(TARGET_DIR)" $(STOW_MODULES)

optimize:
	@echo "[INFO] Đang chạy bảo trì hệ thống Fedora..."
	sudo bash system/optimize/maintainance.sh

performance:
	zsh system/optimize/performance.sh

powersave:
	zsh system/optimize/powersave.sh

gnome-backup:
	bash gnome/backup-gnome.sh backup

gnome-restore:
	bash gnome/backup-gnome.sh restore

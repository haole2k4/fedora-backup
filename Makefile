.PHONY: help optimize performance powersave gnome-backup gnome-restore

help:
	@echo "=================================================================="
	@echo "  FEDORA SYSTEM SETUP & GNOME BACKUP - BẢNG ĐIỀU KHIỂN"
	@echo "=================================================================="
	@echo "  make optimize      : Chạy script bảo trì & tối ưu hệ thống (cần sudo)"
	@echo "  make performance   : Bật chế độ hiệu năng tối đa (Docker + GNOME UI)"
	@echo "  make powersave     : Bật chế độ tiết kiệm pin (Tắt Docker + GNOME UI)"
	@echo "  make gnome-backup  : Sao lưu cấu hình GNOME (/org/gnome/) qua dconf"
	@echo "  make gnome-restore : Khôi phục cấu hình GNOME từ bản sao lưu dconf"
	@echo "=================================================================="

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

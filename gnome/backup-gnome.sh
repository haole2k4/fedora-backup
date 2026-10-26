#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DUMP_FILE="${SCRIPT_DIR}/gnome-settings.dconf"

case "${1:-backup}" in
  backup)
    echo "[INFO] Đang trích xuất cấu hình GNOME (/org/gnome/) ra ${DUMP_FILE}..."
    dconf dump /org/gnome/ > "${DUMP_FILE}"
    echo "[OK] Đã lưu cấu hình GNOME thành công (không ảnh hưởng các Wayland compositor khác)."
    ;;
  restore)
    if [ ! -f "${DUMP_FILE}" ]; then
      echo "[ERR] Không tìm thấy file ${DUMP_FILE} để khôi phục!"
      exit 1
    fi
    echo "[INFO] Đang nạp lại cấu hình GNOME từ ${DUMP_FILE}..."
    dconf load /org/gnome/ < "${DUMP_FILE}"
    echo "[OK] Đã khôi phục cấu hình GNOME thành công."
    ;;
  *)
    echo "Cách dùng: $0 {backup|restore}"
    exit 1
    ;;
esac

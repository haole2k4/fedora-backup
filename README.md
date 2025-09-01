# Hướng Dẫn Cài Đặt Fedora Sau Khi Cài Mới

Đây là tài liệu hướng dẫn các bước cần thiết để cấu hình một hệ thống Fedora mới, giúp bạn có một môi trường làm việc hoàn chỉnh và chuyên nghiệp.

---

## 1. Tối ưu hóa DNF

Bước đầu tiên là tối ưu hóa trình quản lý gói DNF để tăng tốc độ tải xuống bằng cách cho phép tải song song và sử dụng máy chủ nhanh nhất.
Sao chép tệp cấu hình `backupdnf.conf`:

## 2. Chạy Script Cài Đặt Chính

Thực thi tệp `mustdo.sh` để tự động cập nhật hệ thống, thêm các kho lưu trữ RPM Fusion, và cài đặt các gói phần mềm cần thiết như `vim`, `git`, `cargo`, `vlc`, và các công cụ hệ thống khác.

**Lưu ý quan trọng:**
*   Script sẽ yêu cầu bạn **khởi động lại máy** sau khi cập nhật firmware. Hãy làm theo để đảm bảo hệ thống ổn định.
*   **Đối với người dùng NVIDIA:** Script sẽ cài đặt trình điều khiển NVIDIA. Trong quá trình này, bạn sẽ được yêu cầu tạo một mật khẩu cho MOK (Machine Owner Key).
    1.  Hãy **tạo và ghi nhớ** mật khẩu này.
    2.  Sau khi script hoàn tất và bạn khởi động lại máy, một màn hình màu xanh (MOK manager) sẽ xuất hiện.
    3.  Chọn **Enroll MOK**.
    4.  Chọn **Continue** (hoặc Yes).
    5.  Nhập lại mật khẩu MOK bạn đã tạo.
    6.  Chọn **Reboot** để khởi động lại lần cuối. Sau bước này, trình điều khiển NVIDIA sẽ được kích hoạt thành công.
*   `vim` được cài đặt trong bước này để bạn có thể chỉnh sửa các tệp cấu hình sau đó. Nếu không muốn thì xài `nano`.


## 3. Cấu hình Touchpad

Nếu bạn đang dùng laptop, các lệnh sau sẽ giúp giảm độ nhạy của touchpad.

1.  Chạy script để cài đặt các gói phụ thuộc cần thiết:
    ```bash
    bash touchpadfix.sh
    ```

2.  Tạo một tệp cấu hình mới tại `/etc/libinput.conf` với quyền `sudo` và thêm nội dung sau:
    ```ini
    // filepath: /etc/libinput.conf
    scroll-factor-x=0.5
    scroll-factor-y=0.2
    ```

3.  Để có các tùy chỉnh nâng cao hơn, bạn có thể tham khảo tại [libinput-config repo](https://gitlab.com/warningnonpotablewater/libinput-config).

---

## 4. Cài đặt Terminal Ghostty

[Ghostty](https://github.com/ghostty-org/ghostty) là một trình giả lập terminal hiện đại, nhanh và hỗ trợ GPU.

Tải và cài đặt Ghostty (ví dụ, hãy kiểm tra trang chính thức để có hướng dẫn mới nhất):

```bash
# Tải mã nguồn
git clone https://github.com/ghostty-org/ghostty.git
cd ghostty

# Biên dịch và cài đặt
cargo build --release
sudo cp target/release/ghostty /usr/local/bin/
```

---

## 5. Chuyển sang Zsh và Cấu hình

Zsh (Z Shell) là một shell mạnh mẽ với nhiều tính năng hơn Bash. Chúng ta sẽ cài đặt Zsh và cấu hình nó với Zinit để quản lý plugin.

1.  Cài đặt Zsh và đặt làm shell mặc định:
    ```bash
    sudo dnf install zsh -y
    chsh -s $(which zsh)
    ```
    *Bạn sẽ cần đăng xuất và đăng nhập lại để thay đổi có hiệu lực.*

2.  Sao chép tệp cấu hình `zshrc.sh` vào thư mục chính của bạn. Tệp này sẽ tự động cài đặt Zinit và các plugin hữu ích như tự động gợi ý và tô sáng cú pháp.
    ```bash
    cp zshrc.sh ~/.zshrc
    ```

3.  Mở một cửa sổ terminal mới để Zsh và các plugin được tải.

---

## 6. Cài đặt Starship Prompt

[Starship](https://starship.rs) là một dấu nhắc lệnh (prompt) đa nền tảng, nhanh và có khả năng tùy biến cao.

1.  Cài đặt Starship:
    ```bash
    curl -sS https://starship.rs/install.sh | sh
    ```

2.  Sao chép tệp cấu hình `starship-config.toml` để áp dụng giao diện đã được chuẩn bị sẵn.

---

## 7. Video và link Hướng Dẫn Tham Khảo

-   **[Video Hướng Dẫn 1](https://www.youtube.com/watch?v=iRUt8As9hXM)**

-   **[Video Hướng Dẫn 2](https://www.youtube.com/watch?v=ud7YxC33Z3w&t=4s)**

-   **[Link bài viết về touchpad(bị gỡ) và bình luận](https://www.reddit.com/r/framework/comments/17z30p3/comment/kdywvuy/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)**

---

**Hoàn tất!** Bạn đã cấu hình thành công môi trường Fedora của mình. Hãy mở terminal (Ghostty) và tận hưởng.
# dùng để tạo alias cho podman và podman-compose
ln -s /usr/bin/podman ~/.local/bin/docker && ln -s /usr/bin/podman-compose ~/.local/bin/docker-compose

# khong thích nữa thì
rm ~/.local/bin/docker && rm ~/.local/bin/docker-compose

# nếu muốn tạo alias ở .zshrc thì 
echo "alias docker='podman'" >> ~/.zshrc
echo "alias docker-compose='podman-compose'" >> ~/.zshrc
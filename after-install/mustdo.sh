sudo dnf update

sudo fwupdmgr refresh --force
sudo fwupdmgr update
#xong 2 lenh tren thi 
sudo reboot now

sudo dnf install dnf5 dnf5-plugins #use dnf5

sudo dnf install http://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade --refresh

sudo dnf install sl -y
sl

sudo dnf install dnfdragora #optional

sudo dnf install multimedia

sudo dnf5 install gnome-tweaks

flatpak install flathub com.mattjakeman.ExtensionManager

sudo dnf5 install fastfetch mpv wget git gcc make python3 python3-pip unrar unzip cargo p7zip p7zip-plugins ntfs-3g htop java-17-openjdk android-tools vlc

sudo dnf5 install timeshift

#NVIDIA
lspci | grep VGA
sudo dnf install akmod-nvidia

#battery
sudo dnf5 install tlp
sudo systemctl enable tlp
sudo systemctl start tlp
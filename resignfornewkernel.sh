rpm -qa | grep cachyos

sudo dnf remove \
kernel-cachyos-6.18.5-1.fc43.x86_64 \
kernel-cachyos-core-6.18.5-1.fc43.x86_64 \
kernel-cachyos-modules-6.18.5-1.fc43.x86_64 \
kernel-cachyos-modules-extra-6.18.5-1.fc43.x86_64

sudo openssl x509 \
  -inform DER \
  -in /etc/pki/akmods/certs/public_key.der \
  -out /etc/pki/akmods/certs/public_key.pem

sudo sbsign \
  --key /etc/pki/akmods/private/private_key.priv \
  --cert /etc/pki/akmods/certs/public_key.pem \
  /boot/vmlinuz-6.18.6-cachyos1.fc43.x86_64 \
  --output /boot/vmlinuz-6.18.6-cachyos1.fc43.x86_64.signed

sudo mv \
  /boot/vmlinuz-6.18.6-cachyos1.fc43.x86_64.signed \
  /boot/vmlinuz-6.18.6-cachyos1.fc43.x86_64
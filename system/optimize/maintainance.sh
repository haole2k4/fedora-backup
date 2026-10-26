#!/bin/bash

echo "Running system maintenance..."

dnf5 clean all
dnf5 upgrade --refresh -y
journalctl --vacuum-time=7d
fstrim -v /

echo "Maintenance complete!"

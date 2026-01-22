#!/bin/bash
# Save as ~/maintenance.sh and make executable

echo "Running system maintenance..."

# Update system
sudo dnf5 upgrade --refresh

# Clean caches
sudo dnf5 clean all

# Clean old journal entries
sudo journalctl --vacuum-time=7d

# Run TRIM on SSD
sudo fstrim -v /

echo "Maintenance complete!"
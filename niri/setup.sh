sudo dnf copr enable avengemedia/dms
sudo dnf install niri dms

systemctl --user add-wants niri.service dms


sudo mkdir -p /etc/nvidia/nvidia-application-profiles-rc.d
sudo tee /etc/nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json > /dev/null << 'EOF'
{
 "rules": [
  {
   "pattern": {
    "feature": "procname",
    "matches": "niri"
   },
   "profile": "Limit Free Buffer Pool On Wayland Compositors"
  }
 ],
 "profiles": [
  {
   "name": "Limit Free Buffer Pool On Wayland Compositors",
   "settings": [
    {
     "key": "GLVidHeapReuseRatio",
     "value": 0
    }
   ]
  }
 ]
}
EOF
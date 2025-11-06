#!/bin/bash
set -x

# === Створюємо папки ===
mkdir -p /root/folder1 /root/folder2

# === Створюємо move-скрипт ===
cat << 'EOF' > /root/move_script.sh
#!/bin/bash
SRC="/root/folder1"
DEST="/root/folder2"
LOG="/var/log/move_daemon.log"

while true; do
  if [ "$(ls -A $SRC 2>/dev/null)" ]; then
    for file in "$SRC"/*; do
      if [ -f "$file" ]; then
        mv "$file" "$DEST"/
        echo "$(date '+%Y-%m-%d %H:%M:%S') moved $file" >> "$LOG"
      fi
    done
  fi
  sleep 5
done
EOF

chmod +x /root/move_script.sh

# === Створюємо systemd service ===
cat << 'EOF' > /etc/systemd/system/move_daemon.service
[Unit]
Description=Move Daemon - moves files from folder1 to folder2
After=network.target

[Service]
ExecStart=/root/move_script.sh
Restart=always
User=root
Type=simple

[Install]
WantedBy=multi-user.target
EOF

# === Активуємо daemon ===
systemctl daemon-reload
systemctl enable move_daemon.service
systemctl start move_daemon.service 
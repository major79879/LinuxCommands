#!/bin/bash

# ==========================================
# Major Linux Commands Updater
# Developed by: John Kamel & Robin John
# ==========================================

GITHUB_URL="https://raw.githubusercontent.com/major79879/LinuxCommands/refs/heads/main/LinuxCommands.lst"
DEST_DIR="/media/hdd/ajpanel_backup"
DEST_PATH="${DEST_DIR}/LinuxCommands.lst"
TEMP_PATH="/tmp/LinuxCommands.lst"

# طباعة شعار MAJOR بـ ASCII Art
printf '%s\n' '==============================================='
printf '%s\n' '   __  __    ___         _     ___     ____    '
printf '%s\n' '  |  \/  |  / _ \       | |   / _ \   |  _ \   '
printf '%s\n' '  | |\/| | | |_| |      | |  | | | |  | |_) |  '
printf '%s\n' '  | |  | | |  _  |   _ _| |  | |_| |  |  _ <   '
printf '%s\n' '  |_|  |_| |_| |_|   \___/    \___/   |_| \_\  '
printf '%s\n' '   ____      ___     _   _    _____    _       '
printf '%s\n' '  |  _ \    / _ \   | \ | |  | ____|  | |      '
printf '%s\n' '  | |_) |  | |_| |  |  \| |  |  _|    | |      '
printf '%s\n' '  |  __/   |  _  |  | |\  |  | |___   | |___   '
printf '%s\n' '  |_|      |_| |_|  |_| \_|  |_____|  |_____|  '
printf '%s\n' '==============================================='
printf '%s\n' '         LINUX COMMANDS SCRIPT UPDATER         '
printf '%s\n' '            Developed by: John Kamel           '
printf '%s\n' '==============================================='

# التأكد من وجود المجلد الهدف
if [ ! -d "$DEST_DIR" ]; then
    echo "[*] Creating target directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

echo "[*] Fetching latest LinuxCommands from GitHub..."
wget -q --no-check-certificate "$GITHUB_URL" -O "$TEMP_PATH"

if [ $? -eq 0 ] && [ -s "$TEMP_PATH" ]; then
    # نقل الملف وتحديد الصلاحيات
    mv -f "$TEMP_PATH" "$DEST_PATH"
    chmod 644 "$DEST_PATH"
    
    echo "---------------------------------------------------------------------"
    echo "[✔] Update completed successfully!"
    echo "[✔] Saved to: $DEST_PATH"
    echo "====================================================================="
    echo "    Enjoy the updates! - By John Kamel & Robin John"
    echo "====================================================================="
else
    echo "---------------------------------------------------------------------"
    echo "[-] Error: Failed to download the update."
    echo "[-] Please check your internet connection or repository URL."
    echo "====================================================================="
    rm -f "$TEMP_PATH"
    exit 1
fi

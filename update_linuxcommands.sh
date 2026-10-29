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
echo "====================================================================="
echo "  __  __   _      _  ____  ____    ____      _    _   _ _____ _      "
echo " |  \/  | / \    | |/ __ \|  _ \  |  _ \    / \  | \ | | ____| |     "
echo " | |\/| |/ _ \_  | | |  | | |_) | | |_) |  / _ \ |  \| |  _| | |     "
echo " | |  | / ___ \ |_| |  | |  _ <  |  __/  / ___ \| |\  | |___| |___   "
echo " |_|  |_/_/   \_\___|\____/|_| \_\ |_|    /_/   \_\_| \_|_____|_____|"
echo "                                                                     "
echo "                  LINUX COMMANDS SCRIPT UPDATER                      "
echo "              Developed by: John Kamel & Robin John                  "
echo "====================================================================="

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

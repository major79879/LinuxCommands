#!/bin/bash

# ==========================================
# Script to update LinuxCommands.lst for AJPanel
# ==========================================

# 1. رابط الـ Raw الخاص بملفك على GitHub
GITHUB_URL="https://raw.githubusercontent.com/major79879/LinuxCommands/refs/heads/main/LinuxCommands.lst"

# 2. مسار الحفظ النهائي للملف على الجهاز
DEST_DIR="/media/hdd/ajpanel_backup"
DEST_PATH="${DEST_DIR}/LinuxCommands.lst"
TEMP_PATH="/tmp/LinuxCommands.lst"

echo "----------------------------------------"
echo "[*] Starting LinuxCommands.lst update..."
echo "----------------------------------------"

# التأكد من وجود المجلد الهدف وإذا لم يكن موجوداً يتم إنشاؤه
if [ ! -d "$DEST_DIR" ]; then
    echo "[*] Creating target directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# التحميل إلى مجلد مؤقت في /tmp للتأكد من نجاح التحميل قبل الاستبدال
wget -q --no-check-certificate "$GITHUB_URL" -O "$TEMP_PATH"

if [ $? -eq 0 ] && [ -s "$TEMP_PATH" ]; then
    echo "[+] Download successful from GitHub."
    
    # نقل الملف من التمب إلى المسار النهائي مع الاستبدال
    mv -f "$TEMP_PATH" "$DEST_PATH"
    
    # ضبط صلاحيات الملف
    chmod 644 "$DEST_PATH"
    
    echo "[✔] Update completed successfully!"
    echo "[i] Saved to: $DEST_PATH"
    echo "----------------------------------------"
else
    echo "[-] Error: Failed to download the file or file is empty."
    echo "----------------------------------------"
    rm -f "$TEMP_PATH"
    exit 1
fi
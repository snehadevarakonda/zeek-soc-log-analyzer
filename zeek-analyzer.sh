#!/bin/bash

#!/bin/bash

LOG_DIR="logs"

echo "=============================="
echo "   ZEEK SOC LOG ANALYZER"
echo "=============================="

# Safety check
if [ ! -d "$LOG_DIR" ]; then
  echo "[!] logs/ directory not found. Please place Zeek logs inside logs/"
  exit 1
fi

echo ""
echo "[+] Checking Port Scan Activity (conn.log)"
awk '{print $3, $6}' "$LOG_DIR/conn.log" | sort | uniq -c | sort -nr | head
echo ""

echo "[+] Checking Suspicious DNS Queries (dns.log)"
awk '{print $5}' "$LOG_DIR/dns.log" | sort | uniq -c | sort -nr
echo ""

echo "[+] Checking Risky File Downloads (http.log)"
grep -E "\.exe|\.zip|\.sh" "$LOG_DIR/http.log" || echo "No risky downloads found"
echo ""

echo "[+] Checking Encrypted Suspicious Traffic (ssl.log)"
awk '{print $6, $7}' "$LOG_DIR/ssl.log" | sort | uniq
echo ""

echo "[+] Zeek Notices (notice.log)"
cat "$LOG_DIR/notice.log"
echo ""

echo "=============================="
echo " Analysis Complete"
echo "=============================="


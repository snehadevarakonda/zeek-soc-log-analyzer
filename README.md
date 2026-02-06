# Zeek SOC Log Analyzer

A beginner-friendly SOC tool that analyzes Zeek network logs to detect suspicious activities such as port scanning, suspicious DNS queries, risky file downloads, and encrypted traffic patterns.

## Features
- Port scan detection using conn.log
- Suspicious DNS query analysis
- Risky HTTP file download detection
- Encrypted traffic visibility via SSL logs
- Zeek notice review

## Tools Used
- Bash
- awk
- grep
- Zeek log formats

## How to Run
```bash
chmod +x zeek-analyzer.sh
./zeek-analyzer.sh

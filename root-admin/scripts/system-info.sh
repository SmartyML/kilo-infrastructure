#!/bin/bash
set -u

echo "========================================"
echo " SYSTEMINFORMATIONEN"
echo "========================================"

echo
echo "--- Hostname / OS ---"
hostnamectl 2>/dev/null || hostname
cat /etc/os-release 2>/dev/null || true
uname -a

echo
echo "--- CPU / RAM ---"
nproc 2>/dev/null || true
free -h 2>/dev/null || true

echo
echo "--- Dateisysteme ---"
df -hT 2>/dev/null || true

echo
echo "--- Netzwerk ---"
ip -brief address 2>/dev/null || true
ip route 2>/dev/null || true

echo
echo "--- DNS ---"
cat /etc/resolv.conf 2>/dev/null || true

echo
echo "--- SSH ---"
systemctl --no-pager --full status ssh 2>/dev/null | sed -n '1,12p' || true

echo
echo "--- Zeit ---"
timedatectl 2>/dev/null || true

#!/bin/bash

echo -e "\n⚡ Boosting system performance (No Limit Mode)..."

# Bersihkan RAM Cache
sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null

# Matikan limit file system sementara biar proses IO lebih cepat
ulimit -n 999999 2>/dev/null
ulimit -u 999999 2>/dev/null

echo -e "✅ System fully optimized for maximum performance!"

# Service yang ingin direstart
services=(nginx ssh dropbear paradis sketsa drawit)

echo -e "\n🔄 Starting safe restart sequence for Xray services...\n"

for svc in "${services[@]}"; do
    echo "🚀 Restarting $svc ..."
    systemctl restart "$svc"
    sleep 3

    status=$(systemctl is-active "$svc")
    if [[ "$status" == "active" ]]; then
        echo "✅ $svc : Active"
    else
        echo "❌ $svc : Failed"
    fi
    echo "-----------------------------------------"
    sleep 1
done

echo -e "\n✨ All checks completed. ✨"

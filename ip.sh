#!/bin/bash

NETPLAN_DIR="/etc/netplan"

cd "$NETPLAN_DIR" || exit 1

FILE=$(ls *.yaml 2>/dev/null | head -1)
if [ -z "$FILE" ]; then
  FILE=$(ls *.yml 2>/dev/null | head -1)
fi
if [ -z "$FILE" ]; then
  FILE="00-installer-config.yaml"
fi

cat > "$FILE" <<EOF
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses:
        - 192.168.145.10/24
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
EOF

netplan apply
echo "Netplan configuration applied to $FILE"

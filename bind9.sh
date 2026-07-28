#!/bin/bash

cd /etc/bind || exit 1

cat > db.127 << 'EOF'
; BIND reverse data file for local loopback interface
;
$TTL    604800
@       IN      SOA     zidan.local. root.zidan.local. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      zidan.local.
10      IN      PTR     zidan.local.
EOF

cat > db.local << 'EOF'
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     zidan.lcoal. root.zidan.lcoal. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      zidan.lcoal.
@       IN      A       192.168.145.10
www     IN      A       192.168.145.10
EOF

cat > named.conf.default-zones << 'EOF'
// prime the server with knowledge of the root servers
zone "." {
        type hint;
        file "/usr/share/dns/root.hints";
};

// be authoritative for the localhost forward and reverse zones, and for
// broadcast zones as per RFC 1912

zone "zidan.local" {
        type master;
        file "/etc/bind/db.local";
};

zone "145.168.192.in-addr.arpa" {
        type master;
        file "/etc/bind/db.127";
};

zone "0.in-addr.arpa" {
        type master;
        file "/etc/bind/db.0";
};

zone "255.in-addr.arpa" {
        type master;
        file "/etc/bind/db.255";
};
EOF

sed -i 's/nameserver.*/nameserver 192.168.145.10/' /etc/resolv.conf

systemctl restart bind9
echo "Bind9 configuration updated, resolv.conf set, and service restarted."

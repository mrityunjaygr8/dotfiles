echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -i enp3s0 -j ACCEPT
iptables -A FORWARD -i wlo1   -j ACCEPT
iptables -t nat -A POSTROUTING -o wlo1   -j MASQUERADE
iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE

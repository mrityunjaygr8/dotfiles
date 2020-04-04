echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -i enp3s0 -o wlo1 -j ACCEPT
iptables -A FORWARD -i wlo1 -o enp3s0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE

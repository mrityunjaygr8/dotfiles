ssh -M -L 5904:127.0.0.1:5904 -C -fNT -l deb 172.16.0.2
vncviewer localhost:5904
ssh -O exit -l deb 172.16.0.2

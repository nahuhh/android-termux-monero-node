#!/bin/bash
apt install wget nano -y
wget -O p2pool.tar.gz https://github.com/SChernykh/p2pool/releases/download/v1.8/p2pool-v1.8-linux-aarch64.tar.gz
mkdir p2pool
tar --one-top-level=p2pool/ --strip-components=1 --keep-newer-files -xvf p2pool.tar.gz
echo 'YourAddress
# Address must begin with 4
# END to move cursor to the end
# ALT backspace to delete YourAddress
# Tap and hold to paste your actual address
# To save: Ctrl - x - y - enter' > walletaddress.xmr
cat << 'EOF' > startp2pool
#!/bin/bash
./p2pool/p2pool \
--host 127.0.0.1 \
--rpc-port 18081
--stratum 127.0.0.1:3333 \
--loglevel 0 \
--mini \
--no-randomx \
--wallet \
EOF
nano walletaddress.xmr
cat < walletaddress.xmr >> startp2pool
chmod +x startp2pool
echo
'


			To start p2pool, type:


			    ./startp2pool'

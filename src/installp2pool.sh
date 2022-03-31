#!/bin/bash
# Check for existing install. Skip if necessary
mkdir -p p2pool && cd p2pool
if [ ! -e p2pool-v1.9.tar.gz ]
then
apt install wget nano -y
wget -O p2pool-v1.9.tar.gz https://github.com/SChernykh/p2pool/releases/download/v1.9/p2pool-v1.9-linux-aarch64.tar.gz
tar --one-top-level=p2pool-v1.9/ --strip-components=1 --keep-newer-files -xvf p2pool-v1.9.tar.gz
else
echo P2Pool is already installed
fi
cd

# Input user wallet address
echo "

Tap & Hold to paste your Monero address."
ADDRESS="USER INPUT"
read -p "Wallet Address: " ADDRESS

# Create start script
cat << EOF > startp2pool
#!/bin/bash
./p2pool/p2pool-v1.9/p2pool \
--host 127.0.0.1 \
--rpc-port 18081 \
--stratum 0.0.0.0:3333 \
--loglevel 1 \
--mini \
--no-randomx \
--wallet \
$ADDRESS
EOF

# Finish up
chmod +x startp2pool
echo
'


			To start p2pool, type:


			    ./startp2pool'

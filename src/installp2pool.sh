#!/bin/bash
rm -rf p2pool/build
if [ ! -e monero-cli/p2pool/p2pool ]
then 
pkg install git nano build-essential cmake libuv libzmq libcurl -y
git clone --recursive https://github.com/SChernykh/p2pool
cd p2pool
mkdir build && cd build
cmake ..
make
cd
rm -rf monero-cli/p2pool
else
cd p2pool
git pull
cd build
cmake ..
make
cd
rm -rf monero-cli/p2pool
fi

mv p2pool/build monero-cli/p2pool

# Input user wallet address
echo "
1. Copy your Main (4xxx..) address
2. Tap & Hold to paste
3. Press enter to confirm"
ADDRESS="USER INPUT"
read -p "Wallet Address: " ADDRESS

# Create start script
cat << EOF > Start\ P2Pool
#!/bin/bash
./monero-cli/p2pool/p2pool \
--host 127.0.0.1 \
--rpc-port 18081 \
--stratum 0.0.0.0:3333 \
--mini \
--no-randomx \
--no-autodiff \
--wallet \
$ADDRESS
EOF

# Finish up
chmod +x Start\ P2Pool
mv Start\ P2Pool .shortcuts/
echo "P2Pool install finished"
sleep 1

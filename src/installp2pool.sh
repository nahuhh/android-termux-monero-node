#!/bin/bash
apt install wget nano -y
wget -O p2pool.tar.gz https://github.com/SChernykh/p2pool/releases/download/v1.8/p2pool-v1.8-linux-aarch64.tar.gz
mkdir p2pool
tar --one-top-level=p2pool/ --strip-components=1 --keep-newer-files -xvf p2pool.tar.gz
touch startp2pool
echo "#!/bin/bash

# Enter your wallet address below

./p2pool/p2pool --wallet YOURWALLETADDRESS --host 127.0.0.1 --mini --no-randomx" > startp2pool
chmod +x startp2pool
nano startp2pool
echo
'


			To start p2pool, type:


			    ./startp2pool

Tip: press tab to autofill  (type "./sta{tab}" etc) 
'

#!/bin/bash
apt install wget
wget -O p2pool.tar.gz https://github.com/SChernykh/p2pool/releases/download/v1.8/p2pool-v1.8-linux-aarch64.tar.gz
mkdir p2pool
tar --one-top-level=p2pool/ --strip-components=1 --keep-newer-files -xvf p2pool.tar.gz
echo "


			Run p2pool using


./p2pool/p2pool --host 127.0.0.1 --wallet YOURWALLETADDRESS --mini


"

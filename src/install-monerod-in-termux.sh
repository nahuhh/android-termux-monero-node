#!bin/bash
CHOOSE=$(termux-dialog radio -t "Choose which version" -v "Tor,Clearnet" | jq -r ".text")
if [ $CHOOSE = "Tor" ]
then
echo "Selected Tor"
sleep 2
sh -c "$(curl -fsSL https://github.com/nahuhh/android-termux-monero-node/raw/master-beta-tor/src/install-monerod-in-termux.sh)"
elif [ $CHOOSE = "Clearnet" ]
then
echo "Selected Clearnet"
sleep 2
sh -c "$(curl -fsSL https://github.com/nahuhh/android-termux-monero-node/raw/master-beta/src/install-monerod-in-termux.sh)"
else
echo "Install aborted!"
fi

#!/data/data/com.termux/files/usr/bin/bash 

## Install Ubuntu
apt update
apt upgrade -y
apt install wget proot git
cd
git clone https://github.com/MFDGaming/ubuntu-in-termux.git
cd ubuntu-in-termux
chmod +x ubuntu.sh
./ubuntu.sh -y

## Create Ubuntu start widget 
cat << EOF >  ../.shortcuts/Start\ Ubuntu
#!/data/data/com.termux/files/usr/bin/bash
cd
./ubuntu-in-termux/startubuntu.sh 

EOF

## Start Ubuntu
./startubuntu.sh

#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  installing necessary components         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
apt update && apt upgrade -y
apt-get install locate python dos2unix aria2 curl sudo zip htop psmisc ffmpeg libavcodec57 libavutil55 libavfilter6 libavformat57 mysql-server libmysqlclient20 -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
wget -O /usr/local/bin/speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x /usr/local/bin/speedtest-cli
echo " "
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
#
wget -O /usr/local/bin/mpegtv http://infosat.org/mpegtv/files/mpegtv
chmod 755 /usr/local/bin/mpegtv
wget -O /usr/local/bin/slave http://infosat.org/mpegtv/files/slave
chmod 755 /usr/local/bin/slave
mkdir /var/mpegtv
cd /var/mpegtv
wget http://infosat.org/mpegtv/files/mpegtv-data.tgz
tar -xzf mpegtv-data.tgz
#
#
echo -e "${jeshile}	┌────────────────────────────────────────────────────────────────────────┐	\e[0m"
echo -e "${jeshile}	│[R] Getting MpegTv Informations                                         │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter Master Port : "  masterport
read -p "Enter Slave Port : "  slaveport
echo "CONTROL PORT: $masterport" >>/var/mpegtv/mpegtv.cfg
echo "CONTROL PORT: $slaveport" >>/var/mpegtv/slvod.cfg
echo " "
echo -e "${jeshile} ┌────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] installation Completed                      │ \e[0m"
echo -e "${jeshile} └────────────────────────────────────────────────┘ \e[0m"
sleep 8
# reboot
echo " "
echo -e "${jeshile} ┌─────────────────────────----┐ \e[0m"
echo -e "${jeshile} │[R] Please Reboot server...  │ \e[0m"
echo -e "${jeshile} └─────────────────────────----┘ \e[0m"
echo " "
exit

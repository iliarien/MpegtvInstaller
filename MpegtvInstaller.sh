#!/bin/bash
function main {
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  installing necessary components         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
apt update && apt upgrade -y
apt-get install ffmpeg libavcodec57 libavutil55 libavfilter6 libavformat57 mysql-server libmysqlclient20 -y
echo " "
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "

wget -O /usr/local/bin/mpegtv http://infosat.org/mpegtv/files/mpegtv
chmod 755 /usr/local/bin/mpegtv
mkdir /var/mpegtv
cd /var/mpegtv
wget http://infosat.org/mpegtv/files/mpegtv-data.tgz
tar -xzf mpegtv-data.tgz
echo -e "${jeshile}	┌────────────────────────────────────────────────────────────────────────┐	\e[0m"
echo -e "${jeshile}	│[R] Getting MpegTv Informations                                         │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter Main http Port : "  mainport
read -p "Enter mysql host : "  sqlhost
read -p "Enter mysql username : "  sqluser
read -p "Enter mysql password : "  sqlpass
read -p "Enter mysql database : "  sqldatabase
echo "http port: $mainport
mysql server: $sqlhost
mysql username: $sqluser
mysql password: $sqlpass
mysql database: $sqldatabase
FILE IP2COUNTRY: \"/var/mpegtv/IpToCountry.csv\"" >>/var/mpegtv/mpegtv.cfg
echo "Staring Main With $mainport http port"
/usr/local/bin/mpegtv -b &
echo " "
}

function slave {
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  installing necessary components         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
apt update && apt upgrade -y
apt-get install ffmpeg libavcodec57 libavutil55 libavfilter6 libavformat57 -y
echo " "
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
wget -O /usr/local/bin/slave http://infosat.org/mpegtv/files/slave
chmod 755 /usr/local/bin/slave
echo -e "${jeshile}	┌────────────────────────────────────────────────────────────────────────┐	\e[0m"
echo -e "${jeshile}	│[R] Getting Slave Informations                                          │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter Slave http Port : "  slaveport
echo "Staring slave With $slaveport port"
/usr/local/bin/slave $slaveport &
echo " "
}

PS3="Votre choix : "

select item in "- Install Main -" "- Install Slave -" "- Quit -"
do
    for var in $REPLY; do
        echo "Vous avez choisi l'item $var : $item"
        case $var in
                1)
                        main
                        ;;
                2)
                        slave
                        ;;
                3)
                        echo "Fin du script"
                        exit 0
                        ;;
                *)
                        echo "Choix incorrect"
                        ;;
        esac
    done
done

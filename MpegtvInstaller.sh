#!/bin/bash
function main {
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  installing necessary components         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y
apt-get install ffmpeg libavcodec57 libavutil55 libavfilter6 libavformat57 mysql-server -y
wget "http://ftp.de.debian.org/debian/pool/main/m/mysql-5.7/libmysqlclient20_5.7.26-1_amd64.deb"
dpkg -i libmysqlclient20_5.7.26-1_amd64.deb 
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
mv /var/mpegtv/mpegtv.cfg /var/mpegtv/mpegtv.cfg.old
echo " "
read -p "Enter Main http Port : "  mainport
read -p "Enter mysql password : "  sqlpass
echo "http port: $mainport
mysql server: localhost
mysql username: root
mysql password: $sqlpass
mysql database: mpegtv
FILE IP2COUNTRY: \"/var/mpegtv/IpToCountry.csv\"" >>/var/mpegtv/mpegtv.cfg
echo "Staring Main With $mainport http port"
echo "
#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if ps x |grep -v grep |grep -c mpegtv >/dev/null
then
echo \"mpegtv... ok\"
else
echo \"mpegtv... restarting\"
/usr/local/bin/mpegtv &
fi

" >>/usr/local/bin/check
chmod 755 /usr/local/bin/check
echo "killall mpegtv
wget -O /usr/local/bin/mpegtv http://infosat.org/mpegtv/files/mpegtv 
chmod 755 /usr/local/bin/mpegtv
killall mpegtv
check
" >>/usr/local/bin/up
chmod 755 /usr/local/bin/up
echo "
*/1 *  * * *   root    /usr/local/bin/check > /dev/null" >>/etc/crontab

check

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
apt-get update && apt-get upgrade -y
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
echo -e "${jeshile}	│[R] Getting Slave Informations                                         │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter Slave http Port : "  slaveport
echo "Staring slave With $slaveport port"
echo "
#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if ps x |grep -v grep |grep -c slave >/dev/null
then
echo \"slave... ok\"
else
echo \"slave... restarting\"
/usr/local/bin/slave $slaveport &
fi

" >>/usr/local/bin/check
chmod 755 /usr/local/bin/check
echo "killall slave
wget -O /usr/local/bin/slave http://infosat.org/mpegtv/files/slave 
chmod 755 /usr/local/bin/slave
killall slave
check
" >>/usr/local/bin/up
chmod 755 /usr/local/bin/up

echo "
*/1 *  * * *   root    /usr/local/bin/check > /dev/null" >>/etc/crontab
echo " "
}

function slave_14 {
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  installing necessary components         │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y
apt-get install ffmpeg libavcodec57 libavutil55 libavfilter6 libavformat57 -y
echo " "
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
wget -O /usr/local/bin/slave http://infosat.org/mpegtv/files/slave_14
chmod 755 /usr/local/bin/slave
echo -e "${jeshile}	┌────────────────────────────────────────────────────────────────────────┐	\e[0m"
echo -e "${jeshile}	│[R] Getting Slave Informations                                         │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter Slave http Port : "  slaveport
echo "Staring slave With $slaveport port"
echo "
#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if ps x |grep -v grep |grep -c slave >/dev/null
then
echo \"slave... ok\"
else
echo \"slave... restarting\"
/usr/local/bin/slave $slaveport &
fi

" >>/usr/local/bin/check

chmod 755 /usr/local/bin/check
echo "killall slave
wget -O /usr/local/bin/slave http://infosat.org/mpegtv/files/slave_14
chmod 755 /usr/local/bin/slave
killall slave
check
" >>/usr/local/bin/up
chmod 755 /usr/local/bin/up
echo "
*/1 *  * * *   root    /usr/local/bin/check > /dev/null" >>/etc/crontab

check
echo " "
}

function conv {
echo " "
jeshile='\e[40;38;5;82m' #jeshile
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Downloanding Extracting And Installing  │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────┘ \e[0m"
echo " "
wget -O /usr/local/bin/xconv http://infosat.org/mpegtv/files/xconv
chmod 755 /usr/local/bin/xconv
echo -e "${jeshile}	┌────────────────────────────────────────────────────────────────────────┐	\e[0m"
echo -e "${jeshile}	│[R] Getting mysql Informations                                         │	\e[0m"
echo -e "${jeshile}	└────────────────────────────────────────────────────────────────────────┘	\e[0m"
echo " "
read -p "Enter mysql password : "  sqlpass
xconv -u root -p $sqlpass -d xtream_iptvpro > /var/mpegtv/database.sql
sleep 3
mysql -u root -p $sqlpass mpegtv < /var/mpegtv/database.sql
echo " "
}

PS3="Your Choice : "

select item in "- Install Main -" "- Install Slave Ubuntu 18 -" "- Install Slave Ubuntu 14 -""- Convert Database -" "- Quit -"
do
    for var in $REPLY; do
        echo "Y'ouve choosed $var : $item"
        case $var in
                1)
                        main
                        ;;
                2)
                        slave
                        ;;
                3)
                        slave_14
                        ;;
		4)
                        conv
                        ;;
		5)
                        echo "Fin du script"
                        exit 0
                        ;;
                *)
                        echo "Choix incorrect"
                        ;;
        esac
    done
done

#!/bin/bash


lightblue=`tput setaf 14` 
green=`tput setaf 46`     
RED=`tput setaf 196`      
yellow=`tput setaf 11`    
purple=`tput setaf 129`   
reset=`tput sgr0`
clear
echo -e "${yellow}    ____            ____      ____                        ___ _       _______"
echo -e "${yellow}   / __ )___  ___  / __/     / __ \_   _____  _____      /   | |     / / ___/"
echo -e "${yellow}  / __  / _ \/ _ \/ /_______/ / / / | / / _ \/ ___/_____/ /| | | /| / /\__ \ "
echo -e "${yellow} / /_/ /  __/  __/ __/_____/ /_/ /| |/ /  __/ /  /_____/ ___ | |/ |/ /___/ /" 
echo -e "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/\n"  
echo -e "${purple}		         	Github:AzizKpln"
echo -e "${purple}	 	         	Author:Aziz Kaplan"                                                    
echo -e "${purple}		         	Version:2.3\n"
if [[ $(whoami) == "root" ]];then
	echo -e "`tput setaf 196`[-]Please run this script without root privilages..\n\n~Beef Over Aws~"
	exit
fi
check=$(lsb_release -a) &>/dev/null
if [[ $(echo $check | cut -d ":" -f 2 | cut -d "D" -f 1) == " Ubuntu"  ]];then
	sudo apt update -y
	sudo apt install ubuntu-dev-tools -y
else
	sudo apt update -y
fi
sudo chown -R $(whoami):$(whoami) *
sudo chown -R $(whoami):$(whoami) ../Beef-Over-AWS/
echo ${green}
echo "Installing Beef.." 
echo "--------------------" && sleep 2
sudo apt install git -y
sudo apt-get install libsqlite3-dev -y
sudo apt-get install libcurl4-openssl-dev -y 
sudo apt install nodejs -y 
#Necessery Packages For Ubuntu Users
sudo apt install ruby -y
sudo apt install ruby-dev -y
sudo apt install apache2 -y
git clone https://github.com/beefproject/beef.git
sudo gem update
sudo gem install bundler
cd beef/ && bundle install
cd ../
sudo gem install sqlite3
sudo gem install curb -v '0.9.11' --source 'https://rubygems.org/' 
./beef/install
echo "Installing Ngrok.." 
echo "--------------------" 
sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok/ngrok-stable-linux-amd64.zip
unzip ngrok/ngrok-stable-linux-amd64.zip -d ngrok/
sudo rm ngrok/ngrok-stable-linux-amd64.zip
echo -e "${yellow}[+]${green}Please Input Your Authtoken/Lutfen Authtoken'ini Gir:\n\n"
echo -e "${yellow}[ENG]${lightblue}~${yellow}If you don't know what your authtoken is, please enter 'authtoken' or 'help'"
echo -e "${yellow}[TR]${lightblue}~${yellow}Eger Authtoken'ini bilmiyorsan lutfen 'authtoken' veya 'help' yaz ve enterla.\n\n"
read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" au
if [ $au == "authtoken" ] || [ $au == "help" ];then
	firefox https://www.youtube.com/watch?v=FFkF81r7yNA &> /dev/null &
	echo -e "\n${yellow}[ENG]${lightblue}~${yellow}Please Watch The Opened Video."
	echo -e "${yellow}[TR]${lightblue}~${yellow}Acilan Videoyu Izleyin.\n\n"
	
	echo -e "${yellow}[+]${green}Please Input Your Authtoken/Lutfen Authtoken'ini Gir:\n"
	read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" au
fi
./ngrok/ngrok authtoken $au
clear
echo -e "${yellow}    ____            ____      ____                        ___ _       _______"
echo -e "${yellow}   / __ )___  ___  / __/     / __ \_   _____  _____      /   | |     / / ___/"
echo -e "${yellow}  / __  / _ \/ _ \/ /_______/ / / / | / / _ \/ ___/_____/ /| | | /| / /\__ \ "
echo -e "${yellow} / /_/ /  __/  __/ __/_____/ /_/ /| |/ /  __/ /  /_____/ ___ | |/ |/ /___/ /" 
echo -e "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/\n\n"  
echo -e "${purple}		         	Github:AzizKpln"
echo -e "${purple}	 	         	Author:Aziz Kaplan"                                                    
echo -e "${purple}		         	Version:2.3\n"
echo -e "\n${green}Everything looks ok. You can run the script now."

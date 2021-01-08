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
echo -e "${purple}        \t\t\t\t\t\t<#Hackware Community#>\n"
echo -e "${purple}		         	Github:AzizKpln"
echo -e "${purple}	 	         	Aziz Kaplan"                                                    
echo -e "${purple}		         	Version:2.1\n"


if [[ $(whoami) == "root" ]];then
	echo -n "Please run this script with root privilages.."
        rm id.txt
	exit
fi

echo ${green}
echo "Installing Beef.." 
echo "--------------------" && sleep 2
sudo apt update -y
sudo apt-get install libsqlite3-dev -y
sudo apt-get install libcurl4-openssl-dev -y 
sudo apt install nodejs -y 
#For Ubuntu Users
sudo apt install ruby -y
sudo apt install ruby-dev -y
git clone https://github.com/beefproject/beef.git
sudo gem update
sudo gem install bundler
cd beef/ && bundle install
cd ../
sudo gem install sqlite3
sudo gem install curb -v '0.9.11' --source 'https://rubygems.org/'
echo "Installing Ngrok.." 
echo "--------------------" 
#v0.1-->wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ~/Downloads/ngrok-stable-linux-amd64.zip
#v0.1-->unzip ~/Downloads/ngrok-stable-linux-amd64.zip -d ngrok/
#v0.1-->./ngrok/ngrok authtoken 1lYgOsRpMcve44tMiL454zYa9fw_2Vgw3RtSWetiBC16RmDU9


#Install Python Module First
sudo apt install python3
sudo apt install python3-pip
pip3 install pyngrok
python3 ngrok/ngrok_install.py

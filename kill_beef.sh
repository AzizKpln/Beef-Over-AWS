lightblue=`tput setaf 14` 
green=`tput setaf 46`     
RED=`tput setaf 196`      
yellow=`tput setaf 11`    
purple=`tput setaf 129`   
reset=`tput sgr0`
clear
echo "${yellow}    ____            ____      ____                        ___ _       _______"
echo "${yellow}   / __ )___  ___  / __/     / __ \_   _____  _____      /   | |     / / ___/"
echo "${yellow}  / __  / _ \/ _ \/ /_______/ / / / | / / _ \/ ___/_____/ /| | | /| / /\__ \ "
echo "${yellow} / /_/ /  __/  __/ __/_____/ /_/ /| |/ /  __/ /  /_____/ ___ | |/ |/ /___/ /" 
echo "${yellow}/_____/\___/\___/_/        \____/ |___/\___/_/        /_/  |_|__/|__//____/"  
echo "${purple}	 	       #>Author:Aziz Kaplan"                                                    
echo "${purple}		       #>Github:AzizKpln"
echo "${purple}		       #>Version:1.1\n\n"

echo "${yellow}Killing Python:"
killall -9 python3 
echo "${yellow}Killing Ruby:"
killall -9 ruby
echo "${yellow}Killing Ngrok:"
killall -9 ngrok 

echo "${blue}\n\n~Everything Is Clear Now!~"

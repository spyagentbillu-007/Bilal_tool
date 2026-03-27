#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# Install packages
pkg install figlet toilet python neofetch curl nmap jq dnsutils -y

while true
do
clear

# Banner
echo -e "${BLUE}"
figlet "Mr.Bilal"
echo -e "${GREEN}"
toilet -f term -F border "Ethical | Learning | Pro"
echo -e "${YELLOW}"
echo "Code, Learn, Repeat... 🚀"
echo -e "${NC}"
echo "========================================"

# Menu
echo -e "${CYAN}Select Option:${NC}"
echo "1. Network Scanner"
echo "2. Port Scanner (Advanced)"
echo "3. IP Info Lookup"
echo "4. IP Tracer"
echo "5. Website Info"
echo "6. HTTP Header Analyzer"
echo "7. DNS Lookup"
echo "8. Hash Generator"
echo "9. System Info"
echo "10. Exit"
echo ""

read -p "Enter choice: " choice

case $choice in

1)
read -p "Enter IP Range: " target
nmap -sn $target
;;

2)
read -p "Enter Target IP/Domain: " target
nmap -sS -sV -T4 $target
;;

3)
read -p "Enter IP/Domain: " ip
curl ipinfo.io/$ip
;;

4)
read -p "Enter IP: " ip
curl ipinfo.io/$ip | jq
;;

5)
read -p "Enter Website: " site
curl -s "https://api.hackertarget.com/hostsearch/?q=$site"
;;

6)
read -p "Enter Website URL: " site
curl -I $site
;;

7)
read -p "Enter Domain: " domain
nslookup $domain
;;

8)
echo "Enter text to hash:"
read text
echo -n $text | md5sum
echo -n $text | sha256sum
;;

9)
neofetch
;;

10)
echo -e "${RED}Exiting...${NC}"
break
;;

*)
echo "Invalid option"
;;

esac

echo ""
read -p "Press Enter to continue..."
done
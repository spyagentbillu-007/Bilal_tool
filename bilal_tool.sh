#!/bin/bash

# =================================
# 🔥 Bilal Ultimate Toolkit 🔥
# =================================

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

pkg install figlet toilet python neofetch curl nmap jq -y

while true
do
    clear
    # Banner
    echo -e "${BLUE}"
    figlet "Mr.Bilal"
    echo -e "${GREEN}"
    toilet -f term -F border "Learning | Ethical | Fun"
    echo -e "${YELLOW}"
    echo "Code, Learn, Repeat... 🚀"
    echo -e "${NC}"
    echo "========================================"
    echo ""

    # Menu
    echo -e "${CYAN}Select Option:${NC}"
    echo -e "1. Network Scanner 🌐"
    echo -e "2. Password Strength Checker 🔐"
    echo -e "3. System Info 💻"
    echo -e "4. IP Info Lookup 🕵️"
    echo -e "5. Website Info Lookup 🌐"
    echo -e "6. Geo IP Lookup 🌍"
    echo -e "7. IP Tracer 📍"
    echo -e "8. Exit 🚪"
    echo ""

    read -p "Enter choice: " choice

    case $choice in
    1)
        read -p "Enter target IP/range (e.g., 192.168.1.1/24): " target
        nmap -sP $target
        ;;
    2)
        python3 - << END
import re
password = input("Enter your password: ")
if len(password) < 6:
    print("Weak: Too short!")
elif not re.search(r"[A-Z]", password):
    print("Weak: Add uppercase letter")
elif not re.search(r"[0-9]", password):
    print("Weak: Add number")
elif not re.search(r"[!@#$%^&*]", password):
    print("Weak: Add special character")
else:
    print("Strong Password ✅")
END
        ;;
    3)
        neofetch
        echo -e "${YELLOW}"
        echo "CPU Info:"; cat /proc/cpuinfo | grep "model name" | head -1
        echo "Memory Info:"; free -h
        echo -e "${NC}"
        ;;
    4)
        read -p "Enter IP/Domain: " ip
        curl ipinfo.io/$ip
        ;;
    5)
        read -p "Enter Website URL: " site
        curl -s "https://api.hackertarget.com/hostsearch/?q=$site"
        ;;
    6)
        read -p "Enter IP Address: " geoip
        curl -s https://ipapi.co/$geoip/json/ | jq
        ;;
    7)
        read -p "Enter IP Address: " tracerip
        data=$(curl -s https://ipinfo.io/$tracerip/json)
        ip=$(echo $data | jq -r '.ip')
        city=$(echo $data | jq -r '.city')
        region=$(echo $data | jq -r '.region')
        country=$(echo $data | jq -r '.country')
        org=$(echo $data | jq -r '.org')
        loc=$(echo $data | jq -r '.loc')
        echo -e "${YELLOW}IP: $ip"
        echo "City: $city"
        echo "Region: $region"
        echo "Country: $country"
        echo "Organization: $org"
        echo "Location (lat,long): $loc"
        echo "Google Maps: https://www.google.com/maps?q=$loc${NC}"
        ;;
    8)
        echo -e "${RED}Exiting Bilal Ultimate Toolkit...${NC}"
        break
        ;;
    *)
        echo -e "${RED}Invalid Option ❌${NC}"
        ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
done
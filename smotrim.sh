#!/bin/bash

function vpn_connect {
clear
echo "                              Connect to Proton VPN"
echo ""
sudo protonvpn c -f
}
function  vpn_disconnect {
clear
echo "                              Disconnect Proton VPN"
echo ""
sudo protonvpn d
}
function smotrim { 
clear 
echo "                              Smotrim.ru"
echo "" 
firefox https://smotrim.ru
}
function menu {
clear
echo ""
echo " ==========================================="
echo " |                Smotrim                  |"
echo " ==========================================="
echo " |                                         |"
echo -e " |\t1) Connect                         |"
echo -e " |\t2) Disconnect                      |"
echo -e " |\t3) Run Smotrim.ru in Firefox       |"
echo -e " |\te) Exit                            |"
echo " |                                         |"
echo " ==========================================="
echo
echo -en " Your choice: "
read -n 1 option
}
while [ $? -ne 1 ]
do
        menu
        case $option in
e)
        break ;;
1)
        vpn_connect ;;
2)
        vpn_disconnect ;;
3)
        smotrim ;;
*)
        clear
echo " Please select the correct variant in Menu! ";;
esac
echo -en "\n\n\t\t\tPress any key to continue!"
read -n 1 line
9
done
clear


#!/bin/bash
function vpn_info {
clear
echo "                              How to install Proton VPN"
echo ""
echo " From: https://github.com/Rafficer/linux-cli-community/blob/master/USAGE.md"
echo ""
echo " If you want to uninstall ProtonVPN-CLI, run protonvpn configure"
echo "sudo pip3 uninstall protonvpn-cli"
}
function vpn_install {
clear
echo "                              Install Proton VPN"
echo ""
sudo apt install -y openvpn dialog python3-pip python3-setuptools
pip3 install protonvpn-cli
pip3 install protonvpn-cli --upgrade
}
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
function vpn_status { 
clear 
echo "                              Proton VPN status"
echo "" 
sudo protonvpn s
}
function check_ip {
clear
echo "                              Check IP and country"
echo ""
sudo install curl -y 
curl ipinfo.io
}
function speedtest {
clear
echo "                              Check connection speed"
echo ""
pip3  install speedtest-cli -y
speedtest-cli --version
speedtest-cli
}
function menu {
clear
echo ""
echo " ==========================================="
echo " |            Proton VPN                   |"
echo " ==========================================="
echo " |                                         |"
echo -e " |\t1) How to install Proton VPN       |"
echo -e " |\t2) Install Proton VPN              |"
echo -e " |\t3) Connect                         |"
echo -e " |\t4) Disconnect                      |"
echo -e " |\t5) Status                          |"
echo -e " |\t6) Check IP                        |"
echo -e " |\t7) Speed Test                      |"
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
        vpn_info ;;
2)
        vpn_install ;;
3)
        vpn_connect ;;
4)
        vpn_disconnect ;;
5)
        vpn_status ;;
6)
	check_ip ;;
7)
	speedtest ;;	
*)
        clear
echo " Please select the correct variant in Menu! ";;
esac
echo -en "\n\n\t\t\tPress any key to continue!"
read -n 1 line
9
done
clear


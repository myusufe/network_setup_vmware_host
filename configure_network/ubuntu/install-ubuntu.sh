#!/bin/sh


echo "Please, enter IP Address : "
read ipaddress
echo "Please, enter Domain name : "
read domainname
echo "Please, enter Hostname : "
read hostname
echo "Please, enter NetMask IP Address : "
read netmask
echo "Please, enter Network IP Address : "
read network
echo "Please, enter Broadcast IP Address : "
read broadcast
echo "Please, enter Gateway IP Address :"
read gateway
echo "Please, enter DNS IP Address 1 :"
read dns1
echo "Please, enter DNS IP Address 2 :"
read dns2
echo "Please, enter DNS IP Address 2 :"
read dns3

echo -e "\taddress=${ipaddress}" >> interface
echo -e "\tnetmask=${netmask}" >> interface
echo -e "\tnetwork=${network}" >> interface
echo -e "\tbroadcast=${broadcast}" >> interface
echo -e "\tgateway=${gateway}" >> interface
echo -e "\tdns-nameserver ${dns1} ${dns2} ${dns3}" >> interface
echo -e "\tdns-search ${domainname}" >> interface
echo "${hostname}" >> /etc/hostname

cp interface /etc/network/

/etc/init.d/networking restart

echo "check your setting on /etc/network/interface"
echo "If you ready, please reboot the server now!"
echo ""

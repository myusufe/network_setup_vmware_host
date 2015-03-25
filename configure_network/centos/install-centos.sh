#!/bin/sh

uuid=`uuidgen`
hwaddr=`ip addr | awk '/ether/ {print $2}'`

echo "UUID=${uuid}" >> ifcfg-eth0
echo "HWADDR=${hwaddr}" >> ifcfg-eth0

echo "Please, enter IP Address : "
read ipaddress
echo "Please, enter Gateway IP Address :"
read gateway

echo "GATEWAY=${gateway}" >> /etc/sysconfig/network
echo "IPADDR=${ipaddress}" >> ifcfg-eth0

cp ifcfg-eth0 /etc/sysconfig/network-scripts/


chkconfig network on
systemctl disable firewalld
systemctl stop firewalld

systemctl disable NetworkManager
systemctl stop NetworkManager

echo "Please check the /etc/sysconfig/network file at GATEWAY ip address setting."
echo "If you ready, please reboot the server now!"
echo ""

#!/bin/sh
PREFIX="FTR"
MAC=$(ip link |grep ether | tr -d ":" | awk '{print $2}' | tr '[:lower:]' '[:upper:]'| head -n 1 )
IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
MACP1=${MAC:0:6}
MACP2=${MAC:6:11}
DOM=".STORE.INDITEX.GRP"
HN=$PREFIX$MACP2$MACP1
HNDOM=$PREFIX$MACP2$MACP1$DOM
CURRENT_HOSTNAME=$(cat /proc/sys/kernel/hostname)

echo "$HN"
echo "$HNDOM"
echo "$HNDOM"> "/etc/hostname"

IPL="127.0.1.1"
if [ -n "$(grep $IPL /etc/hosts)" ]
        then
            sudo sed -i '/127.0.1.1/d' /etc/hosts;
            sudo -- sh -c -e "echo '127.0.1.1       $HN' >> /etc/hosts";
        else
            sudo -- sh -c -e "echo '127.0.1.1       $HN' >> /etc/hosts";
fi

if [ -n "$(grep $IP /etc/hosts)" ]
        then
            sudo sed -i "/$IP/d" /etc/hosts;
            sudo -- sh -c -e "echo '$IP       $HN $HNDOM' >> /etc/hosts";
        else
            sudo -- sh -c -e "echo '$IP       $HN $HNDOM' >> /etc/hosts";
fi
hostname $HNDOM
hostnamectl set-hostname $HNDOM



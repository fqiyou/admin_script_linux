#!/bin/bash
# update ip
# Run as : root
# Writer : Y
# Mail : yc@fqiyou.com
DIR="/etc/sysconfig/network-scripts/ifcfg-eth0"
U_IPADDR="192.168.20.21"
U_NETMASK="255.255.255.0"
IPADDR=$(cat ${DIR}|grep -v \#|grep "IPADDR="|awk 'BEGIN {FS="="} {print $2}')
if [ ! "${IPADDR}" == ${U_IPADDR} ]; then
    ROWID=$(cat -n ${DIR}|grep -v \#|grep "IPADDR="|awk 'BEGIN {FS=" "} {print $1}')
    sed -i "${ROWID} s/${IPADDR}/${U_IPADDR}/g" ${DIR}
fi
NETMASK=$(cat ${DIR}|grep -v \#|grep "NETMASK="|awk 'BEGIN {FS="="} {print $2}')
if [ ! "${NETMASK}" == ${U_NETMASK} ]; then
    ROWID=$(cat -n ${DIR}|grep -v \#|grep "NETMASK="|awk 'BEGIN {FS=" "} {print $1}')
    if [ -z "${NETMASK}" ]; then
        echo "NETMASK=${U_NETMASK}" >> $DIR
    else
        sed -i "${ROWID} s/${NETMASK}/${U_NETMASK}/g" ${DIR}
    fi
fi
service network reload



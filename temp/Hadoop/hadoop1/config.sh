#!/bin/sh

CHKSELINUX=$(cat /etc/selinux/config|grep -v \#|grep "SELINUX="|awk 'BEGIN {FS="="} {print $2}')

if [ ! "${CHKSELINUX}" == "disabled" ]; then
CHKSELINUXLINE=$(cat -n /etc/selinux/config|grep -v \#|grep "SELINUX="|awk 'BEGIN {FS=" "} {print $1}')
sed -i "${CHKSELINUXLINE} s/${CHKSELINUX}/disabled/g" /etc/selinux/config
fi


#!/bin/sh

# chmod sudoers
echo "chmod sudoers"

chmod u+w /etc/sudoers
rowid=$(cat -n /etc/sudoers|grep -v \#|grep "root"|awk 'BEGIN {FS=" "} {print $1}')
temp=$(cat /etc/sudoers|grep -v \#|grep "root")
rowid=$[$rowid+1]
sed -i " ${rowid}i\\${temp/root/hadoop}" /etc/sudoers

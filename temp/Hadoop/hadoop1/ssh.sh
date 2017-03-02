#!/bin/sh

# update ssh
echo "update ssh"

arr=("#RSAAuthentication" "#PubkeyAuthentication" "#AuthorizedKeysFile")

for i in ${arr[@]};
do
  rowid=$(cat -n /etc/ssh/sshd_config |grep "${i}"|awk 'BEGIN {FS=" "} {print $1}')
  temp=$(echo $i| awk 'BEGIN {FS="#"} {print $2}')
  sed -i "${rowid} s/${i}/${temp}/g" /etc/ssh/sshd_config
done
service sshd stop
service sshd start

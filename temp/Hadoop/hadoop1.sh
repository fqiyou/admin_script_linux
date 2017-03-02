#!/bin/sh

# update selinux/config file other -> disabled
echo " selinux/config file other -> disabled"
CHKSELINUX=$(cat /etc/selinux/config|grep -v \#|grep "SELINUX="|awk 'BEGIN {FS="="} {print $2}')
if [ ! "${CHKSELINUX}" == "disabled" ]; then
CHKSELINUXLINE=$(cat -n /etc/selinux/config|grep -v \#|grep "SELINUX="|awk 'BEGIN {FS=" "} {print $1}')
sed -i "${CHKSELINUXLINE} s/${CHKSELINUX}/disabled/g" /etc/selinux/config
fi

# add hosts
echo " add hosts fqiyou01,2,3"
cat>>/etc/hosts<< EOF1
# hadoop hosts
# Writer: Y
192.168.20.21 fqiyou01
192.168.20.22 fqiyou02
192.168.20.23 fqiyou03
EOF1
if (( $? == 0 ));then
        echo " hadoop hosts  add success"
else
        echo " hadoop hosts  add error"
fi

# stop iptables
echo " stop iptables! "
service iptables save
service iptables stop
chkconfig iptables off

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

#!/bin/sh

# user
group="hadoop"
user="hadoop"
PASSWORD="hadoop"
TEMP=1000
if [ -z "$( awk -F: '{print $1}' /etc/group |grep $group)" ]; then 
  groupadd -g $TEMP  $group
  echo " Add new group $group"
else
  echo " Group $group already existed" 
fi 

TEMP=2000
if [ -z "$( awk -F: '{print $1}' /etc/passwd |grep $user)" ]; then 
  useradd -u $TEMP -g $group $user
  echo $PASSWORD | passwd --stdin $user 
  echo " Add new user $user and passwd"
else
  echo " User $user already existed"
fi

  
# mkdir
dir="/app/hadoop"
echo "$dir"
mkdir -p ${dir}
chown -R hadoop:hadoop ${dir}



# chmod sudoers
echo "chmod sudoers"

chmod u+w /etc/sudoers
rowid=$(cat -n /etc/sudoers|grep -v \#|grep "root"|awk 'BEGIN {FS=" "} {print $1}')
temp=$(cat /etc/sudoers|grep -v \#|grep "root")
rowid=$[$rowid+1]
sed -i " ${rowid}i\\${temp/root/hadoop}" /etc/sudoers


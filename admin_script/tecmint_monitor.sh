#! /bin/bash

clear
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 baidu.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :" $tecreset $os

# Check OS Release Version and Name
echo -n -e '\E[32m'"OS Name :" $tecreset
cat /etc/system-release 

# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers 

# Check Logged In Users
echo -e '\E[32m'"Logged In users :" $tecreset 
who 

# Check RAM and SWAP Usages
echo -e '\E[32m'"Ram Usages :" $tecreset
free -h | grep -v +  | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" $tecreset
free -h | grep -v +  | grep -v "Mem"

# Check Disk Usages
echo -e '\E[32m'"Disk Usages :" $tecreset 
df -h| grep 'Filesystem\|/dev/sda*' 

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print  $12 $13 $14 }')
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadavdderage tecuptime


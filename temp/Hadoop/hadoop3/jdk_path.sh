#!/bin/sh
#Run as root

dir="/stage/hadoop/packages"

install_java_home="/usr/lib/java"


rowid=$(cat -n /etc/profile|grep -v \#|grep "unset i"|awk 'BEGIN {FS=" "} {print $1}')
rowid=$[$rowid-1]
sed -i " ${rowid}i\export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" /etc/profile
sed -i " ${rowid}i\export PATH=\$JAVA_HOME/bin:\$PATH" /etc/profile
sed -i " ${rowid}i\export JAVA_HOME=$install_java_home/jdk1.7.0_79" /etc/profile
sed -i " ${rowid}i\\# Writer: Y" /etc/profile
sed -i " ${rowid}i\\# add Java path" /etc/profile

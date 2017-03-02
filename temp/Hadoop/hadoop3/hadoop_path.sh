#!/bin/sh
#Run as root

dir="/stage/hadoop/packages"

install_java_home="/usr/lib/java"


rowid=$(cat -n /etc/profile|grep -v \#|grep "unset i"|awk 'BEGIN {FS=" "} {print $1}')
rowid=$[$rowid-1]


sed -i " ${rowid}i\export PATH=\$PATH:\$HADOOP_HOME/sbin:\$HADOOP_HOME/bin:\$HOME/bin:\$JAVA_HOME/bin:\$HOME/bin" /etc/profile

sed -i " ${rowid}i\export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native" /etc/profile

sed -i " ${rowid}i\export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop" /etc/profile

sed -i " ${rowid}i\export HADOOP_YARN_HOME=\$HADOOP_HOME" /etc/profile

sed -i " ${rowid}i\export YEAR_HOME=\$HADOOP_HOME" /etc/profile


sed -i " ${rowid}i\export HADOOP_HDFS_HOME=\$HADOOP_HOME" /etc/profile
sed -i " ${rowid}i\export HADOOP_COMMON_HOME=\$HADOOP_HOME" /etc/profile
sed -i " ${rowid}i\export HADOOP_MAPRED_HOME=\$HADOOP_HOME" /etc/profile
sed -i " ${rowid}i\export HADOOP_INSTALL_HOME=\$HADOOP_HOME" /etc/profile
sed -i " ${rowid}i\export HADOOP_HOME=/app/hadoop/hadoop-2.6.4" /etc/profile

sed -i " ${rowid}i\\# Writer: Y" /etc/profile
sed -i " ${rowid}i\\# add hadoop path" /etc/profile

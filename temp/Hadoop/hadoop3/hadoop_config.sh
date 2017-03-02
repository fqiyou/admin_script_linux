#!/bin/sh
#Run as root

dir="$HADOOP_CONF_DIR"


# core-site-site.xml
echo $dir/core-site-site.xml
rowid=$(cat -n $dir/core-site.xml|grep "</configuration>"|awk 'BEGIN {FS=" "} {print $1}')
echo "$rowid"



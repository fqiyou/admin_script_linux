#!/bin/sh
#Run as hadoop

dir="/stage/hadoop/packages"


# jdk
echo $dir
install_java_home="/usr/lib/java"

sudo chmod -R 777 $install_java_home
echo "$dir/jdk-7u79-linux-x64.tar.gz"
echo "$install_java_home/"

cp $dir/jdk-7u79-linux-x64.tar.gz $install_java_home/
cd $install_java_home
tar -xvf $install_java_home/jdk-7u79-linux-x64.tar.gz


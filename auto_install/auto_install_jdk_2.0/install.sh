#!/bin/bash
#   Copyright (C) 2017 All rights reserved.
#   Filename:install.sh
#   Author  :yangchao
#   Mail    :yc@fqiyou.com
#   Date    :2017-03-02
#   Describe:
#######################################################

INSTALL_DATE=`date +%Y%m%d`
COOKIES="--no-check-certificate --no-cookies --header Cookie:oraclelicense=accept-securebackup-cookie " 
LOG_NAME="auto_install_jdk_$INSTALL_DATE.log"
DOWN_DIR="/tmp/auto_install/$INSTALL_DATE/"

function add_var(){
	key=$1
	value="`grep $key build.properties|grep -v "export"|grep -v \#|awk '{print $2}'`"
	eval $key\=$value
	
}
function add_path(){
	path_dir="$HOME/.bash_profile" 
	row_num=$[`cat -n $path_dir|grep -v \#|grep "export PATH"|grep -v "export PATH="|awk 'BEGIN {FS=" "} {print $1}'`]  
	JAVA_HOME=$JAVA_HOME`ls $JAVA_HOME|awk '{print $1}'`
	tac ./build.properties|grep -v \#|grep "export"|while read line
	do
	    sed -i " ${row_num}i\\$line" $path_dir
	done
	# add author
	sed -i "${row_num}i\\export JAVA_HOME=$JAVA_HOME" $path_dir
	sed -i "${row_num}i\\\# mail: yc@fqiyou.com" $path_dir
	sed -i "${row_num}i\\\# Writer: Y" $path_dir
	sed -i "${row_num}i\\\# add Java path" $path_dir
	source ${path_dir}
}
function is_exit(){
	last_res=$1
	if [ "$last_res" -ne 0 ];then
		echo "error !!!! plase  "
		exit 1 
	fi
}
echo $ID
echo "-----------------------start_time--`date +%Y-%m-%d\ %T`-------------------------"
add_var JAVA_HOME
add_var JAVA_W_HOME
add_var JAVA_VERSION
JAVA_W_HOME=$COOKIES$JAVA_W_HOME
echo "-----------------------downfile--`date +%T`---------------------------"
rm -rf $DOWN_DIR && mkdir -p $DOWN_DIR
is_exit $?
echo "wait down file ....."
nohup wget -P $DOWN_DIR  $JAVA_W_HOME > $LOG_NAME 2>&1
is_exit $?
echo "-----------------------downfile--`date +%T`---------------------------"

echo "-----------------------tarfile--`date +%T`----------------------------"
JAR_NAME=`ls $DOWN_DIR`
mkdir -p $JAVA_HOME 
is_exit $?
echo "wait tar file ....."
nohup tar -zxvf $DOWN_DIR$JAR_NAME -C $JAVA_HOME >> $LOG_NAME 2>&1
is_exit $?
echo "-----------------------tarfile--`date +%T`---------------------------"
add_path
java -version
echo "-----------------------end_time--`date +%Y-%m-%d\ %T`-------------------------"

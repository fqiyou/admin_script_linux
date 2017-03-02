#!/bin/bash
# install jdk and path
# Run as: root
# Writer: Y
# mail: yc@fqiyou.com
# 2016-10-13

down_jdk()
{
    echo "-----------------------------"
    echo "down tar -- > packages  wait........"
    nohup wget -P packages/ http://oexsq013r.bkt.clouddn.com/linux_soft/jdk-7u79-linux-x64.tar.gz  >> $LOG 2>&1
    echo "down tar -- > packages  ok........"
}
tar_jdk()
{
  JDK_HOME=$(cat ./conf/build.properties|grep -v \#|grep "JDK_HOME="|awk 'BEGIN {FS="="} {print $2}')
  #echo $JDK_HOME
  JAVA_INSTALL_HOME=$(cat ./conf/build.properties|grep -v \#|grep "JAVA_INSTALL_HOME="|awk 'BEGIN {FS="="} {print $2}')
  #echo $JAVA_INSTALL_HOME
  echo "tar -- > /usr/lib/java  wait........"
  if [ ! -d $JAVA_INSTALL_HOME ];then
      mkdir -p $JAVA_INSTALL_HOME
  fi
  nohup tar -zxvf $JDK_HOME -C $JAVA_INSTALL_HOME >> $LOG 2>&1
  echo "tar -- > /usr/lib/java  ok!!........"
}
path_java()
{
  dir="/etc/profile"
  rowid=$[$(cat -n /etc/profile|grep -v \#|grep "unset i"|awk 'BEGIN {FS=" "} {print $1}')-1]
  cat ./conf/build.properties|grep -v \#|grep "export"|while read line
  do
    sed -i " ${rowid}i\\$line" $dir
  done
  sed -i " ${rowid}i\\# mail: yc@fqiyou.com" $dir
  sed -i " ${rowid}i\\# Writer: Y" $dir
  sed -i " ${rowid}i\\# add Java path" $dir
  source ${dir}
  echo "path add success"
  echo "path add to /etc/profile" >> $LOG
  java -version
}



LOG="log/$(date +%Y%m_%d_%H%M).log"
down_jdk;
tar_jdk;
path_java;

echo "log:${LOG}"
echo $v1



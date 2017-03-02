#!/bin/sh

# vi /etc/hosts

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

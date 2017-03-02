### 设置服务器的HOSTNAME

---

#### 手动HOSTNAME

        vi /etc/sysconfig/network

#### shell 修改HOSTNAME
  
        # update hostname
        # Run as : root
        # Writer : Y
        # Mail : yc@fqiyou.com
        DIR="/etc/sysconfig/network"
        U_HOSTNAME="fqiyou01"
        HOSTNAME=$(cat ${DIR}|grep -v \#|grep "HOSTNAME="|awk 'BEGIN {FS="="} {print $2}')
        if [ ! "${HOSTNAME}" == ${U_HOSTNAME} ]; then
            ROWID=$(cat -n ${DIR}|grep -v \#|grep "HOSTNAME="|awk 'BEGIN {FS=" "} {print $1}')
            sed -i "${ROWID} s/${HOSTNAME}/${U_HOSTNAME}/g" ${DIR}
        fi



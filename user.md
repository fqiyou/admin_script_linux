
# linux 常用命令  
--- 

[README.md](../README.md) 

## 用户管理

### 查看当前用户

        w     # 显示谁在系统中,在干什么
![user001-w](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/w.png)

        id    # 显示当前用户信息
![user001-id](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/id.png)

        who   # 列出当前在系统中登录用户
![user001-who](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/who.png)

        users    # 列出当前登录用户
![user001-users](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/users.png)

        whoami    # 列出用户当前登录的主机账户名  
![user001-whoami](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/whoami.png)

### 创建用户与更改密码

        useradd fqiyou    # 创建用户fqiyou
        passwd fqiyou     # 给fqiyou设置密码
![user001-useradd](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/useradd.png)

        su - fqiyou    # 切换fqiyou用户
        su -     # 切换root用户
![user001-su](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/su.png)

        userdel fqiyou    # 删除用户,但不删除用户的目录
        ls /home/
        rm -rf /home/fqiyou
        ls /var/spool/mail      
        rm -rf /var/spool/mail/fqiyou  
![user001-userdel](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/userdel.png)

        groupadd -g 501 qiyou
        groupdel qiyou
![user001-group](http://oexsq013r.bkt.clouddn.com/hadoop/linux/user/group.png)

---

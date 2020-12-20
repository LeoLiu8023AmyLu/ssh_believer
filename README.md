# 批量实现多台服务器之间ssh无秘钥通信 

## 脚本简介
无密钥通信自动化部署脚本主要分为三大块:
* `believe.sh` : 主运行函数
* `sshkeygen.exp` : ssh秘钥生成函数
* `sshcopy.exp` : ssh 秘钥复制 及 sshkeygen.exp脚本 复制

## 脚本使用方法
1. 运行环境：(Centos 系统) 本地需要先安装好 expect，安装命令为： `yum install -y expect` （脚本中已添加，无需额外执行）；
2. `believe.sh` , `sshcopy.exp` , `sshkeygen.exp` 三个文件需增加可执行权限。`chmod +x *.sh *.exp` ；
3. `sshcopy.exp` 文件的第七行需要注意,根据自己的情况进行是否注释。一般情况**不需要注释**直接运行；
4. 脚本中的 expect脚本 均开启了调试参数，可不开启。 将 `sshkeygen.exp` 与 `sshcopy.exp` 文件首行的  `#!/usr/bin/expect -d` 改为 `#!/usr/bin/expect`
5. hosts 文件中保存了需要无密钥通信的服务器信息，每行为一组信息，记录了服务器的 ip地址:用户名:密码 `host_ip:user_name:password`
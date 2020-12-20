## 批量实现多台服务器之间ssh无秘钥通信 

主要是分为三大块:
* believe.sh 主运行函数
* sshcopy.exp ssh 及 脚本复制函数
* sshkeygen.exp ssh秘钥生成函数

1. 运行环境：(Centos 系统) 本地需要先安装好 expect `yum install -y expect` 
2. believe.sh ,sshcopy.exp ,sshkeygen.exp 三个文件都要具有可执行权限。`chmod +x *.sh *.exp`
3. sshcopy.exp文件的第七行需要注意,根据自己的情况进行是否注释。**不需要注释**
4. 这里的expect脚本都开启了调试参数，可不开启。
5. hosts 文件中保存了 ip地址:用户名:密码 `host_ip:user_name:password`
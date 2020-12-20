#!/bin/bash
# 安装 expect 工具
yum install expect -y
# 检查本地是否有密钥文件，没有则添加。
./sshkeygen.exp
# 循环取出ip和密码
for i in $(cat ./hosts )
do
	#取出 ip 用户名 密码
	IP=$(echo "${i}" |awk -F":" '{print $1}')
	USER=$(echo "${i}" |awk -F":" '{print $2}')
	PW=$(echo "${i}" |awk -F":" '{print $3}')
	# 将本地的公钥复制到远程主机
	./sshcopy.exp $IP $USER $PW
	# 远程主机安装expect
	ssh $USER@$IP "yum install expect -y "
	# 远程主机创建密钥文件
	ssh $USER@$IP "~/sshkeygen.exp&"
	# 将远程主机的公钥添加到本地authorized_keys文件
	ssh $USER@$IP "cat ~/.ssh/*.pub" >> ~/.ssh/authorized_keys

done

# 将本地的公钥复制到远程主机
for i in $(cat ./hosts)
do
	# 获取 ip 用户名
	IP=$(echo "${i}" |awk -F":" '{print $1}')
	USER=$(echo "${i}" |awk -F":" '{print $2}')
	# 将本地主机的公钥文件 复制到 其他机器中 
	scp ~/.ssh/authorized_keys $USER@$IP:~/.ssh/authorized_keys
	scp ~/.ssh/known_hosts $USER@$IP:~/.ssh/known_hosts
done 

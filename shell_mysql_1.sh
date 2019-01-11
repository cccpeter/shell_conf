#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")
day=$(date "+%Y-%m-%d")
#���ݿ���
db_name="typecho1"
#sql���Ŀ¼
input_path="/opt/tt.sql"
#��װmysql����֮����Ҫ�����������
rm -rf ~/.my.cnf
cat > ~/.my.cnf << end_config
[client]
password=xxx
user=xxx
end_config
#����Ȩ��400ȷ��ֻ�з��������ʴ��ļ�
chmod 400 ~/.my.cnf
if [ ! -d "/opt/$day" ]; then
  mkdir /opt/"$day"
  chmod 777 -R /opt/"$day"
fi
echo "$time���óɹ�" >>/opt/"$day"/"$day".log
MYSQL=`which mysql`
$MYSQL -u root<< EOF
show databases;
DROP database IF EXISTS $db_name;
create database $db_name;
EOF
if [ $? -ne 0 ]; then
    echo "$timeɾ��ʧ��" >>/opt/"$day"/"$day".log
else
    echo "$timeɾ��ɹ�" >>/opt/"$day"/"$day".log
fi
#mysqldump -h localhost -u root "$db_name" > /opt/"$time".sql#�������ݣ���ʱ����
mysql -h localhost -u root  "$db_name"< "$input_path"
if [ $? -ne 0 ]; then
    echo "$time��������ʧ��" >>/opt/"$day"/"$day".log
else
    echo "$time�������ݳɹ�" >>/opt/"$day"/"$day".log
fi
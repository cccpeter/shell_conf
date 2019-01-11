#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")
day=$(date "+%Y-%m-%d")
#数据库名
db_name="typecho1"
#sql语句目录
input_path="/opt/tt.sql"
#安装mysql服务之后需要给定这个配置
rm -rf ~/.my.cnf
cat > ~/.my.cnf << end_config
[client]
password=xxx
user=xxx
end_config
#给定权限400确保只有服务器访问此文件
chmod 400 ~/.my.cnf
if [ ! -d "/opt/$day" ]; then
  mkdir /opt/"$day"
  chmod 777 -R /opt/"$day"
fi
echo "$time配置成功" >>/opt/"$day"/"$day".log
MYSQL=`which mysql`
$MYSQL -u root<< EOF
show databases;
DROP database IF EXISTS $db_name;
create database $db_name;
EOF
if [ $? -ne 0 ]; then
    echo "$time删库失败" >>/opt/"$day"/"$day".log
else
    echo "$time删库成功" >>/opt/"$day"/"$day".log
fi
#mysqldump -h localhost -u root "$db_name" > /opt/"$time".sql#导出数据，暂时隐藏
mysql -h localhost -u root  "$db_name"< "$input_path"
if [ $? -ne 0 ]; then
    echo "$time导入数据失败" >>/opt/"$day"/"$day".log
else
    echo "$time导入数据成功" >>/opt/"$day"/"$day".log
fi
#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")

rm -rf ~/.my.cnf
cat > ~/.my.cnf << end_config
[client]
password=cpd954553107
user=root
end_config
MYSQL=`which mysql`
$MYSQL typecho1 -u root<< EOF
show databases;
show tables;
select * from caicai;
insert into caicai values(1,'caicai');
EOF
mysqldump -h localhost -u root typecho1 > /opt/"$time".sql
mysql -h localhost -u root  typecho1< /opt/tt.sql


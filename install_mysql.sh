#!/bin/bash
install_dir=/opt/mysql
is_y='y';
install_mysql(){
	read -p "是否下载？"
	if "$is_y" == "y" ;then
		apt-get install wget && wget -c http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.29.tar.gz;
		cp mysql-5.6.29.tar.gz $install_dir
	else
		echo "自己去下载";
		exit;
	fi		
}

#!/bin/bash
#变量定义
youname="cpeter"
#输出变量
echo ${youname}
#字符串拼接
echo "my name is "${youname}""
#输出字符串长度
echo ${#youname}

#截取字符串
#string="dsagdscefc"
#echo ${string:1:3}

#查找字符串 找到包含cpe的字符串
echo `expr index "${youname}" pe`

#
#if condition
#then
#	command1 
#	elif condition2
#	command2
#else	...
#	commandN 
#fi
#跑流程控制
if `true`;
then
echo "hello if";
fi


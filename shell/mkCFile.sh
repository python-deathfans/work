#! /bin/bash

if [ 0 -eq $#  ]; then
	echo "请输入文件名参数"
	exit 1
fi
echo "您输入的参数是:$*"

if [ -e $1  ];then
	echo "您输入的文件名已存在"
	read -p "如若删除该文件，请输入y,否则回车:" char

	if [ "$char" = "y"  ];then
		rm -f $1
		echo "文件已删除"
	else {
			exit 1
		}
	fi

	cp init.c $1
	vi $1
else
	cp init.c $1
	vi $1
fi

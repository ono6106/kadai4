#!/bin/bash

#input
x=$1
b=$2

if [ $# -ne 2 ];then
	echo "引数は2個入力してください" && exit 1
fi

 expr "$x" : "[0-9]*$" >&/dev/null
 case  $? in 
 1)echo "$xは自然数ではありません" && exit 1;;
esac

expr "$b" : "[0-9]*$" >&/dev/null
case $? in
1)echo "$bは自然数ではありません" && exit 1;;
esac


a=$x

# a>b
if ((b>=a));then
	c=$a
	a=$b
	b=$c
	fi

#euqlid
while  ((b != 0)) 
do
	c=$a
	a=$b
	b=$(($c % $b))	
done

if ((a==0));then
	echo $x
elif ((a==1));then
	echo "1"
elif ((x/a >= a));then
 	echo "$((x/a))"
else
	echo $a
fi

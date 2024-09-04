#!/bin/bash

userid=$(id -u)
R="\e[31m"
N="\e[om"
if [ $userid -ne 0 ]
then
    echo -e "$R please run with root access $N"
    exit 1
fi   

for i in $@
do
     yum install $i -y &>>m.log
done  

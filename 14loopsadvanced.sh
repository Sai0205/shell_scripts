#!/bin/bash

userid=$(id -u)
date=$(date +%F)
logsdir=/home/centos/shell_scriptlogs
filename=$0
logfile=$logsdir/$filename-$date.log

R="\e[31m"
N="\e[om"
if [ $userid -ne 0 ]
then
    echo -e "$R please run with root access $N"
    exit 1
fi   

validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "installing $2 failure"
        exit 1
    else
        echo -e "installing $2 is success"
        fi
}

for i in $@
do
    yum list installed $i &>>$logfile 
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, lets install it"
        yum install $i -y &>>$logfile
        validate() &? "$i"
    else
        echo -e "$R $i is already insatlled $N"
    fi   
done  

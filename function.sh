#!/bin/bash

#dont repeat yourself


userid=$(id -u)
#validate the previous command and inform user it is scucces or failure

VALIDATE(){
    if [ $1 -ne 0 ] 
    then
        echo "$2 failure"
        exit 1
    else
        echo "$2 success"
    fi
}

if [ $userid -ne 0 ]
then
    echo "run with sudo access"
    exit 1
fi   

yum install mysql -y

VALIDATE $? "mysql installing"

yum install postfix -y

VALIDATE $? "postfix installing"
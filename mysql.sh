#!/bin/bash

#check rootuser or not

#if not root user,exit the program and inform user to run with sudo user

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "please run with root access"
    exit 1
fi   

#our resp to check right coomand or not
yum install mysql -y

if [ $? -ne 0 ]
then  
    echo "installation of mysql is error"
    exit 1
else
    echo "success"
fi  
#exit status $? it will store previous command status
#if $? is not zero previous command failed

#lsss -la fialure
#ls -la pass 

#!/bin/bash

#check rootuser or not

#if not root user,exit the program and inform user to run with sudo user

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "please run with root access"
    exit = 1
fi   


yum install git -y
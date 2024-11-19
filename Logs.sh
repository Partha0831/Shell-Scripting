#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$RPlease run Script with Root Credential $N "
        exit 1
    fi
}

VALIDATE(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$package...$R installation failed $N "
    else
        echo -e "$package...$G installation Success $N "
    fi
}


 CHECK_ROOT

for package in $@ 
do
dnf list installed $package
if [ $? -ne 0 ]
then
echo "Please install $package"
dnf install $package -y
VALIDATE
done







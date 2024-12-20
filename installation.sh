#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then

echo "please run as root user"
exit 1

fi

dnf list installed git

if [ $? -ne 0 ]
then
echo "git is not installed please install git"

dnf install git -y

if [ $? -ne 0 ]
then
echo "git installation is failed please check"
exit 1
else
echo "git installation is success"

fi

else
echo "git is already installed"

fi

dnf list installed mysql 

if [ $? -ne 0 ]
then
echo "mysql is not installed please install mysql"

dnf install mysql -y

if [ $? -ne 0 ]
then
echo "mysql installation is failed please check"
exit 1
else
echo "mysql installation is success"

fi

else
echo "mysql is already installed"

fi
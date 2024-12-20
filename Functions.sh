#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then

        echo "please run as root user"
        exit 1

    fi
    }


VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed please check"
        exit 1
    else
        echo "$2 is success"
# $1 and $2 are inputs passed in the function call 1 input and 2 input
    fi
}

CHECK_ROOT

dnf list installed git 

if [ $? -ne 0 ]
then
echo "git is not installed please install git"

dnf install git -y

VALIDATION $? "mysql installtion"

else
echo "git is already installed"

fi

dnf list installed mysql 

if [ $? -ne 0 ]
then
echo "mysql is not installed please install mysql"

dnf install mysql -y

VALIDATION $? "mysql installtion"

else
echo "mysql is already installed"

fi
#!/bin/bash

USERID=$(id -u)

LOG_Folder="/var/log/Shell-Logs"
Log_File=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
File_Name="$LOG_Folder/$Log_File-$TIMESTAMP.log"
mkdir -p $LOG_Folder

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$RPlease run Script with Root Credential $N " &>>$File_Name
        exit 1
    fi
}

VALIDATE(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$package...$R installation failed $N " &>>$File_Name
    else
        echo -e "$package...$G installation Success $N " &>>$File_Name
    fi
}
USAGE(){
    echo -e "$R Usage..Please pass atleast on argument $N"
    exit 1
}


 CHECK_ROOT
 if [ $# -eq o ]
 then
 USAGE
 fi

for package in $@ 
do
dnf list installed $package
if [ $? -ne 0 ]
then
echo "Please install $package" &>>File_Name
dnf install $package -y
VALIDATE
else
echo -e "$package...$G is alteady Installed $N" &>>$File_Name
fi
done







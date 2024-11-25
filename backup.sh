#1/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Source_Dir=$1
Tar_Dir=$2
Days=${3:-14} #if $3 is empty, default is 14 days.
TimseStamp=$(date +%Y-%m-%d-%H-%M-%S)
Zip_File="$Tar_Dir/app-log-$TimseStamp.zip"

USAGE(){
    echo -e "$R Usage :: $N sh backup.sh <source> <Dest> <days(optional)>"
}

if [ $# -lt 2 ]
then
USAGE
exit 1
fi

if [ ! -d $Source_Dir ]
then
echo " $Source_Dir does not exists"
exit 1
fi

if [ ! -d $Tar_Dir ]
then
echo " $Tar_Dir does not exists"
exit 1
fi

Files=$(find $Source_Dir -name "*.log" -mtime +$Days)
echo "$Files"

if [ ! -z $Files ]
then
echo "Files are found"
find $Source_Dir -name "*.log" -mtime +$Days | zip "$Zip_File" -@
if [ -f $Zip_File ]
then
echo -e "Zipping File is $G Suces $N"
while IFS= read -r file
do
echo "deleting $file"
rm -rf $file
done<<<Files
else
echo -e "Zipping files is $R Failed $N"
fi
then
echo "echo zipping the file"
else
echo "Files not are found"
fi


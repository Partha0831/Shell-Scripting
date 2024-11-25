#1/bin/bash

#touch -d 20240802 service.log To create a file with old date
#find . -name "*.log" to file files
#find . -name "*.log" -mtime +14 to find backdated files

Source_Dir=/home/ec2-user/log
G="\e[32m"
R="\e[32m"
N="\e[0m"

if [ -d $Source_Dir ] # -d for directory
then
echo -e "$Source_Dir $G Exists $N"
else
echo -e "$Source_Dir $G does not Exists $N"
exit 1
fi

Files=$(find . $Source_Dir -name "*.log")
echo "Files: $Files"

while IFS= read -r File #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
echo "Deleting $File"
rm -rf $File
done <<< $Files
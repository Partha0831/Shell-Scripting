#1/bin/bash

#touch -d 20240802 service.log To create a file with old date
#find . -name "*.log" to file files
#find . -name "*.log" -mtime +14 to find backdated files

Source_Dir=/log
G="\e[32m"
R="\e[32m"
N="\0m"

if[ -d $Source_Dir ] # -d for directory
then
echo -e "$Source_Dir $G Exists $N"
else
echo -e "$Source_Dir $G does not Exists $N"
fi

Files=$(find . $Source_Dir -name "*.log")
echo "Files: $Files"
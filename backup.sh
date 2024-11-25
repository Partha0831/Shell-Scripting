#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Source_Dir=$1
Tar_Dir=$2
Days=${3:-14} # If $3 is empty, default is 14 days.
TimseStamp=$(date +%Y-%m-%d-%H-%M-%S)
Zip_File="$Tar_Dir/app-log-$TimseStamp.zip"

USAGE(){
    echo -e "$R Usage :: $N sh backup.sh <source> <Dest> <days(optional)>"
}

# Check if at least two arguments are passed
if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

# Check if the source directory exists
if [ ! -d "$Source_Dir" ]
then
    echo "$Source_Dir does not exist"
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$Tar_Dir" ]
then
    echo "$Tar_Dir does not exist"
    exit 1
fi

# Find log files older than the specified number of days
Files=$(find "$Source_Dir" -name "*.log" -mtime +$Days)

echo "$Files"

# Check if files are found
if [ ! -z "$Files" ]
then
    echo "Files are found"
    # Zip the found log files
    find "$Source_Dir" -name "*.log" -mtime +$Days | zip "$Zip_File" -@
    
    # Check if the zip was successful
    if [ -f "$Zip_File" ]
    then
        echo -e "Zipping File is $G Success $N"
        
        # Delete the files if zipping was successful
        while IFS= read -r file
        do
            echo "Deleting $file"
            rm -rf "$file"
        done <<< "$Files"
    else
        echo -e "Zipping files is $R Failed $N"
    fi
else
    echo "No files are found"
fi

# to run script as a command like cp first we need to give execute permission and cp file into /bin/<name of command>
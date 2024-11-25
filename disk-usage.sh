#!/bin/bash

#df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1

Disk_uage=$(df -hT | grep xfs)
Partiton=5 #real projects, it is usually 75
# history command used find command ran history
while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
Folder=$(echo $line | grep xfs | awk -F " " '{print $NF}')
if [ $USAGE -ge $Partiton ]
then
echo "disk usage is used more than : $Partiton folder is :$Folder please check "
fi
done <<< $Disk_uage
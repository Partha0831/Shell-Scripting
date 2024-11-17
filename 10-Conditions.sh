#1/bin/bash

Number1=$1
Number2=$2

if [ $Number1 -gt $Number2 ]
then
    echo "the $Number1 is greater than $Number2"
else
 echo "the $Number2 is greater than $Number1"
fi
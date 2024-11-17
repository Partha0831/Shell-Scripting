#1/bin/bash

echo "list of arguments passed at current execution : $@"
echo "Number of arguments passed at current execution : $#"
echo "Name of the current script running : $0"
echo "Path of the current Execution : $pwd"
echo "current user home directory : $HOME"
echo "PID of the current execution : $$"
sleep 50 &
echo "PID of the last background execution : $!"
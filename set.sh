#!/bin/bash

set -e # -e for exit if error accures -ex from debug(gets more info)

failure(){

    echo 'falied at $1 : $2'
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR
echo "Hello World!"
echooo "Hello World!"
echo "Hello World!"
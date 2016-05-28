#!/bin/bash
if [ $# == 1 ]; then
find . -name "*" ! -name cscope.out ! -name tags |xargs grep -i "$1" --color 2>/dev/null
elif [ $# == 2 ]; then
#find . -name "$2" ! -name cscope.out ! -name tags |xargs grep -i "$1" --color 2>/dev/null
cat $2 | grep -i "$1" --color 2>/dev/null
fi

#!/bin/bash

if [[ $# -lt 2 ]]; then
	echo -e "Invalid arguments!\nFormat: <integers 1-99 inclusive> <file>"
	exit 1;
fi
if [ -f $1 ]; then
	echo -e "File in wrong argument!\nFormat: <integers 1-99 inclusive> <file>"
	exit 1;
fi
if [ ! -f $2 ]; then
	echo "Invalid file argument!"
	exit 1;
fi
if [[ $1 -lt 1 || $1 -gt 99 ]]; then
	echo "First argument must be between 1-99 inclusive!"
	exit 1;
fi
len=`wc -l $2 | cut -f 1 -d " "`
sample=`bc -l <<< "$len * ($1 / 100)" | cut -f 1 -d "."`
shuf $2 | head -n $sample

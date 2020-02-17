#!/bin/bash

re='^[0-9]+$'
Bool=0

if [[ $1 =~ $re ]]
then 
	let "Bool++"
elif [ -z $1 ]
then
	let "Bool--"
fi

echo $Bool

#!/bin/bash
quan=`ls $1 | wc -l`
echo $quan
if [ $quan = 1 ]
then
	mv "$1" .
else
	ls $1
fi

#!/bin/bash
DATE=`date +'%Y-%m-%d_%A'`
mkdir $DATE
cd $DATE
for i in `seq 1 10` ; do
	cp ~/git/sh/geogebra-empty.ggb $i.ggb;
	geogebra $i.ggb & disown;
done

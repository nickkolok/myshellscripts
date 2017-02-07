#!/bin/bash
# Usage: find-block-dupes.sh PATH COMMAND
cd $1
ls -lt --quoting-style=shell-escape | grep -v '^d' | grep -v '^l' | \
while read fileinfo
do
	#echo "$fileinfo"
	filename=`echo "$fileinfo" | awk '{print $9}'`
	filesize=`echo "$fileinfo" | awk '{print $5}'`
	if ! [ "$prevname" = "" ]
	then
		if [ "$filesize" = "$prevsize" ]
		then
			#echo "$filename"
			#echo "$prevname"
			#echo `md5sum $filename | awk '{print $1}'`
			#echo `md5sum $prevname | awk '{print $1}'`
			if [ `md5sum $filename | awk '{print $1}'` = `md5sum $prevname | awk '{print $1}'` ]
			then
				echo "'"$prevname"' == '"$filename"'"
				rm --verbose "$prevname"
			fi
		fi
	fi
	prevname="$filename"
	prevsize="$filesize"
done

#!/bin/bash
mkdir .git
mkdir .git/objects
sudo mount -t tmpfs -o size=5G,nr_inodes=10k,mode=0777 tmpfs .git/objects



if git remote ; then
	# TODO: separate confirmation
	# It does not work properly, but fetching can be easily interrupted

	read -r -p "Add files to git database? [y/N] " response
	response=${response,,}    # tolower
	if [[ $response =~ ^(yes|y)$ ]]; then

		ls -1 | git hash-object --stdin-paths -w

		#for f in `ls -bQ`; do
		#	echo $f
			#echo `cat $f` | git hash-object -w --stdin
		#done;

		read -r -p "Add files to git database recursively? [y/N] " response
		response=${response,,}    # tolower
		if [[ $response =~ ^(yes|y)$ ]]; then
			# Not sure this works
			find . | git hash-object --stdin-paths -w
		fi;

	fi;


	read -r -p "Fetch remote repos? [y/N] " response
	response=${response,,}    # tolower
	if [[ $response =~ ^(yes|y)$ ]]; then
		for remote in `git remote`
		do
			echo "Fetching $remote"
			git fetch $remote;
		done;
	fi
else
    echo "No git repo found, so only created mountpoint and tmpfs"
fi

exit


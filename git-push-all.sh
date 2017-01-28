#!/bin/bash
badrepos=""
for rep in `git remote`
do
	if ! git push --all -u $rep
	then
		badrepos=$badrepos" "$rep
	fi
done
if [[ $badrepos = "" ]]; then
	echo "All repos pushed!"
else
	echo "Problems with: "$badrepos
	verybadrepos=""
	for rep in $badrepos
	do
		if ! git push --all -u $rep
		then
			verybadrepos=$verybadrepos" "$rep
		fi
	done
	if [[ $verybadrepos = "" ]]; then
		echo "All repos pushed!"
	else
		echo "Still having problems with: "$verybadrepos
	fi
fi

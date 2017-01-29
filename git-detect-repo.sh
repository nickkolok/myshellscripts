#!/bin/bash
# Usage: git-detect-repo.sh IFREPO IFNOTREPO
#dirlist=`ls */ -bd1`# | ~/sh/wrap-lines.sh
#echo $dirlist

if ls -d */ &> /dev/null
then
	for d in */
	do
		# echo $d
		if ls "$d.gittransit.lock" -d &> /dev/null
		then
			cd "$d"
			bash -c $0 $@
			cd ..
		else
			if ls "$d.git" -d &> /dev/null
			then
				# echo "$d is a repo"
				if ! ls "$d.gitleaf.lock" -d &> /dev/null
				then
					#echo $d...
					cd "$d"
					bash -c $0 $@
					cd ..
				fi
			else
				if ! ls "$d.nogit.lock" &> /dev/null
				then
					echo "not a repo: $d"
				fi
			fi
		fi
	done
fi

#!/bin/bash
#echo $1
#echo $2
#echo $3
#quote='"'
#filelist=`bash -c "ls -t1 $1" | sed -e "s/'/'\\\\''/g;s/\(.*\)/'\1'/"`
#filelist=`bash -c "ls -t1 $1" | sed -e 's/\(.*\)/"\1"\n/'`
#filelist=`bash -c "ls -t1 $1" | ~/sh/wrap-lines.sh`
#echo $filelist
#sed -e "s/'/'\\\\''/g;s/\(.*\)/'\1'/"
#filelist=$quote$filelist$quote

#| grep $2 -B 309 | grep $3 -A 300 | grep $2 -B 309 | grep $3 -A 300

bash -c "ls -t1 $1" | ~/sh/wrap-lines.sh | grep "$2" -B 309 | grep "$3" -A 300 | grep "$2" -B 309 | grep "$3" -A 300
bash -c "ls -t1 $1" | ~/sh/wrap-lines.sh | grep "$3" -B 309 | grep "$2" -A 300 | grep "$3" -B 309 | grep "$2" -A 300


#for f in $filelist; do echo $f; done | grep $2 -B 309 | grep $3 -A 300 | grep $2 -B 309 | grep $3 -A 300
#for f in $filelist; do echo $f; done | grep $3 -B 309 | grep $2 -A 300 | grep $3 -B 309 | grep $2 -A 300
#ls -t1 $1 | grep $3 -B 309 | grep $2 -A 300

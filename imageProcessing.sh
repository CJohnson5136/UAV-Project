#!/bin/bash

test=$(echo $1 | sed 's_/__g')
output=$(echo $2/images/ | sed 's_//_/_g')

mkdir -p $output

recursiveSkicka () {
   path=$(echo $1 | sed 's/|/ /g')
   skicka ls "$path" | grep .JPG | while read j
   do
      skicka download "$path$j" "$output$(echo $1 | sed 's_/__g' | sed s/$test//)$j"
      #echo "download $(echo $path | sed 's_\([`~\!#$%*(){[|;\x27<>? "]\)_\\\1_g')$j $output$(echo $1 | sed 's_/__g' | sed s/$test//)$j"
   done
   skicka ls -l "$path" | grep ^d | sed 's/.*:..:.. ....  //; s/ /|/g' | while read i
   do
      #echo $i
      #i=$(echo $i | sed 's/|/ /g')
      recursiveSkicka "$1$i" $output
      #echo $1/$i
   done
}

recursiveSkicka $(echo "$1/" | sed 's_//_/_g') $(echo "$2/" | sed 's_//_/_g')

eval $(echo "$3/run.sh $(echo $2 | sed 's_/$__; s_.*/__g')" | sed 's_//__')

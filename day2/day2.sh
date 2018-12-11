#!/usr/bin/env bash

let twos=0
let threes=0

while IFS= read -r line; do
  l=`echo "$line" | gsed 's/\(.\)/\1\n/g' | sort | uniq -ic | awk '{print $1}' | sort -n | uniq | xargs`
  #echo $l
  if [[ $l =~ .*2.* ]]
  then
      let twos++
  fi
  if [[ $l =~ .*3.* ]]
  then
      let threes++
  fi
done < "$1"

expr $twos \* $threes

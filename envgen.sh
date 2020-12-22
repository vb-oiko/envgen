#!/bin/sh
regex='\W*(\w+)\W*='
source='.env.example'
target='.env'

truncate -s 0 $target

while read line; do
    if [[ $line =~ $regex ]]; then
        echo "${BASH_REMATCH[1]}=${!BASH_REMATCH[1]}" >>$target
    else
        echo "no match found"
    fi
done <$source

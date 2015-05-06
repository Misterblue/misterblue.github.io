#! /bin/bash

PICDIR="/cygdrive/f/SHARE/pics"

cat imageNames.txt | while read file ; do
    echo "=== $file"
    find $PICDIR -name ${file}.\*
done



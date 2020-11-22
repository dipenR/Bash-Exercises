#! /usr/bin/bash

if [ ! -e $2 ]; then
    touch "$2"
fi

if [[ ! -w $2 ]]; then
    echo "Cannot write to $2" 
    exit 1
fi
awk -v output_file="$2" '
    BEGIN { FS = ",|:|;" };
    {for (i=1; i<=NF; i++) colsum[i]+=$i;}; 
    END{for (i in colsum) print "Col " i ":" colsum[i] >> output_file} ' $1 

#!/bin/bash

file=""
search=""

while [[ $# -gt 0 ]]; do
    case $1 in
	--file)
	   file=$2
	   shift
	   shift
	   ;;
	--search)
	   search=$2
	   shift
	   shift
	   ;;
	*)
	   echo "unknown parameter $1"
	   exit 1
	   ;;
    esac
done

if [[ ! -f "$file" ]]; then
	echo "file $file does not exist"
	exit 1
fi

if [[ -z "$file" || -z "$search" ]]; then
        echo "Not all parameters were passed"
        exit 1
fi

count=$(grep -c "$search" "$file")

dir_path=$(realpath "$file")

if [[ "$count" -gt 0 ]]; then
	echo "$count"
else
	echo "no matches found $dir_path"
fi
	   

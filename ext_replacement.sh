#!/bin/bash

extension=""
replacement=""
files=()

while [[ $# -gt 0 ]]; do
   case $1 in
      --file)
        files+=("$2")
        shift
        shift 
        ;;
      --extension)
	extension=$2
	shift
	shift
	;;
      --replacement)
	replacement=$2
	shift
	shift
	;;
      *)
	echo "Unknown parameter $1"
	exit 1
	;;
    esac
done

    if [[ -z "$extension" || -z "$replacement" || ${#files[@]} -eq 0 ]]; then
	echo "Not all parameters were passed"
	exit 1
    fi

for file in "${files[@]}"; do
    
    filename=$(basename "$file")
    base_name="${filename%.*}"
    current_ext="${filename##*.}"

    if [ "$current_ext" = "$extension" ]; then
	new_filename="$base_name.$replacement"
	dirpath_file="$PWD/$new_filename"
    
       echo "$dirpath_file"
    else
    origin_dirpath="$PWD/$filename"
    echo "$origin_dirpath"
    fi
done

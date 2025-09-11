#!/bin/bash

url=""
browser=""
version=""

while [[ $# -gt 0 ]]; do
   case $1 in
	--url)
	if [ -n "$2" ]; then
	 url="$2"
	 shift
	 shift
   else 
	 echo "Error: --url requires an argument"
	 exit 1
	fi
	 ;;
	--browser)
	if [ -n "$2" ]; then
         browser="$2"
         shift
	 shift
   else
         echo "Error: --browser requires an argument"
         exit 1
        fi
         ;;
	--version)
	if [ -n "$2" ]; then
	 version="$2"
	 shift
	 shift
   else
	 echo "Error: --version requires an argument"
	 exit 1
	fi
	 ;;
	*)
	shift
	shift
	;;
   esac
done

command_args=("mvn" "clean" "test")

	if [[ -n "$browser" ]]; then
    	  command_args+=("-Dbrowser=$browser")
	fi

	if [[ -n "$version" ]]; then
  	  command_args+=("-DbrowserVersion=$version")
	fi

	if [[ -n "$url" ]]; then
  	  command_args+=("-DbaseURL=$url")
	fi
	echo "Running: ${command_args[*]}"
        "${command_args[@]}"

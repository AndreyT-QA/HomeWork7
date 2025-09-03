#!/bin/bash

number=$1
mult=1
sum=0

if [ $# -eq 0 ]; then
	echo "number not transmitted"
	exit 1
fi

if [ $((number % 2)) -eq 0 ]; then
	mid=$((number / 2))
	start_sum=$((mid + 1))
else
	mid=$(( (number - 1) / 2 ))
	start_sum=$((mid + 2))
fi

for ((i=1; i<=mid; i++)); do
	mult=$((mult * i))
done

for ((i=start_sum; i<=number; i++)); do
	sum=$((sum + i))
done

	echo "mult: $mult"
	echo "sum: $sum"

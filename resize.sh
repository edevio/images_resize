#!/bin/bash

# User input for input directory
while read -e -p $'enter a valid input directory\x0a' dir_input && [[ ! -d "$dir_input" ]] ; do
	printf "\033c"
done

printf "\033c"
echo $dir_input

while read -e -p $'enter a valid output directory\x0a' dir_output && [[ ! -d "$dir_output" ]] ; do
	printf "\033c"
done

printf "\033c"
echo $dir_output

pat="[0-9]{1,}x[0-9]{1,}"

while read -p $"Enter new size in pixels e.g. 10X10 for 10px square - This resize is is 'soft' and won't change the aspect ratio\x0a" new_size && [[ ! "$new_size" =~ $pat ]]; do
	echo ''
done

printf "\033c"
echo 'Processing'

for file in "$dir_input"*; do convert $file -resize "$new_size" "$dir_output"`basename $file`; done
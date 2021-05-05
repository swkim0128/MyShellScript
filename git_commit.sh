#!/bin/bash

cd $(pwd)

modify_file=()
new_file=()

git status -s >status_temp.txt

while read line
do
	git_status=$(echo ${line} | awk '{print $1}')
	file=$(echo ${line} | awk '{print $2}')

	if [[ ${git_status} = "??" ]]; then
		new_file+=(${file})
	else
		modify_file+=(${file})
	fi
	
done <status_temp.txt

if [[ ${new_file} != "" ]]; then
	echo "add new_file!"
	sleep 3s

	git add ${new_file}
	git commit
fi

if [[ ${modify_file} != "" ]]; then
	echo "add modify_file!"
	sleep 3s
	git add ${modify_file}
	git commit
fi

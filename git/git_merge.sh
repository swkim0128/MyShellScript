#!/bin/bash

cd $(pwd)

git branch >git_branches.txt

while read line
do
	glob=$(echo "$line" | awk '{print $1}')

	if [[ ${glob} = "*" ]]; then
		now_branch=$(echo "$line" | awk '{print $2}')
	fi
done <git_branches.txt

if [[ ${now_branch} = "develop" ]]; then
	git checkout master
	git merge --no-ff develop
elif [[ ${now_branch} != "master" || ${now_branch} != "develop" ]]; then
	git checkout develop
	git merge --no-ff ${now_branch}
fi

rm git_branches.txt

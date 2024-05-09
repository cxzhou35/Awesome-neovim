#! /bin/bash

# get current direction
curDir=$(pwd)

# get shell direction
workDir=$(
	cd "$(dirname "$0")"
	pwd
)

cd $workDir

echo "Working on $workDir"

# check if there is any changes
if [ -z "$(git status --porcelain)" ]; then
	echo "No changes to commit"
	exit 0
fi

git add -A

if [ $# -gt 0 ]; then
	git commit -m "[+] $@"
else
	git commit -m "[Default] Sync Local Files"
fi

git push

# check if fail
if [ $? -ne 0 ]; then
	echo "Sync Failed!"
	exit 1
else
	echo "Sync Success!"
fi

cd $curDir

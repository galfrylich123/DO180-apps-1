#!/bin/sh

CurCommitHash=$(git rev-parse HEAD)
BeforeCommitHash=$(git log --left-right --boundary --pretty=format:"%h" master^..master | tail -1)
Folders=("todoapp" "temps" "nodejs-app" "newThing")
Flag='FALSE'


 Changes=$(git diff --name-only ${CurCommitHash} ${BeforeCommitHash})


echo "Current hash -> ${CurCommitHash}"
echo "Before hash -> ${BeforeCommitHash}"


for F in ${Folders[@]}; do
    for change in ${Changes[@]}; do
        if [[ "$change" == *"$F"* ]]; then
            echo "${change} exist in our files array"
            Flag='TRUE'
            
        fi
    done
done

if [[ "$Flag" = "FALSE" ]]; then
    echo "ABORTTTTTT"
fi


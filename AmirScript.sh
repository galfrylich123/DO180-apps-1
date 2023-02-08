#!/bin/sh

CurCommitHash=$(git log --pretty=format:'%h' -n 1 origin/master)
BeforeCommitHash=$(git log --min-parents=2 --pretty=format:'%h' -n 1 origin/master)
Changes=$(git diff --name-only ${CurCommitHash} ${BeforeCommitHash})
Folders=("todoapp" "temps" "nodejs-app" "newThing")
Flag='FALSE'


echo "Current hash -> ${CurCommitHash}"
echo "Before hash -> ${BeforeCommitHash}"
echo "Changes folders -> ${Changes}"

for F in ${Folders[@]}; do
    for change in ${Changes[@]}; do
        if [[ "$change" == *"$F"* ]]; then
            echo "${change} exist in our files array"
            Flag='TRUE'
            #break
        fi
    done
done

if [[ "$Flag" = "FALSE" ]]; then
    echo "ABORTTTTTT"
fi

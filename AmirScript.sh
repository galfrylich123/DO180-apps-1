#!/bin/sh

CurCommitHash=$(git rev-parse HEAD)
BeforeCommitHash=$(git merge-base HEAD $(git rev-list --parents HEAD | awk '{print $2}'))
#BeforeMergeHash=$(git log --pretty=format:'%h' --merges origin/master^)
Folders=("todoapp" "temps" "nodejs-app" "newThing")
Flag='FALSE'

# if [[-z $BeforeMergeHash]]; then
#     Changes=$(git diff --name-only ${CurCommitHash} ${BeforeCommitHash})
# else
#     Changes=$(git diff --name-only ${CurCommitHash} ${BeforeMergeHash})

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

#!/usr/bin/env bash

#set -e
#set -x

# directory where your git repos reside
repo_dir="/home/hazcod/repos/"
# the repos in repo_dir that should be pulled from remote (origin)
repos=(myproject)

for repo in ${repos[@]}; do
        echo "-- ${repo}"
        cd "${repo_dir}${repo}.git"

        echo ">>> Fetching all remotes ..."
        if ! git fetch --all; then
                echo "ERROR: Failed fetching. Exiting.."
                exit 1
        fi

        echo ">>> Tracking all branches ..."
        git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote" 2>/dev/null; done

        echo ">>> Pruning old refs ..."
        git remote prune origin

        echo ">>> Fetching all branches ..."
        git branch -r | grep -v '\->' | while read remote; do git fetch origin "${remote#origin/}:${remote#origin/}"; done

done

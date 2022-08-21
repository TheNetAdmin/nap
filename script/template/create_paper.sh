#!/bin/bash

# Usage through github:
# curl https://raw.githubusercontent.com/TheNetAdmin/nap/master/script/template/create_paper.sh | bash -s -- paper_name github_repo

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 PAPER_NAME GITHUB_REPO"
    echo "E.g. $0 awesome TheNetAdmin/paper-awesome"
fi

paper_name=$1
github_repo=git@github.com:$2

git clone git@github.com:TheNetAdmin/nap $1

cd $1
git remote set-url origin $github_repo
git push origin -u master
git checkout -b paper
git push origin -u paper

echo "Template initlization is done, press any key to exit. NOTE: Remember to change GitHub default branch to 'paper' before you link it to Overleaf"
read

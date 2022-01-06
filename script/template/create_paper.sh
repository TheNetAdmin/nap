#!/bin/bash

if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    echo "Usage: $0 PAPER_NAME GITHUB_REPO"
    echo "E.g. $0 awesome TheNetAdmin/paper-awesome"
    exit 2
fi

paper_name=$1

if [ $# -eq 2 ]; then
    github_repo=git@github.com:$2
else
    github_repo=git@github.com:TheNetAdmin/$1
fi

echo "paper_name:  $paper_name"
echo "github_repo: $github_repo"

git clone git@github.com:TheNetAdmin/nap $1

cd $1
git remote set-url origin $github_repo
git push origin -u master
git checkout -b paper
git push origin -u paper

echo "Template initlization is done, press any key to exit. NOTE: Remember to change GitHub default branch to 'paper' before you link it to Overleaf"
read

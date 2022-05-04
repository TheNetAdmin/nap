#!/bin/bash

set -e

if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
    echo "Usage: $0 PAPER_NAME [GITHUB_REPO]"
    echo "E.g. $0 awesome TheNetAdmin/paper-awesome"
    echo "     will generate dir paper-awesome/ and link to the GitHub"
    exit 2
fi

paper_name=paper-$1

if [ $# -eq 2 ]; then
    github_repo=git@github.com:$2
else
    github_repo=git@github.com:TheNetAdmin/paper-$1
fi

echo "paper_name:  $paper_name"
echo "github_repo: $github_repo"

while true; do
    read -p "Proceed? [y/n]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no";;
    esac
done

git clone git@github.com:TheNetAdmin/nap $1

cd "${paper_name}"
git remote set-url origin ${github_repo}
git push origin -u master
git checkout -b paper
git push origin -u paper

echo "Template initlization is done, press any key to exit. NOTE: Remember to change GitHub default branch to 'paper' before you link it to Overleaf"
read

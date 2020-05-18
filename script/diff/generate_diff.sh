#!/bin/bash

set -x

this_path="$( cd "$(dirname "$0")" ; pwd -P )"
project_path=$this_path/../../

cd $project_path

diff_style=${1:-CFONT}
old_commit=${2:-PLACEHOLDER} # ISCA submission ID
new_commit=${3:-$(git rev-parse master)}
draft_version=${4:-false}

old_tag=$(git describe --exact-match --abbrev=0 $old_commit)
if [[ $? -ne 0 ]]; then
    echo "old_commit $old_commit does not have a tag"
    old_tag=$(git describe $old_commit)
fi

if [[ $(git rev-list -n 1 $new_commit) == $(git rev-parse master) ]]; then
    new_tag="latest"
else
    new_tag=$(git describe --exact-match --abbrev=0 $new_commit)
    if [[ $? -ne 0 ]]; then
        echo "new_commit $new_commit does not have a tag"
        new_tag=$(git describe $new_commit)
    fi
fi

new_tag=$(git describe --exact-match --abbrev=0 $new_commit)
if [[ $? -ne 0 ]]; then
    if [[ $(git rev-list -n 1 $new_commit) == $(git rev-parse master) ]]; then
        new_tag="latest"
    else
        echo "new_commit $new_commit does not have a tag"
        new_tag=$(git describe $new_commit)
    fi
fi

diff_fname=diff-[$old_tag]-[$new_tag].pdf

echo old_commit $old_commit
echo new_commit $new_commit

rm -rf diffout diff.tex

latexdiff-vc --git --force --only-changes \
             --config="PICTUREENV=(?:picture|DIFnomarkup|table|figure)[\w\d*@]*" \
             --flatten -d diffout --type=$diff_style \
             -r $old_commit -r $new_commit paper.tex

ls -l diffout

fname=diffout/$(ls diffout | grep '.tex')
echo "Post processing $fname"

perl -pi.bak0 -e 's/\|clwb\|/clwb/'           $fname
perl -pi.bak1 -e 's/\|mkpt\|/mkpt/'           $fname
perl -pi.bak2 -e 's/\|fio\|/fio/'             $fname
perl -pi.bak3 -e 's/section\{/section\[\]\{/' $fname
perl -pi.bak4 -e 's/\\\\\\vspace\{/\\vspace\{/' $fname

if [[ $draft_version == 'false' ]]; then
    sed -r -i "s/publicversion\}\{.*\}/publicversion\}\{true\}/" config/utils.tex || true
fi


cp $fname ./diff.tex
latexmk -pdf -f -outdir=diffout diff.tex
if [ ! -f diffout/diff.pdf ]; then
    echo "ERROR: diffout/diff.pdf doesn't exist"
    exit 1
fi
mv diffout/diff.pdf diffout/$diff_fname

rm -f diff.tex

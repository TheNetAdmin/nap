#!/bin/bash

require_clean_work_tree() {
    # https://stackoverflow.com/questions/3878624/how-do-i-programmatically-determine-if-there-are-uncommitted-changes
    # Update the index
    git update-index -q --ignore-submodules --refresh
    err=0

    # Disallow unstaged changes in the working tree
    if ! git diff-files --quiet --ignore-submodules --
    then
        echo >&2 "cannot $1: you have unstaged changes."
        git diff-files --name-status -r --ignore-submodules -- >&2
        err=1
    fi

    # Disallow uncommitted changes in the index
    if ! git diff-index --cached --quiet HEAD --ignore-submodules --
    then
        echo >&2 "cannot $1: your index contains uncommitted changes."
        git diff-index --cached --name-status -r --ignore-submodules HEAD -- >&2
        err=1
    fi

    if [ $err = 1 ]
    then
        echo >&2 "Please commit or stash them."
        exit 1
    fi
}

src_file=$1
dst_file=$2

require_clean_work_tree .

if [ ! -f $src_file ]; then
    echo "$0 src_file dst_file"
    exit 1
fi

# Commont out abstract environment
abs_file='content/0-abstract.tex'
if [ ! -f $abs_file ]; then
    echo "Abstract file ($abs_file) does not exist"
    exit 1
fi

echo "Preprocessing"
sed -i 's/\\begin{abstract}/\%\\begin{abstract}/g' $abs_file
sed -i 's/\\end{abstract}/\%\\end{abstract}/g' $abs_file
sed -i 's/\\figref/Figure\~\\ref/g'  content/*.tex
sed -i 's/\\tabref/Table\~\\ref/g'   content/*.tex
sed -i 's/\\secref/Section\~\\ref/g' content/*.tex
sed -i 's/\\figref/Figure\~\\ref/g'  content/*.tex
sed -i 's/\\tabref/Table\~\\ref/g'   content/*.tex
sed -i 's/\\secref/Section\~\\ref/g' content/*.tex
sed -i 's/\\para/\\textbf/g'     content/*.tex

pandoc --wrap=none -f latex -t plain $src_file -o $dst_file

echo "Reverting preprocess changes"
git checkout .

echo "Post-processing generated text file."
sed -i 's/ \././g' $dst_file
sed -i 's/ \,/,/g' $dst_file
sed -i 's/ \;/;/g' $dst_file
sed -i 's/  / /g' $dst_file

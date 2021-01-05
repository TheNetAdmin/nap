#!/bin/bash

TIKZ_FILE=${1}

if [ -z $TIKZ_FILE ]
then
    echo "$0 TIKZ_FILE"
    exit 1
fi

BASE_FILE=$(basename $(echo $TIKZ_FILE | sed 's/.tikz//'))
TEX_FILE=$BASE_FILE.tex
PDF_FILE=$BASE_FILE.pdf

outdir=out/$BASE_FILE
mkdir -p $outdir

cat << EOF >$TEX_FILE
\documentclass[tikz]{standalone}

\fontfamily{aer}
\usepackage{amsfonts}
\usepackage{mathptmx}
\usepackage{pgfplots}
\tikzstyle{every picture}+=[font=\sffamily]

\begin{document}
\input{$TIKZ_FILE}
\end{document}
EOF

latexmk -pdf -silent -outdir=$outdir $TEX_FILE
mv $outdir/$PDF_FILE plot/$BASE_FILE.tikz.pdf

rm -f $TEX_FILE

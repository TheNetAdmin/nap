\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}

\usepackage{ifthen}

\newcommand{\confasplos}
{
    % ASPLOS Style
    % \LoadClass[pageno]{config/asplos/jpaper}
    % \newcommand{\asplossubmissionnumber}{532}

    % Draft stage setting for todonote
    % \setlength{\marginparwidth}{0.6in}
    % \let\marginpar\jp@marginpar
}
\newcommand{\confisca}
{
    % ISCA Style
    \LoadClass[conference]{config/isca/IEEEtran}

    % From ISCA 2020 Template
    \usepackage{cite}
    \usepackage{amsmath,amssymb,amsfonts}
    % \usepackage{algorithmic}
    \usepackage{graphicx}
    \usepackage{textcomp}
    \usepackage{xcolor}
    \usepackage{fancyhdr}
    \usepackage[hyphens]{url}

\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}

    % Ensure letter paper
    \pdfpagewidth=8.5in
    \pdfpageheight=11in


    %%%%%%%%%%%---SETME-----%%%%%%%%%%%%%
    % \newcommand{\iscasubmissionnumber}{133} % ISCA 2020 submissionnumber 133
    \newcommand{\iscasubmissionnumber}{XXX}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    \fancypagestyle{firstpage}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead[C]{\normalsize{ISCA 2020 Submission
        \textbf{\#\iscasubmissionnumber} \\ Confidential Draft: DO NOT DISTRIBUTE}}
    \fancyfoot[C]{\thepage}
    }

    \pagenumbering{arabic}
}
\newcommand{\confmicro}
{
    % % Micro 2020 Style
    \LoadClass{config/micro/sig-alternate}
    \usepackage{mathptmx} % This is Times font

    \usepackage{fancyhdr}
    \usepackage[normalem]{ulem}
    \usepackage[hyphens]{url}
    \usepackage[sort,nocompress]{cite}
    \usepackage[final]{microtype}
    \usepackage[keeplastbox]{flushend}
    % Always include hyperref last
    \usepackage[bookmarks=true,breaklinks=true,letterpaper=true,colorlinks,linkcolor=black,citecolor=blue,urlcolor=black]{hyperref}

    % Ensure letter paper
    \pdfpagewidth=8.5in
    \pdfpageheight=11in

    %%%%%%%%%%%---SETME-----%%%%%%%%%%%%%
    \newcommand{\microsubmissionnumber}{71}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    \fancypagestyle{firstpage}{
      \fancyhf{}
      \renewcommand{\headrulewidth}{0pt}
      \fancyhead[C]{\vspace{15pt}\normalsize{MICRO 2020 Submission
          \textbf{\#\microsubmissionnumber} -- Confidential Draft -- Do NOT Distribute!!}}
      \fancyfoot[C]{\thepage}
    }

    \pagenumbering{arabic}
}
\newcommand{\confieee}
{
    % IEEE conference -- MICRO2020 camera ready
    \LoadClass[conference]{config/ieee/IEEEtran}
    \IEEEoverridecommandlockouts
    % The preceding line is only needed to identify funding in the first footnote. If that is unneeded, please comment it out.
    \usepackage{cite}
    \usepackage{amsmath,amssymb,amsfonts}
    \usepackage{algorithmic}
    \usepackage{graphicx}
    \usepackage{textcomp}
    \usepackage{xcolor}
\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}
}
\newcommand{\confusenix}
{
    % USENIX conference, e.g. ATC
    \LoadClass[letterpaper,twocolumn,10pt]{article}
    \usepackage{config/usenix/usenix-2020-09}
}

\confusenix{}

\hyphenation{NV-RAM}

%=================%
% General settings%
%=================%

\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{amsmath}
\usepackage{commath}
\usepackage{float}
\usepackage{pgfplots}
% \usepackage{algorithm}
% \usepackage{algpseudocode}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{times}
\usepackage{comment}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{textcomp} % For \textperthousand
\usepackage{multirow}
\usepackage{makecell}
\usepackage[inline]{enumitem}
\usepackage[roman]{parnotes}
\usepackage{threeparttable}

\pgfplotsset{compat=1.15}

\makeatletter
\let\MYcaption\@makecaption
\makeatother
% \usepackage[font=scriptsize]{caption}
\usepackage[font=footnotesize,skip=1pt]{subcaption}
\makeatletter
\let\@makecaption\MYcaption
\makeatother


% \setlength{\belowcaptionskip}{-10pt}
% \captionsetup{
%     belowskip=0pt
% }

\lstset{
    frameround=fttt,
    language=C,
    % numbers=left,
    breaklines=true,
    keywordstyle=\color{black}\bfseries,
    basicstyle=\ttfamily\color{black},
    numberstyle=\color{black}
    }
\lstMakeShortInline[columns=fixed]|

\graphicspath{{figure/}}

\tikzstyle{every picture}+=[font=\sffamily]

\def\sectionautorefname{\S}
\def\subsectionautorefname{\S}
\def\subsubsectionautorefname{\S}
\def\algorithmautorefname{Algorithm}

\def\secref{Section~\ref}
\def\figref{Figure~\ref}
\def\tabref{Table~\ref}
\def\obsref{Observation~\ref}

\input{config/utils.tex}

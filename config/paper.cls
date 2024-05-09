\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=nap,
    prefix=
}

\DeclareStringOption [./]        {RootPath}
\DeclareStringOption [statement] {Template}
\DeclareBoolOption   [true]      {PublicVersion}
\DeclareBoolOption   [false]     {RevisedVersion}
\DeclareBoolOption   [true]      {CommentVersion}
\DeclareStringOption [xxxx]      {SubmissionID}

\ProcessKeyvalOptions*

\wlog{RootPath: {\RootPath}}
\wlog{Template: {\Template}}

\usepackage{ifthen}

%==================%
% Conf templates   %
%==================%

\newcommand{\napaperbib}{}
\newcommand{\napaperpagestyle}{}
\newcommand{\rootinput}[1]{\input{\RootPath/#1}}

\rootinput{config/template/\Template/config}

%==================%
% General settings %
%==================%

% \usepackage{amssymb}
% \usepackage{amsfonts}
% \usepackage{amsmath}
% \usepackage{commath}
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
\usepackage{enumitem}
\usepackage[roman]{parnotes}
% \usepackage{threeparttable}
% \usepackage{minted}
\usepackage{xspace}
\usepackage{float}
\usepackage{pgfplots}
\usepackage{ctable}
\usepackage{textcomp}
\usepackage{newclude}
% \usepackage{flushend} % https://tex.stackexchange.com/a/349084
\usepackage{hyperref}

\rootinput{config/style/colors.tex}
\rootinput{config/style/fonts.tex}
\rootinput{config/style/draft.tex}
\rootinput{config/style/figure.tex}
\rootinput{config/style/space.tex}

\lstset{
    frameround=fttt,
    language=C,
    % numbers=left,
    breaklines=true,
    keywordstyle=\color{black}\bfseries,
    basicstyle=\ttfamily\color{black},
    numberstyle=\color{black}
}

\def\sectionautorefname{\S}
\def\subsectionautorefname{\S}
\def\subsubsectionautorefname{\S}
\def\algorithmautorefname{Algorithm}

\def\secref{Section~\autoref}
\def\figref{Figure~\ref}
\def\tabref{Table~\autoref}
\def\obsref{Observation~\ref}

% For tabularx
\newcolumntype{Q}{>{\raggedleft\arraybackslash}X}
\newcolumntype{P}{X<{\centering}}

\newcommand{\squishlist}{
   \begin{list}{$\bullet$}{%
        \setlength{\itemsep}{0pt}%
        \setlength{\parsep}{0pt}%
        \setlength{\topsep}{-3pt}%
        \setlength{\partopsep}{0pt}%
        \setlength{\listparindent}{-2pt}%
        \setlength{\itemindent}{-5pt}%
        \setlength{\leftmargin}{1em}%
        \setlength{\labelwidth}{0em}%
        \setlength{\labelsep}{0.5em}%
    }
}

\newcommand{\squishend}{
    \end{list}  }

\newenvironment{CompactItemize}%
{\begin{list}{$\bullet$}%
    {\leftmargin=\parindent \itemsep=2pt \topsep=2pt
    \parsep=0pt \partopsep=0pt}}%
{\end{list}}


\usepackage[normalem]{ulem}
\newcommand{\emphu}[1]{\textit{\uline{#1}}}

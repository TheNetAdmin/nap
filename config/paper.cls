\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=nap,
    prefix=
}

\DeclareStringOption[./]{RootPath}
\DeclareStringOption[statement]{Template}
\DeclareBoolOption[true]  {PublicVersion}
\DeclareBoolOption[false] {RevisedVersion}
\DeclareBoolOption[true]  {CommentVersion}

\ProcessKeyvalOptions*

\wlog{RootPath: {\RootPath}}
\wlog{Template: {\Template}}

\usepackage{ifthen}

%==================%
% Conf templates   %
%==================%

\wlog{Test content 1}

\input{\RootPath/config/\Template/config}

\wlog{Test content 2}

%==================%
% General settings %
%==================%

% \usepackage{amssymb}
% \usepackage{amsfonts}
% \usepackage{amsmath}
% \usepackage{commath}

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
\usepackage{enumitem}
\usepackage[roman]{parnotes}
% \usepackage{threeparttable}
\usepackage{minted}
\usepackage{xspace}
\usepackage{ctable}
\usepackage{textcomp}
\usepackage{newclude}
% \usepackage{flushend} % https://tex.stackexchange.com/a/349084

\wlog{Test content 2-1}

%%% FONTS
%% https://www.learnui.design/blog/times-new-roman-similar-fonts.html
% \usepackage[T1]{fontenc}
% \usepackage{\RootPath/font/autoinst_output/tex/latex/AdobeCaslonPro/AdobeCaslonPro}
% \usepackage{AdobeCaslonPro}
% \usepackage{merriweather}
% \usepackage{PTSerif}
% \usepackage{LibertinusSerif}
% \usepackage{inconsolata}

% http://www.khirevich.com/latex/microtype/
% Conflicting with USENIX
% \usepackage[kerning,spacing,final]{microtype}
% \usepackage[activate={true,nocompatibility},final,tracking=true,factor=1100,stretch=10,shrink=10]{microtype}
% \usepackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype}
% activate={true,nocompatibility} - activate protrusion and expansion
% final - enable microtype; use "draft" to disable
% tracking=true, kerning=true, spacing=true - activate these techniques
% factor=1100 - add 10% to the protrusion amount (default is 1000)
% stretch=10, shrink=10 - reduce stretchability/shrinkability (default is 20/20)


\wlog{Test content 2-2}

\pgfplotsset{compat=1.15}

\makeatletter
\let\MYcaption\@makecaption
\makeatother
% \usepackage[font=scriptsize]{caption}
\usepackage[font+=smaller,skip=1pt]{subcaption}
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

\graphicspath{{figure/}}

\wlog{Test content 3}


\tikzstyle{every picture}+=[font=\sffamily]

\def\sectionautorefname{\S}
\def\subsectionautorefname{\S}
\def\subsubsectionautorefname{\S}
\def\algorithmautorefname{Algorithm}

\def\secref{\autoref}
\def\figref{\autoref}
\def\tabref{\autoref}
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


\newcommand*\mycircinternal[1]{%
  \tikz[baseline=(char.base)]{%
  \node[minimum size=0.325cm,shape=circle,draw,inner sep=0.25pt,fill=black,text=white,font=\bfseries] (char) {\small#1};}%
\newcommand*\mycirc[1]{%
\raisebox{.5pt}{\mycircinternal{\raisebox{-.9pt} {#1}}}%
}}

% Check mark and cross mark
% \usepackage{pifont}
% \newcommand{\cmark}{\ding{51}}
% \newcommand{\xmark}{\ding{55}}

% https://tex.stackexchange.com/a/169711
\renewcommand{\floatpagefraction}{.9}

% % Don't use `todonote` package, it slows down the LaTeX compilation
% % Treat todo as text or not
% \ifthenelse{\boolean{todoastext}}{
%     % Output todo as text
%     \newcommand{\todocolortext}[3]{\color{2}#3}
% }{
%     % Assert error at todo
%     \newcommand{\todocolortext}[1]{Do NOT use \\#1 for public version!}
% }

% Paper presentation
\ifthenelse{\boolean{PublicVersion}}{
    \setboolean{RevisedVersion}{false}
    \setboolean{CommentVersion}{false}
}{
    \newcommand{\draftversion}{ConfName}

    % For date time print
    % \edef\pdfilemoddate#1{\pdfcreationdate} % not working in xelatex
    \usepackage[useregional]{datetime2}
    \usepackage{background}
    \backgroundsetup{
        color=gray,
        position=current page.west,
        angle=90,
        nodeanchor=west,
        vshift=-5mm,
        hshift=-20mm,
        opacity=1,
        scale=1.75,
        contents=DRAFT [Ver.{\draftversion}] {\DTMnow} {Page \thepage}
    }
}

% Revision
\ifthenelse{\boolean{RevisedVersion}}{
    \usepackage{soul, color}

    % Register customized commands to soul, so that \hl and \st can process
    % these commands without compilation errors
    %
    % https://tex.stackexchange.com/a/139500
    % arg#2 available values:
    %   0 or 1: font switching commands
    %        7: \textsuperscript or similar commands, e.g., \cite, \ref
    %        8: \footnote
    %        9: accents

    % Reference style commands
    \soulregister{\cite}    {7}
    \soulregister{\ref}     {7}
    \soulregister{\autoref} {7}
    \soulregister{\figref}  {7}
    \soulregister{\secref}  {7}
    \soulregister{\tabref}  {7}
    \soulregister{\pageref} {7}

    % Font switching style commands
    \soulregister{\para}    {1}
    \soulregister{\zixuan}  {1}

    % % https://tex.stackexchange.com/questions/282386/make-soul-highlight-span-lines
    % \makeatletter
    % \def\SOUL@hlpreamble{%
    %     \setul{\dp\strutbox}{\dimexpr\ht\strutbox+\dp\strutbox\relax}%
    %     \let\SOUL@stcolor\SOUL@hlcolor
    %     \SOUL@stpreamble
    % }
    % \makeatother

    % Usage:
    % \st{for paragraph with deleting lines}.}
    % \hl{highlight a paragraph with yellow background.}
} {
    % \renewcommand{\st}[1]{}
    % \renewcommand{\hl}[1]{}
    \newcommand{\st}[1]{\PackageError{napaper}{Do NOT use \\st for public version!}}
    \newcommand{\hl}[1]{\PackageError{napaper}{Do NOT use \\hl for public version!}}
}

% Comments
\ifthenelse{\boolean{CommentVersion}}{
    \newcommand{\inlinecomment}[3]{{\color{#1}\sf \footnotesize #2: #3}}
    \newcommand{\ignore}       [1]{{\color{gray} #1}}
    \newcommand{\updatelater}  [1]{{\color{blue}#1}}
}{
    \newcommand{\inlinecomment}[3]{}
    \newcommand{\ignore}[1]{}
    % \newcommand{\updatelater}[1]{#1}
    \newcommand{\updatelater}[1]{\PackageError{napaper}{Do NOT use \\updatelater for public version!}}
}

\newcommand{\zixuan}       [1]{\inlinecomment{brown}  {Zixuan}{#1}}

\newcommand{\rootinput}[1]{\input{\RootPath/#1}}
% \newcommand{\rootinput}[1]{\includedoc{\RootPath/#1}}

\usepackage{cleveref}

\usepackage[normalem]{ulem}
\newcommand{\emphu}[1]{\textit{\uline{#1}}}


\wlog{Test content 4}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% thesisisel.cls
%%% ISEL/IPL Dissertation document class
%%%
%%% By Matilde Pós-de-Mina Pato (matilde.pato@isel.pt)
%%% Version of October 2012
%%% Version v1.1:  July 2013 
%%% Version v2.0: March 2015
%%% Version v2.3: December 2017
%%% Version v2.4: January 2019
%%% Version v2.5: December 2019
%%% Version v2.5.1.: February 2020
%%% Version v2.5.2.: March 2020
%%% Version v2.5.3.: June 2020
%%% 
%%% This template is vaguely based on a template from the
%%%     Universidade Nova de Lisboa (NOT OFFICIAL)
%%%
%%% BUGS and SUGGESTIONS: please send email to "matilde.pato@isel.pt"
%%%     or sumit a ticket in the the project web page at
%%%     https://github.com/matpato/thesisisel
%%%
%%% CONTRIBUTERS are welcome. Please contact "matilde.pato@isel.pt"
%%%
%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisisel}[2012/10/09 ISEL thesis template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% == Languages ===
\DeclareOption{pt}{% 		//PORTUGUESE
  \let\@language=0%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{en}{%		//ENGLISH
  \let\@language=1%
  \PassOptionsToPackage{portuguese,english}{babel}}

% == Printing ===
\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{book}}

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{book}}

% == Paper type/format (dfault A4) ===
\PassOptionsToClass{a4paper}{book} % Default paper format

\DeclareOption{a4}{%
	\PassOptionsToClass{a4paper}{book}}

\DeclareOption{a4paper}{%
	\PassOptionsToClass{a4paper}{book}}

% == Font Size ===
\PassOptionsToClass{12pt}{book} % Default point size

\DeclareOption{11pt}{%
	\PassOptionsToClass{11pt}{book}}

\DeclareOption{12pt}{%
	\PassOptionsToClass{12pt}{book}}
			
% == Text Encoding ===
\let\@utf=1
\DeclareOption{latin1}{\let\@utf=0}
\DeclareOption{utf8}{\let\@utf=1}

% == Type of document ===
% \@degreetype=0	BSc preliminary report		: prepbsc
% \@degreetype=1	BSc report							: bsc
% \@degreetype=2	MSc preliminary report		: prepmsc
% \@degreetype=3	MSc dissertation				: msc
%
			
\DeclareOption{prepbsc}{
	\let\@degreetype=0
	\def\@degree{\@bachelordegree}
	\def\@dissertationtype{\@prepbscdissertationtstr}
}
\DeclareOption{bsc}{
	\let\@degreetype=1
	\def\@degree{\@bachelordegree}
	\def\@dissertationtype{\@bscdissertationtstr}
}
\DeclareOption{prepmsc}{
	\let\@degreetype=2
	\def\@degree{\@mastersdegree}
	\def\@dissertationtype{\@prepmscdissertationtstr}
}
\DeclareOption{msc}{
	\let\@degreetype=3
	\def\@degree{\@mastersdegree}
	\def\@dissertationtype{\@mscdissertationtstr}
}

% == Printable or On Screen  Document ===
%
% \@printable=1		Format your thesis in a way that presents on paper: onpaper
% \@printable=0		Format your thesis in a way that presents on screen: onscreen 
%\let\@degreetype=4
\DeclareOption{onpaper}{
	\let\@printable=1
}
\DeclareOption{onscreen}{
	\let\@printable=0
}

% == Default Options ===
\ExecuteOptions{
	pt,
	msc,
	onscreen
}
\ProcessOptions

\LoadClass{book} 
			
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%================================================
% PACKAGE hyperref
%================================================
% Set links for references and citations in document
% Some MiKTeX distributions have faulty PDF creators in which case this package will not work correctly
% Long live Linux :D
%% Title of Report + author(s) + professor + date
%\hypersetup{ a4paper=true,
%%             pdftitle={ },
%%             pdfauthor={ },
%%             pdfsubject={ },
% %            pdfcreator={Matilde P.M. Pato},
% %            pdfkeywords={ }
%             }
\RequirePackage[
			breaklinks = true,
			hidelinks,
			colorlinks,
			pdfdisplaydoctitle,
			citecolor=mydarkblue,
			linkcolor=black,
			urlcolor=mydarkblue
			]{hyperref}

%================================================
% PACKAGE latin, utf8
%================================================
% Latin1
\if\@utf0
\RequirePackage[latin1]{inputenc}
% UTF8
\else\if\@utf1
\RequirePackage[utf8]{inputenc}
\fi\fi

\RequirePackage[T1]{fontenc}

%================================================
% PACKAGE amsmath, amsthm, amssymb, amsfonts:
%================================================
% This package is typically required. Among many other things it adds the possibility
% to put symbols in bold by using \boldsymbol (not \mathbf); defines additional 
% fonts and symbols; adds the \eqref command for citing equations. I prefer the style
% "(x.xx)" for referering to an equation than to use "equation x.xx".

\usepackage{txfonts} 
  \let\iint\relax 
  \let\iiint\relax 
  \let\iiiint\relax 
  \let\idotsint\relax 
\usepackage{amsmath, amssymb, amsfonts, verbatim, mathabx}
\usepackage{spverbatim}
% underline  
\usepackage{ulem}

% Provides the inparaenum environment (with an optional formatting specification in square brackets)
\usepackage{paralist} 
  
\newcounter{saveenumi}
\newcommand{\seti}{\setcounter{saveenumi}{\value{enumi}}}
\newcommand{\conti}{\setcounter{enumi}{\value{saveenumi}}}
% === Beautiful simple tables ===
\usepackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage{babel}
\RequirePackage[toc]{appendix}

\RequirePackage{ifthen}
\RequirePackage{titlesec}           % To format the headings
\RequirePackage{fancyhdr}        % Headings configuration

% Set inter-line spacing
\RequirePackage{setspace}           % One-and-half spacing
\onehalfspacing

%================================================
% PACKAGE general styles
%================================================
%\RequirePackage{mathptmx}
\RequirePackage[scaled]{helvet}
\RequirePackage{courier}
\RequirePackage{palatino}
\usepackage{xmpincl}
%\usepackage[a-1b]{pdfx}

\RequirePackage[]{xcolor}
\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
\usepackage{ifpdf}		% This is now the recommended way for checking for PDFLaTeX:
\ifpdf
	\RequirePackage[pdftex]{graphicx}
	\DeclareGraphicsExtensions{.pdf, .png, .jpg, .tif}	
	\else
		\RequirePackage{graphicx}
		\DeclareGraphicsExtensions{.eps, .png, .jpg}
\fi


%  === Geometry: Print on paper ===
\if\@printable1
\RequirePackage[top=3cm,
	bottom=3cm,
	inner=3.5cm,
	outer=2.5cm]{geometry}[2010/09/12]
	
% === Geometry: Print on screen ===
\else\if\@printable0
\RequirePackage[top=3cm,
	bottom=3cm,
	inner=2.5cm,
	outer=2.5cm]{geometry}[2010/09/12]
\fi\fi
	
%================================================
% PACKAGE tikz
%================================================
\RequirePackage{tikz}	%Tikz is probably the most complex and powerful tool to create graphic elements in LATEX. 

\RequirePackage{ctable}

% This can be done in an expandable form using \csname.  Use \Repeat
\RequirePackage{expl3}
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

%================================================
% PACKAGE algorithm and algpseudocode
%================================================
\usepackage[Algoritmo]{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}

%================================================
% PACKAGE acronym and nomencl
%================================================
% This package is most usefull for acronyms. The package garantees that all acronyms definitions 
% are given at the first usage. 
% IMPORTANT: do not use acronyms in titles/captions; otherwise the definition will appear on the table of contents.
% Printing a list of abbreviations or symbols is one of these things (like so many) LaTeX provides a very simple and elegant solution for. 
% The nomencl package implements a few basic commands to do that.
% First load the package in the preamble. The makenomenclature command is required for the generation of the nomenclature file (.nlo). Commenting it out is a convenient way to “switch it off”.
%

%\usepackage[
%	  printonlyused,
%   withpage,
%   intoc]               	% show listings as entries in table of contents      
%	{nomencl}
%\makenomenclature
\usepackage[
	%nogroupskip,
	sort = standard,  %or, def or use
	order = letter,		 %or, word
	translate = babel,
	shortcuts,
	%nonumberlist, % do not show page numbers
	acronym,        	% generate acronym listing
	toc                		% show listings as entries in table of contents
	]          				% use section level for toc entries
	{glossaries}
\glsdisablehyper
\makenoidxglossaries

\setglossarystyle{long} %long3colheader
% style=long,header=none,border=none,cols=2 &
\addtolength{\glspagelistwidth}{1cm}
\addtolength{\glsdescwidth}{2.5cm}
\renewcommand*{\glsnamefont}[1]{\bfseries #1}%

\def\UrlBreaks{\do\/\do-}
%\usepackage[square, comma, sort&compress, numbers]{natbib}

%================================================
% PACKAGE pdfpages and pdflscape
%================================================
\usepackage{pdfpages} % include pdf file
% The pdflscape package adds PDF support to the landscape environment of package lscape, by setting the PDF/Rotate page attribute.
\usepackage{pdflscape}
%

%================================================
% PACKAGE listings
%================================================

% To process lists and other stuff
\RequirePackage{etoolbox}

% The ‘listings’ package is loaded at the beginning of a LATEX file in the preamble
% Here is an example of my \lset{} declaration for ‘R’ code. 
% Then, after having including this (also in the preamble), I simply include my external ‘R’ files. 
% They can be included using an:
% \include{ } - like interface to the external files;
% by using the command \lstinputlisting{./code.R} to include the code from the file code.R which % is located in the same directory as the ‘LATEX’ source file.
%
%====================================================================

\usepackage{listings}
% listings package provides a key called inputpath for specifying a path where \lstinputlisting should search for source files.
\newcommand*\lstinputpath[1]{\lstset{inputpath=#1}}
\usepackage{fancyvrb}
\usepackage{fvextra}

\renewcommand{\lstlistoflistings}{
	\begingroup
	\tocfile{\lstlistlistingname}{lol}
	\endgroup
	}

%================================================
% PACKAGE subcaption, float, figures, totalcount
%================================================

% To aggregate multiple figures in a single one with subfigures
% Note: subfigure package does not recognise \textwidth as a number, when it is in fact a number (equivalent to the constant width of the total text block on a page). The way to resolve this is to use the more updated subcaption package
\usepackage{subcaption}

% To have text wrapping figures
\usepackage{wrapfig}
\usepackage{float}						% Improves the interface for defining floating objects such as figures and tables
%
\usepackage[figure,table,lstlisting]{totalcount}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%
 \let\origcleardoublepage=\cleardoublepage
 \def\cleardoublepage{%
   \newpage{\pagestyle{empty}\origcleardoublepage}
 }

% 
% === No identation ===
\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}
% 

%%
% === For use with the pseudocode package ===
 \def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Some relevant strings
\gdef\@mbachelordegreestr{Licenciado}
\gdef\@fbachelordegreestr{Licenciada}
\gdef\@mmastersdegreestr{Mestre}
\gdef\@fmastersdegreestr{Mestre}

\gdef\@singlemadviserstr{Orientador}
\gdef\@manymadviserstr{Orientadores}

\gdef\@bachelordissertationstr{Trabalho Final de Curso}
\gdef\@bachelorqualifyingstr{Preparação do Trabalho Final de Curso}
\gdef\@mastersdissertationstr{Dissertação de Mestrado}
\gdef\@mastersqualifyingstr{Preparação de Dissertação}

\gdef\@jurystr{Júri}
\gdef\@presidentstr{Presidente}

\gdef\@singlejuryastr{Vogal}
\gdef\@manyjuryastr{Vogais}

\gdef\@prepbscdissertationtstr{Relatório preliminar realizado no âmbito de
 \@coursefield, \\ do curso de licenciatura em \@majorfield\\
 Semestre de Verão \@scholaryear}
\gdef\@bscdissertationtstr{Relatório final realizado no âmbito de
 \@coursefield, \\ do curso de licenciatura em \@majorfield\\
 Semestre de Verão \@scholaryear}
\gdef\@prepmscdissertationtstr{Relatório preliminar para obtenção do Grau 
de Mestre \\em \@majorfield}
\gdef\@mscdissertationtstr{\@thesistype~ para obtenção do Grau 
de Mestre \\em \@majorfield}

\gdef\@presentationtext{\@dissertationtype}

%%  === Language Dependencies ===

\gdef\@abstrnamePT{Resumo}
\gdef\@abstrnameEN{Abstract}

\gdef\@keywordsnamePT{Palavras-chave}
\gdef\@keywordsnameEN{Keywords}

% Portuguese
\if\@language0
  	\gdef\@notdefined{NÃO DEFINIDO}
  	\gdef\acknowledgementsname{Agradecimentos} 
  	\gdef\equationname{equação} 
  	\addto\captionsportuguese{% Replace "english" with the language you use
  		\renewcommand{\contentsname}{Índice}%
	}
	
 	\renewcommand*{\listtablename}{Lista de Tabelas}
	\renewcommand*{\listfigurename}{Lista de Figuras}
	
  	\def\appendixname{Anexos}

  	\def\glossaryname{Main}
 		\addto{\captionsportuguese}{
 			\renewcommand*{\acronymname}{Lista de Abreviaturas e Siglas}
 			\renewcommand*{\glossaryname}{Glossário}
 			\renewcommand*{\pagelistname}{Páginas}
 			\renewcommand*{\entryname}{Notação}
	}
 
	\def\lstlistlistingname{Listagens}
	  	\addto{\captionsportuguese}{%
			%\renewcommand*{\lstlistingname}{Listagem}%
			\renewcommand*{\lstlistingname}{Listagem}% Listing -> Algorithm
			\renewcommand{\lstlistlistingname}{Lista de Listagens}% List of Listings -> List of Algorithms
	}
	
	\renewcommand{\algorithmicrequire}{\textbf{Dados: }}
	\renewcommand{\algorithmicensure}{\textbf{Resultado: }}
	
% English
\else\if\@language1
  	\gdef\@notdefined{UNDEFINED}
  	\gdef\acknowledgementsname{Acknowledgments}
  	\def\appendixname{Appendix}
	\gdef\equationname{equation}	
	\def\lstlistlistingname{Listings}
	  	\addto{\captionsenglish}{%
			%\renewcommand*{\lstlistingname}{Listagem}%
			\renewcommand*{\lstlistingname}{Listing}% Listing -> Algorithm
			\renewcommand{\lstlistlistingname}{List of \lstlistingname s}% List of Listings -> List of Algorithms
	}
	  	
\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEFINE LOGO AND IMAGE IN FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ADD ISEL's LOGO and IMAGE in frontpage
\newcommand{\logo}[2]{
\parbox[t][0.15\paperheight]{0.1\paperwidth}{%
\vfill
\centering
\hspace*{-4em}\includegraphics[scale=#2,trim=5em 0 5em 0,clip]{#1}%
\vfill
}}

\newcommand{\image}[1]{
\parbox[t][6cm][c]{12cm}{%
\vfill
\centering
\includegraphics[height=6cm,width=12cm]{#1}%
\vfill
}}

\newcommand{\noimage}{
\parbox[t][6cm][c]{12cm}{%
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CREATING A TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \def\universitylogo#1{%
   \gdef\@universitylogo{#1}}
 \def\@universitylogo{~universitylogo \@notdefined}

 \def\university#1{%
   \gdef\@university{#1}}
 \def\@university{~university \@notdefined}
 
 \def\faculty#1{%
   \gdef\@faculty{#1}}
 \def\@faculty{~faculty\@notdefined}
 
 \def\department#1{%
   \gdef\@department{#1}}
 \def\@department{~department\@notdefined}

\def\thesistype#1{%
  \gdef\@thesistype{#1}}
\def\@thesistype{~thesistype\@notdefined}

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{~majorfield \@notdefined}

\def\coursefield#1{%
  \gdef\@coursefield{#1}}
\def\@coursefield{~coursefield \@notdefined}

\def\scholaryear#1{%
  \gdef\@scholaryear{#1}}
\def\@scholaryear{~scholaryear \@notdefined}

%\def\@noimage

\def\workimage#1{%
   \gdef\@workimage{#1}}
% \def\@workimage{~workimage \@notdefined}
 
\@input@{defaults}

%% Date

\def\themonth#1{\gdef\@themonth{#1}}
\def\@themonth{~themonth \@notdefined}

\def\theyear#1{\gdef\@theyear{#1}}
\def\@theyear{~theyear \@notdefined}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AUTHOR and ADVISORS DEFINITION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Author identification (at most 2 of each)
%% \author[m|f]{Name}

\def\@author{~author \thesisisel@notdefined}
%%
\def\authordegree#1{%
  \gdef\@authordegree{#1}}
\def\@authordegree{~authordegree \@notdefined}


\def\@theauthorgender{m}	% default for male authors
\newcount\@theauthorcount	% number of authors
\@theauthorcount 0\relax

\def\author{%
  \@ifnextchar [%
    {\@pauthor[]}%
    {\@pauthor[][m]}}

% #1 = [] 
% #2 = [m] or [f]
% #3 = {name}
\def\@pauthor[#1][#2]#3{%
  \expandafter\advance\csname @the#1authorcount\endcsname 1\relax
  \ifx#2m
  	\def\@the#1authorgender{m}
  \else\ifx#2f
  	\def\@the#1authorgender{f}
  \else
  \typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please specify #1author gender using [m] or [f] as the second^^J%
!  argument of the "#1author" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   \errhelp{Please be gentle and follow the template recommendations.}
   \errmessage{Please specify author gender!}
  \fi\fi
  \expandafter\gdef\csname @#1authorname\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#3}
	}

\def\@theauthorstr[#1]{%
	\@ptheauthorstr[#1]{\expandafter\csname @the#1authorcount\endcsname}{\expandafter\csname @the#1authorgender\endcsname}
	}

\def\printauthor[#1]#2{%
	\ifcsname @#1authorname#2\endcsname
		\ifnum #2 > 1
			% do nothing
		\fi
		&
		\expandafter\csname @#1authorgender#2\endcsname
		\expandafter\csname @#1authorname#2\endcsname
	\\
	\fi
}

% ADVISORS IDENTIFICATION (at most 4 of each)
%% ---------------------------------------------------%%
%% \adviser[m|f]{Category}{Name}
%% ---------------------------------------------------%%

%% where N i a number from 1 to 4
\def\@theadvisergender{f}	% default for female advisers
\newcount\@theadvisercount	% number of advisers
\@theadvisercount 0\relax

\def\adviser{%
  \@ifnextchar [%
    {\@padviser[]}%
    {\@padviser[][m]}}

% #1 = [] for adviser
% #2 = [m] or [f]
% #3 = {name}
% #4 = {category}
\def\@padviser[#1][#2]#3#4{%
  \expandafter\advance\csname @the#1advisercount\endcsname 1\relax
  \ifx#2m
  	\expandafter\def\csname @the#1advisergender\endcsname{m}
  \else\ifx#2f
  \else
  \typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please specify #1adviser gender using [m] or [f] as the second^^J%
!  argument of the "#1adviser" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   \errhelp{Please be gentle and follow the template recommendations.}
   \errmessage{Please specify adviser gender!}
  \fi\fi
  \expandafter\gdef\csname @#1advisername\expandafter\number\csname @the#1advisercount\endcsname\endcsname{#3}
  \expandafter\gdef\csname @#1advisercat\expandafter\number\csname @the#1advisercount\endcsname\endcsname{#4}
	}

\def\@theadviserstr[#1]{%
	\@ptheadviserstr[#1]{\expandafter\csname @the#1advisercount\endcsname}{\expandafter\csname @the#1advisergender\endcsname}
	}

\def\@ptheadviserstr[#1]#2#3{%
	\ifnum #2 > 1
  		\expandafter\csname @many#3#1adviserstr\endcsname
	\else
  		\expandafter\csname @single#3#1adviserstr\endcsname
	\fi
	}

\def\printadviser[#1]#2{%
	\ifcsname @#1advisername#2\endcsname
		\ifnum #2 = 1
			& \\[-2ex]
			\@theadviserstr[#1]:
		\fi
		&
		\expandafter\csname @#1advisercat#2\endcsname\
		\expandafter\csname @#1advisername#2\endcsname
	\\
	\fi
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DOCUMENT IDENTIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
\def\@
\def\title#1{%
  \gdef\@title{#1}
  \hypersetup{pdftitle={\@title}}}
\def\@title{~title \@notdefined}

\def\@texttype{%
 	\if\@degreetype0
    \@bachelorqualifyingstr	  
  \else\if\@degreetype1
    \@bachelordissertationstr
  \else\if\@degreetype2
    \@mastersqualifyingstr
  \else\if\@degreetype3
  \@mastersdissertationstr
  \fi\fi\fi\fi}


\def\thedegree#1#2{%
	\expandafter\csname @#1#2\endcsname}

\def\@degree{%
  \if\@degreetype0
    \thedegree{\authorgender}{bachelordegreestr}
  \else\if\@degreetype1
    \thedegree{\authorgender}{bachelordegreestr}    
  \else\if\@degreetype2
    \thedegree{\authorgender}{mastersdegreestr}
  \else\if\@degreetype3
    \thedegree{\authorgender}{mastersdegreestr}
\fi\fi\fi\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JURY IDENTIFICATION (at most 5 of each)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% [p] for president and [a] for referees 
%% ---------------------------------------------------%%
%% \jury[p|a]{Category and Name}
%% ---------------------------------------------------%%
%% where N i a number from 1 to 5
\newcount\@thejurypcount	% number of presidents (must be one)
\@thejurypcount 0\relax
\newcount\@thejuryacount	% number of referees
\@thejuryacount 0\relax

\def\jury{%
  \@ifnextchar [%
    {\@pjury}%
    {\@pjury[a]}}


% #1 = [p] for president and [a] for referee
% #2 = {name}
\def\@pjury[#1]#2{%
	\expandafter\advance\csname @thejury#1count\endcsname 1\relax
  	\expandafter\gdef\csname @jury#1name\expandafter\number\csname @thejury#1count\endcsname\endcsname{#2}
}

\def\printthejuryp{%
	\ifnum \@thejurypcount = 1
		& \\[-2ex]
		\@presidentstr: & \csname @jurypname1\endcsname \\
	\else
  		\typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please identify one and only one president of the jury with^^J%
!  the [p] argument of the "jury" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   		\errhelp{Please be gentle and follow the template recommendations.}
   		\errmessage{Please specify president of the jury!}
	\fi
}

\def\@pthejuryastr{%
	\ifnum \@thejuryacount > 1
  		\expandafter\csname @manyjuryastr\endcsname
	\else
  		\expandafter\csname @singlejuryastr\endcsname
	\fi
}

\def\@printthejurya[#1]{%
	\ifcsname @juryaname#1\endcsname
	\ifnum #1 = 1
		& \\[-2ex]
		\@pthejuryastr:
	\fi
	& \expandafter\csname @juryaname#1\endcsname\relax \\
	\fi
}

\def\printthejurya{%
	\ifnum \@thejuryacount > 0
		\@printthejurya[1]
		\@printthejurya[2]
		\@printthejurya[3]
		\@printthejurya[4]
	\else
  		\typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please identify at least one referee with the [a] argument ^^J%
!  of the "jury" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   		\errhelp{Please be gentle and follow the template recommendations.}
   		\errmessage{Please specify referees of the jury!}
	\fi
}

\def\printthejury{%
	\fontsize{11}{12}
	\selectfont
	\ctable[
		cap=,
		caption=,
		label=,
		pos=h,
		maxwidth=1\linewidth,
		doinside=\hspace*{1.5cm},
	]{rX}{}{
	& \@jurystr: \\
 	\printthejuryp
	\printthejurya
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\synctex=1 % Uase synctex
\brokenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FONTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}

%\newcommand{\reverseconcat}[3]{#3#2#1}
\newcommand{\version}[1]{ 
	\if\@language0
		\selectlanguage{portuguese}
			vers\~ao #1
	\else
	 	\selectlanguage{english}
	 		version #1
	 \fi
 }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRINT CHAPTERS, DEDICATORY, ACKNOWLEDGEMENTS, ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\input{thesisisel-files/thesismainmatter.clo}

% === Dedicatory ===
\def\dedicatoryfile#1{%
  \gdef\@dedicatoryfile{#1}}
\def\@dedicatoryfile{\@empty}

\ifx\@dedicatoryfile\@empty
\def\printdedicatory{}
\else
\def\printdedicatory{
	\if\@degreetype0
	\else\if\@degreetype1
		\@input@{Chapters/\@dedicatoryfile}\global\let\@dedicatoryfile\@empty
	\else\if\@degreetype2
	\else\if\@degreetype3
		\@input@{Chapters/\@dedicatoryfile}\global\let\@dedicatoryfile\@empty
	\fi\fi\fi\fi
}
\fi

% === Acknowledgement ===
\def\acknowledgementsfile#1{%
  \gdef\@acknowledgementsfile{#1}}
\def\@acknowledgementsfile{~acknowledgementsfile \@notdefined}

\def\printacknowledgements{
	\if\@degreetype0	
	\else\if\@degreetype1			
		\@input@{Chapters/\@acknowledgementsfile}\global\let\@acknowledgementsfile\@empty
	\else\if\@degreetype2
	\else\if\@degreetype3		
		\@input@{Chapters/\@acknowledgementsfile}\global\let\@acknowledgementsfile\@empty
	\fi\fi\fi\fi
}

% === Abstract ===
\def\ptabstractfile#1{%
  \gdef\@ptabstractfile{#1}}
\def\@ptabstractfile{\@empty}
% \def\@ptabstractfile{~ptabstractfile \@notdefined}

\def\enabstractfile#1{%
  \gdef\@enabstractfile{#1}}
\def\@enabstractfile{\@empty}
% \def\@enabstractfile{~enabstractfile \@notdefined}

\if\@language0   % Sumário-PT + Abstract-EN for thesis in Portuguese
\def\@ptabstractfile{~ptabstractfile \@notdefined}
\else\if\@language1   % Abstract-EN + Sumário-PT for thesis in English
\def\@enabstractfile{~enabstractfile \@notdefined}
\fi\fi

\def\printabstract{%
	\if\@language0   % Sumário-PT + Abstract-EN for thesis in Portuguese
		\selectlanguage{portuguese}
		\@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
		\ifx\@enabstractfile\@empty
		\else
			\selectlanguage{english}
			\@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
			\selectlanguage{portuguese}
		\fi
	\else\if\@language1   % Abstract-EN + Sumário-PT for thesis in English
		\selectlanguage{english}
		\@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
		\ifx\@ptabstractfile\@empty
		\else
			\selectlanguage{portuguese}
			\@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
			\selectlanguage{english}
		\fi
	\fi\fi
}

% === Chapters ===
\newcount\@chapcount
\@chapcount 0\relax

\def\chapterfile#1{%
	\advance\@chapcount 1\relax
	\expandafter\gdef\csname @chapterfile\number\@chapcount\endcsname{Chapters/#1}
}

\def\printchapters{%
	\thesismainmatter
	\newcount\@myi
	\@myi 0\relax
	\loop
		\advance\@myi 1\relax
		\def\@chapname{\expandafter\csname @chapterfile\number\@myi\endcsname}
		\@input@{\@chapname}
	\ifnum \@myi < \@chapcount
	\repeat
	\endthesismainmatter
}

% === Conditional list of tables, figures, ... ===
\newcommand\conditionalLoF{%
  \iftotalfigures\listoffigures\fi}
\newcommand\conditionalLoT{%
  \iftotaltables\listoftables\fi}
\newcommand\conditionalLoL{%
  \iftotallstlistings\lstlistoflistings\fi} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deal with optional lists in the frontmatter: listoftables, listoffigures, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@printlist#1{ %
		#1\cleardoublepage
}

\def\addlisttofrontmatter#1{ %
		\listgadd{\@frontmatter@list}{#1}
}

\def\printotherlists{ %
		\cleardoublepage
		\forlistloop{\@printlist}{\@frontmatter@list} %
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\input{thesisisel-files/frontpage.clo}
\input{thesisisel-files/frontpageMSc.clo}
\input{thesisisel-files/frontpageBSC.clo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEDICATORY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\dedicatory{ %
	\if @openright\cleardoublepage\else\clearpage\fi
	\thispagestyle{empty}
	~\\[2cm]
    \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti
    \begin{flushright}}
\def\enddedicatory{
	\end{flushright}
    \normalfont
    \end{minipage}
	\end{flushright}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% QUOTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\quote{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\thispagestyle{empty}
	~\\[2cm]
    \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti
    \begin{flushright}}
\def\endquote{
	\end{flushright}
    \normalfont
    \end{minipage}
	\end{flushright}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ACKNOWLEDGEMENT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\acknowledgements{%
  \chapter*{\acknowledgementsname}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\abstractEN{%
  \selectlanguage{english}
  \gdef\@keywordsname{\@keywordsnameEN}
  \chapter*{\@abstrnameEN}
}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  ABSTRACT IN PORTUGUESE LANGUAGE (RESUMO)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\abstractPT{%
  \selectlanguage{portuguese}
  \gdef\@keywordsname{\@keywordsnamePT}
  \chapter*{\@abstrnamePT}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% KEYWORDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTERS FILES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\newcommand*{\MaxNumOfChapters}{10}% Adjust these two settings for your needs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLE OF CONTENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTIONING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\setcounter{secnumdepth}{3}


\definecolor{backGrayColor}{rgb}{0.7,0.7,0.7} % Background title color
\titleformat{\chapter}[display]
	{\bfseries\Huge}				% format
	{\hfill\colorbox{backGrayColor}{\fontsize{80}{100}\selectfont{\textcolor{white}	{\thechapter}}}} % label
	{1ex}							% sep
	{%\titlerule
  	\vspace{2ex}\filleft}			% before
	[\vspace{1cm}					%\titlerule
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADERS & FOOTERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BIBLIOGRAPHY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%http://tex.stackexchange.com/questions/15971/bibliography-with-page-numbers
%URL linebreak in footnote
%\usepackage{breakurl}
\usepackage[
	style=ieee, %{ieee, numeric, alphabetic, authoryear, authortitle, verbose, apa, chem-acs, chem-angew, mla, nature, science, nejm, phys},
%defernumbers=true, 
	backend=bibtex, %{bibtex, biber}
	sorting=debug, %{none, nty, nyt, nyvt, anyt, anyvt, ynt, debug},
	%dashed=false, 
	maxnames=20,
	maxcitenames=3,
	giveninits=false,
	citestyle=nature,
	natbib=true,%
	doi=true,%
	%url=false,%
	isbn=true,%
	%urldate=long,
	%uniquename=false,
	%uniquelist=false
]{biblatex}

%%%% The important part:
\DefineBibliographyStrings{portuguese}{%
	bibliography = {Referências},
    references = {Referências},
    page={pág.},
    pages={páginas},
    and={\&},
  	mathesis = {Tese de Mestrado},
  	phdthesis = {Tese de Doutoramento}
}

\DefineBibliographyStrings{english}{%
	bibliography = {References},
    references = {References},
    page={page},
    pages={pages},
    %and={\&}  	
}
\usepackage{tocbibind} % Add bibliography/index/contents to Table of Contents. Automatically adds the bibliography and/or the index and/or the contents, etc., to the Table of Contents.

% If you want to break on URL numbers
\setcounter{biburlnumpenalty}{9000}
% If you want to break on URL lower case letters
\setcounter{biburllcpenalty}{9000}
% If you want to break on URL UPPER CASE letters
\setcounter{biburlucpenalty}{9000}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APPENDIXES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\newcount\@appxcount
\@appxcount 0\relax

\def\appendixfile#1{%
	\advance\@appxcount 1\relax
	\expandafter\gdef\csname @appendixfile\number\@appxcount\endcsname{Appendixes/#1}
}

\ifx\@appendixfile\@empty
	\def\printappendixes{}
\else
	\def\printappendixes{
		\appendix
		\newcount\@myi
		\@myi 0\relax
		\loop
			\advance\@myi 1\relax
			\def\@appxname{\expandafter\csname @appendixfile\number\@myi		\endcsname}
		\@input@{\@appxname}
		\ifnum \@myi < \@appxcount
		\repeat
	}
\fi
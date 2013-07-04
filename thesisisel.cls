%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% thesisisel.cls
%%% ISEL/IPL Dissertation document class
%%%
%%% By Matilde Pós-de-Mina Pato (mpato@deq.isel.pt)
%%% Version of October 2012
%%% Revision 1st: July 2013 
%%%
%%% This template is vaguely based on a template from the
%%%     Universidade Nova de Lisboa (NOT OFFICIAL)
%%%
%%% BUGS and SUGGESTIONS: please send email to "mpato@deq.isel.pt"
%%%     or sumit a ticket in the the project web page at
%%%     https://github.com/matpato/thesisisel
%%%
%%% CONTRIBUTERS are welcome. Please contact "mpato@deq.isel.pt"
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisisel}[2012/10/09]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% == Languages ===
\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{en}{%
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

% == Type of Document ===
% \@degreetype=0	BSc report
% \@degreetype=1	MSc preliminary report
% \@degreetype=2	MSc dissertation
\let\@degreetype=3
\DeclareOption{bsc}{
	\let\@degreetype=0
	\def\@degree{\@bachelordegree}
	\def\@dissertationtype{\@bscdissertationtstr}
}
\DeclareOption{prepmsc}{
	\let\@degreetype=1
	\def\@degree{\@mastersdegree}
	\def\@dissertationtype{\@prepmscdissertationtstr}
}
\DeclareOption{msc}{
	\let\@degreetype=2
	\def\@degree{\@mastersdegree}
	\def\@dissertationtype{\@mscdissertationtstr}
}


% == Default Options ===
\ExecuteOptions{en,msc}
\ProcessOptions

\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Latin1
\if\@utf0
\RequirePackage[latin1]{inputenc}
% UTF8
\else\if\@utf1
\RequirePackage[utf8]{inputenc}
\fi\fi

\RequirePackage[T1]{fontenc}

%====================================================================
% PACKAGE amsmath, amsthm, amssymb, amsfonts:
%====================================================================
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
%\RequirePackage{amsmath,amsfonts,amssymb,amsthm,verbatim, mathabx} 

\RequirePackage{csquotes}
\RequirePackage{babel}

\RequirePackage[toc]{appendix}

% \RequirePackage{tabularx}

\RequirePackage{ifthen}

\RequirePackage{titlesec}           % To format the headings
\RequirePackage{fancyhdr}        % Headings configuration

% Set inter-line spacing
\RequirePackage{setspace}           % One-and-half spacing
\onehalfspacing

%\RequirePackage{mathptmx}
\RequirePackage[scaled]{helvet}
\RequirePackage{courier}
\RequirePackage{palatino}

\usepackage{ifpdf}		% This is now the recommended way for checking for PDFLaTeX:
\ifpdf
\RequirePackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.pdf, .png, .jpg, .tif}
\RequirePackage[pdftex,usenames]{color}
\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
\RequirePackage[pdftex,breaklinks,colorlinks,pdfdisplaydoctitle,citecolor=mydarkblue,linkcolor=black,urlcolor=mydarkblue]{hyperref}
\else
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps, .png, .jpg}
\RequirePackage[usenames]{color}
\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
\RequirePackage[breaklinks,colorlinks,pdfdisplaydoctitle,citecolor=mydarkblue,linkcolor=black,urlcolor=mydarkblue]{hyperref}
\fi

%====================================================================
% PACKAGE hyperref
%====================================================================
% Set links for references and citations in document
% Some MiKTeX distributions have faulty PDF creators in which case this package will not work correctly
% Long live Linux :D
\hypersetup{ a4paper=true,
             pdftitle={ },
             pdfauthor={ },
             pdfsubject={ },
             pdfcreator={Matilde Pato},
             pdfkeywords={ }
             }
%
\RequirePackage[top=3cm,bottom=3cm,inner=3.5cm,outer=2.5cm]{geometry}[2012/10/09]
% \setlength{\marginparwidth}{2cm}

\RequirePackage{ctable}

% This can be done in an expandable form using \csname.  Use \Repeat
\RequirePackage{expl3}
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

\usepackage[square, comma, sort&compress, numbers]{natbib}

%====================================================================
% PACKAGE acronyum and nomencl
%====================================================================
% This package is most usefull for acronyms. The package garantees that all acronyms definitions 
% are given at the first usage. IMPORTANT: do not use acronyms in titles/captions; otherwise the definition will appear on the table of contents.
% Printing a list of abbreviations or symbols is one of these things (like so many) LaTeX provides a very simple and elegant solution for. 
% The nomencl package implements a few basic commands to do that.
% First load the package in the preamble. The makenomenclature command is required for the generation of the nomenclature file (.nlo). Commenting it out is a convenient way to “switch it off”.
%
\usepackage[printonlyused]{acronym}
\usepackage{nomencl}
\makenomenclature
\usepackage[style=altlistgroup,toc,counter=page]{glossaries} % make a separate list of acronyms

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \let\origcleardoublepage=\cleardoublepage
 \def\cleardoublepage{%
   \newpage{\pagestyle{empty}\origcleardoublepage}
 }

% 
% No identation
\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}
% 

%%
% For use with the pseudocode package
 \def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEFINE LOGO AND IMAGE IN FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add ISEL's logo and image in frontpage
\newcommand{\logo}[1]{
\parbox[t][0.15\paperheight]{0.1\paperwidth}{%
\vfill
\centering
\includegraphics[scale=0.1]{#1}%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Some relevant strings

\gdef\@mbachelordegreestr{Licenciado}
\gdef\@fbachelordegreestr{Licenciada}
\gdef\@mmastersdegreestr{Mestre}
\gdef\@fmastersdegreestr{Mestre}

\gdef\@singlemadviserstr{Orientador}
\gdef\@manymadviserstr{Orientadores}

\gdef\@bachelordissertationstr{Trabalho de Licenciatura}
\gdef\@mastersdissertationstr{Dissertação de Mestrado}
\gdef\@mastersqualifyingstr{Preparação de Dissertação}

\gdef\@jurystr{Júri}
\gdef\@presidentstr{Presidente}

\gdef\@singlejuryastr{Vogal}
\gdef\@manyjuryastr{Vogais}

\gdef\@bscdissertationtstr{Relatório para obtenção do Grau 
de \@degree \\em \@majorfield}
\gdef\@prepmscdissertationtstr{Relatório intermédio para obtenção do Grau 
de \@degree \\em \@majorfield}
\gdef\@mscdissertationtstr{Dissertação para obtenção do Grau 
de \@degree \\em \@majorfield}

\gdef\@presentationtext{\@dissertationtype}

%% Language Dependent

\gdef\@abstrnamePT{Resumo}
\gdef\@abstrnameEN{Abstract}

\gdef\@keywordsnamePT{Palavras-chave}
\gdef\@keywordsnameEN{Keywords}


% Portuguese
\if\@language0
  \gdef\@notdefined{NÃO DEFINIDO}
  \gdef\acknowledgementsname{Agradecimentos}
  \def\lstlistlistingname{Listagens}
  \def\appendixname{Anexos}
  \renewcommand*{\nomname}{Nomenclatura}
    \addto{\captionsportuguese}{
      \renewcommand{\glossaryname}{Glossário}
    }% English
\else\if\@language1
  \gdef\@notdefined{UNDEFINED}
  \gdef\acknowledgementsname{Acknowledgements}
  \def\appendixname{Appendix}
\fi\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CREATING A TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{~majorfield \@notdefined}

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

%% Author's identification

\def\author{%
  \@ifnextchar [%
    {\@pauthor}%
    {\@pauthor[m]}}

\def\@pauthor[#1]#2{%
  \if#1m
  	\def\authorgender{m}
  \else\if#1f
	\def\authorgender{f}
  \else
  \typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please specify author gender using [m] or [f] as the first^^J%
!  argument of the "author" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   \errhelp{Please be gentle and follow the template recommendations.}
   \errmessage{Please specify author gender!}
  \fi\fi

  \gdef\@author{#2}
  \hypersetup{pdfauthor={\@author}}
  }

\def\@author{~author \@notdefined}

\def\authordegree#1{%
  \gdef\@authordegree{#1}}
\def\@authordegree{~authordegree \@notdefined}

%% Advisors identification (at most 4 of each)
%% \adviser[m|f]{Category}{Name}
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

%% Work identification

\def\@
\def\title#1{%
  \gdef\@title{#1}
  \hypersetup{pdftitle={\@title}}}
\def\@title{~title \@notdefined}

\def\@texttype{%
  \if\@degreetype0
    \@bachelordissertationstr
  \else\if\@degreetype1
    \@mastersqualifyingstr
  \else\if\@degreetype2
  \@mastersdissertationstr
  \fi\fi\fi}

\def\thedegree#1#2{%
	\expandafter\csname @#1#2\endcsname}

\def\@degree{%
  \if\@degreetype0
    \thedegree{\authorgender}{bachelordegreestr}
  \else\if\@degreetype1
    \thedegree{\authorgender}{mastersdegreestr}
  \else\if\@degreetype2
    \thedegree{\authorgender}{mastersdegreestr}
\fi\fi\fi}


% Jury identification (at most 5 of each)
%% [p] for president and [a] for referees 
%% \jury[p|a]{Category and Name}
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
		center,
	]{rX}{}{
	& \@jurystr: \\
 	\printthejuryp
	\printthejurya
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\synctex=1 % Uase synctex
\brokenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Including chapters and similars
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\dedicatoryfile#1{%
  \gdef\@dedicatoryfile{#1}}
\def\@dedicatoryfile{\@empty}

\ifx\@dedicatoryfile\@empty
\def\printdedicatory{}
\else
\def\printdedicatory{
	\if\@degreetype0
		\@input@{Chapters/\@dedicatoryfile}\global\let\@dedicatoryfile\@empty
	\else\if\@degreetype1
	\else\if\@degreetype2
		\@input@{Chapters/\@dedicatoryfile}\global\let\@dedicatoryfile\@empty
	\fi\fi\fi
}
\fi

\def\acknowledgementsfile#1{%
  \gdef\@acknowledgementsfile{#1}}
\def\@acknowledgementsfile{~acknowledgementsfile \@notdefined}

\def\printacknowledgements{
	\if\@degreetype0		\@input@{Chapters/\@acknowledgementsfile}\global\let\@acknowledgementsfile\@empty
	\else\if\@degreetype1
	\else\if\@degreetype2		\@input@{Chapters/\@acknowledgementsfile}\global\let\@acknowledgementsfile\@empty
	\fi\fi\fi
}


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

\def\thesismainmatter{%
	\mainmatter
	\pagestyle{fancy}
	\fancyhead{}
	\setlength{\headheight}{15pt}
	\fancyhead[RO,LE]{\leftmark\hfill\rightmark}
	\def\chaptermark##1{\markboth{\fontfamily{ptm}% Times New Roman (ptm) or Helvetica (phv)
		\selectfont\footnotesize\thechapter.\ \textsc{##1}}{}}
	\def\sectionmark##1{\markright{\fontfamily{ptm}%
	 	\selectfont\footnotesize\thesection.\ ##1}}
	\if\@language0   % Thesis in  Portuguese
		\selectlanguage{portuguese}
	\else\if\@language1   % Thesis in English
		\selectlanguage{english}
	\fi\fi
}

\def\endthesismainmatter{%
	\fancyhead{}
	\lhead{\nouppercase{\textsc{\leftmark}}}
	\rhead{}
}

% Chapters
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

% Appendixes
\newcount\@appxcount
\@appxcount 0\relax

\def\appendixfile#1{%
	\advance\@appxcount 1\relax
	\expandafter\gdef\csname @appendixfile\number\@appxcount\endcsname{Chapters/#1}
}

\def\printappendixes{%	
	\appendix
	\newcount\@myi
	\@myi 0\relax
	\loop
		\advance\@myi 1\relax
		\def\@appxname{\expandafter\csname @appendixfile\number\@myi\endcsname}
		\@input@{\@appxname}
	\ifnum \@myi < \@appxcount
	\repeat
}


\def\printlistoffigures{%
  \gdef\@printlistoffigures{\listoffigures}}
\def\@printlistoffigures{}

\def\printlistoftables{%
  \gdef\@printlistoftables{\listoftables}}
\def\@printlistoftables{}

\def\printlistoflistings{%
  \gdef\@printlistoflistings{\lstlistoflistings}}
\def\@printlistoflistings{}

\def\printotherlists{%
	\@printlistoffigures
	\@printlistoftables
	\if\@language0   % Estamos a usar o Português
		\def\lstlistlistingname{Listagens}
	\fi
	\@printlistoflistings
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Frontpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\frontpage{

\thispagestyle{empty}
\newgeometry{tmargin=0.25cm,bmargin=0.5cm,lmargin=2cm,rmargin=2cm}

\begin{center}
% Put logo
	\logo{\@universitylogo}

%Define font style (ptm=Times New Roman)
	\fontfamily{ptm}

% Name of Institute
	\fontsize{16}{19.2}
	\selectfont
	\textbf{\@university}

\vspace{0.25cm}	
% Name of Department
	\fontsize{14}{16.8}
	\selectfont
	\textbf{\@department}

% Put image
	\ifx\@workimage\undefined
	\noimage
	\else
	\image{\@workimage}
	\fi

\vspace{0.65cm}
% Title of Dissertation
	\fontsize{18}{21.6}
	\selectfont
	\textbf{\@title}\\[0.75cm]

\vspace{0.2cm}	
% Name of Candidate
	\fontsize{16}{19.2}
	\selectfont
	\textbf{\@author}
	
\vspace{0.15cm}	
% Academic qualifications
	\fontsize{14}{16.8}
	\selectfont
	\@authordegree

\vspace{0.75cm}
% Degree
	\fontsize{12}{13}
	\selectfont
	\@presentationtext
	
	\vfill
	% Advisers
	\fontsize{11}{14.4}
	\selectfont
	\ctable[
		cap=,
		caption=,
		label=,
		pos=h,
		maxwidth=1\linewidth,
	]{rX}{}{
		\printadviser[]{1}
		\printadviser[]{2}
}


\vfill\vfill
% Referee board
\if\@degreetype0
\printthejury
\else\if\@degreetype1
\else\if\@degreetype2
\printthejury
\fi\fi\fi

\vfill\vfill\vfill

% Date
\fontsize{10}{12.2}
\selectfont
\textbf{\@themonth, \@theyear}
	
\end{center}
\restoregeometry
\cleardoublepage %\newpage
\thispagestyle{empty}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedicatory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\dedicatory{%
	\if@openright\cleardoublepage\else\clearpage\fi
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quote
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\acknowledgements{%
  \chapter*{\acknowledgementsname}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractPT{%
  \selectlanguage{portuguese}
  \gdef\@keywordsname{\@keywordsnamePT}
  \chapter*{\@abstrnamePT}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractEN{%
  \selectlanguage{english}
  \gdef\@keywordsname{\@keywordsnameEN}
  \chapter*{\@abstrnameEN}
}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Keywords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{3}

\definecolor{backGrayColor}{rgb}{0.7,0.7,0.7} % Background title color

\titleformat{\chapter}[display]
{\bfseries\Huge}				% format
{\hfill\colorbox{backGrayColor}{\fontsize{80}{100}\selectfont{\textcolor{white}{\thechapter}}}} % label
{1ex}							% sep
{%\titlerule
  \vspace{2ex}\filleft}			% before
[\vspace{1cm}					%\titlerule
]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers & footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Appendix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

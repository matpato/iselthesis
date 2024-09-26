%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% iselthesis.cls
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
%%% Version v3.0.: May 2024
%%% Version v4.0: June 2024
%%% 
%%% This template is vaguely  adapted on a template from the
%%%     Universidade Nova de Lisboa (NOT OFFICIAL)
%%%
%%% Authors / Contributors:
%%%      - Matilde Pato <matilde.pato@isel.pt>
%%%      - Nuno Datia <nuno.datia@isel.pt>
%%%
%%% BUGS and SUGGESTIONS: please send email to "matilde.pato@isel.pt"
%%%     or sumit a ticket in the the project web page at
%%%     https://github.com/matpato/iselthesis
%%%
%%% CONTRIBUTERS are welcome. Please contact "matilde.pato@isel.pt"
%%%
%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
%%% 
%%%   You SHOULD NOT change this file (you are playing with fire!)
%%% 
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
%============================================================

\ProvidesClass{iselthesis}[2024-05-30 iselthesis template]
\NeedsTeXFormat{LaTeX2e}[2020-02-02]


% --------------------------------------------------------
% Save these definitions asap, to be used later in the “\annex” command,
% because "\@Roman" and "\Roman" were failing with pdflatex
% when loading the "greek" language (and LGR font encofing)
% --------------------------------------------------------

\let\oldRoman=\Roman
\let\old@Roman=\@Roman

% --------------------------------------------------------
%%  MEMOIR CUSTOMIZATION AND LOADING
%%      Please open and edit the appropriate
%%       configuration file “Config/_memoir.tex”
% --------------------------------------------------------

\newcommand*{\ncmemoirsetup}[1]{\PassOptionsToClass{#1}{memoir}}
\input{Config/_memoir}
\LoadClass{memoir}
\OnehalfSpacing% One-and-half spacing

\newcolumntype{L}{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}
\newcolumntype{C}{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}X}
\newcolumntype{R}{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}X}


% --------------------------------------------------------
%% GENERAL PURPOSE MACROS
% --------------------------------------------------------
% Redefine \cleardoublepage to use a really empty page…
\let\origcleardoublepage=\cleardoublepage
\renewcommand\cleardoublepage{%
  \newpage{\pagestyle{empty}\origcleardoublepage}%
}

% Do some magic defining arrays :)
\newcommand{\userData}[1]{%
  \@namedef{#1}[##1]=##2{\@namedef{#1##1}{##2}}%
  \@namedef{the#1}[##1]{\@nameuse{#1##1}}%
}

\def\ifexists#1[#2]#3{%
  \ifcsname #1#2\endcsname%
    #3%
  \fi%
}

\newcommand{\iteratecsvlist}[2]{%
  \@for\iselthesis@themember:=#2\do{#1{\iselthesis@themember}}%
}

% --------------------------------------------------------
%% Loading additinal files
% --------------------------------------------------------

\def\iselthesis@saveabstractorder{}
\newcommand{\@setabstractorder}{%
  \StrGobbleRight{\iselthesis@saveabstractorder}{1}[\iselthesis@saveabstractorder]%
  \@for\myi:=\iselthesis@saveabstractorder\do{%
    \StrCut{\myi}{=}\iselthesis@key\iselthesis@val%
    \IfStrEq{\iselthesis@val}{}{\edef\iselthesis@val{\iselthesis@key}\def\iselthesis@key{\iselthesis@opt@lang}}{}%
    \abstractorder(\iselthesis@key):={\iselthesis@val}%
  }%
}

% --------------------------------------------------------
%% Multilingual support
% --------------------------------------------------------
\newcommand{\selectthelanguage}[1]{%
  \xdef\iselthesis@tmp{\thelangabbrev[#1]}%
  \expandafter\selectlanguage\expandafter{\iselthesis@tmp}%
}
% --------------------------------------------------------
% SOME PRELIMINARY LANGUAGE DEFINITIONS
\userData{langabbrev}
\userData{langsused}

\input{ISELthesis-files/lang-conf.clo}

% --------------------------------------------------------
%% SOME ESSENTIAL PACKAGES
%% Others will be loaded later, in the file “packages.clo”
%% And, additionaly defined by use in the file "_packages.tex"
% --------------------------------------------------------
\RequirePackage[table,svgnames]{xcolor}%
\RequirePackage{colortbl}
\definecolor{darkblue}{rgb}{0.0,0.08,0.45}

% \newcommand*{\ncbibsetup}[1]{%
%   \@ifpackageloaded{biblatex}{\ClassError{iselthesis}{Please load biblatex options earlier.}{}}{\PassOptionsToPackage{#1}{biblatex}}%
% }

\newcommand*{\@loadglossaryfiles}{%
  \@for\listitem:={glossary,acronym,symbols}\do{%
    \iffileadded[\listitem]{glossaries}{\iselthesis@loadallfiles{\listitem}{glossaries}}{}%
  }%
}


\def\UrlBreaks{\do\/\do-}

\RequirePackage{ISELthesis-files/user-sty/memory2}

% --------------------------------------------------------
% PROCESS PACKAGE OPTIONS
\input{ISELthesis-files/options.clo}

% --------------------------------------------------------
% LOAD ADDITIONAL PACKAGES
\input{ISELthesis-files/packages.clo}

% --------------------------------------------------------
% FIX BABEL TRANSLATION
\input{ISELthesis-files/fix-babel.clo}

% --------------------------------------------------------
%% DEFINE LOGO AND IMAGE IN FRONTPAGE
% --------------------------------------------------------

\newcommand{\ncimage}[1]{
\parbox[t][12cm][c]{12cm}{%
\vfill
\centering
\includegraphics[height=8cm,width=12cm]{#1}%
\vfill
}}

\newcommand{\noimage}{
\parbox[t][12cm][c]{12cm}{%
\vfill
}}

% Image
\def\workimage#1{ \gdef\@workimage{#1} }


% --------------------------------------------------------
% Trim spaces around argument
\RequirePackage{ISELthesis-files/user-sty/fix-profiling}

% --------------------------------------------------------
%% Cover definition macros
% --------------------------------------------------------

%%%%%%% PUT THIS IN A MORE ADEQUATE PLACE
\newif\if@printcommitteeaux
\@printcommitteeauxfalse % aux variable

% --------------------------------------------------------
% COVER DEFINITION MACROS
% --------------------------------------------------------

% \addcoveritem[<position>]{<width>}{<text>}(<cover page>)
\def\addcoveritem[#1]#2#3(#4){%
  \ifstrequal{#4}{cover}{%
    \listcsadd{iselthesis@fstcoveritem@list}{[#1][#2]{#3}}%
  }{%
  \ifstrequal{#4}{secondcover}{%
    \listcsadd{iselthesis@scdcoveritem@list}{[#1][#2]{#3}}%
  }{}
  }%
}

\newcounter{iselthesis@myloop}
\def\iselthesis@printcoveritem@i[#1][#2]#3{%
  \IfInteger{#2}{%IS INTEGER
    \setcounter{iselthesis@myloop}{0}%
    \whileboolexpr{test{\ifnumless{\value{iselthesis@myloop}}{#2}}}{%
      \stepcounter{iselthesis@myloop}%
      \vfill%
    }%
  }{%IS NOT INTEGER
    \vspace*{#2}%
  }%
  \noindent\begin{minipage}[t]{\linewidth}%
    \ifthenelse{\equal{#1}{l}}{\raggedright}{%
      \ifthenelse{\equal{#1}{c}}{\centering}{%
        \ifthenelse{\equal{#1}{r}}{\raggedleft}{%
        }%
      }%
    }%
    #3%
  \end{minipage}\par%
}


\newcommand{\iselthesis@printcoveritem}[1]{%
  \iselthesis@printcoveritem@i#1%
}

% Define the \printcoveritems command
\def\printcoveritems(#1){%
   \ifstrequal{#1}{cover}{%
    \ifcsdef{iselthesis@fstcoveritem@list}{%
      \forlistcsloop{\iselthesis@printcoveritem}{iselthesis@fstcoveritem@list}%
    }{}%
  }{%
    \ifstrequal{#1}{secondcover}{%
      \ifcsdef{iselthesis@scdcoveritem@list}{%
        \forlistcsloop{\iselthesis@printcoveritem}{iselthesis@scdcoveritem@list}%
      }{}%
    }{}%
  }%
}

\newlength{\mpwidth}%
\newlength{\mpheight}%
\newsavebox{\iselthesis@coverbox}%

\def\printcoverpage{%
  \thispagestyle{empty}%
  \selectthelanguage{\iselthesis@opt@coverlang}%

  \setlength{\mpwidth}{\dimexpr%
    \paperwidth%
      -\themargin(\iselthesis@opt@docdegree,left)%
      -\themargin(\iselthesis@opt@docdegree,right)}%
  
  \setlength{\mpheight}{\dimexpr%
    \paperheight%
       -\themargin(\iselthesis@opt@docdegree,top)%
       -\themargin(\iselthesis@opt@docdegree,bottom)}%
  \sbox{\iselthesis@coverbox}{%
    \parbox[t][\mpheight][t]{\mpwidth}{%
     \printcoveritems(cover)%
    }%
  }%
  \AddToShipoutPictureFG*{%
    \AtPageUpperLeft{%
      \put(%
    \LenToUnit{\themargin(\iselthesis@opt@docdegree,left)},%
        -\LenToUnit{\themargin(\iselthesis@opt@docdegree,top)})%
        {\usebox{\iselthesis@coverbox}}%
    }%
  }%
  ~% This space is important here so that the cover page is not empty anymore!
  \cleardoublepage%
  %% Print second cover page if is MSc
  \@printcommitteeauxtrue
  \setcounter{@iselthesis@cnt}{0}%	reset counter used in the name listing
  \ifthenelse{%
  	\equal{\iselthesis@opt@docdegree}{msc}%
	}%
	{
    \thispagestyle{empty}%
    \selectthelanguage{\iselthesis@opt@coverlang}%

  \setlength{\mpwidth}{\dimexpr%
    \paperwidth%
      -\themargin(\iselthesis@opt@docdegree,left)%
      -\themargin(\iselthesis@opt@docdegree,right)}%
  
  \setlength{\mpheight}{\dimexpr%
    \paperheight%
       -\themargin(\iselthesis@opt@docdegree,top)%
       -\themargin(\iselthesis@opt@docdegree,bottom)}%
  \sbox{\iselthesis@coverbox}{%
    \parbox[t][\mpheight][t]{\mpwidth}{%
      \printcoveritems(secondcover)%
    }%
  }%
  \AddToShipoutPictureFG*{%
    \AtPageUpperLeft{%
      \put(%
    \LenToUnit{\themargin(\iselthesis@opt@docdegree,left)},%
        -\LenToUnit{\themargin(\iselthesis@opt@docdegree,top)})%
        {\usebox{\iselthesis@coverbox}}%
    }%
  }%
	  ~% This space is important here so that the cover page is not empty anymore!
	  \cleardoublepage%
  }%
  {}%
  \selectthelanguage{\iselthesis@opt@lang}%
}


\newcommand{\printbackcoverpage}{%
  \ifexists{thesiscover}[\iselthesis@opt@docdegree,back]{
    \cleardoublepage%
    \thispagestyle{empty}%
    ~
    \clearpage%
    \thispagestyle{empty}%
    %\coverbackground[\@nameuse{thesiscover\iselthesis@opt@docdegree,back}]
    ~% This space is important here so that the cover page is not empty anymore!
    \cleardoublepage%
    \selectthelanguage{\iselthesis@opt@lang}%
  }
}
% --------------------------------------------------------
%% Some definition 
% --------------------------------------------------------

\newdata{abstractorder}

\newdata{abstractstring}
\newdata{keywordsstring}

\newdata{copyrighttextstring}
\newdata{acknowledgmentsstring}
\newdata{acknowledgementstr}

\newcommand\iselthesis@undefined{\thenotdefined[\iselthesis@opt@lang]}

\newdata{notdefined}
\newdata{margin}
\newdata{spine}

\newdata{thesiscover}
\newdata{degreestr}
\newdata{degreestrfont}

\newdata{doctypestr}
\newdata{doctypestrfont}

\newdata{committeeorder}
\newdata{committeeadviser}

\newdata{committeetitlestr}
\newdata{committeetitlestrfont}

\newdata{committeestr}
\newdata{committeestrfont}

\newdata{dissertationstr}
\newdata{dissertationstrfont}

\newdata{doctitle}

% --------------------------------------------------------
%% Include strings in the used languages
% --------------------------------------------------------

\newcommand{\iselthesis@includestrings@lang}[1]{%
  \edef\iselthesis@filetoinclude{ISELthesis-files/Strings/strings-#1.clo}
  \input{\iselthesis@filetoinclude}%
}
\iteratecsvlist{\iselthesis@includestrings@lang}{\iselthesis@tmp}%


% --------------------------------------------------------
%% Defaults for university, faculty, degree, etc…
% --------------------------------------------------------
\newdata{university}
\newdata{school}
\newdata{department}

\newdata{majorfield}
\newdata{specialization}

% --------------------------------------------------------
% Add school specific Images folder to the graphics path
\prependtographicspath{{Logo/}}

% --------------------------------------------------------
% Include the file with the defaults
\InputIfFileExists{ISELthesis-files/Default/defaults.clo}{}{}

% --------------------------------------------------------
%% LABELS
% --------------------------------------------------------

\providecommand\thepresentationtext{%
  \thedissertationstrfont()%
  \ifdatadefined{dissertationstr}(\iselthesis@opt@docdegree,\iselthesis@opt@coverlang){%
    \thedissertationstr(\iselthesis@opt@docdegree,\iselthesis@opt@coverlang)%
  }{%
    }%
}

\providecommand\thecopyrightstr{%
    \thispagestyle{empty}%
    \noindent%
    Copyright\textcopyright\ \thedocauthor(name), %
    \theschool(\iselthesis@opt@lang), \theuniversity(\iselthesis@opt@lang).\\%
    \thecopyrighttextstring(\iselthesis@opt@lang)%
}

% --------------------------------------------------------
%% DEFINITIONS OF YEAR AND MONTH
% --------------------------------------------------------
% Date and month
\newcommand{\thedatemonth}{~datemonth \iselthesis@undefined}
\newcommand{\thedateyear}{~dateyear \iselthesis@undefined}

\newcommand{\datemonth}[1]{\renewcommand{\thedatemonth}{
     \IfInteger{#1}{\pgfcalendarmonthname{#1}}{#1}
     }}
\newcommand{\dateyear}[1]{\renewcommand{\thedateyear}{#1}}

% --------------------------------------------------------
%% DEFINITIONS FOR THE REMINDER OF CUSTOMIZATION STUFF
% --------------------------------------------------------

\def\ncfield#1{\@ifstar{\iselthesisfieldifundef{#1}}{\iselthesisfield{#1}}}
\def\iselthesisfieldifundef#1(#2)#3{\ifdatadefined{#1}(#2){}{\iselthesisfield{#1}(#2){#3}}}
\def\iselthesisfield#1(#2)#3{\csname #1\endcsname(#2):={#3}}

% Specific Field Definitions: School, Department, Major Field and Specialization Area
\def\ncuniversity{\ncfield{university}}
\def\ncschool{\ncfield{school}}
\def\ncdepartment{\ncfield{department}}
\def\ncmajorfield{\ncfield{majorfield}}
\def\ncspecialization{\ncfield{specialization}}

% --------------------------------------------------------
% Title
\def\nctitle(#1,#2)#3{%
  % #1 = type (main, spine) title
  % #2 = lang
  % #3 = value
  % \typeout{NT TITLE [#1] [#2] [#3]}%
  \noexpandarg
  \StrSubstitute{#3}{\\}{ }[\iselthesis@cleantitle]
  % \typeout{XXXX [\iselthesis@cleantitle]}\aaa
  \doctitle(#2,#1):={\iselthesis@cleantitle}%
  \doctitle(#2,#1,cover):={#3}%
  \IfStrEq{#1}{main}{\doctitle(#2,spine):=?{\iselthesis@cleantitle}}{}%
  \fullexpandarg
}

% --------------------------------------------------------
%% AUTHOR identification
% --------------------------------------------------------
\newdata{docauthor}
\docauthor(name):={Author Name}
\docauthor(name,short):={Author Short Name}
\docauthor(gender):={Author Gender}
\docauthor(degree,\iselthesis@opt@coverlang):={Author Previous Degree}

\def\ncauthorname(#1)#2#3{% [m|f]{Long name}{Short name}
  \docauthor(gender):={#1}%
  \docauthor(name):={\uppercase{#2}}\hypersetup{pdfauthor={#2}}%
  \docauthor(name,short):={#3}}

\def\ncauthordegree(#1)#2{
  \docauthor(degree,#1):={#2}
  }
 
% --------------------------------------------------------
%% NEW definition for COMMITTEE & ADVISERS with lists
% --------------------------------------------------------

% Define a boolean variable to indicate whether to print affiliation
\newif\ifprintaffiliation
\printaffiliationtrue % Initialize to false by default

% Command to set the print affiliation option
\newcommand{\setprintaffiliation}[1]{%
  \ifnum#1=0
    \printaffiliationfalse
  \else
    \printaffiliationtrue
  \fi
}

\newcommand{\initcommittee}[1]{%
  \ifcsname c@iselthesis@committee@#1@cnt\endcsname%
  \else
    \newcounter{iselthesis@committee@#1@cnt}% To count the total # of members in class
    \setcounter{iselthesis@committee@#1@cnt}{0}%
    \newcounter{iselthesis@committee@#1m@cnt}% To count the # of male members in class
    \setcounter{iselthesis@committee@#1m@cnt}{0}%
    \newcounter{iselthesis@committee@#1f@cnt}% To count the # of female members in class
    \setcounter{iselthesis@committee@#1f@cnt}{0}%
  \fi
}

% Main macro to handle committee member addition
\def\ncmember(#1,#2)#3#4{% #1={c,r} #2={m,f} #3={member name}
  \initcommittee{#1}%
  \stepcounter{iselthesis@committee@#1@cnt}%
  \stepcounter{iselthesis@committee@#1#2@cnt}%
  \listcsadd{iselthesis@committee@#1@list}{{#3, #4}}%
}

% Simplified command to print committee members
\newcommand{\iselthesis@printcommitteeclassmembers}[1]{%
  & \ifprintaffiliation % Check if affiliation should be printed
    #1 \\[0.4ex]%
  \else
    \StrBefore{#1}{,}\\[0.4ex]% Extract only the name and ignore the rest
  \fi
}

% Simplified command to print committee members
\newcommand{\iselthesis@printcommitteemembers}[1]{%
  % Check if committee member list exists
  \ifcsname iselthesis@committee@#1@list\endcsname
    % Determine gender and total number for Portuguese language form
    \ifthenelse{\value{iselthesis@committee@#1m@cnt} = 0}%
      {\def\iselthesis@tmp@gender{f}}%
      {\def\iselthesis@tmp@gender{m}}%
    \ifthenelse{\value{iselthesis@committee@#1@cnt} = 1}%
      {\def\iselthesis@tmp@total{1}}%
      {\def\iselthesis@tmp@total{2}}%
    % Print committee member string
    \thecommitteetitlestrfont(\iselthesis@opt@coverlang)%
    \thecommitteestr(#1,\iselthesis@tmp@total,\iselthesis@tmp@gender,\iselthesis@opt@coverlang):%
    % Loop through and print each committee member in the list
    \forlistcsloop{\iselthesis@printcommitteeclassmembers}{iselthesis@committee@#1@list}%
  \fi
}

% Simplified command to print committee section
\newcommand{\printcommittee@i}{%
\xdef\iselthesis@tmp{\thecommitteetitlestr(\iselthesis@opt@coverlang)}%
  \begin{tabular}{ll}%
    % Check if committee title string is empty
    \ifx\iselthesis@tmp\@empty
      % Do nothing if empty
    \else
      \thecommitteestrfont(\iselthesis@opt@coverlang)%
      \thecommitteetitlestr(\iselthesis@opt@coverlang):\\[1ex]%
    \fi
    % Print all committee members
    \xdef\iselthesis@tmp{\thecommitteeorder(all)}%
    \iteratecsvlist{\iselthesis@printcommitteemembers}{\iselthesis@tmp}%
  \end{tabular}%
}


% Simplified main command to print committee
\newcommand{\printcommittee}{%
  \ifthenelse{\equal{\iselthesis@opt@printcommittee}{true}}%
    {\printcommittee@i}%
    {}%
}

% Simplified command to print committee section
\newcommand{\printadvisers@i}{%
  \begin{tabular}{ll}%
   \ifx\iselthesis@tmp\@empty
      % Do nothing if empty
    \else
      \thecommitteestrfont(\iselthesis@opt@coverlang)%
    \fi
    % Print all advisers members
    \xdef\iselthesis@tmp{\thecommitteeadviser(adviser)}%
    \iteratecsvlist{\iselthesis@printcommitteemembers}{\iselthesis@tmp}%
  \end{tabular}%
}

% Command to print advisers
\newcommand{\printadvisers}{%
  \newbox\iselthesis@savebox%
  \sbox\iselthesis@savebox{%
    \begin{tabular}{@{}rl@{}}%
      \printadvisers@i%
     \end{tabular}%
  }%
  \ifdim\wd\iselthesis@savebox>\linewidth%
    \sbox\iselthesis@savebox{%
      \begin{tabularx}{0.99\linewidth}{@{}rX@{}}%
      \printadvisers@i%
      \end{tabularx}%
    }%
  \fi%
  \noindent\usebox\iselthesis@savebox%
}

\newcounter{@iselthesis@cnt}%
\setcounter{@iselthesis@cnt}{0}%


% --------------------------------------------------------
%% PAGE LAYOUT
% --------------------------------------------------------

\AtEndPreamble{\ncsetlayout}%

\newcommand*{\ncsetlayout}{%
    % \synctex=1% Use synctex
    \brokenpenalty=10000%
    \settypeoutlayoutunit{mm}%
    \setulmarginsandblock%
    {\themargin(\iselthesis@opt@media,top)}%
    {\themargin(\iselthesis@opt@media,bottom)}%
    {*}%
    \setlrmarginsandblock%
    {\themargin(\iselthesis@opt@media,left)}%
    {\themargin(\iselthesis@opt@media,right)}%
    {*}%
    \checkandfixthelayout%
    \ifequal{iselthesis@opt@media}{paper}{\openright}{}%
}

\newcommand*{\setpdftexpagesize}{%
  \@ifundefined{pdfpageheight}{}{\pdfpageheight=\the\stockheight}
  \@ifundefined{pdfpagewidth}{}{\pdfpagewidth=\the\stockwidth}
  \@ifundefined{pageheight}{}{\pageheight=\the\stockheight}
  \@ifundefined{pagewidth}{}{\pagewidth=\the\stockwidth}
  \@ifundefined{pdfvorigin}{}{\ifdim\pdfvorigin=0pt\pdfvorigin=1in\fi}
  \@ifundefined{pdfhorigin}{}{\ifdim\pdfhorigin=0pt\pdfhorigin=1in\fi}
}

\DeclareRobustCommand\nc@changelayout{%
  \setlength{\@colht}{\textheight}
  \setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}
  \setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep
    \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}%
}%

\newcommand\nc@savelength[2]{%
  \csappto{nt@restoregeometry@#1}{%
    \expandafter\csname
    #2\endcsname\expandafter=\expandafter\the\csname #2\endcsname\relax
  }%
}
\newcommand\nc@saveboolean[2]{%
  \csname if#2\endcsname
  \csappto{nt@restoregeometry@#1}{%
          \expandafter\noexpand\csname #1true\endcsname}%
  \else
  \csappto{nt@restoregeometry@#1\endcsname}{%
          \expandafter\noexpand\csname #1false\endcsname}%
  \fi
}%

\newcommand\nc@restoregeometry{%
  \csuse{nt@restoregeometryB@\the\c@pdfnewlytlevel}%
  \addtocounter{pdfnewlytlevel}{-1}%
}

\newcommand\nc@savegeometry{%
  \addtocounter{pdfnewlytlevel}{1}%
  \csgdef{nt@restoregeometryA@\the\c@pdfnewlytlevel}{}%
  \nc@savelength{\the\c@pdfnewlytlevel}{paperwidth}%
  \nc@savelength{\the\c@pdfnewlytlevel}{paperheight}%
  \nc@savelength{\the\c@pdfnewlytlevel}{textwidth}%
  \nc@savelength{\the\c@pdfnewlytlevel}{textheight}%
  \nc@savelength{\the\c@pdfnewlytlevel}{evensidemargin}%
  \nc@savelength{\the\c@pdfnewlytlevel}{oddsidemargin}%
  \nc@savelength{\the\c@pdfnewlytlevel}{topmargin}%
  \nc@savelength{\the\c@pdfnewlytlevel}{headheight}%
  \nc@savelength{\the\c@pdfnewlytlevel}{headsep}%
  \nc@savelength{\the\c@pdfnewlytlevel}{topskip}%
  \nc@savelength{\the\c@pdfnewlytlevel}{footskip}%
  \nc@savelength{\the\c@pdfnewlytlevel}{baselineskip}%
  \nc@savelength{\the\c@pdfnewlytlevel}{marginparwidth}%
  \nc@savelength{\the\c@pdfnewlytlevel}{marginparsep}%
  \nc@savelength{\the\c@pdfnewlytlevel}{columnsep}%
  \nc@savelength{\the\c@pdfnewlytlevel}{hoffset}%
  \nc@savelength{\the\c@pdfnewlytlevel}{voffset}
  \nc@saveboolean{\the\c@pdfnewlytlevel}{@twocolumn}%
  \nc@saveboolean{\the\c@pdfnewlytlevel}{@twoside}%
  \nc@saveboolean{\the\c@pdfnewlytlevel}{@mparswitch}%
  \nc@saveboolean{\the\c@pdfnewlytlevel}{@reversemargin}%
}

\newcounter{pdfnewlytlevel}
\RequirePackage{atbegshi}
\newenvironment{newpdflayout}[3][]{%
  \nc@savegeometry%
  \let\oldstockheight=\stockheight
  \let\oldstockwidth=\stockwidth
  \clearpage
  \begingroup
  \setstocksize{#2}{#3}
  \settrimmedsize{#2}{#3}{*}
  \paperwidth=\stockwidth
  \paperheight=\stockheight
  \setlrmarginsandblock%
    {\themargin(\iselthesis@opt@media,top)}%
    {\themargin(\iselthesis@opt@media,bottom)}%
    {*}%
     \setulmarginsandblock%
    {\themargin(\iselthesis@opt@media,left)}%
    {\themargin(\iselthesis@opt@media,right)}%
    {*}%
  #1%
  \checkandfixthelayout[fixed]
  \setpdftexpagesize
  \nc@changelayout%
}{%
  \clearpage%
  \endgroup%
  \nc@restoregeometry
  \checkandfixthelayout[fixed]
  \setpdftexpagesize
  \nc@changelayout
  \clearpage%
  \addtocounter{page}{-1}%
  ~\AtBeginShipoutDiscard
  \clearpage
}

% --------------------------------------------------------
%% Fonts
% --------------------------------------------------------

\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\itshape\normalsize}

% --------------------------------------------------------
%% Including chapters and similars
% --------------------------------------------------------

% --------- Dedicatory -------------
\newcommand{\@dedicatoryfile}{\@empty}

\newcommand{\dedicatoryfile}[1]{\renewcommand{\@dedicatoryfile}{#1}}

\ifx\@dedicatoryfile\@empty%
\newcommand{\printdedicatory}{}%
\else%
\newcommand{\printdedicatory}{%
	\ifthenelse{%
		\equal{\iselthesis@opt@docdegree}{bsc}	% bsc
		\OR%
		\equal{\iselthesis@opt@docdegree}{msc}	% msc
	}{% THEN
		\InputIfFileExists{Chapters/\@dedicatoryfile}{%
			% File dedicatory.tex exists and is read
			\global\let\@dedicatoryfile\@empty%
			\cleardoublepage%
		}{%
			% File does not exist
		}%
	}{ % ELSE
	}%
}
\fi

% --------- Quote -------------
\newcommand{\@quotefile}{\@empty}
\newcommand{\quotefile}[1]{\renewcommand{\@quotefile}{#1}}

\ifx\@quotefile\@empty%
  \newcommand{\printquote}{}%
\else%
  \newcommand{\printquote}{%
  	\ifthenelse{%
  		\equal{\iselthesis@opt@docdegree}{bsc}	% bsc
  		\OR%
  		\equal{\iselthesis@opt@docdegree}{msc}	% msc
  	}{% THEN
  		\InputIfFileExists{Chapters/\@quotefile}{%
  			% File qualtefile.tex exists and is read
  			\global\let\@quotefile\@empty%
  			\cleardoublepage%
  		}{%
  			% File quotefile.tex is not found, ignore
  		}	%
  	}{ % ELSE
  	}%
  }%
\fi

% --------- Acknowledgement -------------
\newcommand{\iselthesis@acknowledgementsfile}{\@empty}

\newcommand{\acknowledgementsfile}[1]{%
  \renewcommand{\iselthesis@acknowledgementsfile}{#1}%
}

\newcommand{\printacknowledgements}{%
	\IfFileExists{Chapters/\iselthesis@acknowledgementsfile}{%
		\ifthenelse{%
			\equal{\iselthesis@opt@docdegree}{bsc}	% bsc
			\OR%
			\equal{\iselthesis@opt@docdegree}{msc}	% msc
		}{% THEN
			\input{Chapters/\iselthesis@acknowledgementsfile}%
			\cleardoublepage%
		}{% ELSE
		}%
	}%
	{}%
}

% --------- Statement -------------
\newcommand{\iselthesis@statementfile}{\@empty}
\newcommand{\statementfile}[1]{%
  \renewcommand{\iselthesis@statementfile}{#1}%
}

\newcommand{\printstatement}{%
	\IfFileExists{Chapters/\iselthesis@statementfile}{%
		\ifthenelse{%
			\equal{\iselthesis@opt@docdegree}{msc}	% msc
		}{% THEN
			\input{Chapters/\iselthesis@statementfile}%
	        \newpage
            \printcopyrightpage
        %\cleardoublepage%
		}{% ELSE
		}%
	}%
	{}%
}


% --------------------------------------------------------
%% Abstract, Acronyms and Glossary
% --------------------------------------------------------

\@setabstractorder
\ifdatadefined{abstractorder}(en){}{%
  \abstractorder(en):={en,pt}
}
\ifdatadefined{abstractorder}(\iselthesis@opt@lang){}{%
  \abstractorder(\iselthesis@opt@lang):={\iselthesis@opt@lang,en}
}

\def\abstractfile[#1]#2{%
	\expandafter\xdef\csname iselthesis@abstractfile@#1\endcsname{#2}}%

\def\iselthesis@printabstract@lang#1{%
  { % Extra braces to force language changes to be local
    \setabstractlang{#1}%
  	\edef\iselthesis@filetoinclude{Chapters/\@nameuse{iselthesis@abstractfile@#1}}%
  	\InputIfFileExists{\iselthesis@filetoinclude}%
      {}%
      {}%
    \selectthelanguage{\iselthesis@opt@lang}
    \cleardoublepage%
  }%
}

\newcommand{\printabstract}{% 
    \xdef\iselthesis@tmp{\theabstractorder(\iselthesis@opt@lang)}%
  \iteratecsvlist{\iselthesis@printabstract@lang}{\iselthesis@tmp}%
  % disables protrusion locally in the document for the forthcoming tables of contents
  \microtypesetup{protrusion=false}%
}


\newcommand{\glossaryfile}[1]{%
  \InputIfFileExists{Chapters/#1}{}{}
}%

\newcommand{\acronymsfile}[1]{%
  \InputIfFileExists{Chapters/#1}{}{}
}%


\newcommand*{\ncthesisfrontmatter}{%
 \frontmatter%
  \selectthelanguage{\iselthesis@opt@lang}
  \pagestyle{iselthesis@frontmatter}%
  \copypagestyle{chapter}{iselthesis@frontmatter}
  \pagenumbering{roman}%
  \setlength{\headheight}{15pt}%
}

\newcommand*{\ncthesismainmatter}{%
  % \endgroup
  \bookmarksetup{startatroot}%
  \ifbool{@openright}{}{% openany=true
    % Avoid cleardoublepage before "mainmatter"
    \let\oldcleardoublepage\cleardoublepage%
    \renewcommand{\cleardoublepage}{\clearforchapter}%
  }%
  \mainmatter%
  \pagenumbering{arabic} %
  \ifbool{@openright}{}{% openany=true
    \let\cleardoublepage\oldcleardoublepage%
  }%
  \pagestyle{iselthesis@mainmatter}%
  \ifxeorlua{}{\microtypesetup{protrusion=true}}%
}


% --------------------------------------------------------
%% Chapters
% --------------------------------------------------------

\newcommand{\addfile}[1]{\listgadd{\iselthesis@chapter@list}{#1}}

\newcommand{\iselthesis@printchapter}[1]{%
	\InputIfFileExists{Chapters/#1}{\cleardoublepage}{ERROR: File '#1' does not exist!!!}%
}

\newcommand{\printchapters}{%
	\ifthenelse{\isundefined\iselthesis@chapter@list}{}%
		{\forlistloop{\iselthesis@printchapter}{\iselthesis@chapter@list}}%
}

% --------------------------------------------------------
%% Appendixes and Annexes
% --------------------------------------------------------
\RequirePackage{appendix}
% --------- Appendix -------------
\renewcommand*{\addappheadtotoc}{%
    \phantomsection\addtocontents{toc}%
    {\protect\contentsline{chapter}{\appendixtocname}{}{}}%
 }

\newcommand{\appendixfile}[1]{%
	\listgadd{\iselthesis@appendix@list}{#1}%
}

\newcommand{\iselthesis@printappendix}[1]{%
	\InputIfFileExists{Chapters/#1}{\cleardoublepage}{}%
}

\newcommand*{\ncprintappendices}{%
  \ifthenelse{\isundefined\iselthesis@appendix@list}{}{
    \renewcommand{\appendixtocname}{\appendixplname}%
    \appendix\addappheadtotoc%
    \forlistloop{\iselthesis@printappendix}{\iselthesis@appendix@list}%
  }%
}

% --------- Annex -------------
\newcommand{\annexfile}[1]{%
	\listgadd{\iselthesis@annex@list}{#1}%
}

\newcommand{\iselthesis@printannex}[1]{%
	\InputIfFileExists{Chapters/#1}{\cleardoublepage}{}%
}

\newcommand*{\ncprintannexes}{%
  \ifthenelse{\isundefined\iselthesis@annex@list}{}{
    \renewcommand{\appendixtocname}{\annexplname}%
    \annex\addappheadtotoc%
    \forlistloop{\iselthesis@printannex}{\iselthesis@annex@list}%
  }%
}

\newcommand{\printannexes}{%
	\ifthenelse{\isundefined\iselthesis@annex@list}{}%
		{\cleardoublepage\annex%
		 \forlistloop{\iselthesis@printannex}{\iselthesis@annex@list}}%
} 

\newcommand{\annex}{\par
  \xdef\Hy@chapapp{annex}%  
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\annexname}%
  \gdef\thechapter{\@Roman\c@chapter}%
  }

% --------------------------------------------------------
%% Deal with optional lists in the frontmatter: listoftables, listoffigures, etc.
% --------------------------------------------------------
\newcommand{\iselthesis@printlist}[1]{%
	#1\cleardoublepage%
}

\newcommand{\addlisttofrontmatter}[1]{%
	\listgadd{\iselthesis@frontmatter@list}{#1}%
}

\newcommand{\printotherlists@i}{%
	\ifthenelse{\isundefined\iselthesis@frontmatter@list}%
    {}%
		{\cleardoublepage%
      \forlistloop{\iselthesis@printlist}{\iselthesis@frontmatter@list}%
    }%
  \cleardoublepage%
}

\newcommand{\printotherlists}{%
  \cleardoublepage%
   \ifthenelse{\equal{\iselthesis@opt@otherlistsat}{front}}%
  {%
    \if@mainmatter%
    \else%
      \printotherlists@i%
    \fi%
  }%
  {}%
  \ifthenelse{\equal{\iselthesis@opt@otherlistsat}{back}}%
  {%
    \if@mainmatter%
      \printotherlists@i%
    \else%
    \fi%
  }%
  {}%
}

\newcommand{\iselthesis@loadallfiles}[2]{\optionlistdo{/@nc/file/#2/#1}{\iselthesisloadfile@i{##1}}}

\newcommand{\iselthesisloadfile@i}[2][]{\IfFileExists{#2}{\input{#2}}{#1}}

\newcommand{\iselthesisloadfiles@ii}[2][\iselthesis@opt@docdegree]{%
  % #1=KEY
  % #2=file class
  \iffileadded[#1]{#2}{\iselthesis@loadallfiles{#1}{#2}}{}%
}

\newcommand{\iffileadded}[2][\iselthesis@opt@docdegree]{\ifoptiondefined{/@nt/file/#2/#1}}

% --------------------------------------------------------
%% Bibliography
% --------------------------------------------------------

\newcommand{\addbibfile}[1]{\addbibresource{#1}}

\newcommand{\printbib}{\printbibliography}

% --------------------------------------------------------
%% Copyright page
% --------------------------------------------------------
\newcommand{\printacknowledgementsblock}{%
    \noindent\parbox{\linewidth}{%
    \vspace*{2.5ex}\footnoterule\theacknowledgmentsstring(\iselthesis@opt@lang)}
}

\newcommand{\printcopyrightpage}{%
  \null\vfill%
  \noindent  \textbf{\large\thedoctitle(\iselthesis@opt@lang,main)}\par%
  \bigskip%
  \thecopyrightstr\par%
  \printacknowledgementsblock 
}


% --------------------------------------------------------
% %% Dedicatory
% --------------------------------------------------------
\def\dedicatory{%%
	\cleardoublepage%
	\thispagestyle{empty}%
	~\\[2cm]%
    \begin{flushright}%
    \begin{minipage}{100mm}%
    \quotefonti%
    \begin{flushright}%
}%
\def\enddedicatory{%
	\end{flushright}%
    \normalfont%
    \end{minipage}%
	\end{flushright}%
	\cleardoublepage%
}

% --------------------------------------------------------
%% Quote
% --------------------------------------------------------

\def\quote{%%
	\cleardoublepage%
	\thispagestyle{empty}%
	~\\[2cm]%
    \begin{flushright}%
    \begin{minipage}{100mm}%
    \quotefonti%
    \begin{flushright}}%
\def\endquote{%
	\end{flushright}%
    \normalfont%
    \end{minipage}%
	\end{flushright}%
}

% --------------------------------------------------------
%% Acknowledgements
% --------------------------------------------------------

\newcommand{\acknowledgements}{%
  \chapter*{\theacknowledgementstr(\iselthesis@opt@lang)}%
}

% --------------------------------------------------------
%% Abstract
% --------------------------------------------------------

\newcommand{\iselthesis@keywordsstr}{}
\newcommand{\setabstractlang}[1]{%
	\selectthelanguage{#1}%
  \renewcommand{\iselthesis@keywordsstr}{\thekeywordsstring(#1)}%
	\chapter*{\theabstractstring(#1)}%
	\rule{\textwidth}{0.2mm} ~\\[-3.5ex]%
}

% --------------------------------------------------------
%% Keywords
% --------------------------------------------------------

\def\keywords{%
  \par\vskip\baselineskip\noindent{\bfseries\iselthesis@keywordsstr: }%
}
\def\endkeywords{~\\[2ex]\rule{\textwidth}{0.2mm}}


% --------------------------------------------------------
%% Table of contents
% --------------------------------------------------------

\setcounter{tocdepth}{2}

% --------------------------------------------------------
%% Sectioning
% --------------------------------------------------------

\maxsecnumdepth{subsubsection}

% --------------------------------------------------------
% Text & code style
% --------------------------------------------------------

\InputIfFileExists{ISELthesis-files/Chap-Styles/\iselthesis@opt@chapstyle.ldf}{}{}

% --------------------------------------------------------
% Check if a font file exists
\newcommand*{\nccheckfont}[2]{%
  \IfFileExists{ISELthesis-files/Font-Styles/#1}{}%
    {\ClassError{iselthesis}{Missing font “#1”! Please download from: “#2” and copy it to “ISELthesis-files/Font-Styles/#1”}{Please download from: “#2” and copy it to “ISELthesis-files/Font-Styles/#1”}}%
}


% --------------------------------------------------------
% Load and Helvetica-like font as the default SF font
\newcommand*{\LoadHelveticaLikeFont}{%
  \IfFileExists{inter.sty}%
    {\RequirePackage{inter}}%
  {\IfFileExists{helvet.sty}%
    {\RequirePackage{helvet}}%
  {\IfFileExists{gillius2.sty}%
    {\RequirePackage{gillius2}}%
    {\ClassWarning{iselthesis}{Could not find a suitable Sans Serif font… using the default!}}}}%
}

\RequirePackage[hyperref=auto,defernumbers=true]{biblatex}%

% --------------------------------------------------------
% Customize the pagestyle
\newcommand{\rightorleftmark}{%
  \setbox0=\hbox{\rightmark}
  \ifdim\wd0>0.1pt\relax
    \rightmark
  \else
    \leftmark
  \fi
}

\makepagestyle{iselthesis@mainmatter}
\makeoddfoot{iselthesis@mainmatter}{}{\thepage}{}
\makeevenfoot{iselthesis@mainmatter}{}{\thepage}{}
\makeheadrule{iselthesis@mainmatter}{\textwidth}{\normalrulethickness}
\makeevenhead{iselthesis@mainmatter}{\small\textsc{\leftmark}}{}{}
\makeoddhead{iselthesis@mainmatter}{}{}{\small\rightorleftmark}

\makepagestyle{iselthesis@frontmatter}
\makeoddfoot{iselthesis@frontmatter}{}{\thepage}{}
\makeevenfoot{iselthesis@frontmatter}{}{\thepage}{}

% --------------------------------------------------------
% Generate book spine (if otion "spine=true")
% --------------------------------------------------------
%
% See file "ISELthesis-files/spine.clo"
% This file is loaded only if otion "spine=true"  :)

% --------------------------------------------------------
% LOADING CUSTOMIZATION STUFF - part 2
% --------------------------------------------------------

% --------------------------------------------------------
%  THESIS/DISSERTATION COVER DATA (title, author, etc)
%   Please open and edit the appropriate
%   configuration file “Config/_cover.tex”
% --------------------------------------------------------
\input{Config/_cover}

% --------------------------------------------------------
%  THESIS/DISSERTATION FILES
%   Please open and edit the appropriate
%   configuration file “Config/_files.tex”
% --------------------------------------------------------
\input{Config/_files}
\addbibfile{ISELthesis-files/manual-bib} 


% --------------------------------------------------------
%  UNIVERSITY/SCHOOL SPECIFIC MATERIALS
%  configuration file “Config/_department.tex”
% --------------------------------------------------------
\input{Config/_department}

% --------------------------------------------------------
% ADDITIONAL PACKAGES and MACROS
%   Please open and edit the appropriate
%   configuration file “Config/_packages.tex”
% --------------------------------------------------------
\AtEndPreamble{\input{Config/_packages}}


\AtBeginDocument{%
  \hypersetup{%
    pdfauthor={\thedocauthor(name)},
    pdftitle={\thedoctitle(\iselthesis@opt@lang,main)},
    pdfsubject={\thedoctitle(\iselthesis@opt@lang,main)}
  }

  %--------------------------------
  % If subcaptin is laoded, let it hand handle subfigures
  % otherwise use memoir subfigures
  \@ifpackageloaded{subcaption}{}{\newsubfloat{figure}}
  \newcommand{\@nccite}[1]{\ifdef{\parencite}{\parencite{#1}}{\cite{#1}}}
  \makeatother
}

% --------------------------------------------------------
%% Deal with ISELthesis options and configuration files
% --------------------------------------------------------
\RequirePackage{ISELthesis-files/user-sty/options2}
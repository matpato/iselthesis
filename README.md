# template
Template for bachelor and master degrees report written in LaTex

## Instructions

This template serves both degrees as a bachelor's and master's degree. And, during the development stages of the work as final or "Preparation of BSc (MSc) dissertation". To do this simply change the following settings (see template.tex, line 29-41):

	\documentclass[
		msc,			% (*) msc, prepmsc, bsc, prepbsc - degree
					% prepbsc(msc) Preparation of BSc (MSc) dissertation
					% bsc(msc) BSc graduation report/ MSc dissertation
					% GO TO LINE 189
		pt,			% (*) pt, en - languages 
		twoside,		% (*) twoside, oneside - single or double sided printing
		12pt,			% (*) 12pt, 11pt, 10pt - use font size
		a4paper,		% the paper size/format
		utf8,			% (*) utf8, latin1	- Text encoding: Linux, Mac or Windows
		hyperref = true,	% Hyperlinks in citations: true(*) false
		listof = totoc
		]{thesisisel} 

**How to run (terminal or console)**

1. Single document w/o nomenclature or references<br>
		$ pdflatex template

1. With nomenclature:<br>
		$ pdflatex template<br>
		$ makeindex template.nlo -s nomencl.ist -o template.nls<br>
		$ pdflatex template (twice)<br>

1. With Bibliography:<br>
		$ pdflatex template<br>
		$ bibtex template<br>
		$ pdflatex template (twice)<br>

## Description

**thesisisel**: This is the main directory and includes:

1. Appendixes: Directory with tex files with a section or table of subsidiary matter at the end of a book or document;
1. Logo: Directory with Faculty logos;
1. Chapters: Directory where to put user files (text and figures);
	1. chapter# - tex files for each chapter (#: 1, 2, ...); 
	1. scripts: Directory with useful bash scripts, e.g., for cleaning all temporary files;
	1. img: Directory with all images to use in the chapters, e.g. \texttt{ra-raster.png}.
	
1. alpha-pt.bst: A file with bibliography names in portuguese, e.g., 'Relatório Técnico' e 'Tese de Mestrado' instead of 'Technical Report' and 'Master Thesis'. This file is used automatically if Portuguese is selected as the main language (see below);
1. defaults.tex: A file with the main default values for the package (institution name, faculty's logo, degree name and similars - TO CHANGE BY THE USER);
1. personaldataofthesis.tex: A file with the identification of report as well as the author and juries names - TO CHANGE BY THE USER;
1. template.tex: The main file. Please refrain from changing the file content outside of the well defined area;
1. bibliography.bib: The bib file. An easy way to find to import citation into bibtex is select option "Show links to import citation into BibTex" in \href{http://scholar.google.pt/scholar_settings?hl=en&as_sdt=0,5}{Scholar google settings};
1. thesisisel.cls: The  LaTeX class file for the thesis{} style. Currently, some of the defaults are stored here instead of \verb!defaults.tex!. This file should not be changed, unless you're ready to play with fire! :) - **DO NOT CHANGE**).
	
 
## Some informations

The template will first automatically place the abstract in the language of the main text and then the abstract in the other language. For example, if the dissertation is written in Portuguese, the abstract will appear first in Portuguese, then in English, followed by the main text in Portuguese.


## How to write using LaTex

The template presents some instructions how to write a report, or the major concepts how to write a good report: title, abstract, keywords and chapters. I recommend to you to read carefully. Moreover, you will find some instructions how to write in #LaTex, for instance how to insert a figure, table, some text formats and others. In addition, the list below you can see some webpages that may be useful

	https://www.latex-project.org
	https://www.sharelatex.com/learn/Creating_a_document_in_LaTeX
	http://www4.di.uminho.pt/~jcr/AULAS/didac/manuais/manual-latex.pdf

	tikZ and PGF: http://www.texample.net/tikz/

## Available Software

1. Texmaker is a free, modern and cross-platform LaTeX editor for linux, macosx and windows systems that integrates many tools needed to develop documents with LaTeX, in just one application. (source: http://www.xm1math.net/texmaker/)

1. MiKTeX (pronounced mick-tech) is an up-to-date implementation of TeX/LaTeX and related programs. TeX is a typesetting system written by Donald Ervin Knuth who says that it is intended for the creation of beautiful books - and especially for books that contain a lot of mathematics. (source: https://miktex.org)

1. ShareLaTeX is an open-source online real-time collaborative LaTeX editor. We run a hosted version at http://www.sharelatex.com, but you can also run your own local version, and contribute to the development of ShareLaTeX. (source: https://pt.sharelatex.com)
	
1. Overleaf is an online LaTeX and Rich Text collaborative writing and publishing tool that makes the whole process of writing, editing and publishing scientific documents much quicker and easier. (source: https://www.overleaf.com)

# 

<p>Authors</p>

	Matilde Pós-de-Mina Pato
	Nuno Datia (as contributor)

Last update: December, 29th 2017 

**this package and template are not official for ISEL/IPL**
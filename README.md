# thesisisel
The thesisisel is designed to create a bachelor or master degrees report written in LaTex

1. Instructions

This template serves both degrees as a bachelor's and master's degree. And, during the development stages of the work as final or "Preparation of BSc (MSc) dissertation". To do this simply change the following settings (see template.tex, line 34-46):

	\documentclass[
		msc,		% (*) msc, prepmsc, bsc, prepbsc - degree
					% prepbsc(msc) Preparation of BSc (MSc) dissertation
					% bsc(msc) BSc graduation report/ MSc dissertation
		pt,			% (*) pt, en - languages 
		twoside,	% (*) twoside, oneside - single or double sided printing
		12pt,		% (*) 12pt, 11pt, 10pt - use font size
		a4paper,	% Paper size/format
		utf8,			% (*) utf8, latin1	- Text encoding: Linux, Mac or Windows
		onpaper, % (*) onpaper, onscreen Format your thesis in a way that presents well on paper and/or on screen
		hyperref = true,  % (*) true, false - Hyperlinks in citations
		listof=totoc
		]{thesisisel} 

	1.1 How to run

	Bibliography:
		$ pdflatex template
		$ bibtex template
		$ pdflatex template (twice)

# 

2. Description

thesisisel This is the main directory and includes:

	2.1 Appendixes: Directory with tex files with a section or table of subsidiary matter at the end of a book or document;
	2.2 Logo: Directory with Faculty logos;
	2.3 Chapters: Directory where to put user files (text and figures);
		
		2.3.1 scripts: Directory with useful bash scripts, e.g., for cleaning all temporary files;
		2.3.2 img: Directory with all images to use in the chapters, e.g. \texttt{ra-raster.png};
	
	2.4 alpha-pt.bst: A file with bibliography names in portuguese, e.g., 'Relatório Técnico' e 'Tese de Mestrado' instead of 'Technical Report' and 'Master Thesis'. This file is used automatically if Portuguese is selected as the main language (see below);
	2.5 defaults.tex: A file with the main default values for the package (institution name, faculty's logo, degree name and similars - TO CHANGE BY THE USER);
	2.6 personaldataofthesis.tex: A file with the main default values for the package (identification of report as well as the author and juries - TO CHANGE BY THE USER);
	2.7 template.tex: The main file. You should run  \texttt{LaTeX} in this one. Please refrain from changing the file content outside of the well defined area;
	2.8 bibliography.bib: The bib file. An easy way to find to import citation into bibtex is select option "Show links to import citation into BibTex" in \href{http://scholar.google.pt/scholar_settings?hl=en&as_sdt=0,5}{Scholar google settings}.
	2.9 thesisisel.cls: The  LaTeX class file for the thesis{} style. Currently, some of the defaults are stored here instead of \verb!defaults.tex!. This file should not be changed, unless you're ready to play with fire! :) - DO NOT CHANGE);
	
All of these files should be in the same folder. The outputs will be a .pdf file called **template.pdf** with the manuscript. After that, this should be renamed. 

In addition, latex generates extra files which are .aux, .log, .out, .bbl and .synctex.gz. Theses files provide important info: 
	
	.log - about the compiler that you are running (warning and errors);
	.aux, .sync, .toc and others - are needed for things to actually work when you compile your document multiple times.

Deleting them can break things, then it's not really a great idea to (automatically) remove them. However, if you desire to have a cleaner working directory, there are a few ways to accomplish that. For example, you can compile your document with the output-directory parameter. [Read more ...](https://tex.stackexchange.com/questions/369771/how-to-delete-files-generated-by-latex)  
	
# 

3. Some informations

The template will first automatically place the abstract in the language of the main text and then the abstract in the other language. For example, if the dissertation is written in Portuguese, the abstract will appear first in Portuguese, then in English, followed by the main text in Portuguese.

# 

4. How to write using LaTex

	https://www.latex-project.org
	https://www.overleaf.com
	http://www4.di.uminho.pt/~jcr/AULAS/didac/manuais/manual-latex.pdf

	tikZ and PGF: http://www.texample.net/tikz/

# 

5. Available Software

	1. Texmaker is a free, modern and cross-platform LaTeX editor for linux, macosx and windows systems that integrates many tools needed to develop documents with LaTeX, in just one application. (source: http://www.xm1math.net/texmaker/)

	2. MiKTeX (pronounced mick-tech) is an up-to-date implementation of TeX/LaTeX and related programs. TeX is a typesetting system written by Donald Ervin Knuth who says that it is intended for the creation of beautiful books - and especially for books that contain a lot of mathematics. (source: https://miktex.org)

	3. Visual Studio Code is a source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js and has a rich ecosystem of extensions for other languages (such as C++, C#, Java, Python, PHP, Go, Latex) and runtimes (such as .NET and Unity). (source: https://code.visualstudio.com)
	Helper: LaTeX Workshop (https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

	4. Overleaf is an open-source online real-time collaborative LaTeX editor. Overleaf comes with a complete, ready to go LaTeX environment which runs on our servers. With Overleaf you get the same LaTeX set-up wherever you go. By working with your colleagues and students on Overleaf, you know that you're not going to hit any version inconsistencies or package conflicts. (source: https://www.overleaf.com)

## Authors

	Matilde Pós-de-Mina Pato
	Nuno Datia (as contributor)

September, 25th 2020


This package and template are not official for ISEL/IPL.

# License

[MIT](https://choosealicense.com/licenses/mit/)
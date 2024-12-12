<p align="center">
    <a href="https://sulu.io/" target="_blank">
        <img width="50%" src="https://www.isel.pt/sites/default/files/SCI/Identidade/logo_ISEL_simplificado_cor.png" alt="ISEL logo">
    </a>

[![GitHub forks](https://img.shields.io/github/forks/matpato/iselthesis.svg?style=social&label=Fork)](https://github.com/matpato/iselthesis)
[![GitHub stars](https://img.shields.io/github/stars/matpato/iselthesis.svg?style=social&label=Star)](https://github.com/matpato/iselthesis)
[![GitHub watchers](https://img.shields.io/github/watchers/matpato/iselthesis.svg?style=social&label=Watch)](https://github.com/matpato/iselthesis)
[![GitHub followers](https://img.shields.io/github/followers/matpato.svg?style=social&label=Follow)](https://github.com/matpato/iselthesis)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/matpato/iselthesis/graphs/commit-activity)
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg?color=green)](https://www.latex-project.org/)
[![GitHub license](https://img.shields.io/badge/License-LaTeX%20v1.3c-green.svg)](https://www.latex-project.org/lppl/lppl-1-3c)


![![Last commit](https://github.com/matpato/iselthesis)](https://img.shields.io/github/last-commit/matpato/iselthesis?color=blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
</p>

<!-- TOC BEGIN -->
Table of Contents
=================

* [Table of Contents](#table-of-contents)
  * [About](#about)
  * [Getting Started](#getting-started)
    * [Configuration](#configuration)
    * [With a Local LaTeX Installation](#local-install)
    * [With a Remote Cloud\-based Service](#cloud-service)
  * [Getting Help](#getting-help)
    * [Problems and Difficulties](#problems-and-difficulties)
    * [Suggestions, Bugs and Feature Requests](#suggestions-bugs-and-feature-requests)
  * [Authors](#authors)
<!-- TOC END -->

## About

This LaTeX-template might be used to write a bachelor or master thesis at the Department of Electronical Engineering, Telecommunications and Computers (DEETC) at [Lisbon School of Engineering](https://www.isel.pt) of Polytechnic Institute of Lisbon. It is based on the fabulous [“*novathesis*” LaTeX template](https://joaomlourenco.github.io/novathesis/) style template of João Lourenço. 

It is adapted to the current style guide for bachelor and master theses in the ISEL, as outlined in [Normas de escrita e apresentação de trabalhos finais de curso](https://www.isel.pt/informacoes-academicas/normas-trabalhos-finais).

This template serves both degrees as a bachelor's and master's degree. And, during the development stages of the work as final or "Preparation of BSc (MSc) dissertation". 

## Getting Started

In the following, we explain how to actually use, i.e. add content and compile, the thesis template to create a nice and shiny PDF file that will please your supervisor.

### Configuration

The LaTeX template can be modified and configured easily using a very limited number of files, namely in _Config_ and _Chapters_ folders, and _template.tex_-file. Only use these two directories and one file to modify your LaTeX thesis. Please _DO NOT_ modify the actual LaTeX code for your thesis (as this becomes quite complex and consumes a lot of time). 

Please find a brief description of the various configuration options below:

#### template.tex

The _template.tex_ file contains the basic structure and all the chapter-files that contain the actual content of your thesis. Thus, you have to modify this file in order to configure some basic stuff like the language of your thesis here: 

```
    \documentclass[
        docdegree=msc,       
        doctype=dissertation, 
        lang=en,             
        coverlang=pt,        
        fontstyle=kpfonts,   
        chapstyle=vz43,    
        otherlistsat=front,   
        linkscolor=darkblue,  
        printcommittee=true, 
        biblatex={            
            backend=bibtex,		  
            style=numeric-comp, 
            sortcites=true,     
            sorting=nyt,       
            maxbibnames=99,			
            firstinits=true,   
            hyperref=true,
            backref=true,      
        },
        memoir={	          
            a4paper,          
            11pt,              
            final,            
        },
        media=screen,         
        ]{iselthesis}
```

#### Writing abstracts

Every thesis has to have two abstracts; one in Portuguese and one in English. Thus, there are two abstract files included in the _template.tex_-file. Boths files, called _abstract-en.tex_ for the English abstract and _abstract-pt.tex_ for the Portuguese abstract, are located in the _Chapters_ directory.

You have to modify both these files and place your abstract text in _abstract-en.tex_ and _abstract-pt.tex_ respectively.

#### Adding content

By default, the thesis template, i.e. the _template.tex_-file, contains (includes) some default content files for chapters and appendix from the _Chapters_-directory. You have to add, or remove in _Config/_ __files.tex_ your own files. Please note that it is best practice to put all your content in separate files.

##### Bibliographies

By default all bibliographies that can be referenced in the thesis are put into the _bibliography.bib_ file in the _Bibliography_ directory of the LaTeX sources. However, if you want to use additional bibliography files, you may add them.

##### Language

The default language of your thesis is English. If you want to switch to Portuguese, you have to modify the language selection `lang=en` option.

##### Personal data

This is where you have to place all the personal stuff of your thesis in the __cover.tex_-file.


### With a Local LaTeX Installation <a name="local-install"></a>

*[See below](#cloud-service) for alternatives to a local LaTeX installation*

*See [minimal installation](https://en.wikibooks.org/wiki/LaTeX/Installation#Minimal_installation) for instructions on how to build/use a minimal installation of LaTeX, which is just enough to compile the template successfully*

1. Download LaTeX:
   * **Windows:** install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org).
   * **Linux:** install [TeX-Live](https://www.tug.org/texlive/) or [MikTeX](https://miktex.org).
   * **macOS:** install [MacTeX](https://www.tug.org/mactex/) (a macOS version of [TeX-Live](https://www.tug.org/texlive/)) or [MikTeX](https://miktex.org).
2. Download `iselthesis` by either:
   * Cloning the [GitHub repository](https://github.com/matpato/iselthesis) with <kbd>git clone --depth=1 https://github.com/matpato/iselthesis.git</kbd>; or
   * Downloading the [latest version from the GitHub repository as a Zip file](https://github.com/matpato/iselthesis/archive/refs/heads/master.zip)
3. Compile the document with you favorite LaTeX processor (pdfLaTeX, XeLaTeX or LuaLaTeX):
   * The main file is named `template.tex`.
   * Either load it in your favorite [LaTeX text editor](https://en.wikipedia.org/wiki/Comparison_of_TeX_editors). In addition, the thesis template repository contains a Makefile that allows you to compile the thesis template using the _make_ tool available on most Unix and Linux systems. Simply type:
    
    ```
    $ make
    ```  
    to compile the LaTeX code into a PDF-file. Moreover, you may use

    ```
    $ make clean
    ```

    to remove all temporary files, which are produced during the compilation process. Finally,

    ```
    $ make tar [| zip]
    ```

    generates a `tar-package` or `zip-package` file, which contains all the source files of your LaTeX code. In case you need to create a PDF-version with embedded fonts you may use

    ```
    $ make pdf
    ```

    finally, to open the pdf you can use

    ```
    $ make v view
    ```

   * LaTeX will create the file `template.pdf`, which you may open with your favorite PDF viewer.

4. TODO: The ISELthesis template ships with two Dockerfiles that create [Docker](https://www.docker.com/) container used to compile the LaTeX code. One container - built by the [Dockerfile.ci]() Docker file - is used by the CI to compile the thesis template and check its integrity at every commit. The other one - created by the [Dockerfile.local](). Docker file - might be used to build the Docker container that allows to compile the LaTeX code on your local machine without the need to install any LaTeX files. 	
5. Edit the files in the “*Config*” folder:

| File                 | Contents                                                                                             |
|:--------------------:|:-----------------------------------------------------------------------------------------------------|
| `_cover.tex`         | Configure cover contents (e.g., author's name, thesis/dissertation title, advisers, committee, etc)  |
| `_department.tex`    | Configure school and department content: e.g. school name, department, major field, etc.             |
| `_files.tex`         | Configure the files for chapters, appendices, annexes, etc.                                          |
| `_memoir.tex`        | Options specific for the memoir package. Don't touch this file unless you know what you are doing!   |
| `_packages.tex`      | Configure additional packages and commands                                                           |

5. Recompile de document
6. You're done with a beautifully formatted thesis/dissertation!

### With a Remote Cloud-based Service <a name="cloud-service"></a>

*[See above](#local-install) for using a local installation of LaTeX*

*ISELthesis v4.0.0 is available as an [Overleaf template](https://www.overleaf.com/latex/templates/isel-thesis/jgfhgbpcfxyz).  Just select <kbd>open as template</kbd> and follow from [step 3 above](#local-install)!*

1. Download the [latest version from the GitHub repository as a Zip file](https://github.com/matpato/iselthesis/archive/refs/heads/master.zip).
2. Login to your favorite LaTeX cloud service. I recommend Overleaf but there are alternatives (these instructions apply to Overleaf  and you'll have to adapt for other providers).
3. In the menu select <kbd>New project</kbd>-><kbd>Upload project</kbd>
4. Upload the zip with all the "iselthesis" files.
5. Select “*template.tex*” as the main file.
6. Follow from [step 3 above](#local-install)

*WARNING: Overleaf reduced the compile time*
There is no way you can compile yout thesis/dissertation (using this template) within the new (20 seconds) time limit.  This means you have two options:
* Install LaTeX in your computer and [use a the template locally](#local-install)!
* Opt for a hassle free solution and [buy a (student) plan in Overleaf](https://www.overleaf.com/user/subscription/plans).

## Getting Help

### Problems and Difficulties

Check the [wiki](https://github.com/matpato/iselthesis/wiki) and have some hope!
If you couldn't find what you were looking for, ask for help in:

* The [GitHub Discussions page](https://github.com/matpato/iselthesis/discussions) (only EN please) at https://github.com/matpato/iselthesis/discussions.
 
### Suggestions, Bugs and Feature Requests

* Do you have a suggestion? Please add it to the [wiki](https://github.com/matpato/iselthesis/wiki) and help other users!
* Did you find a bug? Please [open an issue](https://github.com/matpato/iselthesis/issues). Thanks!

## Authors

	Matilde Pós-de-Mina Pato
	Nuno Datia (as contributor)

December, 12nd 2024

This package and template are not official for ISEL/IPL.

# License

[MIT](https://choosealicense.com/licenses/mit/)

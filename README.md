<p align="center">
    <a href="https://www.isel.pt" target="_blank">
        <img width="75%" src="Logo/01_ISEL-Logotipo-RGB_Horizontal.png" alt="ISEL logo">
    </a>
</p>

<p align="center">

[![GitHub forks](https://img.shields.io/github/forks/matpato/iselthesis.svg?style=social&label=Fork)](https://github.com/matpato/iselthesis)
[![GitHub stars](https://img.shields.io/github/stars/matpato/iselthesis.svg?style=social&label=Star)](https://github.com/matpato/iselthesis)
[![GitHub watchers](https://img.shields.io/github/watchers/matpato/iselthesis.svg?style=social&label=Watch)](https://github.com/matpato/iselthesis)
[![GitHub followers](https://img.shields.io/github/followers/matpato.svg?style=social&label=Follow)](https://github.com/matpato)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/matpato/iselthesis/graphs/commit-activity)
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg?color=green)](https://www.latex-project.org/)
[![Last commit](https://img.shields.io/github/last-commit/matpato/iselthesis?color=blue)](https://github.com/matpato/iselthesis/commits)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</p>

> [!IMPORTANT]
> **Three rules — read these even if you read nothing else:**
> 1. **Compile with LuaLaTeX**, not pdfLaTeX. Only LuaLaTeX uses the Verdana font required by ISEL. With pdfLaTeX the document still compiles, but with the wrong font.
> 2. **Edit only** the `Config/` and `Chapters/` folders and your `.bib` file.
> 3. **Do not change** `template.tex`, `iselthesis.cls` or anything in `ISELthesis-files/`.

<!-- TOC BEGIN -->
Table of Contents
=================

* [About](#about)
* [File Structure](#file-structure)
* [Getting Started](#getting-started)
  * [Step 1 — Get the template](#step-1)
  * [Step 2 — Select LuaLaTeX](#step-2)
  * [Step 3 — Configure your document](#step-3)
  * [Step 4 — Write your content](#step-4)
  * [Step 5 — Compile](#step-5)
* [Getting Help](#getting-help)
* [Authors](#authors)
* [License](#license)
<!-- TOC END -->

## About

This LaTeX template is used to write bachelor's project reports and master's dissertations at the Department of Electronic Engineering, Telecommunications and Computers (DEETC) and the Department of Computer Science Engineering (DEI) of the [Lisbon School of Engineering (ISEL)](https://www.isel.pt), Polytechnic Institute of Lisbon.

It follows the ISEL style guide, [Normas de escrita e apresentação de trabalhos finais de curso](https://www.isel.pt/informacoes-academicas/normas-trabalhos-finais), and supports three types of document:

| `docdegree` | Document |
|:-----------:|:---------|
| `bsc`       | Bachelor's project report |
| `mscprep`   | Preparation of the master's dissertation (end of the 1st semester) |
| `msc`       | Master's dissertation (final version) |

The compiled `template.pdf` is also the **user manual** of the template: Chapter 2 describes the structure and options, and Chapter 3 the compilation and many LaTeX examples.

## File Structure

```
iselthesis/
│
├── template.tex ................. Main file — compile this one        ✗ do not edit
├── template.xmpdata ............. PDF/A metadata (author, title…)      ✓ edit
├── iselthesis.cls ............... Class file                          ✗ do not edit
├── Makefile
├── changelog.txt
│
├── Config/ ...................... YOUR SETTINGS                       ✓ edit
│   ├── _options.tex ............. Degree, language, media, link colour
│   ├── _cover.tex ............... Title, author, advisers, committee, date
│   ├── _files.tex ............... Which chapters, abstracts, appendices… to include
│   ├── _memoir.tex .............. Paper size, font size, draft/final
│   ├── _packages.tex ............ Your own packages and commands
│   └── _institution.tex ......... University/school names (only if not ISEL)
│
├── Chapters/ .................... YOUR CONTENT                        ✓ edit
│   ├── abstract-en.tex
│   ├── abstract-pt.tex
│   ├── chapter1.tex …
│   ├── img/ ..................... Your images
│   └── scripts/ ................. Code to include in the text
│
├── Bibliography/
│   └── bibliography.bib ......... Your references                     ✓ edit
│
├── ISELthesis-files/ ............ Internal class files                ✗ do not edit
│   ├── Chap-Styles/  Default/  Font-Styles/  Strings/  user-sty/
│   └── fix-babel.clo  lang-conf.clo  options.clo  packages.clo  …
│
└── Logo/ ........................ Logos and cover backgrounds         ✗ do not edit
```

## Getting Started

### Step 1 — Get the template <a name="step-1"></a>

Choose one:

* **Overleaf (cloud):** open the [ISELthesis template on Overleaf](https://www.overleaf.com/latex/templates/isel-thesis/jgfhgbpcfxyz) and select <kbd>Open as Template</kbd>. Alternatively, download the [Zip file](https://github.com/matpato/iselthesis/archive/refs/heads/master.zip), then <kbd>New Project</kbd> → <kbd>Upload Project</kbd>, and make sure `template.tex` is the main document.
* **Local installation:** install a LaTeX distribution — [TeX Live](https://www.tug.org/texlive/) (Windows/Linux), [MacTeX](https://www.tug.org/mactex/) (macOS) or [MiKTeX](https://miktex.org) — and get the template:
  ```
  git clone --depth=1 https://github.com/matpato/iselthesis.git
  ```
  or download the [Zip file](https://github.com/matpato/iselthesis/archive/refs/heads/master.zip).

> [!WARNING]
> Overleaf's free plan has a short compile-time limit, and a full dissertation may exceed it. If that happens, use a local installation or an Overleaf student plan.

### Step 2 — Select LuaLaTeX <a name="step-2"></a>

Most editors use pdfLaTeX by default, so **change the compiler once**:

| Editor | Where |
|:-------|:------|
| Overleaf | Menu → Settings → Compiler → **LuaLaTeX** |
| TeXstudio | Options → Configure TeXstudio → Build → Default Compiler → **LuaLaTeX** |
| VS Code (LaTeX Workshop) | Recipe **latexmk (lualatex)** |
| TeXShop | Typeset menu in the toolbar → **LuaLaTeX** |

The Verdana font files are included in `ISELthesis-files/Font-Styles/` — there is nothing to install. Just make sure that folder is uploaded/copied with the rest of the template.

### Step 3 — Configure your document <a name="step-3"></a>

All settings live in the `Config/` folder. You **never** need to edit `template.tex`.

**`Config/_options.tex`** — the type and language of your document:

```latex
\iselthesissetup{
  docdegree      = msc,          % msc, mscprep, bsc
  doctype        = dissertation, % dissertation, project
  lang           = en,           % en, pt
  coverlang      = en,           % en, pt
  printcommittee = true,         % false before the committee is appointed
  media          = screen,       % screen, paper
  linkscolor     = darkblue,     % darkblue, black (for printing)
}
```

**`Config/_memoir.tex`** — paper and draft/final mode:

```latex
\ncmemoirsetup{a4paper,11pt,final}   % use draft while writing
```

**`Config/_cover.tex`** — your title, name, advisers, committee and date.

**`template.xmpdata`** — the PDF/A metadata (author, title, keywords, language). Use plain text and the **same** title and name as in `_cover.tex`.

The font, chapter style and bibliography style are fixed by the institution and cannot be changed.

### Step 4 — Write your content <a name="step-4"></a>

* **Abstracts:** write them in `Chapters/abstract-pt.tex` and `Chapters/abstract-en.tex`. Both are required; the one in the main language is printed first. Maximum one page / 300 words each, with at least 3 keywords.
* **Chapters:** put each chapter in its own file in `Chapters/` and list it in `Config/_files.tex`. The same file lists appendices, annexes, glossaries, etc.
* **Images:** put them in `Chapters/img/`. Use PDF (preferably vector), PNG or JPEG. EPS is not supported by LuaLaTeX.
* **References:** add them to `Bibliography/bibliography.bib`. Google Scholar can export BibTeX entries (enable it in Scholar settings).

### Step 5 — Compile <a name="step-5"></a>

In your editor, just press compile (with LuaLaTeX selected). From the command line:

```
latexmk -lualatex template
```

or manually:

```
lualatex template
bibtex   template
lualatex template
lualatex template
```

The result is `template.pdf`. To check the font, open *File → Properties → Fonts* in your PDF viewer: **Verdana** must be listed.

The Makefile provides shortcuts on Linux/macOS:

| Command | Action |
|:--------|:-------|
| `make` | Compile the PDF |
| `make clean` | Remove temporary files |
| `make tar` / `make zip` | Package the source files |
| `make v` / `make view` | Open the PDF |

## Getting Help

* **Problems?** Check the [wiki](https://github.com/matpato/iselthesis/wiki), then ask in [GitHub Discussions](https://github.com/matpato/iselthesis/discussions) (English, please).
* **Found a bug?** Please [open an issue](https://github.com/matpato/iselthesis/issues).
* **Suggestion?** Add it to the [wiki](https://github.com/matpato/iselthesis/wiki) to help other users.

## Authors

* Matilde Pós-de-Mina Pato
* Nuno Datia (contributor)

October 2026

*This package and template are not official for ISEL/IPL.*

## How to Cite

If you use this template, please cite it as:

> M. P. M. Pato and N. Datia, *ISELthesis: LaTeX template for bachelor's and master's theses at ISEL*, version 4.3.2, 2026. Available: https://github.com/matpato/iselthesis

BibTeX:

```bibtex
@misc{iselthesis,
  author       = {Pato, Matilde P{\'o}s-de-Mina and Datia, Nuno},
  title        = {{ISELthesis}: {LaTeX} template for bachelor's and master's theses at {ISEL}},
  year         = {2026},
  version      = {4.3.2},
  howpublished = {\url{https://github.com/matpato/iselthesis}},
  note         = {Accessed: <date>}
}
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
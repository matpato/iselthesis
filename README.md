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
> 2. **Edit only** the `Config/`, `Chapters/` and `Bibliography/` folders.
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
  * [Step 6 — Before submitting](#step-6)
* [Getting Help](#getting-help)
* [Authors](#authors)
* [How to Cite](#how-to-cite)
* [License](#license)
<!-- TOC END -->

## About

This LaTeX template is used to write bachelor's project reports and master's dissertations at the [Lisbon School of Engineering (ISEL)](https://www.isel.pt), Polytechnic Institute of Lisbon.

It follows the ISEL style guide, [Normas de escrita e apresentação de trabalhos finais de curso](https://www.isel.pt/informacoes-academicas/normas-trabalhos-finais), and supports three types of document:

| `docdegree` | Document |
|:-----------:|:---------|
| `bsc`       | Bachelor's project report (up to 3 authors) |
| `mscprep`   | Preparation of the master's dissertation (end of the 1st semester) |
| `msc`       | Master's dissertation (final version) |

The output is a **PDF/A** file, ready for deposit in repositories such as RCAAP.

The compiled `template.pdf` is also the **user manual** of the template: Chapter 2 describes the structure, options and cover data, and Chapter 3 the compilation and many LaTeX examples.

## File Structure

```
iselthesis/
│
├── template.tex ................. Main file — compile this one        ✗ do not edit
├── template.xmpdata ............. PDF/A metadata (generated)          ✗ do not edit
├── iselthesis.cls ............... Class file                          ✗ do not edit
├── Makefile
├── changelog.txt ................ History of changes
├── requirements.txt ............. LaTeX packages used by the template
│
├── Config/ ...................... YOUR SETTINGS                       ✓ edit
│   ├── _options.tex ............. Degree, language, media, link colour
│   ├── _cover.tex ............... Authors, title, course, advisers, dates, keywords
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

  A full installation (TeX Live `scheme-full`, MacTeX) already includes everything. For a minimal installation, `requirements.txt` lists all the packages the template needs, with a `tlmgr` command to install them.

> [!WARNING]
> Overleaf's free plan has a short compile-time limit, and a full dissertation may exceed it. If that happens, use a local installation or an Overleaf student plan.

### Step 2 — Select LuaLaTeX <a name="step-2"></a>

Most editors use pdfLaTeX by default, so **change the compiler once**:

| Editor | Where |
|:-------|:------|
| Overleaf | Menu → Settings → Compiler → **LuaLaTeX** |
| TeXstudio | Options → Configure TeXstudio → Build → Default Compiler → **LuaLaTeX** |
| TeXmaker | Options → Configure Texmaker → Quick Build → **LuaLaTeX + BibTeX + LuaLaTeX (x2) + View PDF** |
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

**`Config/_cover.tex`** — your personal data, written **once**. It is used on the covers, in the integrity declaration and in the PDF/A metadata:

```latex
\ncauthorname(m){John Very Longname Doe}{John Doe}   % up to 3 authors (BSc)
\nctitle(main,en){Title of the Dissertation}
\nctitle(main,pt){Título da Dissertação}
\iselthesis@setcourse{meic}                          % course acronym
\ncmember(a,f){Name of the Adviser}{ISEL}            % a = adviser, c = president, r = member
\dateday{30} \datemonth{6} \dateyear{2026}
\nckeywords{keyword1, keyword2, keyword3}            % for the PDF metadata
```

Course acronyms: `meb`, `mec`, `mee`, `meet`, `meic`, `meim`, `megi`, `mem`, `meqa`, `meqb`, `mmai`. The same acronym is used for bachelor's and master's documents: with `docdegree=bsc` the cover refers to the bachelor's degree automatically. The full list is in Chapter 2 of the manual.

**`Config/_memoir.tex`** — paper and draft/final mode:

```latex
\ncmemoirsetup{a4paper,11pt,draft}   % draft while writing, final to submit
```

The font, chapter style and bibliography style are fixed by the institution and cannot be changed.

> [!NOTE]
> The PDF/A metadata file (`template.xmpdata`, or `output.xmpdata` on Overleaf) is **generated automatically** from `_cover.tex`. Do not edit it.

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

The result is `template.pdf`. The PDF metadata is written in one run and included in the next, so always compile at least twice.

**Draft mode** (`draft` in `_memoir.tex`) is faster while writing: the first page is a checklist, images in the text are replaced by boxes, the second cover is omitted and overfull lines are marked with black bars.

The Makefile provides shortcuts on Linux/macOS:

| Command | Action |
|:--------|:-------|
| `make` | Compile the PDF |
| `make clean` | Remove temporary files |
| `make tar` / `make zip` | Package the source files |
| `make v` / `make view` | Open the PDF |

### Step 6 — Before submitting <a name="step-6"></a>

1. Set `final` in `Config/_memoir.tex` and compile twice.
2. Check the checklist items (shown in draft mode): abstracts, page limit, date of the integrity declaration.
3. Open **File → Properties** in your PDF viewer and check:
   * **Fonts:** Verdana must be listed;
   * **Description:** title, author, subject and keywords must match your data.
4. Submit the PDF as it is — it is already PDF/A. Do not re-save it with another tool.

## Getting Help

* **Problems?** Check the [wiki](https://github.com/matpato/iselthesis/wiki), then ask in [GitHub Discussions](https://github.com/matpato/iselthesis/discussions) (English, please).
* **Found a bug?** Please [open an issue](https://github.com/matpato/iselthesis/issues).
* **Suggestion?** Add it to the [wiki](https://github.com/matpato/iselthesis/wiki) to help other users.

## Authors

* Matilde Pós-de-Mina Pato
* Nuno Datia (contributor)

October 2026

*This package and template are not official for ISEL/UPL.*

## How to Cite

If you use this template, please cite it as:

> Matilde Pato and N. Datia, *ISELthesis: LaTeX template for bachelor's and master's theses at ISEL*, version 4.3.2, 2026. Available: https://github.com/matpato/iselthesis

BibTeX:

```bibtex
@misc{iselthesis,
  author       = {Pato, Matilde and Datia, Nuno},
  title        = {{ISELthesis}: \LaTeX\ template for bachelor's and master's theses at {ISEL}},
  year         = {2026},
  version      = {4.3.2},
  howpublished = {\url{https://github.com/matpato/iselthesis}},
  note         = {Accessed: <date>}
}
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
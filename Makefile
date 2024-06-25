SILENT:=-interaction=batchmode
SYNCTEX:=1
MASTER = template
VERSION = v4.4
NAME    = Your
SURNAME = Surname

TIMES=$(shell printf "TIMMINGS for last run:" ;\
	fgrep "TIME process" -A 1 *.log | while read a; do \
	  read b; read c; \
	  S=`echo $$a | cut -d ' '  -f3 | cut -d '=' -f 1`; \
	  T=`echo $$b | cut -d ':' -f 2 | cut -d ' ' -f 2`; \
	  printf "\n%12s = %7.2f s" "$$S" "$$T"; \
	done  | tr '\n ' '\1\2')


B:=${MASTER}
F:=-time -shell-escape -synctex=$(SYNCTEX) -output-format=pdf -file-line-error $(FLAGS)
T:=$(B).pdf
S:=$(B).tex
L:=latexmk $(F)
V:=open -a skim

ZIPFILES:=ISELthesis-files Bibliography Config Chapters Makefile iselthesis.cls README.md .gitignore template.tex latexmkrc
DATE:=`date +%Y%m%d`
ZIPTARGET:=$(B)-${NAME}_${SURNAME}-$(VERSION)@$(DATE).zip
AUXFILES:=$(shell ls $(B)*.* | fgrep -v .tex | fgrep -v $(B).pdf | sed 's: :\\ :g' | sed 's:(:\\(:g' | sed 's:):\\):g')
TARFILES:=ISELthesis-files Bibliography Config Chapters Makefile iselthesis.cls README.md  template.tex 
TARTARGET:=$(B)-${NAME}_${SURNAME}-$(VERSION)@$(DATE).tar

$(T): $(S)
	$(MAKE)

.PHONY: pdf
pdf: $(S)
	$(L) -pdf $(SILENT) $(B)
	@echo $(TIMES)  | tr '\1@\2' '\n\t '

.PHONY: publish
publish: all
	@ps2pdf14 -dPDFSETTINGS=/prepress ${MASTER}.pdf
	@mv ${MASTER}.pdf.pdf ${MASTER}.pdf
	
.PHONY: xe lua
xe lua: $(S)
	$(L) -pdf$@ $(SILENT) $(B)
	@echo $(TIMES)  | tr '\1@\2' '\n\t '

.PHONY: v view
v view: $(T)
	$(V) $(T)

.PHONY: vv verb verbose
vv verb verbose:
	$(L) -pdf $(B)
	@echo $(TIMES)  | tr '\1@\2' '\n\t '

.PHONY: $(VERSION)
$(VERSION):
	hash -r
	PATH="$(wildcard /usr/local/texlive/$@/bin/*-darwin/):$(PATH)" make $(filter-out $@,$(MAKECMDGOALS))

.PHONY: mik
mik:
	hash -r
	# echo $(filter-out mik,$(MAKECMDGOALS))
	PATH="$(HOME)/bin:$(PATH)" make $(filter-out $@,$(MAKECMDGOALS))
	
.PHONY: zip
zip:
	@echo 'creating zip file including all docs'
	rm -f "$(ZIPTARGET)"
	zip --exclude .github --exclude .git -r "$(ZIPTARGET)" $(ZIPFILES)

.PHONY: tar
tar:
	@echo 'creating tar file including all docs'
	rm -f "$(TARTARGET)"
	@tar --exclude .github --exclude .git -cf "$(TARTARGET)" $(TARFILES)


.PHONY: clean
clean:
	@$(L) -c $(B)
	@rm -f $(AUXFILES) "*(1)*"
	@find . -name .DS_Store -o -name '_minted*' | xargs rm -rf

gclean:
	git clean -fdx -e Scripts -e Fonts

all: clean
	@pdflatex ${MASTER}.tex
	@test -f ${MASTER}-blx.bib && ( bibtex ${MASTER}; pdflatex ${MASTER}.tex ) || echo "No Bibtex"
	@pdflatex ${MASTER}.tex


.PHONY: times
times:
	@echo $(TIMES)  | tr '\1@\2' '\n\t '
# fgrep "TIME process" -A 1 *.log | while read a; do \
#   read b; read c; \
#   S=`echo $$a | cut -d ' '  -f3 | cut -d '=' -f 1`; \
#   T=`echo $$b | cut -d ':' -f 2`; \
#   echo TIME $$S =$$T; \
# done

# merge, tag and push
mtp:
	make clean
	git cam "Version $(VERSION)."
	git checkout main
	git pull
	git merge -m "Merge branch 'develop'" develop
	git tag -a "v$(VERSION)" -m "Version $(VERSION)."
	git push --all
	git push --tags
	git checkout develop

cleanall: clean
	@rm *.pdf
NAME = das-versprechen-der-vernetzung
MAKE = make
MYPATH = JupyterNotebook
export TEXINPUTS:=.//:

COMPILER_INFO=$(shell lualatex -v | head -n1 | cut -d ' ' -f3-)
LATEX_OPTS="\newcommand*\InfoTeX{Die automatisierte Konvertierung des RNotebooks wurde erstellt mit ${COMPILER_INFO}.}\AtBeginDocument{\title{Das Versprechen der Vernetzung}\author{Dorothea Strecker | Lukas C. Bossert | Évariste Demandt}\date{\today\protect\footnote{\InfoTeX}}\setmainfont{Alegreya}\RequirePackage{microtype,etoolbox,bookmark,longtable,booktabs}\definecolor{cellbackground}{HTML}{FFFFFF}\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\},fontsize=\footnotesize}}\raggedbottom"


all:
	time $(MAKE) {html,pdf,script,md,slides}

html:
	jupyter nbconvert --to html --no-prompt $(NAME).ipynb

pdf: tex
	# jupyter nbconvert --to pdf $(NAME).ipynb
	latexmk \
 -gg \
 -quiet \
 -lualatex \
 -usepretex=$(LATEX_OPTS) \
 $(NAME).tex
	rm $(NAME).{aux,fdb*,fls,log}

tex:
	jupyter nbconvert --to latex --no-prompt $(NAME).ipynb

slides:
	jupyter nbconvert --to slides --no-prompt --SlidesExporter.reveal_scroll=True  $(NAME).ipynb

# --no-input

script:
	jupyter nbconvert --to script $(NAME).ipynb

md:
	jupyter nbconvert --to markdown $(NAME).ipynb


execute:
	jupyter nbconvert --to notebook --execute $(NAME).ipynb


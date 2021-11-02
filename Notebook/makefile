NAME ?= the-promise-to-partner
WORKSHOP = $(NAME)-workshop
MAKE = make
MYPATH = JupyterNotebook
export TEXINPUTS:=.//:

COMPILER_INFO=$(shell lualatex -v | head -n1 | cut -d ' ' -f3-)
#PANDOC_OPTIONS ="\newcommand*\InfoTeX{The automated conversion of the R notebook was created with ${COMPILER_INFO}.}\AtBeginDocument{\title{The Promise to Partner}\author{Lukas C. Bossert | Sama Majidian | Évariste Demandt}\date{\today\protect\footnote{\InfoTeX}}\setmainfont{Alegreya}\RequirePackage{microtype,etoolbox,bookmark,longtable,booktabs}\definecolor{cellbackground}{HTML}{FFFFFF}\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\},fontsize=\footnotesize}}\raggedbottom"

PANDOC_OPTIONS += --top-level-division=section
#PANDOC_OPTIONS += -V titlepage:t
PANDOC_OPTIONS += --to latex
PANDOC_OPTIONS += --template bin/eisvogel.latex

all:
	time $(MAKE) {html,script,slides,pdf,md,org}
	time $(MAKE) md NAME=$(NAME)-workshop

html:
	jupyter nbconvert --to html --no-prompt $(NAME).ipynb

# pdf: tex
# 	latexmk \
#  -gg \
#  -quiet \
#  -lualatex \
#  -usepretex=$(LATEX_OPTS) \
#  $(NAME).tex
# 	rm $(NAME).{aux,fdb*,fls,log}

pdf: org
	pandoc $(PANDOC_OPTIONS) $(NAME).org -o $(NAME).pdf

tex:
	jupyter nbconvert --to latex --no-prompt $(NAME).ipynb

slides:
	jupyter nbconvert --to slides --no-prompt --SlidesExporter.reveal_scroll=True  $(NAME).ipynb

script:
	jupyter nbconvert --to script $(NAME).ipynb

md:
	jupyter nbconvert --to markdown $(NAME).ipynb
#	markdownlint --fix $(NAME).md

org: md
	pandoc $(NAME).md -o $(NAME).org

execute:
	jupyter nbconvert --to notebook --execute $(NAME).ipynb


NAME = das-versprechen-der-vernetzung
MAKE = make
MYPATH = JupyterNotebook
export TEXINPUTS:=.//:


all:
	time $(MAKE) {html,pdf,script,md}

html:
	cd $(MYPATH) && jupyter nbconvert --to html $(NAME).ipynb

pdf:
	cd $(MYPATH) && jupyter nbconvert --to pdf $(NAME).ipynb

slides:
	cd $(MYPATH) && jupyter nbconvert --to slides $(NAME).ipynb

script:
	cd $(MYPATH) && jupyter nbconvert --to script $(NAME).ipynb

md:
	cd $(MYPATH) && jupyter nbconvert --to markdown $(NAME).ipynb


execute:
	cd $(MYPATH) && jupyter nbconvert --to notebook --execute $(NAME).ipynb

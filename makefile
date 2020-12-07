NAME = das-versprechen-der-vernetzung
MAKE = make
export TEXINPUTS:=.//:


all:
	time $(MAKE) {html,pdf,script,md}

html:
	jupyter nbconvert --to html $(NAME).ipynb

pdf:
	jupyter nbconvert --to pdf $(NAME).ipynb

slides:
	jupyter nbconvert --to slides $(NAME).ipynb

script:
	jupyter nbconvert --to script $(NAME).ipynb

md:
	jupyter nbconvert --to markdown $(NAME).ipynb


execute:
	jupyter nbconvert --to notebook --execute $(NAME).ipynb

.DEFAULT_GOAL:=paper
make_flag:=--no-print-directory -j8

.PHONY: paper
paper:	paper.pdf

paper.pdf: figure
	latexmk -shell-escape -pdf paper.tex
	pdffonts paper.pdf > paper.pdf.font.log

.PHONY: grammar
grammar:
	bash script/text_process/pandoc_latex_to_plain.sh paper.tex paper.txt

figure/Makefile: figure/plots.csv \
                 script/figure/configure.py
	@echo GEN $@
	@python script/figure/configure.py gen-makefile $< $@


figure/plots.tex: figure/plots.csv \
                  script/figure/configure.py
	@echo GEN $@
	@python script/figure/configure.py gen-texfile $< $@


.PHONY: figure
figure: figure/Makefile figure/plots.tex
	@make ${make_flag} -C figure all_tikz_pdf all_pdf


.PHONY: clean
clean:
	@latexmk -c

.PHONY: clean_all
clean_all: clean
	@make ${make_flag} -C figure clean

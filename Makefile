.DEFAULT_GOAL:=paper
make_flag:=--no-print-directory -j8

.PHONY: paper
paper:	out/paper.pdf

out/paper.pdf: figure
	latexmk -pdf -outdir=out paper.tex

.PHONY: grammar
grammar:
	bash script/text_process/pandoc_latex_to_plain.sh paper.tex out/paper.txt


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
	@make ${make_flag} -C figure all_tikz


.PHONY: clean
clean:
	@make ${make_flag} -C figure clean
	@latexmk -c -outdir=out

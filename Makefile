.DEFAULT_GOAL:=paper
make_flag:=--no-print-directory -j8

.PHONY: paper
paper:	out/paper.pdf


out/paper.pdf: figure
	latexmk -pdf -outdir=out paper.tex

.PHONY: grammar
grammar:
	pandoc -f latex -t plain paper.tex -o out/paper.txt


figure/Makefile: figure/src/rplots.csv \
                  script/figure/r_figs.py
	@echo GEN $@
	@python script/figure/r_figs.py gen-makefile $< $@


figure/rplots.tex: figure/src/rplots.csv \
                   script/figure/r_figs.py
	@echo GEN $@
	@python script/figure/r_figs.py gen-texfile $< $@


.PHONY: figure
figure: figure/Makefile figure/rplots.tex
	@make ${make_flag} -C figure all_tikz


.PHONY: clean
clean:
	@make ${make_flag} -C figure clean
	@latexmk -c -outdir=out


# This Makefile is generated by script/figure/configure.py
# Do not modify this file manually, modify the config file instead

.DEFAULT_GOAL:=all_tikz_pdf

make_flag:=--no-print-directory -j8

RSCRIPT:=Rscript --no-save --no-restore

plot/example.tikz: ../data/example.csv \
                   src/example.R
	@echo -e "GEN \t $@"
	@${RSCRIPT} $(word 2,$^) --data $< --out $@ --type tikz 


plot/example.tikz.pdf: plot/example.tikz
	@echo -e "GEN \t $@"
	@bash ../script/figure/tikz_to_pdf/tikz_to_pdf.sh $<


.PHONY: all
all: all_tikz     \
     all_pdf      \
     all_png      \
     all_tikz_pdf \
     all_tikz_svg \
     all_pdf_svg

.PHONY: all_pdf
all_pdf: 

.PHONY: all_png
all_png: 

.PHONY:   all_tikz
all_tikz: plot/example.tikz

.PHONY:       all_tikz_pdf
all_tikz_pdf: plot/example.tikz.pdf

.PHONY: all_tikz_svg
all_tikz_svg: 

.PHONY: all_pdf_svg
all_pdf_svg: 

config: 
	ln -s ../config $@


figure: 
	ln -s . $@


.PHONY:      tikz_to_pdf
tikz_to_pdf: out/plots.pdf

out/plots.pdf: plots.tex         \
               config            \
               figure            \
               plot/example.tikz
	@latexmk -pdf -outdir=out -quiet plots.tex


.PHONY:clean
clean: clean_tikz     \
       clean_tikz_pdf \
       clean_tikz_svg \
       clean_pdf      \
       clean_png      \
       clean_symlinks

.PHONY: clean_tikz
clean_tikz: 
	rm -f plot/example.tikz
	rm -f *_ras1.png


.PHONY: clean_tikz_pdf
clean_tikz_pdf: 
	rm -f plot/example.tikz.pdf


.PHONY: clean_tikz_svg
clean_tikz_svg: 
	rm -f 


.PHONY: clean_pdf
clean_pdf: 
	rm -f 

.PHONY: clean_png
clean_png: 
	rm -f 

.PHONY: clean_symlinks
clean_symlinks: 
	rm -f config figure

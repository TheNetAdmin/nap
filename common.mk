.DEFAULT_GOAL:=all
make_flag:=--no-print-directory -j8

.PHONY: test
test:
	echo ${all_targets}

.PHONY: all
all: ${all_targets}


.PHONY: force
force:


%.pdf: force
	@ echo "[latexmk] |$(notdir $(shell pwd))| $(*F).tex"
	@ cd $(@D) && \
	latexmk -shell-escape -lualatex -synctex=1 $(*F).tex && \
	pdffonts $(*F).pdf > $(*F).pdf.font.log && \
	pdftotext $(*F).pdf $(*F).txt


# %.txt: %.pdf
#	pandoc --wrap=none -f latex -t plain ${root_path}/content/$(*F).tex -o $(*F).orig.txt
# 	pandoc --wrap=none -f latex -t plain $(*F).tex -o $(*F).txt


.PHONY: grayscale
grayscale: paper.grayscale.pdf


paper.grayscale.pdf: paper.pdf
	gs \
	-sOutputFile=$@ \
	-sDEVICE=pdfwrite \
	-sColorConversionStrategy=Gray \
	-dProcessColorModel=/DeviceGray \
	-dCompatibilityLevel=1.4 \
	-dAutoRotatePages=/None \
	-dEmbedAllFonts=true \
	-dNOPAUSE \
	-dBATCH \
	$<


.PHONY: docker-build
docker-build:
	bash script/docker/run.sh make paper.pdf


${root_path}/figure/Makefile: ${root_path}/figure/plots.csv \
                              ${root_path}/script/figure/configure.py
	@echo GEN $@
	@cd ${root_path}/ && python script/figure/configure.py gen-makefile $< $@


${root_path}/figure/plots.tex: ${root_path}/figure/plots.csv \
                               ${root_path}/script/figure/configure.py
	@echo GEN $@
	@cd ${root_path}/ && python script/figure/configure.py gen-texfile $< $@


figure_targets:=all_tikz_pdf all_pdf
.PHONY: figure
figure: ${root_path}/figure/Makefile ${root_path}/figure/plots.tex
	@cd ${root_path}/ && make ${make_flag} -C figure ${figure_targets}


.PHONY: clean
clean:
	@ echo "[latexmk] |$(notdir $(shell pwd))| clean"
	@ for f in *.tex; do \
		latexmk -C $$f; \
	done


.PHONY: distclean
distclean: clean
	make ${make_flag} -C ${root_path}/figure clean
	rm -rf _minted-*
	rm -f *.pdf.font.log
	rm -f *.bbl
	rm -f *.run.xml
	rm -f *.txt

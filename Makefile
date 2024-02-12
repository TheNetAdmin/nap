projects := $(PWD)
all_targets += paper.pdf
root_path := $(PWD)
include common.mk

# include project/conference/usenix.mk

# project/conference/usenix.mk: project/conference/usenix.csv
# 	cd project/conference && python3 configure.py

.PHONY: testoutput
testoutput:
	echo $(projects)

.DEFAULT_GOAL:=all_projects

.PHONY: all_projects
all_projects: build_all_projects

.PHONY: build_all_projects
build_all_projects:
	@for dir in $(projects); do \
		$(MAKE) -s --no-print-directory -C $$dir all; \
	done
	@echo "ALL FINISHED"

.PHONY: clean_projects
clean_projects:
	for dir in $(projects); do \
		$(MAKE) -C $$dir clean; \
	done

.PHONY: distclean_projects
distclean_projects:
	for dir in $(projects); do \
		$(MAKE) -C $$dir distclean; \
	done

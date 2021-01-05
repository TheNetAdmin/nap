# Plots

Lines start with '#' are comments
This comment is not a standard csv feature
The comment is recognized by:
  - script/figure/configure.py:read_config
  - vscode extension rainbow-csv
  - vscode extension edit-csv
NOTE: do not use comma in comment to prevent highlight error in vscode
Available options:
  - code   (source code file name under figure/src without leading path)
  - data   (data file name under data/ without leading path)
  - type   (multiple options are separated with colon)
    1. pdf      : source code -> pdf
    2. tikz     : source code -> tikz
    3. tikz_pdf : source code -> tikz -> pdf
    4. tikz_svg : source code -> tikz -> pdf -> svg
  - tikz_post_process (script name under script/figure/tikz_post_process):
    1. heatmap_path_fix.sh

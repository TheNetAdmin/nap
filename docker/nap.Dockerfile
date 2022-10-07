FROM texlive/texlive:latest

RUN apt-get update && \
    apt-get install -qy --no-install-recommends r-base cmake poppler-utils && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/ && \
    Rscript -e 'install.packages(c("optparse", "ggplot2", "ggpubr", "ggsci", "tikzDevice", "scales", "ggrepel", "viridis", "gridExtra", "dplyr", "jsonlite", "rcartocolor"))'

WORKDIR /nap

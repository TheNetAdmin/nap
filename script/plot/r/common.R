suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(ggpubr))
suppressPackageStartupMessages(library(ggsci))
suppressPackageStartupMessages(library(tikzDevice))
suppressPackageStartupMessages(library(scales))
suppressPackageStartupMessages(library(ggrepel))
suppressPackageStartupMessages(library(viridis))
suppressPackageStartupMessages(library(grid))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(dplyr))

line_default_size <- 1.5
vline_default_size <- 0.75

naplot <- function(color_name = '', fill_name = '', ...){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=11),
              legend.position='top',
              legend.margin=margin(0,0,-10,0),
              legend.text = element_text(size=10),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85")
        )%+replace%
        theme(...)
    )
}

naplot3 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,-10,-10,-10),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}

naplot31 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=8),
              legend.position='top',
              legend.margin=margin(0,-10,-10,-10),
              legend.text = element_text(size=8),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}

naplot4 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,-10,-10,-20),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0.2, "cm"),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}

naplot5 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,0,0,-10),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(margin=margin(8,0,0,0,"pt"), angle=15),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}

naplot51 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,-10,-10,-10),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_blank(),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}

naplot52 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='none',
              legend.margin=margin(0,0,0,-10),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(size = 9, margin=margin(8,0,0,0,"pt"), angle=15),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,-0.5,0), "cm")
        )
    )
}

naplot53 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,0,0,0),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(size = 9, margin=margin(8,0,0,0,"pt"), angle=15),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,-0.5,0), "cm")
        )
    )
}

naplot6 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        # scale_fill_viridis(name = fill_name, discrete = TRUE, option="F") +
        theme(text=element_text(size=9),
              legend.position='top',
              legend.margin=margin(0,250,-30,0),
              legend.text = element_text(size=9),
              legend.spacing.x = unit(0.05, "cm"),
              legend.background = element_rect(fill=alpha('blue', 0)),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(margin=margin(10,0,0,0,"pt"), angle=15),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0.3,0,-0.5,0), "cm")
        )
    )
}


naplot7 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        # scale_fill_viridis(name = fill_name, discrete = TRUE, option="F") +
        theme(text=element_text(size=10),
              legend.position='top',
              legend.margin=margin(0,0,-10,0),
              legend.text = element_text(size=10),
              legend.spacing.x = unit(0, "cm"),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(margin=margin(8,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0,0,0,0), "cm")
        )
    )
}


naplot8 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=11),
              legend.position='top',
              legend.margin=margin(0,0,-10,0),
              legend.text = element_text(size=11),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85")
        )
    )
}

naplot9 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        # scale_fill_viridis(name = fill_name, discrete = TRUE, option="F") +
        theme(text=element_text(size=9),
              legend.position='none',
              legend.margin=margin(0,-50,-50,0),
              legend.text = element_text(size=8),
              legend.key.height=unit(0.2,"cm"),
              legend.key.width=unit(0.2,"cm"),
              legend.spacing.x = unit(0, "cm"),
              legend.background = element_rect(fill=alpha('blue', 0)),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(margin=margin(8,0,0,0,"pt"), size=8),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0.25,0.05,0,0), "cm")
        )
    )
}

naplot10 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_jama(name = color_name) +
        scale_fill_jama(name = fill_name) +
        # scale_fill_viridis(name = fill_name, discrete = TRUE, option="F") +
        theme(text=element_text(size=9),
              legend.position='top',
              # for 2 legend row
            #   legend.margin=margin(0,-40,-35,0),
              legend.margin=margin(0,-50,-42,0),
              legend.key.height=unit(0.2,"cm"),
              legend.key.width=unit(0.25,"cm"),
              legend.text = element_text(size=8),
              legend.spacing.x = unit(0, "cm"),
              legend.background = element_rect(fill=alpha('blue', 0)),
              axis.ticks.length=unit(0, "cm"),
              axis.text.x = element_text(margin=margin(8,0,0,0,"pt"), size=8),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0.25,0.05,0,0), "cm")
        )
    )
}

naplot11 <- function(color_name = '', fill_name = ''){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=11),
              legend.position=c(0.2, 0.8),
              legend.title=element_text(size=0),
              legend.margin=margin(0,0,0,0),
              legend.text = element_text(size=11),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0.2,0.12,0,0.05), "cm")
        )
    )
}

naplot12 <- function(color_name = '', fill_name = '', ...){
    return(ggplot() +
        theme_pubr(border = TRUE, base_family="sans") +
        scale_color_d3(name = color_name) +
        scale_fill_d3(name = fill_name) +
        theme(text=element_text(size=11),
              legend.position='top',
              legend.margin=margin(0,0,-10,0),
              legend.text = element_text(size=11),
              axis.ticks.length=unit(-0.1, "cm"),
              axis.text.x = element_text(margin=margin(5,0,0,0,"pt")),
              axis.text.y = element_text(margin=margin(0,5,0,0,"pt")),
              panel.border = element_rect(size=1.5),
              panel.grid.major.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              panel.grid.minor.y = element_line(linetype = "dashed", size=vline_default_size, color="gray85"),
              plot.margin = unit(c(0.2,0.12,0,0.05), "cm")
        ) %+replace%
        theme(...)
    )
}

read_data <- function(filename) {return(read.csv(filename, strip.white=TRUE))}

fig_full_width  <- 6.60
fig_full_height <- 2.69

fig_half_width  <- 3.20
fig_half_height <- 1.80

fig_trd_width   <- 2.10
fig_trd_height  <- 1.20

fig_quad_width  <- 1.60
fig_quad_height <- 0.90

pub_ppi <- 600

output_dev <- function(type, out_filename, out_width, out_height)
{
    if(type == 'tikz') {
        tikz(file = out_filename, width = out_width, height = out_height, documentDeclaration='documentclass[10pt]{article}')
    } else if(type == 'pdf') {
        pdf(file = out_filename, width = out_width, height = out_height, pointsize = 1/pub_ppi)
    }
}

output_dev_close <- function() {supress <- dev.off()}

output_file <- function(type, out_filename, out_width, out_height)
{
    if(type == 'tikz') {
        ggsave(file = out_filename, width = out_width, height = out_height, device=tikzDevice::tikz)
    } else if(type == 'pdf') {
        ggsave(file = out_filename, width = out_width, height = out_height, pointsize = 1/pub_ppi, device="pdf")
    }
}

# Comes from 'scales::byte_number_format'
byte_scale <- function (number, unit = "")
{
  sifactor <- c(1, 1024, 1024^2, 1024^3, 1024^4, 1024^5, 1024^6, 1024^7, 1024^8)
  pre <- c("", " K", " M", " G", " T", " P", " E", " Z", " Y")
  absolutenumber <- number * sign(number)
  ix <- findInterval(absolutenumber, sifactor)
  if (length(ix) > 0) {
    sistring <- paste(number/sifactor[ix], pre[ix], sep = "", unit = unit)
  }
  else {
    sistring <- as.character(number)
  }
  return(sistring)
}

byte_scale_factor <- function (number, unit = "")
{
  sifactor <- c(1, 1024, 1024^2, 1024^3, 1024^4, 1024^5, 1024^6, 1024^7, 1024^8)
  pre <- c("", " K", " M", " G", " T", " P", " E", " Z", " Y")
  number <- as.numeric(as.character(number))
  absolutenumber <- number * sign(number)
  ix <- findInterval(absolutenumber, sifactor)
  if (length(ix) > 0) {
    sistring <- paste(number/sifactor[ix], pre[ix], sep = "", unit = unit)
  }
  else {
    sistring <- as.character(number)
  }
  return(sistring)
}

format_si <- function(...) {
  # Based on code by Ben Tupper
  # https://stat.ethz.ch/pipermail/r-help/2012-January/299804.html

  function(x) {
    limits <- c(1e-24, 1e-21, 1e-18, 1e-15, 1e-12,
                1e-9,  1e-6,  1e-3,  1e0,   1e3,
                1e6,   1e9,   1e12,  1e15,  1e18,
                1e21,  1e24)
    prefix <- c("y",   "z",   "a",   "f",   "p",
                "n",   "µ",   "m",   " ",   "k",
                "M",   "G",   "T",   "P",   "E",
                "Z",   "Y")

    # Vector with array indices according to position in intervals
    i <- findInterval(abs(x), limits)

    # Set prefix to " " for very small values < 1e-24
    i <- ifelse(i==0, which(limits == 1e0), i)

    paste(format(round(x/limits[i], 1),
                 trim=TRUE, scientific=FALSE, ...),
          prefix[i])
  }
}

vline <- function(xint) {return(geom_vline(xintercept=xint, color='gray65', linetype='solid', size=vline_default_size))}

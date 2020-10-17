source('../script/figure/r/cmdline.R')
source('../script/figure/r/common.R')

df <- read_data(opt$data)

output_dev(opt$type, opt$out, fig_half_width, fig_half_height)
naplot() +

output_dev_close()

## Plot a geom_line
## geom_line(data = df, aes(x = , y = , color = ), size=line_default_size)

## Plot a geom_bar
## geom_bar(data = , aes(x = , y = , fill = ), colour='black', stat='identity', position=position_dodge(width=0.8), width=0.78, size=0.2)

## Reorder factorized legends
## df$col <- factor(df$col, levels=c())

## Scale x axis with byte labels
## scale_x_continuous(name = '', trans = 'log2', labels = byte_scale)

## Remove axis title and white spaces
## scale_x_continuous(name = NULL)

## Expand y axis to full plot
## scale_y_continuous(expand = c(0.005, 0))

## Remove minor y axis line
## panel.grid.minor.y = NULL

## Change axis name
## labs(x = "", y = "", title="")

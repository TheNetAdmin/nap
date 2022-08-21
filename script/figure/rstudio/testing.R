library(dplyr)
library(reshape)
library(plotly)
source("../r/common.R")

df <- read.csv("../../../data/lat-breakdown-pred-pipeline.csv")
df <- df %>% mutate(e2e = rowSums(across(where(is.numeric))))

df <- melt(df)

update_geom_defaults("point", list(color=NA))
p <- df %>%
  naplot(legend.position = "none") +
  geom_boxplot(
    aes(
      x     = variable,
      y     = value
    )
  ) +
  scale_x_discrete(name = "Module") +
  scale_y_continuous(name = "Avg. CPU Utilization (%)")
ggplotly(p)


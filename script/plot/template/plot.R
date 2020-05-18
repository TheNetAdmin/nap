source('../plot/r/common.R')

df <- read_data('../../data/RaW-NI-a878420-65ee76d.csv')
df <- df[df$raw_type == 'raw-chasing-separate',]
# df <- df[df$fence == 'mfence',]
df <- df[df$access_size <= 512*1024,]

label_points <- data.frame("x" = c(4096, 16384), "y" = c(135, 135), "pos" = c('4 K', '16 K'))

naplot() +
  geom_line(data = df, aes(x = access_size, y = average_float * (cycle_write_end - cycle_start) / (cycle_read_end - cycle_start) / access_size * 64, color = 'pc-st')) +
  geom_line(data = df, aes(x = access_size, y = average_float * (cycle_read_end - cycle_write_end) / (cycle_read_end - cycle_start) / access_size * 64, color = 'pc-ld')) +
  scale_y_continuous(name = 'Latency per CL (ns)') +
  scale_x_continuous(name = 'Access size (byte)', trans = 'log2', labels = byte_scale) +
  vline(16384) +
  vline(4096) +
  geom_label_repel(data = label_points,
                   aes(x, y, label = pos),
                   arrow = arrow(length = unit(0.02, "npc"),type = "closed", ends = "first"),
                   direction = 'x',
                   angle = 90,
                   nudge_y = 0,
                   hjust = 0,
                   size = 3
                   )


df <- read_data('../../data/sim-comp/pcm/pcm_pc_read.csv')

naplot() +
  geom_line(data = df, aes(x = size, y = ns*2*5/size*64))


df <- read_data('../../data/sim-comp.csv')

naplot(legend.margin=margin(0,-10,-10,-10),
       legend.spacing.x = unit(0.1, "cm"),
       axis.ticks.length=unit(0, "cm"),
       plot.margin = unit(c(0,0.1,0,0.1), "cm")) +
  scale_color_jama(name = '') +
  scale_fill_jama(name = '') +
  geom_bar(data = df, aes(x = stringr::str_wrap(Tool,8), y = Accuracy, fill = Metric, color = Metric), size=0.3, colour="black",  stat='identity', width=0.8, position=position_dodge(width=0.85)) +
  scale_x_discrete(name = '') +
  scale_y_continuous(name = 'Accuracy', expand = c(0.005, 0), limits=c(0, 1.0))
  
df <- read_data('../../data/sim/spec/spec-accuracy.csv')
naplot() +
  geom_point(data = df, aes(x = exec_IPC, y = exec_IPC*gem5_ipc_normed), size = 3) +
  geom_abline(linetype = 2) +
  scale_x_continuous(limits=c(0, 4)) +
  scale_y_continuous(limits=c(0, 4))

library(psych)
df$ipc_acc <- with(df, 100-abs(1-gem5_ipc_normed)/1*100)
df$llc_acc <- with(df, 100-abs(1-gem5_llc_miss_normed)/1*100)
df$spd_acc <- with(df, 100-abs(exec_speedup-speedup)/speedup*100)

geometric.mean(df$ipc_acc)
geometric.mean(df$llc_acc)
geometric.mean(df$spd_acc)


df <- read_data('../../data/sim/spec/spec-accuracy-melt.csv')
naplot() +
  geom_bar(data = df, aes(x = shortname, y = speedup, colour=machine, fill=machine), stat='identity', position=position_dodge())


df <- read_data('../../data/RaW-Interleaved-NT.csv')
label_points <- data.frame("x" = c(4096, 16384), "y" = c(135, 135), "pos" = c('4 K', '16 K'))
naplot() +
  geom_line(data = df, aes(x = access_size, y = average_float * (cycle_write_end - cycle_start) / (cycle_read_end - cycle_start) / access_size * 64, color = 'pc-st')) +
  geom_line(data = df, aes(x = access_size, y = average_float * (cycle_read_end - cycle_write_end) / (cycle_read_end - cycle_start) / access_size * 64, color = 'pc-ld')) +
  scale_y_continuous(name = 'Latency per CL (ns)') +
  scale_x_continuous(name = 'Access size (byte)', trans = 'log2', labels = byte_scale)
  # vline(16384) +
  # vline(4096)

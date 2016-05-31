source("radar.R")

roll_call <- build_rollcall('dados/sen2005-2006.csv', 'Brazilian Senate 2005-2006')
radar_pca <- radarpca(roll_call, lop = -1, minvotes = 0)
plot_radar(radar_pca)

roll_call <- build_rollcall('dados/votes-cmsp-2015.csv', 
                            'Câmara Municipal de São Paulo 2015')
radar_pca <- radarpca(roll_call, lop = -1, minvotes = 0)
plot_radar(radar_pca)




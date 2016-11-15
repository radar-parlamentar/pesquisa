source("radar.R")

# Federal: 2007-2010, 2011-2014
# Municipal: 2013-2016 (atualizar dados antes ou verificar existência 2009-2012)

# valores padrões utilizados pelo wnominate
minvotes=20
lop=0.025

analisar <- function(analise) {
  roll_call <- build_rollcall(paste('dados/', analise, '.csv', sep=''), analise)
  radar_pca <- radarpca(roll_call, lop = lop, minvotes = minvotes)
  plot_radar(radar_pca)
}

#analisar('sen2005-2006')
#analisar('cmsp2015')

analisar('cdep2007-2010') 
analisar('cdep2011-2014') 
analisar('sen2007-2010')
analisar('sen2011-2014') 
analisar('cmsp2013-2016')





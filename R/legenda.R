source("radar.R")
library(rafalib)

mypar(1,1)
cores <- c("#000000", "#FF0000", "#FF5B00", "#0059AB", "#80c341", "#002664", "#002664", "#203487", "#110274", "#ff8d00", "#6c85b1", "#1f1a17", "#f95800", "#25b84a", "#f7931e", "#da251c", "#fea801", "#15c5ff", "#00CC00", "#D51500", "#d7bf1f", "#2ba138", "#65a4fb", "#67a91e", "#173495", "#FFFF00", "#312dc1", "#ffff6b", "#0066ff", "#004607", "#094196", "#1db10c")
partidos <- c("Sem partido", "PT", "PMDB", "PSDB", "PSD", "DEM", "PFL", "PP", "PR", "PSB", "PDT", "PTB", "SD", "PSC", "PROS", "PCdoB", "PPS", "PRB", "PV", "PMN", "PEN", "PTdoB", "PHS", "PRP", "PSL", "PSOL", "PRTB", "PSDC", "PTC", "PPL", "PAN", "REDE")
length(partidos) # 32
x <- c(rep(1, 11), rep(2, 11), rep(3, 10))
y <- c(seq(11,1), seq(11,1), seq(10,1))
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", bty="n", main="Partidos", 
     col=cores, bg=cores, pch = 19, xlim=c(0.5,4))
text(x, y, labels=partidos, pos=4, cex=0.8)


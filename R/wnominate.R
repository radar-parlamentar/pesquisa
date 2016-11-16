
library("wnominate")

csv_file <- 'dados/cmsp2015.csv'
data  <- read.csv(csv_file, sep=',', as.is=T)

#l <- list(data$voter_id, data$rollcall)
#length(l) # 2
#head(l[1]) # voters
#head(l[2]) # rollcalls

votes_matrix <- tapply(data$vote, list(data$voter_id, data$rollcall), c)
# Pra cada par (voter_id, rollcall) gera um vetor com os votos do voter no rollcall
# Mas o esperado é que cada voter tenha apenas um voto (ou nenhum) no rollcall

votes_matrix[is.na(votes_matrix)] <- 0 # Transforma NAs em 0s
dim(votes_matrix) # rows = votes and columns = rollcalls

?rollcall
rc_object <- rollcall(votes_matrix, yea=1, nay=-1, missing=0)
rc_object
summary(rc_object)

?wnominate
# que chato ter que falar esse polarity
wn <- wnominate(rc_object, polarity=c(1,1), minvotes = 0, lop = 0)

plot(wn)
# wnominate gera pontos e linhas.
# Pontos são parlamentares.
# Linhas são votações. Um lado da linha é SIM e o outro é NÃO.
# WNominate tenta maximizar a quantidade de pontos do lado certo da linha.

s <- summary(wn)
# Predicted Yeas: vê quantos pontos caíram corretamente do lado Yes da linha
# Predicted Nays: vê quantos pontos caíram corretamente do lado Nay da linha
# Correct Classifiction
# APRE
# GMP




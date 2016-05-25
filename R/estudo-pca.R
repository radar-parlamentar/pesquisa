# Leonardo 2016

csv_file <- 'dados/votes-cmsp-2015.csv'
data  <- read.csv(csv_file, sep=',', as.is=T)
votes_matrix <- with(data, tapply(vote, list(voter_id, rollcall), c))
votes_matrix[is.na(votes_matrix)] <- 0 # Transforma NAs em 0s
dim(votes_matrix)
# votes_matrix: 67 vereadores X 131 votações

# Esse
s <- svd( votes_matrix - mean(votes_matrix) )
plot(s$d[1]*s$v[,1], s$d[2]*s$v[,2])
# equivale a esse
pca <- prcomp( t(votes_matrix) )
plot(pca$x[,1], pca$x[,2])
# Mas temos 131 pontos, o que corresponde às votações, e não aos vereadores.

# prcomp assumes: units/samples in row and features in columns.

# Esse
s <- svd( t(votes_matrix) - mean(t(votes_matrix)) )
plot(s$d[1]*s$v[,1], s$d[2]*s$v[,2])
# deveria corresponder a esse
pca <- prcomp( votes_matrix )
plot(pca$x[,1], pca$x[,2])
# mas são diferentes

x1 <- s$d[1]*s$v[,1]
x2 <- pca$x[,1]
length(x1)
length(x2)
x1[1:10]
x2[1:10]

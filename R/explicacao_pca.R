
library(rafalib)
mypar(1,1)

x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y = c(0.1, 4, 1, 5, 2, 8, 3, 7, 4, 11)

# Gráfico 1

plot(x, y, xlim=c(0,11), ylim=c(-3,12), asp=1, main="Projeção dos dados sobre a primeira componente principal")

# CP1
model = lm(y ~ x)
abline(model)
text(15, 10.5, "CP1")
intercept <- model$coefficients["(Intercept)"]
slope <- model$coefficients["x"] 
perp.slope <- -1/slope 

# projeções sobre CP1
x1 <- x[1]
y1 <- y[1]
intercept1 <- -perp.slope*x1 + y1
abline(intercept1, perp.slope, lty=2)
x2 <- x[10]
y2 <- y[10]
intercept2 <- -perp.slope*x2 + y2
abline(intercept2, perp.slope, lty=2)

# projection line
sx0 <- (intercept1 - intercept) / (slope - perp.slope)
sy0 <- intercept + slope*sx0
sx1 <- (intercept2 - intercept) / (slope - perp.slope)
sy1 <- intercept + slope*sx1
segments(x0=sx0, y0=sy0, x1=sx1, y1=sy1, col="red", lwd=2)




# Gráfico 2

plot(x, y, xlim=c(0,11), ylim=c(-3,12), asp=1, main="Projeção dos dados sobre outra reta r2 qualquer")

# linha de baixa variância
outro.intercept <- intercept - 3
outro.slope <- perp.slope - 0.2
abline(outro.intercept, outro.slope)
text(-5, 6, "r2")

# projeções sobre a linha de baixa variância
x1 <- x[9]
y1 <- y[9]
slope1 = -1/outro.slope
intercept1 <- -slope1*x1 + y1
abline(intercept1, slope1, lty=2)
x2 <- x[10]
y2 <- y[10]
intercept2 <- -slope1*x2 + y2
abline(intercept2, slope1, lty=2)

# projection line
sx0 <- (intercept1 - outro.intercept) / (outro.slope - slope1)
sy0 <- outro.intercept + outro.slope*sx0
sx1 <- (intercept2 - outro.intercept) / (outro.slope - slope1)
sy1 <- outro.intercept + outro.slope*sx1
segments(x0=sx0, y0=sy0, x1=sx1, y1=sy1, col="red", lwd=2)


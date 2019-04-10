# Lista 1 - Exercicio 3 - item c
# Zt = 0,4*Zt-1 + at - 0,3*at-1 - 0,8*at-2 ==> ARMA(p, q), p=1, q=2 ==> ARMA(1,2)
set.seed(666)

N <- 1000

noise <- rnorm(N, 0, 1)

phi.1 <- .4
theta.1 <- -.3
theta.2 <- -.8

Z <- noise[1]

Z[2] <- phi.1*Z[1] + noise[2] + theta.1*noise[1]

# t >= 3
for (t in 3:N) {
  Z[t] = phi.1*Z[t-1] + noise[t] + theta.1*noise[t-1] + theta.2*noise[t-2]
}

par(mfrow=c(3,1))
ts.plot(Z)

acf(Z, type = "correlation", plot = T, main = "Autocorrelation function", xaxt = 'n')
axis(1, at = seq(0, 30), by = 1)

acf(Z, type = "partial", plot = T, main = "Partial autocorrelation function", xaxt = 'n')
axis(1, at = seq(0, 30), by = 1)
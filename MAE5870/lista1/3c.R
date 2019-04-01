# Lista 1 - Exercicio 3 - item c
# Zt = 0,4*Zt-1 + at - 0,3*at-1 - 0,8*at-2 ==> ARMA(p, q), p=1, q=2 ==> ARMA(1,2)
set.seed(666)

noise <- rnorm(1000)

# t = 1
Z <- rnorm(1)

# t = 2
Z[2] <- .4*Z[1] + rnorm(1) + .3*noise[1]

# t >= 3
for (t in 3:length(noise)) {
  Z[t] = .4*Z[t-1] + rnorm(1) - .3*noise[t-1] - .8*noise[t-2]
}

par(mfrow=c(3,1))
ts.plot(Z)
acf(Z, type = "correlation", plot = T)
acf(Z, type = "partial", plot = T)
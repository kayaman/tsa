# Lista 1 - Exercicio 3 - item b
# Zt = 0,3*Zt-1 - 0,585*Zt-2 + at ==> AR(p), p=2 ==> AR(2)
set.seed(666)

noise <- rnorm(1000)

t = 1
Z <- rnorm(1)

t = 2
Z[t] <- .3*Z[t-1] + rnorm(1)

for (t in 3:length(noise)) {
  Z[t] <- .3*Z[t-1] - .585*Z[t-2] + rnorm(1)
}

par(mfrow=c(3,1))
ts.plot(Z)
acf(Z, type = "correlation", plot = T)
acf(Z, type = "partial", plot = T)

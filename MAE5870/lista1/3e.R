# Lista 1 - Exercicio 3 - item e
# Zt = (1 - 1,2*B)(1 - 0,6*B)at  ==> Zt = at - 1,8at-1 + 0,72at-2 ==> MA(q), q=2 ==> MA(2)
set.seed(666)

noise <- rnorm(1000)

t = 1
Z <- rnorm(1)

t = 2
Z[t] = rnorm(1) - 1.8*noise[t-1]

# t >= 3
for (t in 3:length(noise)) {
  Z[t] = rnorm(1) - 1.8*noise[t-1] + .72*noise[t-2]
}

par(mfrow=c(3,1))
ts.plot(Z)
acf(Z, type = "correlation", plot = T)
acf(Z, type = "partial", plot = T)
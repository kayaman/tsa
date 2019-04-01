# Lista 1 - Exercicio 3 - item c
# Zt = 0,4*Zt−1 + at − 0,3*at-1 − 0,8*at−2 ==> ARMA(p, q), p=1, q=2 ==> ARMA(1,2)
set.seed(666)

Z_t <- arima.sim(model = list(ar = c(.4), ma = c(-.3, -.8)), n = 1000)

par(mfrow=c(3,1))
ts.plot(Z_t)
ar.acf <- acf(Z_t, type = "correlation", plot = T)
ar.pacf <- acf(Z_t, type = "partial", plot = T)

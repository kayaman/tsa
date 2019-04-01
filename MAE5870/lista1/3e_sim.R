# Lista 1 - Exercicio 3 - item e
# Zt = (1 − 1,2*B)(1 − 0,6*B)at  ==> Zt = at - 1,8at-1 + 0,72at-2 ==> MA(q), q=2 ==> MA(2)
set.seed(666)


Z_t <- arima.sim(model = list(ma = c(-1.8, .72)), n = 1000)

par(mfrow=c(3,1))
ts.plot(Z_t)
ar.acf <- acf(Z_t, type = "correlation", plot = T)
ar.pacf <- acf(Z_t, type = "partial", plot = T)
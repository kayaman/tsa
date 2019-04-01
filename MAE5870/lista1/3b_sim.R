# Lista 1 - Exercicio 3 - item b
# Zt = 0,3Z*t−1 − 0,585*Zt−2 + at ==> AR(p), p=2 ==> AR(2)
set.seed(666)

Z_t <- arima.sim(model = list(ar = c(.3, -.585)), n = 1000)

par(mfrow=c(3,1))
ts.plot(Z_t)
ar.acf <- acf(Z_t, type = "correlation", plot = T)
ar.pacf <- acf(Z_t, type = "partial", plot = T)
